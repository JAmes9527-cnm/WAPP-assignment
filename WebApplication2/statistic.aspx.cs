using System;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace WebApplication2
{
    public partial class statistic : System.Web.UI.Page
    {
        protected int StudentCount { get; set; }
        protected int TutorCount { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve counts from the database
                RetrieveUserCounts();

                // Pass data to the client-side script
                ClientScript.RegisterStartupScript(this.GetType(), "chartData",
                    $"var studentCount = {StudentCount}; var tutorCount = {TutorCount};", true);
            }
        }

        private void RetrieveUserCounts()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(CASE WHEN usertype = 'member' THEN 1 END) AS StudentCount, " +
                               "COUNT(CASE WHEN usertype = 'tutor' THEN 1 END) AS TutorCount FROM userTable";

                SqlCommand cmd = new SqlCommand(query, conn);

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            StudentCount = reader.GetInt32(0);
                            TutorCount = reader.GetInt32(1);
                        }
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    // Handle exceptions
                    Console.WriteLine("Error: " + ex.Message);
                }
            }
        }
    }
}
