using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;

namespace WebApplication2
{
    public partial class home : System.Web.UI.Page
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
            Response.Redirect("UP.aspx");
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
        protected void SignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }
    }
}