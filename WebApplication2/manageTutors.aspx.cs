using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace WebApplication2
{
    public partial class manageTutors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load existing tutors
                LoadExistingTutors();

                // Load new tutors awaiting approval
                LoadNewTutors();
            }
        }

        private void LoadExistingTutors()
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                string query = "SELECT UserID, fname, lname, Verified FROM userTable WHERE usertype = 'tutor' AND Verified = 1";
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                GridViewExistingTutors.DataSource = dataTable;
                GridViewExistingTutors.DataBind();
            }
        }

        private void LoadNewTutors()
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                string query = "SELECT UserID, fname, lname, RegisterDate FROM userTable WHERE usertype = 'tutor' AND Verified = 0";
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                GridViewNewTutors.DataSource = dataTable;
                GridViewNewTutors.DataBind();
            }
        }

        protected void GridViewExistingTutors_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                int userID = Convert.ToInt32(e.CommandArgument);
                // Write code to remove the tutor with the specified UserID from the database
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    string query = "UPDATE userTable SET Verified = 0, usertype = 'user' WHERE UserID = @UserID";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@UserID", userID);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
                // Refresh the GridView
                LoadExistingTutors();
            }
        }

        protected void GridViewNewTutors_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Approve")
            {
                int userID = Convert.ToInt32(e.CommandArgument);
                // Write code to approve the new tutor with the specified UserID
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    string query = "UPDATE userTable SET Verified = 1 WHERE UserID = @UserID";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@UserID", userID);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
                // Refresh the GridViews
                LoadExistingTutors();
                LoadNewTutors();
            }
            else if (e.CommandName == "Decline")
            {
                int userID = Convert.ToInt32(e.CommandArgument);
                // Write code to decline the new tutor with the specified UserID
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    string query = "UPDATE userTable SET Verified = 0, usertype = 'user' WHERE UserID = @UserID";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@UserID", userID);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
                // Refresh the GridViews
                LoadExistingTutors();
                LoadNewTutors();
            }
        }
    }
}