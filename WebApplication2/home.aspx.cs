using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication2
{
    public partial class newHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["userName"] != null)
            {
                WelcomeText.Text = "Welcome, " + Session["firstName"];

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();

                string query = "select imgUrl from userTable where UserID = '" + Session["UserID"] + "'";
                SqlCommand cmd = new SqlCommand(query, con);

                pfp.ImageUrl = cmd.ExecuteScalar().ToString(); // Set the URL of the profile picture

                UserPanel.Visible = true;
            }


            else
            {
                loginPanel.Visible = true;
            }

            if (!IsPostBack)
            {
                LoadUserFeedback();
            }

        }

        private void LoadUserFeedback()
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();
                    string query = "SELECT TOP 5 Name, Rating, Review, Timestamp FROM feedbackTable ORDER BY Timestamp DESC";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.HasRows)
                        {
                            feedbackSection.Visible = true;
                            feedbackRepeater.DataSource = reader;
                            feedbackRepeater.DataBind();
                        }
                        else
                        {
                            feedbackSection.Visible = false; // Hide the section if there are no feedback entries
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the exception (implement logging as needed)
                Console.WriteLine("An error occurred: " + ex.Message);
            }
        }

        protected string GenerateStarsHtml(int rating)
        {
            string starsHtml = string.Empty;
            for (int i = 0; i < 5; i++)
            {
                if (i < rating)
                {
                    starsHtml += "<i class='fas fa-star' style='color: #f7c508;'></i>";
                }
                else
                {
                    starsHtml += "<i class='fas fa-star' style='color: #ddd;'></i>";
                }
            }
            return starsHtml;
        }



        protected void PfpButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserProfile.aspx");
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
        protected void SignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }

        protected void LogOut_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("login.aspx");
        }

        protected void dashboardBtn_Click(object sender, EventArgs e)
        {
            if (Session["userType"] != null)
            {
                String type = Session["userType"].ToString();
                if (type == "member")
                {
                    Response.Redirect("memberDashboard");
                }
                else if (type == "tutor")
                {
                    Response.Redirect("tutorDashboard");
                }
                else if (type == "admin")
                {
                    Response.Redirect("adminDashboard");
                }
            }

           
            else
            {
                Response.Write("<script>alert('You must be logged in to access user dashboard.')</script>");
            }
        }

    }
}