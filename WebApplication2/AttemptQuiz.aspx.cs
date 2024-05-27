using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class AttemptQuiz : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadQuiz();
            }
        }

        private void LoadQuiz()
        {
            string courseID = Request.QueryString["CourseID"];
            if (string.IsNullOrEmpty(courseID))
            {
                Response.Redirect("Courses.aspx");
            }

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT name FROM courses WHERE CourseID = @CourseID", con);
                cmd.Parameters.AddWithValue("@CourseID", courseID);
                lblCourseTitle.Text = cmd.ExecuteScalar().ToString();

                cmd = new SqlCommand("SELECT * FROM Questions WHERE CourseID = @CourseID", con);
                cmd.Parameters.AddWithValue("@CourseID", courseID);

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        int questionID = Convert.ToInt32(reader["QuestionID"]);
                        string questionText = reader["Question"].ToString();
                        string choice1 = reader["Choice1"].ToString();
                        string choice2 = reader["Choice2"].ToString();
                        string choice3 = reader["Choice3"].ToString();
                        string choice4 = reader["Choice4"].ToString();

                        Label lblQuestion = new Label { Text = questionText, Font = { Size = FontUnit.Large } };
                        phQuestions.Controls.Add(lblQuestion);
                        phQuestions.Controls.Add(new LiteralControl("<br/>"));

                        RadioButtonList rblChoices = new RadioButtonList
                        {
                            ID = "rblChoices_" + questionID,
                            RepeatDirection = RepeatDirection.Vertical
                        };
                        rblChoices.Items.Add(new ListItem(choice1, choice1));
                        rblChoices.Items.Add(new ListItem(choice2, choice2));
                        rblChoices.Items.Add(new ListItem(choice3, choice3));
                        rblChoices.Items.Add(new ListItem(choice4, choice4));

                        phQuestions.Controls.Add(rblChoices);
                        phQuestions.Controls.Add(new LiteralControl("<br/><br/>"));
                    }
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string courseID = Request.QueryString["CourseID"];
            int userID = Convert.ToInt32(Session["UserID"]); // Assumes you have userID stored in session
            int attemptID;

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("INSERT INTO QuizAttempts (UserID, CourseID, AttemptDate) VALUES (@UserID, @CourseID, @AttemptDate); SELECT SCOPE_IDENTITY();", con);
                cmd.Parameters.AddWithValue("@UserID", userID);
                cmd.Parameters.AddWithValue("@CourseID", courseID);
                cmd.Parameters.AddWithValue("@AttemptDate", DateTime.Now);
                attemptID = Convert.ToInt32(cmd.ExecuteScalar());

                foreach (Control control in phQuestions.Controls)
                {
                    if (control is RadioButtonList rbl)
                    {
                        int questionID = Convert.ToInt32(rbl.ID.Split('_')[1]);
                        string userAnswer = rbl.SelectedValue;

                        cmd = new SqlCommand("INSERT INTO QuizAnswers (AttemptID, QuestionID, UserAnswer) VALUES (@AttemptID, @QuestionID, @UserAnswer)", con);
                        cmd.Parameters.AddWithValue("@AttemptID", attemptID);
                        cmd.Parameters.AddWithValue("@QuestionID", questionID);
                        cmd.Parameters.AddWithValue("@UserAnswer", userAnswer);
                        cmd.ExecuteNonQuery();
                    }
                }
            }

            Response.Redirect("QuizResult.aspx?AttemptID=" + attemptID);
        }
    }
}
