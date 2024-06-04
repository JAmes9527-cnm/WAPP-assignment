using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication2
{
    public partial class newHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                LoadUserFeedback();
            }

        }

        private void LoadUserFeedback()
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();
                    string query = "SELECT TOP 5 Name, Rating, Review, Timestamp FROM feedbackTable ORDER BY Timestamp DESC";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.HasRows)
                        {
                            feedbackSection.Visible = true;
                            feedbackRepeater.DataSource = reader;
                            feedbackRepeater.DataBind();
                        }
                        else
                        {
                            feedbackSection.Visible = false; // Hide the section if there are no feedback entries
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the exception (implement logging as needed)
                Console.WriteLine("An error occurred: " + ex.Message);
            }
        }

        protected string GenerateStarsHtml(int rating)
        {
            string starsHtml = string.Empty;
            for (int i = 0; i < 5; i++)
            {
                if (i < rating)
                {
                    starsHtml += "<i class='fas fa-star' style='color: #f7c508;'></i>";
                }
                else
                {
                    starsHtml += "<i class='fas fa-star' style='color: #ddd;'></i>";
                }
            }
            return starsHtml;
        }
    }
}