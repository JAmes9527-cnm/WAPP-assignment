using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;


namespace WebApplication2
{
    public partial class feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            // Validate input fields
            if (string.IsNullOrEmpty(name.Text) || string.IsNullOrEmpty(email.Text) || string.IsNullOrEmpty(review.Text))
            {
                // Display an error message to the user (you can implement this in your own way)
                lblError.Text = "Please fill in all required fields.";
                lblError.Visible = true;
                return;
            }

            // Determine the selected rating
            int rating = 0;
            if (star5.Checked) rating = 5;
            else if (star4.Checked) rating = 4;
            else if (star3.Checked) rating = 3;
            else if (star2.Checked) rating = 2;
            else if (star1.Checked) rating = 1;

            // Ensure a rating was selected
            if (rating == 0)
            {
                // Display an error message to the user (you can implement this in your own way)
                lblError.Text = "Please select a rating.";
                lblError.Visible = true;
                return;
            }

            // Insert feedback into the database
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    con.Open();

                    string query = "INSERT INTO feedbackTable (Name, Email, Rating, Review) VALUES (@Name, @Email, @Rating, @Review)";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Name", name.Text);
                        cmd.Parameters.AddWithValue("@Email", email.Text);
                        cmd.Parameters.AddWithValue("@Rating", rating);
                        cmd.Parameters.AddWithValue("@Review", review.Text);

                        cmd.ExecuteNonQuery();
                    }
                }

                // Redirect or inform the user of successful submission
                Response.Redirect("~/feedbacksuccess.aspx"); // Adjust the path if necessary
            }
            catch (Exception ex)
            {
                // Handle the exception (log it and inform the user)
                lblError.Text = "An error occurred while submitting your feedback. Please try again later.";
                lblError.Visible = true;
                // Log the exception details (ex.Message) as needed for debugging purposes
            }
        }
    }
}

