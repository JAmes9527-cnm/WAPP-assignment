using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter("select * from Quiz where QuizId = @QuizId", con);
            da.SelectCommand.Parameters.AddWithValue("@QuizId", 1);

                Random random = new Random();
                int randomIndex = random.Next(validQuizIDs.Count);
                int randomQuizID = validQuizIDs[randomIndex];

                SqlDataAdapter da = new SqlDataAdapter("select * from Quiz where QuizID = @QuizId", con);
                da.SelectCommand.Parameters.AddWithValue("@QuizId", randomQuizID);

                DataTable dt = new DataTable();
                da.Fill(dt);

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

                Question1.Text = dt.Rows[0][2].ToString();
                Choice1.Text = dt.Rows[0][randomChoiceIndices[0]].ToString();
                Choice2.Text = dt.Rows[0][randomChoiceIndices[1]].ToString();
                Choice3.Text = dt.Rows[0][randomChoiceIndices[2]].ToString();
                Choice4.Text = dt.Rows[0][randomChoiceIndices[3]].ToString();
                CorrectAnswer = dt.Rows[0][7].ToString();
                ViewState["CorrectAnswer"] = CorrectAnswer;
            }
            else
            {
                CorrectAnswer = ViewState["CorrectAnswer"].ToString();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Answer.Text))
            {
                // If no option is selected, display a message and prevent further action
                verify.Visible = true;
                verify.Text = "Please select an answer.";
                verify.ForeColor = System.Drawing.Color.Red;
                return;
            }

            DataTable dt = new DataTable();
            da.Fill(dt);
            verify.Visible = true;
            if (Answer.Text == CorrectAnswer)
            {
                verify.Text = "Correct Answer!";
                verify.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                verify.Text = "Wrong Answer!Correct Answer is " + CorrectAnswer.ToString();
                verify.ForeColor = System.Drawing.Color.Red;
            }
            Submit.Visible = false;
            Next.Visible = true;

            Choice1.Enabled = false;
            Choice2.Enabled = false;
            Choice3.Enabled = false;
            Choice4.Enabled = false;
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

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }
    }
}
