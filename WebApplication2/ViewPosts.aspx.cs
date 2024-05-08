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
    public partial class ViewPosts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the TopicID is provided in the query string
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
                    // Handle the case when TopicID is not provided
                    // Redirect the user back to the forum page or display an error message
                    Response.Redirect("forum.aspx");
                }
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

                            Button upVoteButton = new Button();
                            upVoteButton.Text = "Up Vote";
                            upVoteButton.Click += upVoteButton_Click; // Attach event handler
                            Button downVoteButton = new Button();
                            downVoteButton.Text = "Up Vote";
                            downVoteButton.Click += downVoteButton_Click; // Attach event handler

                            postPanel.Controls.Add(contentControl);
                            postPanel.Controls.Add(createdByControl);
                            postPanel.Controls.Add(createdAtControl);
                            postPanel.Controls.Add(voteControl);

                            posts.Controls.Add(postPanel);
                        }
                    }
                }
            }
        }

        protected void upVoteButton_Click(object sender, EventArgs e)
        {

        }

        protected void downVoteButton_Click(object sender, EventArgs e)
        {

        }
    }
}

