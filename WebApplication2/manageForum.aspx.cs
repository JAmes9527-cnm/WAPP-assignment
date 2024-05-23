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
    public partial class manageForum : System.Web.UI.Page
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

                            Panel topicPanel = new Panel();
                            topicPanel.CssClass = "topic";
                            Panel contentPanel = new Panel();
                            contentPanel.CssClass = "contentPanel";
                            Panel buttonPanel = new Panel();
                            buttonPanel.CssClass = "buttonPanel";

                            LiteralControl titleControl = new LiteralControl("<h3>" + title + "</h3>");
                            LiteralControl contentControl = new LiteralControl("<p>" + content + "</p>");
                            LiteralControl createdAtControl = new LiteralControl("<p><i>Created on " + createdAt + "</i></p>");

                            Button managePostsButton = new Button();
                            managePostsButton.Text = "Manage";
                            managePostsButton.CssClass = "button";
                            managePostsButton.CommandArgument = topicID.ToString(); // Set CommandArgument to TopicID
                            managePostsButton.Click += managePostsButton_Click; // Attach event handler

                            Button deleteTopicButton = new Button();
                            deleteTopicButton.Text = "Delete";
                            deleteTopicButton.CssClass = "button";
                            deleteTopicButton.CommandArgument = topicID.ToString(); // Set CommandArgument to TopicID
                            deleteTopicButton.Click += deleteTopicButton_Click; // Attach event handler

                            topicPanel.Controls.Add(titleControl);
                            contentPanel.Controls.Add(contentControl);
                            topicPanel.Controls.Add(contentPanel);
                            buttonPanel.Controls.Add(managePostsButton);
                            buttonPanel.Controls.Add(deleteTopicButton);
                            topicPanel.Controls.Add(buttonPanel);
                            topicPanel.Controls.Add(createdAtControl);

                            topics.Controls.Add(topicPanel); // Add the topic panel to the existing topics div 
                        }
                    }
                }
            }
        }
        protected void managePostsButton_Click(object sender, EventArgs e)
        {
            Button viewPostsButton = (Button)sender;
            int topicID = Convert.ToInt32(viewPostsButton.CommandArgument);

            Response.Redirect("ManagePosts.aspx?TopicID=" + topicID);
        }

        protected void deleteTopicButton_Click(object sender, EventArgs e)
        {
            Button deleteTopicButton = (Button)sender;
            int topicID = Convert.ToInt32(deleteTopicButton.CommandArgument);

            deleteTopic(topicID);
            Response.Redirect(Request.Url.AbsoluteUri, false); // Redirect to the same page
            Context.ApplicationInstance.CompleteRequest(); // End the response without further processing
        }

        private void deleteTopic(int TopicID)
        {
            // Get the connection string from web.config
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Step 1: Delete all votes related to the posts of the topic
                string deleteVotesQuery = "DELETE FROM Votes WHERE PostID IN (SELECT PostID FROM Posts WHERE TopicID = @TopicID)";
                using (SqlCommand deleteVotesCmd = new SqlCommand(deleteVotesQuery, con))
                {
                    deleteVotesCmd.Parameters.AddWithValue("@TopicID", TopicID);
                    deleteVotesCmd.ExecuteNonQuery();
                }

                // Step 2: Delete all posts related to the topic
                string deletePostsQuery = "DELETE FROM Posts WHERE TopicID = @TopicID";
                using (SqlCommand deletePostsCmd = new SqlCommand(deletePostsQuery, con))
                {
                    deletePostsCmd.Parameters.AddWithValue("@TopicID", TopicID);
                    deletePostsCmd.ExecuteNonQuery();
                }

                // Step 3: Delete the topic itself
                string deleteTopicQuery = "DELETE FROM Topics WHERE TopicID = @TopicID";
                using (SqlCommand deleteTopicCmd = new SqlCommand(deleteTopicQuery, con))
                {
                    deleteTopicCmd.Parameters.AddWithValue("@TopicID", TopicID);
                    deleteTopicCmd.ExecuteNonQuery();
                }
            }
        }
    }
}