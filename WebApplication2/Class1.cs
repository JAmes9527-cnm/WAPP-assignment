using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

namespace WebApplication2
{
    public class Class1
    {
        public static string GetUsernameFromID(int userID)
        {
            string username = null;

            // Get the connection string from web.config
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            // Create a SQL connection
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Open the connection
                con.Open();

                // Define the SQL query to select the username for the given userID
                string query = "SELECT Username FROM userTable WHERE UserID = @UserID";

                // Create a SQL command with parameters
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Add parameter to the command
                    cmd.Parameters.AddWithValue("@UserID", userID);

                    // Execute the command and get the username
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        username = reader["Username"].ToString();
                    }

                    // Close the reader
                    reader.Close();
                }
            }

            return username;
        }

        public static int GetPostNo(int TopicID)
        {
            int count = 0;

            // Get the connection string from web.config
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            // Create a SQL connection
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Open the connection
                con.Open();

                // Define the SQL query to select the username for the given userID
                string query = "SELECT count(*) FROM Posts WHERE TopicID = @TopicID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@TopicID", TopicID);
                count = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            }

            return count;
        }

    }

}