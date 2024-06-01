using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class memberDashboard : System.Web.UI.Page
    {

        protected void courses_Click(object sender, EventArgs e)
        {
            Response.Redirect("Courses.aspx");
        }

        protected void addCourses_Click(object sender, EventArgs e)
        {
            Response.Redirect("resources.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("calculator.aspx");
        }
    }
}