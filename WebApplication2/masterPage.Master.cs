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
    public partial class Site1 : System.Web.UI.MasterPage
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
        }

        protected void PfpButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
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
                    Response.Redirect("memberDashboard.aspx");
                }
                else if (type == "tutor")
                {
                    Response.Redirect("tutorDashboard.aspx");
                }
                else if (type == "admin")
                {
                    Response.Redirect("adminDashboard.aspx");
                }
            }


            else
            {
                Response.Write("<script>alert('You must be logged in to access user dashboard.')</script>");
            }
        }
    }
}