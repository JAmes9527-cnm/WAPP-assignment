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
               
                LoadExistingTutors();

                // Load new tutors awaiting approval
                LoadNewTutors();
            }
        }

        private void LoadExistingTutors()
        {
            // Replace "Your_Connection_String" with your actual connection string
            string connectionString = "ConnectionString";
            string query = "SELECT * FROM TutorTable"; // Assuming TutorTable is your table for existing tutors

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                GridViewExistingTutors.DataSource = reader;
                GridViewExistingTutors.DataBind();
            }
        }

        private void LoadNewTutors()
        {
            // Replace "Your_Connection_String" with your actual connection string
            string connectionString = "Your_Connection_String";
            string query = "SELECT * FROM NewTutorTable"; // Assuming NewTutorTable is your table for new tutors awaiting approval

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                GridViewNewTutors.DataSource = reader;
                GridViewNewTutors.DataBind();
            }
        }

        protected void ApproveTutorsButton_Click(object sender, EventArgs e)
        {
            // Logic to approve newly registered tutors
            // You can implement this based on your application requirements
        }

        protected void RemoveTutorButton_Click(object sender, EventArgs e)
        {
            // Logic to remove existing tutors
            // You can implement this based on your application requirements
        }
    }
}
