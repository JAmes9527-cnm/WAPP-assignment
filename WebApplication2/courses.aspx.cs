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
    public partial class newCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadCourses();
        }

        private void LoadCourses(string searchQuery = "")
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            // Create a SQL connection
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Define the SQL query to select topics
                string query = "SELECT CourseID, name, description, thumbnailUrl, createdBy, createdAt FROM courses";
                if (!string.IsNullOrEmpty(searchQuery))
                {
                    query += " WHERE Title LIKE @SearchQuery OR Content LIKE @SearchQuery";
                }
                query += " ORDER BY CreatedAt ASC";

                // Create a SQL command
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (!string.IsNullOrEmpty(searchQuery))
                    {
                        cmd.Parameters.AddWithValue("@SearchQuery", "%" + searchQuery + "%");
                    }

                    // Open the connection
                    con.Open();

                    // Execute the command and get a data reader
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        // Clear previous topics
                        courses.Controls.Clear();

                        // Loop through the results and generate HTML for each topic
                        while (reader.Read())
                        {
                            int courseID = Convert.ToInt32(reader["CourseID"]);
                            string name = reader["name"].ToString();
                            string description = reader["description"].ToString();
                            string thumbnailUrl = reader["thumbnailUrl"].ToString();
                            string createdBy = reader["createdBy"].ToString();
                            string createdAt = reader["createdAt"].ToString();

                            // Create HTML elements for the topic
                            Panel coursePanel = new Panel();
                            coursePanel.CssClass = "course";
                            Panel thumbnailPanel = new Panel();
                            thumbnailPanel.CssClass = "thumbnail";
                            Panel detailsPanel = new Panel();
                            detailsPanel.CssClass = "details";

                            LiteralControl titleControl = new LiteralControl("<h3>" + name + "</h3>");
                            LiteralControl thumbnailControl = new LiteralControl("<img src='" + thumbnailUrl + "'/>");
                            LiteralControl contentControl = new LiteralControl(description);
                            LiteralControl createdAtControl = new LiteralControl("<p><i>Created on " + createdAt + " by: " + createdBy + "</i></p>");

                            Button viewCourseButton = new Button();
                            viewCourseButton.Text = "View Course";
                            viewCourseButton.CssClass = "viewCourseButton";
                            viewCourseButton.CommandArgument = courseID.ToString(); // Set CommandArgument to CourseID
                            viewCourseButton.Click += ViewCourseButton_Click; // Attach event handler

                            coursePanel.Controls.Add(titleControl);
                            thumbnailPanel.Controls.Add(thumbnailControl);
                            detailsPanel.Controls.Add(contentControl);
                            detailsPanel.Controls.Add(createdAtControl);
                            detailsPanel.Controls.Add(viewCourseButton);
                            if (Session["userType"] != null)
                            {
                                if (Session["userType"].ToString() == "tutor")
                                {
                                    Button editCourseButton = new Button();
                                    editCourseButton.Text = "Edit Course";
                                    editCourseButton.CssClass = "viewCourseButton";
                                    editCourseButton.CommandArgument = courseID.ToString(); // Set CommandArgument to CourseID
                                    editCourseButton.Click += editCourseButton_Click; // Attach event handler
                                    detailsPanel.Controls.Add(editCourseButton);
                                }
                            }
                            coursePanel.Controls.Add(thumbnailPanel);
                            coursePanel.Controls.Add(detailsPanel);

                            courses.Controls.Add(coursePanel); // Add the topic panel to the existing topics div
                        }
                    }
                }
            }
        }

        protected void ViewCourseButton_Click(object sender, EventArgs e)
        {
            // Get the topicID from the command argument
            Button viewCourseButton = (Button)sender;
            int courseID = Convert.ToInt32(viewCourseButton.CommandArgument);

            // Redirect to the page where users can view posts in the selected topic
            Response.Redirect("viewCourse.aspx?CourseID=" + courseID);
        }

        protected void editCourseButton_Click(object sender, EventArgs e)
        {
            // Get the topicID from the command argument
            Button viewCourseButton = (Button)sender;
            int courseID = Convert.ToInt32(viewCourseButton.CommandArgument);

            // Redirect to the page where users can view posts in the selected topic
            Response.Redirect("editCourse.aspx?CourseID=" + courseID);
        }
    }
}