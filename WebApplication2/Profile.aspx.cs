using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication2
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserProfile();
            }
        }

        private void LoadUserProfile()
        {
            // Assuming you have a way to get the logged-in user's ID
            int userId = Convert.ToInt32(Session["UserID"]);

            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "SELECT * FROM userTable WHERE UserID = @UserID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        lblFirstName.Text = reader["fname"].ToString();
                        lblLastName.Text = reader["lname"].ToString();
                        lblGender.Text = reader["gender"].ToString();
                        lblEmail.Text = reader["email"].ToString();
                        lblUsername.Text = reader["username"].ToString();
                        lblRegisterDate.Text = reader["RegisterDate"].ToString();
                        lblUserType.Text = reader["usertype"].ToString();
                        lblVerified.Text = reader["Verified"].ToString() == "0" ? "Not Verified" : "Verified";
                        imgProfile.ImageUrl = reader["imgUrl"].ToString();
                    }
                }
            }
        }

        protected void editProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserProfile.aspx");
        }
    }
}