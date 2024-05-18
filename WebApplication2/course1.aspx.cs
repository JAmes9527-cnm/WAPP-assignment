using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usertype"] != null &&  Session["usertype"].ToString() == "member")
            {
                Button4.Visible = false;
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditQuiz.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("courses.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Quiz1Page.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("Result Page.aspx");
        }
    }
}