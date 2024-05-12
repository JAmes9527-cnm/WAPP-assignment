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

            DataTable dt = new DataTable();
            da.Fill(dt);


            Question1.Text = dt.Rows[0][2].ToString();

            Choice1.Text = dt.Rows[0][3].ToString();
            Choice2.Text = dt.Rows[0][4].ToString();
            Choice3.Text = dt.Rows[0][5].ToString();
            Choice4.Text = dt.Rows[0][6].ToString();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select * from Quiz where QuizId = @QuizId", con);
            da.SelectCommand.Parameters.AddWithValue("@QuizId", 1);

            DataTable dt = new DataTable();
            da.Fill(dt);
            verify.Visible = true;
            if (Answer.Text == dt.Rows[0][7].ToString())
            {
                verify.Text = "Correct Answer!";
                verify.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                verify.Text = "Wrong Answer!Correct Answer is " + dt.Rows[0][7].ToString();
                verify.ForeColor = System.Drawing.Color.Red;
            }
            Submit.Visible = false;
            Next.Visible = true;
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
