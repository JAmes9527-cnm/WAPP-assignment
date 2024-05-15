using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class manageTutors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadExistingTutors();
                LoadNewTutors();
            }
        }

        private void LoadExistingTutors()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query = "SELECT TutorID, TutorName FROM TutorsTable";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                GridViewExistingTutors.DataSource = reader;
                GridViewExistingTutors.DataBind();
                reader.Close();
            }
        }

        private void LoadNewTutors()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query = "SELECT TutorID, TutorName, RegistrationDate FROM NewTutorsTable";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                GridViewNewTutors.DataSource = reader;
                GridViewNewTutors.DataBind();
                reader.Close();
            }
        }

        protected void GridViewExistingTutors_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridViewExistingTutors.Rows[index];
                string tutorID = row.Cells[1].Text;

                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                string query = "DELETE FROM TutorsTable WHERE TutorID = @TutorID";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@TutorID", tutorID);
                    connection.Open();
                    command.ExecuteNonQuery();
                }

                LoadExistingTutors(); // Refresh existing tutors gridview after removal
            }
        }

        protected void GridViewNewTutors_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Approve")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridViewNewTutors.Rows[index];
                string tutorID = row.Cells[1].Text;

                // Retrieve tutor details from NewTutorsTable and insert into TutorsTable
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                string querySelect = "SELECT TutorName, RegistrationDate FROM NewTutorsTable WHERE TutorID = @TutorID";
                string queryInsert = "INSERT INTO TutorsTable (TutorName, RegistrationDate) VALUES (@TutorName, @RegistrationDate)";
                string queryDelete = "DELETE FROM NewTutorsTable WHERE TutorID = @TutorID";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand commandSelect = new SqlCommand(querySelect, connection);
                    commandSelect.Parameters.AddWithValue("@TutorID", tutorID);
                    connection.Open();
                    SqlDataReader reader = commandSelect.ExecuteReader();

                    if (reader.Read())
                    {
                        string tutorName = reader["TutorName"].ToString();
                        string registrationDate = reader["RegistrationDate"].ToString();

                        reader.Close();

                        SqlCommand commandInsert = new SqlCommand(queryInsert, connection);
                        commandInsert.Parameters.AddWithValue("@TutorName", tutorName);
                        commandInsert.Parameters.AddWithValue("@RegistrationDate", registrationDate);
                        commandInsert.ExecuteNonQuery();

                        SqlCommand commandDelete = new SqlCommand(queryDelete, connection);
                        commandDelete.Parameters.AddWithValue("@TutorID", tutorID);
                        commandDelete.ExecuteNonQuery();

                        LoadExistingTutors(); // Refresh existing tutors gridview after insertion
                        LoadNewTutors(); // Refresh new tutors gridview after deletion
                    }
                }
            }
            else if (e.CommandName == "Decline")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridViewNewTutors.Rows[index];
                string tutorID = row.Cells[1].Text;

                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                string query = "DELETE FROM NewTutorsTable WHERE TutorID = @TutorID";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@TutorID", tutorID);
                    connection.Open();
                    command.ExecuteNonQuery();

                    LoadNewTutors(); // Refresh new tutors gridview after removal
                }
            }
        }
    }
}
