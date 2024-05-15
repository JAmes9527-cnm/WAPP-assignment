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
    public partial class forum : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadTopics();
        }



        private void LoadTopics()
        {
            // Get the connection string from web.config
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            // Create a SQL connection
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Define the SQL query to select topics
                string query = "SELECT TopicID, Title, Content,CreatedAt,UserID FROM Topics ORDER BY CreatedAt DESC";

                // Create a SQL command
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Open the connection
                    con.Open();

                    // Execute the command and get a data reader
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        // Loop through the results and generate HTML for each topic
                        while (reader.Read())
                        {
                            int topicID = Convert.ToInt32(reader["TopicID"]);
                            string title = reader["Title"].ToString();
                            string content = reader["Content"].ToString();
                            string createdAt = reader["CreatedAt"].ToString();

                            // Create HTML elements for the topic
                            Panel topicPanel = new Panel();
                            topicPanel.CssClass = "topic";
                            Panel contentPanel = new Panel();
                            contentPanel.CssClass = "contentPanel";
                            Panel buttonPanel = new Panel();
                            buttonPanel.CssClass = "buttonPanel";

                            LiteralControl titleControl = new LiteralControl("<h3>" + title + "</h3>");
                            LiteralControl contentControl = new LiteralControl(content);
                            LiteralControl createdAtControl = new LiteralControl("<p><i>Created on " + createdAt + "</i></p>");

                            // Create a button to view posts
                            Button viewPostsButton = new Button();
                            viewPostsButton.Text = "View Posts";
                            viewPostsButton.CssClass = "button";
                            viewPostsButton.CommandArgument = topicID.ToString(); // Set CommandArgument to TopicID
                            viewPostsButton.Click += ViewPostsButton_Click; // Attach event handler

                            LiteralControl span = new LiteralControl();
                            span.Text = "<span class=\"button-content\">" + viewPostsButton.Text + "</span>";
                            viewPostsButton.Controls.Add(span);

                            topicPanel.Controls.Add(titleControl);
                            contentPanel.Controls.Add(contentControl);
                            topicPanel.Controls.Add(contentPanel);
                            buttonPanel.Controls.Add(viewPostsButton);
                            topicPanel.Controls.Add(buttonPanel);
                            topicPanel.Controls.Add(createdAtControl);

                            topics.Controls.Add(topicPanel); // Add the topic panel to the existing topics div 
                        }
                    }
                }
            }
        }

        protected void ViewPostsButton_Click(object sender, EventArgs e)
        {
            // Get the topicID from the command argument
            Button viewPostsButton = (Button)sender;
            int topicID = Convert.ToInt32(viewPostsButton.CommandArgument);

            // Redirect to a page where users can view posts in the selected topic
            Response.Redirect("ViewPosts.aspx?TopicID=" + topicID);
        }



        protected void postBtn_Click(object sender, EventArgs e)
        {
            if (Session["userName"] != null)
            {
                // Get the connection string from web.config
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                // Retrieve the values from the textboxes
                string title_text = title.Text;
                string content_text = content.Text;
                string UserID = Session["userID"].ToString();

                // Create a SQL connection
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    // Define the SQL query to insert a new topic
                    string query = "INSERT INTO Topics (Title, Content, UserID) VALUES (@Title, @Content, @UserID)";

                    // Create a SQL command with parameters
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Add parameters to the command
                        cmd.Parameters.AddWithValue("@Title", title_text);
                        cmd.Parameters.AddWithValue("@Content", content_text);
                        cmd.Parameters.AddWithValue("@UserID", UserID);

                        // Open the connection
                        con.Open();

                        // Execute the command
                        cmd.ExecuteNonQuery();
                    }
                }

                // Redirect the user to the same page after posting the topic
                Response.Redirect(Request.Url.AbsoluteUri, false); // Redirect to the same page
                Context.ApplicationInstance.CompleteRequest(); // End the response without further processing
            }

            else
            {
                // User is not logged in, display an error message or redirect to the login page
                Response.Write("<script>alert('You must be logged in to post a topic.')</script>");
            }
        }
    }
}