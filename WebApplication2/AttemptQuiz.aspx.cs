using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class AttemptQuiz : System.Web.UI.Page
    {
        string courseID;
        string CorrectAnswer;
        int totalResult = 0;
        List<int> validQuizIDs = new List<int>();
        protected void Page_Load(object sender, EventArgs e)
        {
            courseID = Request.QueryString["courseID"]; ;
            if (!IsPostBack)
            {
                LoadQuiz();
            }
        }

        private void LoadQuiz()
        {
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

                SqlCommand idCmd = new SqlCommand("Select QuizID from Quiz Where Quiz = @CourseID", con);
                idCmd.Parameters.AddWithValue("@CourseID", courseID);
                SqlDataReader reader = idCmd.ExecuteReader();
                while (reader.Read())
                {
                    validQuizIDs.Add(Convert.ToInt32(reader["QuizID"]));
                }
                reader.Close();

                Random random = new Random();

                for (int i = 0; i < 3; i++)
                {
                    if (validQuizIDs.Count != 0)
                    {
                        int randomIndex = random.Next(validQuizIDs.Count);
                        int randomQuizID = validQuizIDs[randomIndex];

                        SqlDataAdapter da = new SqlDataAdapter("select * from Quiz where QuizID = @QuizId", con);
                        da.SelectCommand.Parameters.AddWithValue("@QuizId", randomQuizID);

                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        validQuizIDs.RemoveAt(randomIndex);

                        Random randomChoice = new Random();
                        List<int> randomChoiceIndices = new List<int>();

                        while (randomChoiceIndices.Count < 4)
                        {
                            int randomChoiceIndex = randomChoice.Next(3, 7); // 7 is exclusive, so it will give values from 3 to 6
                            if (!randomChoiceIndices.Contains(randomChoiceIndex))
                            {
                                randomChoiceIndices.Add(randomChoiceIndex);
                            }
                        }

                        if (i == 0)
                        {
                            Question1.Text = dt.Rows[0][2].ToString();
                            Choice1.Text = dt.Rows[0][randomChoiceIndices[0]].ToString();
                            Choice2.Text = dt.Rows[0][randomChoiceIndices[1]].ToString();
                            Choice3.Text = dt.Rows[0][randomChoiceIndices[2]].ToString();
                            Choice4.Text = dt.Rows[0][randomChoiceIndices[3]].ToString();
                            CorrectAnswer = dt.Rows[0][7].ToString();
                            ViewState["CorrectAnswer1"] = CorrectAnswer;
                        }
                        else if (i == 1)
                        {
                            Question2.Text = dt.Rows[0][2].ToString();
                            Choice5.Text = dt.Rows[0][randomChoiceIndices[0]].ToString();
                            Choice6.Text = dt.Rows[0][randomChoiceIndices[1]].ToString();
                            Choice7.Text = dt.Rows[0][randomChoiceIndices[2]].ToString();
                            Choice8.Text = dt.Rows[0][randomChoiceIndices[3]].ToString();
                            CorrectAnswer = dt.Rows[0][7].ToString();
                            ViewState["CorrectAnswer2"] = CorrectAnswer;
                        }
                        else if (i == 2)
                        {
                            Question3.Text = dt.Rows[0][2].ToString();
                            Choice9.Text = dt.Rows[0][randomChoiceIndices[0]].ToString();
                            Choice10.Text = dt.Rows[0][randomChoiceIndices[1]].ToString();
                            Choice11.Text = dt.Rows[0][randomChoiceIndices[2]].ToString();
                            Choice12.Text = dt.Rows[0][randomChoiceIndices[3]].ToString();
                            CorrectAnswer = dt.Rows[0][7].ToString();
                            ViewState["CorrectAnswer3"] = CorrectAnswer;

                        }
                    }
                    else
                    {

                    }
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Answer.Text) || string.IsNullOrEmpty(Answer2.Text) || string.IsNullOrEmpty(Answer3.Text))
            {
                verify.Visible = false;
                verify2.Visible = false;
                verify3.Visible = false;

                if (string.IsNullOrEmpty(Answer.Text))
                {
                    verify.Visible = true;
                    verify.Text = "Please select an answer for question 1.";
                    verify.ForeColor = System.Drawing.Color.Red;
                }
                if (string.IsNullOrEmpty(Answer2.Text))
                {
                    verify2.Visible = true;
                    verify2.Text = "Please select an answer for question 2.";
                    verify2.ForeColor = System.Drawing.Color.Red;
                }
                if (string.IsNullOrEmpty(Answer3.Text))
                {
                    verify3.Visible = true;
                    verify3.Text = "Please select an answer for question 3.";
                    verify3.ForeColor = System.Drawing.Color.Red;
                }
                return;
            }

            verify.Visible = true;
            verify2.Visible = true;
            verify3.Visible = true;

            if (Answer.Text == ViewState["CorrectAnswer1"].ToString())
            {
                verify.Text = "Correct Answer!";
                verify.ForeColor = System.Drawing.Color.Green;
                totalResult++;
            }
            else
            {
                verify.Text = "Wrong Answer!Correct Answer is " + ViewState["CorrectAnswer1"].ToString();
                verify.ForeColor = System.Drawing.Color.Red;
            }

            if (Answer2.Text == ViewState["CorrectAnswer2"].ToString())
            {
                verify2.Text = "Correct Answer!";
                verify2.ForeColor = System.Drawing.Color.Green;
                totalResult++;
            }
            else
            {
                verify2.Text = "Wrong Answer!Correct Answer is " + ViewState["CorrectAnswer2"].ToString();
                verify2.ForeColor = System.Drawing.Color.Red;
            }

            if (Answer3.Text == ViewState["CorrectAnswer3"].ToString())
            {
                verify3.Text = "Correct Answer!";
                verify3.ForeColor = System.Drawing.Color.Green;
                totalResult++;
            }
            else
            {
                verify3.Text = "Wrong Answer!Correct Answer is " + ViewState["CorrectAnswer3"].ToString();
                verify3.ForeColor = System.Drawing.Color.Red;
            }
            Submit.Visible = false;
            Next.Visible = true;
            Button1.Visible = true;

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO ResultTable (StudentID, CourseID, Q1, StudentAnswer1, CorrectAnswer1, Result1, Q2, StudentAnswer2, CorrectAnswer2, Result2, Q3, StudentAnswer3, CorrectAnswer3, Result3, TotalResult) VALUES (@StudentID, @CourseID, @Q1, @StudentAnswer1, @CorrectAnswer1, @Result1, @Q2, @StudentAnswer2, @CorrectAnswer2, @Result2, @Q3, @StudentAnswer3, @CorrectAnswer3, @Result3, @TotalResult)", con);
                cmd.Parameters.AddWithValue("@StudentID", Session["UserID"]);
                cmd.Parameters.AddWithValue("@CourseID", courseID);
                cmd.Parameters.AddWithValue("@Q1", Question1.Text);
                cmd.Parameters.AddWithValue("@StudentAnswer1", Answer.Text);
                cmd.Parameters.AddWithValue("@CorrectAnswer1", ViewState["CorrectAnswer1"].ToString());
                cmd.Parameters.AddWithValue("@Result1", (Answer.Text == ViewState["CorrectAnswer1"].ToString()) ? "Correct" : "Wrong");
                cmd.Parameters.AddWithValue("@Q2", Question2.Text);
                cmd.Parameters.AddWithValue("@StudentAnswer2", Answer2.Text);
                cmd.Parameters.AddWithValue("@CorrectAnswer2", ViewState["CorrectAnswer2"].ToString());
                cmd.Parameters.AddWithValue("@Result2", (Answer2.Text == ViewState["CorrectAnswer2"].ToString()) ? "Correct" : "Wrong");
                cmd.Parameters.AddWithValue("@Q3", Question3.Text);
                cmd.Parameters.AddWithValue("@StudentAnswer3", Answer3.Text);
                cmd.Parameters.AddWithValue("@CorrectAnswer3", ViewState["CorrectAnswer3"].ToString());
                cmd.Parameters.AddWithValue("@Result3", (Answer3.Text == ViewState["CorrectAnswer3"].ToString()) ? "Correct" : "Wrong");
                cmd.Parameters.AddWithValue("@TotalResult", totalResult);

                cmd.ExecuteNonQuery();
            }

            Choice1.Enabled = false;
            Choice2.Enabled = false;
            Choice3.Enabled = false;
            Choice4.Enabled = false;
            Choice5.Enabled = false;
            Choice6.Enabled = false;
            Choice7.Enabled = false;
            Choice8.Enabled = false;
            Choice9.Enabled = false;
            Choice10.Enabled = false;
            Choice10.Enabled = false;
            Choice12.Enabled = false;


        }


        protected void Choice1_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton selectedChoice = (RadioButton)sender;
            if (selectedChoice.Checked)
            {
                Answer.Text = selectedChoice.Text;
            }
        }

        protected void Choice2_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton selectedChoice = (RadioButton)sender;
            if (selectedChoice.Checked)
            {
                Answer.Text = selectedChoice.Text;
            }
        }

        protected void Choice3_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton selectedChoice = (RadioButton)sender;
            if (selectedChoice.Checked)
            {
                Answer.Text = selectedChoice.Text;
            }
        }

        protected void Choice4_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton selectedChoice = (RadioButton)sender;
            if (selectedChoice.Checked)
            {
                Answer.Text = selectedChoice.Text;
            }
        }

        protected void Choice5_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton selectedChoice = (RadioButton)sender;
            if (selectedChoice.Checked)
            {
                Answer2.Text = selectedChoice.Text;
            }
        }

        protected void Choice6_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton selectedChoice = (RadioButton)sender;
            if (selectedChoice.Checked)
            {
                Answer2.Text = selectedChoice.Text;
            }
        }

        protected void Choice7_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton selectedChoice = (RadioButton)sender;
            if (selectedChoice.Checked)
            {
                Answer2.Text = selectedChoice.Text;
            }
        }

        protected void Choice8_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton selectedChoice = (RadioButton)sender;
            if (selectedChoice.Checked)
            {
                Answer2.Text = selectedChoice.Text;
            }
        }

        protected void Choice9_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton selectedChoice = (RadioButton)sender;
            if (selectedChoice.Checked)
            {
                Answer3.Text = selectedChoice.Text;
            }
        }

        protected void Choice10_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton selectedChoice = (RadioButton)sender;
            if (selectedChoice.Checked)
            {
                Answer3.Text = selectedChoice.Text;
            }
        }

        protected void Choice11_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton selectedChoice = (RadioButton)sender;
            if (selectedChoice.Checked)
            {
                Answer3.Text = selectedChoice.Text;
            }
        }

        protected void Choice12_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton selectedChoice = (RadioButton)sender;
            if (selectedChoice.Checked)
            {
                Answer3.Text = selectedChoice.Text;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("QuizResult.aspx?CourseID=" +courseID);
        }
    }
}
