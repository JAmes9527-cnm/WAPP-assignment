using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class manageTutor : System.Web.UI.Page
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
            // Connect to database and retrieve existing tutors
            using (SqlConnection connection = new SqlConnection("ConnectionString"))
            {
                string query = "SELECT TutorID, TutorName FROM TutorsTable";
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
            // Connect to database and retrieve new tutors awaiting approval
            using (SqlConnection connection = new SqlConnection("ConnectionString"))
            {
                string query = "SELECT TutorID, TutorName, RegistrationDate FROM TutorsTable";
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
                string tutorID = row.Cells[1].Text; // Assuming TutorID is in the second column
                // Write code to remove tutor with the specified ID from the database
            }
        }

        protected void GridViewNewTutors_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Approve")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridViewNewTutors.Rows[index];
                string tutorID = row.Cells[1].Text; // Assuming TutorID is in the second column
                // Write code to approve the new tutor with the specified ID
            }
            else if (e.CommandName == "Decline")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridViewNewTutors.Rows[index];
                string tutorID = row.Cells[1].Text; // Assuming TutorID is in the second column
                // Write code to decline the new tutor with the specified ID
            }
        }
    }
}
