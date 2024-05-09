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
    public partial class ManagePosts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["TopicID"] != null)
            {
                int topicID = Convert.ToInt32(Request.QueryString["TopicID"]);

                GetPostsForTopic(topicID);
                if (Class1.GetPostNo(topicID) == 0)
                {
                    label1.Visible = true;
                }
            }
            else
            {
                Response.Redirect("manageForum.aspx");
            }
        }

        private void GetPostsForTopic(int topicID)
        {

            // Get the connection string from web.config
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            // Create a SQL connection
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Define the SQL query to select posts for the given topic
                string query = "SELECT PostID, Content, UserID, CreatedAt, vote FROM Posts WHERE TopicID = @TopicID ORDER BY CreatedAt DESC";

                // Create a SQL command with parameters
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Add parameter for TopicID
                    cmd.Parameters.AddWithValue("@TopicID", topicID);

                    // Open the connection
                    con.Open();

                    // Execute the command and get a data reader
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        // Loop through the results and create Post objects
                        while (reader.Read())
                        {
                            int postID = Convert.ToInt32(reader["PostID"]);
                            string content = reader["Content"].ToString();
                            int userID = Convert.ToInt32(reader["UserID"]);
                            string createdBy = Class1.GetUsernameFromID(userID);
                            int vote = Convert.ToInt32(reader["vote"]);
                            DateTime createdAt = Convert.ToDateTime(reader["CreatedAt"]);

                            Panel postPanel = new Panel();
                            postPanel.CssClass = "post";

                            LiteralControl contentControl = new LiteralControl("<p>" + content + "</p>");
                            LiteralControl createdByControl = new LiteralControl("<p>By: " + createdBy + "</p>");
                            LiteralControl createdAtControl = new LiteralControl("<p><i>" + createdAt + "</i></p>");
                            LiteralControl voteControl = new LiteralControl("<p>vote: " + vote + "</p>");

                            Button deleteButton = new Button();
                            deleteButton.Text = "delete";
                            deleteButton.CommandArgument = postID.ToString();
                            deleteButton.Click += deleteButton_Click; // Attach event handler


                            postPanel.Controls.Add(contentControl);
                            postPanel.Controls.Add(createdByControl);
                            postPanel.Controls.Add(createdAtControl);
                            postPanel.Controls.Add(voteControl);
                            postPanel.Controls.Add(deleteButton);

                            posts.Controls.Add(postPanel);
                        }
                    }


                }
            }
        }
        protected void deleteButton_Click(object sender, EventArgs e)
        {
            Button deleteButton = (Button)sender;
            int PostID = Convert.ToInt32(deleteButton.CommandArgument);

            deletePost(PostID);
            Response.Redirect(Request.Url.AbsoluteUri, false); // Redirect to the same page
            Context.ApplicationInstance.CompleteRequest(); // End the response without further processing
        }

        private void deletePost(int PostID)
        {
            // Get the connection string from web.config
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Step 1: Delete all votes related to the posts of the topic
                string deleteVotesQuery = "DELETE FROM Votes WHERE PostID = @PostID";
                using (SqlCommand deleteVotesCmd = new SqlCommand(deleteVotesQuery, con))
                {
                    deleteVotesCmd.Parameters.AddWithValue("@PostID", PostID);
                    deleteVotesCmd.ExecuteNonQuery();
                }

                // Step 2: Delete all posts related to the topic
                string deletePostsQuery = "DELETE FROM Posts WHERE PostID = @PostID";
                using (SqlCommand deletePostsCmd = new SqlCommand(deletePostsQuery, con))
                {
                    deletePostsCmd.Parameters.AddWithValue("@PostID", PostID);
                    deletePostsCmd.ExecuteNonQuery();
                }

            }
        }

        protected void postBtn_Click(object sender, EventArgs e)
        {
            if (Session["userName"] != null)
            {
                // Get the connection string from web.config
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                string content_text = content.Text;
                string UserID = Session["userID"].ToString();

                // Create a SQL connection
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    // Define the SQL query to insert a new topic
                    string query = "INSERT INTO Posts (TopicID, Content, UserID) VALUES (@TopicID, @Content, @UserID)";

                    // Create a SQL command with parameters
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        int topicID = Convert.ToInt32(Request.QueryString["TopicID"]);
                        cmd.Parameters.AddWithValue("@TopicID", topicID);
                        cmd.Parameters.AddWithValue("@Content", content_text);
                        cmd.Parameters.AddWithValue("@UserID", UserID);

                        // Open the connection
                        con.Open();

                        // Execute the command
                        cmd.ExecuteNonQuery();
                    }
                }

                // Redirect the user to the same page after posting the topic
                Response.Redirect(Request.Url.AbsoluteUri);
            }

            else
            {
                // User is not logged in, display an error message or redirect to the login page
                Response.Write("<script>alert('You must be logged in to post.')</script>");
            }
        }
    }
}