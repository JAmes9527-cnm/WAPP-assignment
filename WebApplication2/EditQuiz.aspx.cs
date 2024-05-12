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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { 
/*
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter("select * from Quiz where Question = '" + Number.Text + "'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            N.Text = dt.Rows[0][0].ToString();
            Question.Text = dt.Rows[0][1].ToString();
            Choice1.Text = dt.Rows[0][2].ToString();
            Choice2.Text = dt.Rows[0][3].ToString();
            Choice3.Text = dt.Rows[0][4].ToString();
            Choice4.Text = dt.Rows[0][5].ToString();
            Answer.Text = dt.Rows[0][6].ToString();
*/
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

                string query = "select count(*)from Quiz where Question = 'ggg'";
                SqlCommand cmd = new SqlCommand(query, con);
                int check = Convert.ToInt32(cmd.ExecuteScalar().ToString());

                if (check > 0)
                {
                    string updateQuery = "UPDATE Quiz SET Choice1 = @Choice1, Choice2 = @Choice2, Choice3 = @Choice3, Choice4 = @Choice4, Answer = @Answer WHERE Question = @Question";
                    SqlCommand updateCmd = new SqlCommand(updateQuery, con);
                    updateCmd.Parameters.AddWithValue("@Question", Question.Text);
                    updateCmd.Parameters.AddWithValue("@Choice1", Choice1.Text);
                    updateCmd.Parameters.AddWithValue("@Choice2", Choice2.Text);
                    updateCmd.Parameters.AddWithValue("@Choice3", Choice3.Text);
                    updateCmd.Parameters.AddWithValue("@Choice4", Choice4.Text);
                    updateCmd.Parameters.AddWithValue("@Answer", Answer.Text);
                    updateCmd.ExecuteNonQuery();
                }
                else
                {
                    string quiz = "INSERT INTO Quiz(Question,Choice1,Choice2,Choice3,Choice4,Answer) VALUES (@Question,@Choice1,@Choice2,@Choice3,@Choice4,@Answer)";
                    SqlCommand cmd1 = new SqlCommand(quiz, con);
                    cmd1.Parameters.AddWithValue("@Question", Question.Text);
                    cmd1.Parameters.AddWithValue("@Choice1", Choice1.Text);
                    cmd1.Parameters.AddWithValue("@Choice2", Choice2.Text);
                    cmd1.Parameters.AddWithValue("@Choice3", Choice3.Text);
                    cmd1.Parameters.AddWithValue("@Choice4", Choice4.Text);
                    cmd1.Parameters.AddWithValue("@Answer", Answer.Text);
                    cmd1.ExecuteNonQuery();
                }
                con.Close();
                Response.Redirect(Request.RawUrl);

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

        }

        protected void Question_TextChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter("select * from Quiz where Question = '" + Number.Text + "'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            N.Text = dt.Rows[0][0].ToString();
            Question.Text = dt.Rows[0][1].ToString();
            Choice1.Text = dt.Rows[0][2].ToString();
            Choice2.Text = dt.Rows[0][3].ToString();
            Choice3.Text = dt.Rows[0][4].ToString();
            Choice4.Text = dt.Rows[0][5].ToString();
            Answer.Text = dt.Rows[0][6].ToString();
        }


    }
}