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
                            postPanel.CssClass = "topic";
                            Panel voteBtn = new Panel();
                            voteBtn.CssClass = "btnContainer";

                            LiteralControl contentControl = new LiteralControl("<p>" + content + "</p>");
                            LiteralControl createdByControl = new LiteralControl("<p>By: " + createdBy + "</p>");
                            LiteralControl createdAtControl = new LiteralControl("<p><i>" + createdAt + "</i></p>");
                            LiteralControl voteControl = new LiteralControl("<p>vote: " + vote + "</p>");

                            LinkButton upVoteButton = new LinkButton();
                            upVoteButton.Text = "<i class=\"fa-solid fa-thumbs-up\"></i>";
                            upVoteButton.CommandArgument = postID.ToString();
                            upVoteButton.Click += upVoteButton_Click; // Attach event handler
                            LinkButton downVoteButton = new LinkButton();
                            downVoteButton.Text = "<i class=\"fa-solid fa-thumbs-down\"></i>";
                            downVoteButton.CommandArgument = postID.ToString();
                            downVoteButton.Click += downVoteButton_Click; // Attach event handler
                            LinkButton unVoteButton = new LinkButton();
                            unVoteButton.Text = "<i class=\"fa-solid fa-xmark\"></i>";
                            unVoteButton.CommandArgument = postID.ToString();
                            unVoteButton.Click += unVoteButton_Click; // Attach event handler

                            upVoteButton.ForeColor = System.Drawing.Color.Black; // Set color using hex value
                            downVoteButton.ForeColor = System.Drawing.Color.Black; // Set color using named color
                            unVoteButton.ForeColor = System.Drawing.Color.Black; // Set color using color name

                            postPanel.Controls.Add(contentControl);
                            postPanel.Controls.Add(createdByControl);
                            postPanel.Controls.Add(createdAtControl);

                            voteBtn.Controls.Add(upVoteButton);
                            voteBtn.Controls.Add(new LiteralControl("&nbsp;&nbsp;")); // Add padding between buttons
                            voteBtn.Controls.Add(voteControl);
                            voteBtn.Controls.Add(new LiteralControl("&nbsp;&nbsp;")); // Add padding between buttons
                            voteBtn.Controls.Add(downVoteButton);
                            voteBtn.Controls.Add(new LiteralControl("&nbsp;")); // Add padding between buttons
                            voteBtn.Controls.Add(unVoteButton);

                            postPanel.Controls.Add(voteBtn);
                            

                            posts.Controls.Add(postPanel);
                        }
                    }
                }
            }
        }

        protected void upVoteButton_Click(object sender, EventArgs e)
        {
            
            LinkButton upVoteButton = (LinkButton)sender;
            int postID = Convert.ToInt32(upVoteButton.CommandArgument);
            if (Session["userName"] != null)
            {
                int UserID = Convert.ToInt32(Session["UserID"]);
                if (!CheckVoteExist(UserID, postID))
                {
                    CreateVoteRecord(UserID, postID);
                }
                if (CheckVote(UserID, postID) == 0)
                {
                    UpdatePostVote(postID, "up");
                    UpdateVoteRecord(UserID, postID, 1);
                    Response.Redirect(Request.Url.AbsoluteUri);
                }
                else if(CheckVote(UserID, postID) == 1)
                {
                    Response.Write("<script>alert('You already upvoted.')</script>");
                }
                else if (CheckVote(UserID, postID) == -1)
                {
                    UpdatePostVote(postID, "up");
                    UpdatePostVote(postID, "up");
                    UpdateVoteRecord(UserID, postID, 1);
                    Response.Redirect(Request.Url.AbsoluteUri, false); // Redirect to the same page
                    Context.ApplicationInstance.CompleteRequest(); // End the response without further processing
                }

            }

            else
            {
                // User is not logged in, display an error message or redirect to the login page
                Response.Write("<script>alert('You must be logged in to post.')</script>");
            }

        }

        protected void downVoteButton_Click(object sender, EventArgs e)
        {
            
            LinkButton downVoteButton = (LinkButton)sender;
            int postID = Convert.ToInt32(downVoteButton.CommandArgument);

            if (Session["userName"] != null)
            {
                int UserID = Convert.ToInt32(Session["UserID"]);

                if (CheckVote(UserID,postID) == 0)
                {


                    // Call a method to update the vote value in the database
                    UpdatePostVote(postID, "down");
                    UpdateVoteRecord(UserID, postID, -1);
                    Response.Redirect(Request.Url.AbsoluteUri);
                }
                else if(CheckVote(UserID,postID) == -1)
                {
                    Response.Write("<script>alert('You already downvoted.')</script>");
                }
                else if (CheckVote(UserID,postID) == 1)
                {
                    UpdatePostVote(postID, "down");
                    UpdatePostVote(postID, "down");
                    UpdateVoteRecord(UserID, postID, -1);
                    Response.Redirect(Request.Url.AbsoluteUri, false); // Redirect to the same page
                    Context.ApplicationInstance.CompleteRequest(); // End the response without further processingview
                }
            }

            else
            {
                // User is not logged in, display an error message or redirect to the login page
                Response.Write("<script>alert('You must be logged in to post.')</script>");
            }
        }
        protected void unVoteButton_Click(object sender, EventArgs e)
        {

            LinkButton unVoteButton = (LinkButton)sender;
            int postID = Convert.ToInt32(unVoteButton.CommandArgument);

            if (Session["userName"] != null)
            {
                int UserID = Convert.ToInt32(Session["UserID"]);

                if (CheckVote(UserID, postID) == 0)
                {
                    Response.Write("<script>alert('You hasn't voted yet.')</script>");
                }
                else if (CheckVote(UserID, postID) == -1)
                {
                    UpdatePostVote(postID, "up");
                    UpdateVoteRecord(UserID, postID, 0);
                    Response.Redirect(Request.Url.AbsoluteUri);
                }
                else if (CheckVote(UserID, postID) == 1)
                {
                    UpdatePostVote(postID, "down");
                    UpdateVoteRecord(UserID, postID, 0);
                    Response.Redirect(Request.Url.AbsoluteUri); 
                }
            }

            else
            {
                // User is not logged in, display an error message or redirect to the login page
                Response.Write("<script>alert('You must be logged in to post.')</script>");
            }
        }

        private void UpdatePostVote(int postID, string voteType)
        {
            int UserID = Convert.ToInt32(Session["UserID"]);
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "";
                if (voteType == "up")
                {
                    query = "UPDATE Posts SET Vote = Vote + 1 WHERE PostID = @PostID";
                }
                else if (voteType == "down")
                {
                    query = "UPDATE Posts SET Vote = Vote - 1 WHERE PostID = @PostID";
                }

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@PostID", postID);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        private int CheckVote(int UserID,int PostID)
        {
            int vote = 0;

                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "Select vote from Votes where UserID = @UserID and PostID = @PostID";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Add parameters to the command
                        cmd.Parameters.AddWithValue("@UserID", UserID);
                        cmd.Parameters.AddWithValue("@PostID", PostID);

                        // Open the connection
                        con.Open();

                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.Read())
                        {
                            vote = Convert.ToInt32(reader["vote"]);
                        }

                        // Close the reader
                        reader.Close();
                    }

                }

                return (vote);

        }


        private bool CheckVoteExist(int UserID, int PostID)
        {
            if (Session["UserID"] != null)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT COUNT(*) FROM Votes WHERE UserID = @UserID AND PostID = @PostID";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@UserID", UserID);
                        cmd.Parameters.AddWithValue("@PostID", PostID);
                        con.Open();
                        int voteCount = (int)cmd.ExecuteScalar();
                        return voteCount > 0;
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('You must be logged in to vote.')</script>");
                return false;
            }
        }

        private void CreateVoteRecord(int UserID, int PostID)
        {
            if (Session["UserID"] != null)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Votes (UserID, PostID) VALUES (@UserID, @PostID)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@UserID", UserID);
                        cmd.Parameters.AddWithValue("@PostID", PostID);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('You must be logged in to vote.')</script>");
            }
        }

        private void UpdateVoteRecord(int UserID, int PostID, int vote)
        {

                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                string query = "UPDATE Votes SET vote = @vote WHERE UserID = @UserID AND PostID = @PostID";

                using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@UserID", UserID);
                        cmd.Parameters.AddWithValue("@PostID", PostID);
                    cmd.Parameters.AddWithValue("@vote", vote);
                        con.Open();
                        cmd.ExecuteNonQuery();
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

