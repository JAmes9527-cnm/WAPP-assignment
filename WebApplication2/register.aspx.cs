using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

namespace WebApplication2
{
    public partial class register : System.Web.UI.Page
    {
        bool otpVerifyStatus = false;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(pwd.Text))
            {
                errMsg.Visible = true;
                errMsg.ForeColor = System.Drawing.Color.Red;
                errMsg.Text = "Password cannot be empty!";
                return; // Stop further processing
            }

            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();

                string query = "select count(*) from UserTable where username = '" + username.Text + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                int check = Convert.ToInt32(cmd.ExecuteScalar().ToString());

                string quer = "select count(*) from UserTable where email = '" + email.Text + "'";
                SqlCommand cm = new SqlCommand(quer, con);
                int chec = Convert.ToInt32(cm.ExecuteScalar().ToString());

                if (check > 0)
                {
                    errMsg.Visible = true;
                    errMsg.ForeColor = System.Drawing.Color.Red;
                    errMsg.Text = "Username has been taken!";

                }
                else if (chec > 0)
                {
                    errMsg.Visible = true;
                    errMsg.ForeColor = System.Drawing.Color.Red;
                    errMsg.Text = "Email has been taken!";
                }
                else if (Session["otpVerifyStatus"] == null || !(bool)Session["otpVerifyStatus"])
                {
                    errMsg.Visible = true;
                    errMsg.ForeColor = System.Drawing.Color.Red;
                    errMsg.Text = "OTP not verified!";
                }
                else
                {
                    //create record in a table called userTable
                    string query1 = "insert into UserTable (fname, lname, gender, email, username, password, usertype) values(@firstName, @lastName, @gender, @email, @username, @password, @usertype) ";
                    SqlCommand cmd1 = new SqlCommand(query1, con);
                    cmd1.Parameters.AddWithValue("@firstName", fname.Text);
                    cmd1.Parameters.AddWithValue("@lastName", lname.Text);
                    cmd1.Parameters.AddWithValue("@gender", gender.SelectedItem.ToString());
                    cmd1.Parameters.AddWithValue("@email", email.Text);
                    cmd1.Parameters.AddWithValue("@username", username.Text);
                    cmd1.Parameters.AddWithValue("@password", pwd.Text);
                    cmd1.Parameters.AddWithValue("@usertype", usertype.Text);
                    cmd1.ExecuteNonQuery();
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "showSuccessMessage();", true);

                }
                con.Close();
            }
            catch (Exception ex)
            {
                errMsg.Visible = true;
                errMsg.ForeColor = System.Drawing.Color.Red;
                errMsg.Text = "Registration not sucessful!" + ex.ToString();
            }
        }


        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            
        }

        private string GenerateOTP()
        {
            Random random = new Random();
            return random.Next(100000, 999999).ToString();
        }

        private void SendOTPEmail(string email, string otp)
        {
            var fromAddress = new MailAddress("mjyak118@gmail.com", "Smart Money Mastery");
            var toAddress = new MailAddress(email);
            const string fromPassword = "nbpl oguu osvl ygpr"; // Use the app password generated from your Google account
            const string subject = "Your OTP Code for registration on Smart Money Mastery";
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

        protected void requestOtp_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    con.Open();
                    string query = "select count(*) from UserTable where email = @Email";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Email", email.Text);
                    int check = Convert.ToInt32(cmd.ExecuteScalar());

                    if (check > 0)
                    {
                        verifyStatus.Text = "This email has been taken!";
                        verifyStatus.Visible = true;
                    }
                    else
                    {
                        string otp = GenerateOTP();
                        Session["OTP"] = otp;
                        SendOTPEmail(email.Text, otp);
                        verifyStatus.Visible = false;
                        Session["otpVerifyStatus"] = false; // Reset OTP verification status
                    }
                }
            }
            catch (Exception ex)
            {
                verifyStatus.Text = "Error sending OTP: " + ex.Message;
                verifyStatus.Visible = true;
            }
        }


        protected void verifyOtp_Click(object sender, EventArgs e)
        {
            string enteredOtp = otp.Text;
            string sessionOtp = Session["OTP"] as string;

            if (enteredOtp == sessionOtp)
            {
                verifyStatus.Text = "OTP Verified!";
                verifyStatus.ForeColor = System.Drawing.Color.Green;
                verifyStatus.Visible = true;
                Session["otpVerifyStatus"] = true; // Set session variable
            }
            else
            {
                verifyStatus.Text = "Wrong OTP!";
                verifyStatus.ForeColor = System.Drawing.Color.Red;
                verifyStatus.Visible = true;
                Session["otpVerifyStatus"] = false; // Set session variable
            }
        }

    }
}