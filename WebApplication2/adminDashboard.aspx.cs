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
               
                string imageUrl = GetImageUrlFromDatabase();

               
                Image1.ImageUrl = imageUrl;
            }
        }
                   public string GetImageUrlFromDatabase(int userId)
                    {
                        string imageUrl = "/img/pfp/default_pfp.png"; 

                       
                        string connectionString = "Your_Connection_String";
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
                              
                            }
                        }

                        return imageUrl;
                    }

                    protected void ManageForumButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("manageForum.aspx");
        }

        protected void ManageStudentsButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("manageStudents.aspx");
        }

        protected void ManageTutorsButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("manageTutors.aspx");
        }

        protected void ManageForumButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("manageForum.aspx");
        }

        protected void EditQuizButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditQuiz.aspx");
        }

        protected void ManagePostsButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManagePosts.aspx");
        }

    }
}
