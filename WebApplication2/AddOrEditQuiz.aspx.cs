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
    public partial class AddOrEditQuiz : System.Web.UI.Page
    {
        string CourseID;
        protected void Page_Load(object sender, EventArgs e)
        {
            CourseID = Request.QueryString["CourseID"];
            if (string.IsNullOrEmpty(CourseID))
            {
                Response.Redirect("Courses.aspx");
            }
            if (!IsPostBack)
            {
                SqlDataSource1.SelectParameters["CourseID"].DefaultValue = CourseID;
            }
        }
        protected void TextBox5_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    con.Open();

                    string[] choices = { Choice1.Text, Choice2.Text, Choice3.Text, Choice4.Text };
                    string answer = Answer.Text.Trim();

                    if (!choices.Contains(answer))
                    {
                        // Invalid answer
                        ErrMsg.Visible = true;
                        ErrMsg.Text = "The answer must be one of the choices.";
                    }
                    else
                    {
                        if (SelectedQuestion.SelectedItem != null && Question.Text.Equals(SelectedQuestion.SelectedItem.Text))
                        {
                            string updateQuery = "UPDATE Quiz SET Quiz = @CourseID, Question = @Question, Choice1 = @Choice1, Choice2 = @Choice2, Choice3 = @Choice3, Choice4 = @Choice4, Answer = @Answer WHERE QuizID = @QuestionID";
                            using (SqlCommand updateCmd = new SqlCommand(updateQuery, con))
                            {
                                updateCmd.Parameters.AddWithValue("@CourseID", CourseID);
                                updateCmd.Parameters.AddWithValue("@QuestionID", QuestionID.Text);
                                updateCmd.Parameters.AddWithValue("@Question", Question.Text);
                                updateCmd.Parameters.AddWithValue("@Choice1", Choice1.Text);
                                updateCmd.Parameters.AddWithValue("@Choice2", Choice2.Text);
                                updateCmd.Parameters.AddWithValue("@Choice3", Choice3.Text);
                                updateCmd.Parameters.AddWithValue("@Choice4", Choice4.Text);
                                updateCmd.Parameters.AddWithValue("@Answer", Answer.Text);
                                updateCmd.ExecuteNonQuery();
                            }
                            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Update Successful!'); window.location='" + Request.RawUrl + "';", true);
                        }
                        else if (checkQuestionExist(Question.Text, CourseID))
                        {
                            Response.Write("<script>alert('This question already exists.')</script>");
                        }
                        else
                        {
                            string insertQuery = "INSERT INTO Quiz (Quiz, Question, Choice1, Choice2, Choice3, Choice4, Answer) VALUES (@CourseID, @Question, @Choice1, @Choice2, @Choice3, @Choice4, @Answer)";
                            using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                            {
                                cmd.Parameters.AddWithValue("@CourseID", CourseID);
                                cmd.Parameters.AddWithValue("@Question", Question.Text);
                                cmd.Parameters.AddWithValue("@Choice1", Choice1.Text);
                                cmd.Parameters.AddWithValue("@Choice2", Choice2.Text);
                                cmd.Parameters.AddWithValue("@Choice3", Choice3.Text);
                                cmd.Parameters.AddWithValue("@Choice4", Choice4.Text);
                                cmd.Parameters.AddWithValue("@Answer", Answer.Text);
                                cmd.ExecuteNonQuery();
                            }
                            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Add Question Successful!'); window.location='" + Request.RawUrl + "';", true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Label1.Text = "Error: " + ex.Message;
            }
        }


        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewCourse.aspx?CourseID=" + CourseID);
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter("select * from Quiz where Question = '" + SelectedQuestion.Text + "'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            con.Close();
            QuestionID.Text = dt.Rows[0][0].ToString();
            Question.Text = dt.Rows[0][2].ToString();
            Choice1.Text = dt.Rows[0][3].ToString();
            Choice2.Text = dt.Rows[0][4].ToString();
            Choice3.Text = dt.Rows[0][5].ToString();
            Choice4.Text = dt.Rows[0][6].ToString();
            Answer.Text = dt.Rows[0][7].ToString();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string query = "delete from Quiz where QuizID = '" + QuestionID.Text + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();

            con.Close();
            Response.Redirect(Request.RawUrl);

        }

        protected void Question_TextChanged(object sender, EventArgs e)
        {

        }

        private bool checkQuestionExist(string question, string courseID)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();

                    string query = "SELECT COUNT(*) FROM Quiz WHERE Question = @Question AND CourseID = @CourseID";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Question", question);
                        cmd.Parameters.AddWithValue("@CourseID", courseID);
                        int count = (int)cmd.ExecuteScalar();
                        return count > 0;
                    }
                }
            }
            catch
            {
                // Handle exception
                return false;
            }
        }

    }
}