using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication2
{
    public partial class viewCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCourseDetails();
            }
        }

        private void LoadCourseDetails()
        {
            string courseID = Request.QueryString["courseID"];
            if (string.IsNullOrEmpty(courseID))
            {
                // Handle missing courseID, show an error or redirect
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM courses WHERE CourseID = @CourseID";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@CourseID", courseID);

                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Display course details
                            lblName.Text = reader["name"].ToString();
                            lblDescription.Text = reader["description"].ToString();
                            imgThumbnail.ImageUrl = reader["thumbnailUrl"].ToString();
                            lblTitle1.Text = reader["title1"].ToString();
                            lblContent1.Text = reader["content1"].ToString();
                            lblTitle2.Text = reader["title2"]?.ToString();
                            lblContent2.Text = reader["content2"]?.ToString();
                            lblTitle3.Text = reader["title3"]?.ToString();
                            lblContent3.Text = reader["content3"]?.ToString();
                            lblTitle4.Text = reader["title4"]?.ToString();
                            lblContent4.Text = reader["content4"]?.ToString();
                            lblCreatedBy.Text = "Created by: " + reader["createdBy"].ToString();
                            lblCreatedAt.Text = "Created at: " + reader["createdAt"].ToString();
                        }
                    }
                }
            }
        }
    }
}