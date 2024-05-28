using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;

namespace WebApplication2
{
    public partial class QuizResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadResult();
            }
        }

        private void LoadResult()
        {
            string attemptID = Request.QueryString["AttemptID"];
            if (string.IsNullOrEmpty(attemptID))
            {
                Response.Redirect("Courses.aspx");
            }

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM QuizAnswers WHERE AttemptID = @AttemptID AND UserAnswer = (SELECT Answer FROM Questions WHERE QuestionID = QuizAnswers.QuestionID)", con);
                cmd.Parameters.AddWithValue("@AttemptID", attemptID);

                int correctAnswers = Convert.ToInt32(cmd.ExecuteScalar());
                lblResult.Text = "You got " + correctAnswers + " correct answers.";

                // Get the detailed results
                cmd = new SqlCommand(
                    "SELECT Questions.Question, Questions.Answer AS CorrectAnswer, QA.UserAnswer " +
                    "FROM QuizAnswers QA " +
                    "INNER JOIN Questions Q ON QA.QuestionID = Q.QuestionID " +
                    "WHERE QA.AttemptID = @AttemptID", con);
                cmd.Parameters.AddWithValue("@AttemptID", attemptID);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptQuestions.DataSource = dt;
                rptQuestions.DataBind();
            }
        }
    }
}
