using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Web.UI;


namespace WebApplication2
{
    public partial class newLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            SqlCommand cmd = new SqlCommand("select count(*) from userTable where username = '" + username.Text + "' and Password = '" + pwd.Text + "'", con);
            int count = Convert.ToInt32(cmd.ExecuteScalar().ToString());

            if (count > 0)
            {
                SqlCommand cmdType = new SqlCommand("select fname, usertype, UserID from userTable where username = '" + username.Text + "'", con);
                SqlDataReader dr = cmdType.ExecuteReader();

                string type = "";
                string name = "";
                string UserID = "";

                while (dr.Read())
                {
                    type = dr["usertype"].ToString().Trim();
                    name = dr["fname"].ToString().Trim();
                    UserID = dr["UserID"].ToString().Trim();
                }
                Session["firstName"] = name;
                Session["userName"] = username.Text;
                Session["userID"] = UserID;
                Session["userType"] = type;



                if (type == "admin")
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "showSuccessMessage('adminDashboard.aspx','" + name + "');", true);
                else if (type == "member")
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "showSuccessMessage('home.aspx','" + name + "');", true);
                else if (type == "tutor")
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "showSuccessMessage('tutorDashboard.aspx','" + name + "');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "showErrorMessage();", true);
                return;
            }

            con.Close();
        }

        protected void register_btn_Click(object sender, EventArgs e)
        {
            // Redirect to the registration page or handle sign-up logic
            Response.Redirect("register.aspx");
        }

        protected void SendOTPButton_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand("select email from userTable where email = @Email", con);
                    cmd.Parameters.AddWithValue("@Email", forgotEmail.Text);
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        string userEmail = dr["email"].ToString().Trim();
                        string generatedOTP = GenerateOTP();
                        Session["userEmail"] = userEmail;
                        Session["generatedOTP"] = generatedOTP;
                        Session["OTPTimestamp"] = DateTime.Now;
                        SendOTPEmail(userEmail, generatedOTP);
                        MultiView1.ActiveViewIndex = 2; // Switch to OTPView
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "startCountdown", "startCountdown();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "errorMessage", "showErrorMessage('Email not found.');", true);
                    }

                    dr.Close();
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "errorMessage", $"showErrorMessage('{ex.Message}');", true);
            }
        }

        protected void ValidateOTPButton_Click(object sender, EventArgs e)
        {
            string sessionOTP = Session["generatedOTP"]?.ToString();
            DateTime? otpTimestamp = Session["OTPTimestamp"] as DateTime?;

            if (otpTimestamp != null && DateTime.Now.Subtract(otpTimestamp.Value).TotalSeconds <= 30)
            {
                if (otp.Text == sessionOTP)
                {
                    MultiView1.ActiveViewIndex = 3; // Switch to NewPasswordView
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "errorMessage", "showErrorMessage('Invalid OTP.');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "errorMessage", "showErrorMessage('OTP has expired.');", true);
            }
        }

        protected void ResetPasswordButton_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand("update userTable set Password = @Password where email = @Email", con);
                    cmd.Parameters.AddWithValue("@Password", newPassword.Text);
                    cmd.Parameters.AddWithValue("@Email", Session["userEmail"].ToString());
                    cmd.ExecuteNonQuery();

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "successMessage", "showSuccessMessage2('Password reset successfully.');", true);
                    MultiView1.ActiveViewIndex = 0; // Switch back to LoginView
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "errorMessage", $"showErrorMessage('{ex.Message}');", true);
            }
        }

        protected void forgotPasswordLink_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1; // Switch to ForgotPasswordView
        }

        protected void ResendOTPButton_Click(object sender, EventArgs e)
        {
            try
            {
                string userEmail = Session["userEmail"].ToString();
                string generatedOTP = GenerateOTP();
                Session["generatedOTP"] = generatedOTP;
                Session["OTPTimestamp"] = DateTime.Now;
                SendOTPEmail(userEmail, generatedOTP);
                MultiView1.ActiveViewIndex = 2; // Switch to OTPView
                ScriptManager.RegisterStartupScript(this, this.GetType(), "startCountdown", "startCountdown();", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "successMessage", "showSuccessMessage2('A new OTP has been sent to your email.');", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "errorMessage", $"showErrorMessage('{ex.Message}');", true);
            }
        }

        private string GenerateOTP()
        {
            Random random = new Random();
            return random.Next(100000, 999999).ToString();
        }

        private void SendOTPEmail(string email, string otp)
        {
            var fromAddress = new MailAddress("mjyak118@gmail.com", "Your Name");
            var toAddress = new MailAddress(email);
            const string fromPassword = "nbpl oguu osvl ygpr"; // Use the app password generated from your Google account
            const string subject = "Your OTP Code";
            string body = $"Your OTP code is {otp}";

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
            };
            using (var message = new MailMessage(fromAddress, toAddress)
            {
                Subject = subject,
                Body = body
            })
            {
                smtp.Send(message);
            }
        }

    }
}