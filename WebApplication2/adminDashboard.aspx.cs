using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication2
{
    public partial class adminDashboard : Page
    {
        string username;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] != null)
            {
                username = Session["userName"].ToString();
            }
        }



        protected void courses_Click(object sender, EventArgs e)
        {
            Response.Redirect("manageStudents.aspx");
        }

        protected void addCourses_Click(object sender, EventArgs e)
        {
            Response.Redirect("manageForum.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("manageTutors.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewResult.aspx?username=" + username);
        }
    }
}
