using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (HttpContext.Current.Session["first_name"] != null)
                {
                    lblFirstName.Text = HttpContext.Current.Session["first_name"].ToString();
                    loginPlaceHolder.Visible = false; // Hide login buttons
                    logoutPlaceHolder.Visible = true; // Show logout button
                }
                else
                {
                    loginPlaceHolder.Visible = true; // Show login buttons
                    logoutPlaceHolder.Visible = false; // Hide logout button
                }
            }
        }
    }
}