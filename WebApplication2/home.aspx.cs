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
                if (Session["userName"] != null)
                {
                    String welcomeText = "Welcome, " + Session["firstName"];
                    LiteralControl welcomeControl = new LiteralControl(welcomeText);
                    loginPlaceHolder.Controls.Add(welcomeControl);
                    loginPanel.Visible = false;
                }
            }
            else
            {
                loginPanel.Visible = true;
            }
        }
    }
}