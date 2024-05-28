using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication2
{
    public partial class adminDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
    }
}
