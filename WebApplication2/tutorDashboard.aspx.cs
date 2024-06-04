using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class tutorDashboard : System.Web.UI.Page
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
            Response.Redirect("courses.aspx");
        }

        protected void addCourses_Click(object sender, EventArgs e)
        {
            Response.Redirect("addCourses.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewResult.aspx?username=" + username);
        }
    }
}