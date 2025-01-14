﻿using System;
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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["action"] == "update")
                {
                    // Show the alert message
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Update Successful!');", true);
                }
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();

                SqlDataAdapter da = new SqlDataAdapter("select * from Quiz where QuizId = @QuizId", con);
                da.SelectCommand.Parameters.AddWithValue("@QuizId", 0);

                DataTable dt = new DataTable();
                da.Fill(dt);

                QuizID.Text = dt.Rows[0][0].ToString();
                Question.Text = dt.Rows[0][2].ToString();
                Choice1.Text = dt.Rows[0][3].ToString();
                Choice2.Text = dt.Rows[0][4].ToString();
                Choice3.Text = dt.Rows[0][5].ToString();
                Choice4.Text = dt.Rows[0][6].ToString();
                Answer.Text = dt.Rows[0][7].ToString();
            }
        }
        protected void TextBox5_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();

                string query = "select count(*)from Quiz where Question = '" + Question.Text + "'";
                SqlCommand cmd = new SqlCommand(query, con);
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

                    if (Question.Text == "Question")
                    {
                        ErrMsg.Visible = true;
                        ErrMsg.Text = "The Default Display cannot be Add";
                    }
                    else if (Convert.ToInt32(QuizID.Text) > 0)
                    {
                        string updateQuery = "UPDATE Quiz SET Quiz = @Quiz,Question = @Question,Choice1 = @Choice1, Choice2 = @Choice2, Choice3 = @Choice3, Choice4 = @Choice4, Answer = @Answer WHERE QuizID = @QuizID";
                        SqlCommand updateCmd = new SqlCommand(updateQuery, con);
                        updateCmd.Parameters.AddWithValue("@QuizID", QuizID.Text);
                        updateCmd.Parameters.AddWithValue("Quiz", "Quiz1");
                        updateCmd.Parameters.AddWithValue("@Question", Question.Text);
                        updateCmd.Parameters.AddWithValue("@Choice1", Choice1.Text);
                        updateCmd.Parameters.AddWithValue("@Choice2", Choice2.Text);
                        updateCmd.Parameters.AddWithValue("@Choice3", Choice3.Text);
                        updateCmd.Parameters.AddWithValue("@Choice4", Choice4.Text);
                        updateCmd.Parameters.AddWithValue("@Answer", Answer.Text);
                        updateCmd.ExecuteNonQuery();
                        con.Close();
                        ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Update Successful!'); window.location='" + Request.RawUrl + "';", true);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@Question", Question.Text);
                        int questionCount = (int)cmd.ExecuteScalar();

                        if (questionCount > 0)
                        {
                            // Question already exists
                            ErrMsg.Visible = true;
                            ErrMsg.Text = "The question already exists. Please enter a different question.";
                        }
                        else
                        {
                            string quiz = "INSERT INTO Quiz(Quiz,Question,Choice1,Choice2,Choice3,Choice4,Answer) VALUES (@Quiz,@Question,@Choice1,@Choice2,@Choice3,@Choice4,@Answer)";
                            SqlCommand cmd1 = new SqlCommand(quiz, con);
                            cmd1.Parameters.AddWithValue("@Quiz", "Quiz1");
                            cmd1.Parameters.AddWithValue("@Question", Question.Text);
                            cmd1.Parameters.AddWithValue("@Choice1", Choice1.Text);
                            cmd1.Parameters.AddWithValue("@Choice2", Choice2.Text);
                            cmd1.Parameters.AddWithValue("@Choice3", Choice3.Text);
                            cmd1.Parameters.AddWithValue("@Choice4", Choice4.Text);
                            cmd1.Parameters.AddWithValue("@Answer", Answer.Text);
                            cmd1.ExecuteNonQuery();
                            con.Close();
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
            Response.Redirect("course1.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Quiz1Page.aspx");
        }


        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter("select * from Quiz where Question = '" + Number.Text + "'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            con.Close();
            QuizID.Text = dt.Rows[0][0].ToString();
            Question.Text = dt.Rows[0][2].ToString();
            Choice1.Text = dt.Rows[0][3].ToString();
            Choice2.Text = dt.Rows[0][4].ToString();
            Choice3.Text = dt.Rows[0][5].ToString();
            Choice4.Text = dt.Rows[0][6].ToString();
            Answer.Text = dt.Rows[0][7].ToString();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(QuizID.Text) > 0)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();

                string query = "delete from Quiz where Question = '" + Question.Text + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();

                con.Close();
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                ErrMsg.Text = "The QuizID 0 Cannot be Deleted";
                ErrMsg.Visible = true;
            }
        }

        protected void Question_TextChanged(object sender, EventArgs e)
        {

        }
    }
}