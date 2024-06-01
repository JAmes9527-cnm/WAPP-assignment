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
                string courseID = Request.QueryString["courseID"];
                if (string.IsNullOrEmpty(courseID))
                {
                    Response.Redirect("Courses.aspx");
                }
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(connectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("select count(*) from Quiz where Quiz = '" + courseID + "'" , con);
                int count = Convert.ToInt32(cmd.ExecuteScalar().ToString());

                if (count > 0)
                {
                    
                    if (Session["userType"] != null)
                    {
                        if(Session["userType"].ToString() == "member")
                        {
                            quiz_buttons.Visible = true;
                            AttemptQuizBtn.Visible = true;
                        }
                        else if (Session["userType"].ToString() == "tutor")
                        {
                            quiz_buttons.Visible = true;
                            EditQuizBtn.Text = "Edit Quiz";
                            EditQuizBtn.Visible = true;
                        }
                    }
                }
                else if(count == 0)
                {
                    if (Session["userType"] != null)
                    {
                       if (Session["userType"].ToString() == "tutor")
                        {
                            quiz_buttons.Visible = true;
                            EditQuizBtn.Text = "Add Quiz";
                            EditQuizBtn.Visible = true;
                        }
                    }
                        
                }
                con.Close();
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

        protected void AttemptQuizBtn_Click(object sender, EventArgs e)
        {
            string courseID = Request.QueryString["courseID"];
            Response.Redirect("AttemptQuiz.aspx?CourseID=" + courseID);
        }

        protected void EditQuizBtn_Click(object sender, EventArgs e)
        {
            if(ExtractUsername(lblCreatedBy.Text) == Session["userName"].ToString())
            {
                string courseID = Request.QueryString["courseID"];
                Response.Redirect("AddOrEditQuiz.aspx?CourseID=" + courseID);
            }
            else if(Session["userType"].ToString() == "admin")
            {
                string courseID = Request.QueryString["courseID"];
                Response.Redirect("AddOrEditQuiz.aspx?CourseID=" + courseID);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "showErrorMessage();", true);
                return;
            }
        }

        private string ExtractUsername(string createdByText)
        {
            // Define the prefix to look for
            string prefix = "Created by: ";
            if (createdByText.StartsWith(prefix))
            {
                // Extract and return the part after the prefix
                return createdByText.Substring(prefix.Length);
            }
            return string.Empty; // Or handle the case where the prefix is not found
        }
    }
}