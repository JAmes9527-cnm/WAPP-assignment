using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace WebApplication2
{
    public partial class newLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            SqlCommand cmd = new SqlCommand("select count(*) from userTable where username = '" + username.Text + "' and Password = '" + pwd.Text + "'", con);
            int count = Convert.ToInt32(cmd.ExecuteScalar().ToString());

            if (count > 0)
            {
                SqlCommand cmdType = new SqlCommand("select fname, usertype, UserID from userTable where username = '" + username.Text + "'", con);
                SqlDataReader dr = cmdType.ExecuteReader();

                string type = "";
                string name = "";
                string UserID = "";

                while (dr.Read())
                {
                    type = dr["usertype"].ToString().Trim();
                    name = dr["fname"].ToString().Trim();
                    UserID = dr["UserID"].ToString().Trim();
                }
                Session["firstName"] = name;
                Session["userName"] = username.Text;
                Session["userID"] = UserID;
                Session["userType"] = type;



                if (type == "admin")
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "showSuccessMessage('adminDashboard.aspx','" + name + "');", true);
                else if (type == "member")
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "showSuccessMessage('home.aspx','" + name + "');", true);
                else if (type == "tutor")
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "showSuccessMessage('tutorDashboard.aspx','" + name + "');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "showErrorMessage();", true);
                return;
            }

            con.Close();
        }

        protected void register_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }
    }
}