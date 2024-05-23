using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication2
{
    public partial class adminDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int userId = 1; // Change this to the actual user ID
                string imageUrl = GetImageUrlFromDatabase(userId);

                Image1.ImageUrl = imageUrl;
            }
        }

        public string GetImageUrlFromDatabase(int userId)
        {
            string imageUrl = "/img/pfp/default_pfp.png"; // Default image URL

            // Replace "ConnectionString" with your actual connection string
            string connectionString = "Server=myServerAddress;Database=myDataBase;User Id=myUsername;Password=myPassword;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT [imgUrl] FROM userTable WHERE [UserID] = @UserId";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@UserId", userId);

                try
                {
                    connection.Open();
                    object result = command.ExecuteScalar();

                    if (result != null && result != DBNull.Value)
                    {
                        imageUrl = result.ToString();
                    }
                }
                catch (Exception ex)
                {
                    // Handle exceptions, e.g., log the exception
                    Console.WriteLine("Error fetching image URL: " + ex.Message);
                }
            }

            return imageUrl;
        }

        protected void ManageForumButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("manageForum.aspx");
        }

        protected void ManageTutorsButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("manageTutors.aspx");
        }

        protected void ManageStudentsButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("manageUsers.aspx");
        }
    }
}
