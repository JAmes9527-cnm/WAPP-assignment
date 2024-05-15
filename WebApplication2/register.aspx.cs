using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

namespace WebApplication2
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();

                string query = "select count(*) from UserTable where username = '" + username.Text + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                int check = Convert.ToInt32(cmd.ExecuteScalar().ToString());

                if (check > 0)
                {
                    errMsg.Visible = true;
                    errMsg.ForeColor = System.Drawing.Color.Red;
                    errMsg.Text = "Username has been taken!";

                }

                else
                {
                    //create record in a table called userTable
                    string query1 = "insert into UserTable (fname, lname, gender, email, username,password, usertype) values(@firstName, @lastName, @gender, @email, @username, @password, @usertype) ";
                    SqlCommand cmd1 = new SqlCommand(query1, con);
                    cmd1.Parameters.AddWithValue("@firstName", fname.Text);
                    cmd1.Parameters.AddWithValue("@lastName", lname.Text);
                    cmd1.Parameters.AddWithValue("@gender", gender.SelectedItem.ToString());
                    cmd1.Parameters.AddWithValue("@email", email.Text);
                    cmd1.Parameters.AddWithValue("@username", username.Text);
                    cmd1.Parameters.AddWithValue("@password", pwd.Text);
                    cmd1.Parameters.AddWithValue("@usertype", usertype.Text);
                    cmd1.ExecuteNonQuery();
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "showSuccessMessage();", true);

                }
                con.Close();
            }
            catch (Exception ex)
            {
                errMsg.Visible = true;
                errMsg.ForeColor = System.Drawing.Color.Red;
                errMsg.Text = "Registration not sucessful!" + ex.ToString();
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            
        }

    }
}