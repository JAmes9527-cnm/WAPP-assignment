using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class ViewResult : System.Web.UI.Page
    {
        string TutorID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["username"] != null)
            {
                TutorID = Request.QueryString["username"];
            }
            else
            {
                Response.Redirect("courses.aspx");
            }
            // Check if the user is logged in
            if (Session["usertype"] != null)
            {
                string userType = Session["usertype"].ToString();

                // Check if the user is a tutor
                if (userType == "tutor")
                {
                    // Show all data
                    SqlDataSource1.SelectCommand = "SELECT * FROM [ResultTable] WHERE CourseID IN (SELECT CourseID FROM courses WHERE CreatedBy = @username)";
                    SqlDataSource1.SelectParameters.Clear();
                    SqlDataSource1.SelectParameters.Add("username", TutorID);
                }
                else if (userType == "member")
                {
                    String userID = Session["userID"].ToString();
                    SqlDataSource1.SelectCommand = "SELECT * FROM [ResultTable] WHERE StudentID = @StudentID";
                    SqlDataSource1.SelectParameters.Clear();
                    SqlDataSource1.SelectParameters.Add("StudentID", userID);
                }
                else if (userType == "admin")
                {
                    SqlDataSource1.SelectCommand = "SELECT * FROM [ResultTable]";
                }

                if (userType == "member")
                {
                    if (GridView1.Columns.Count > 0)
                    {
                        GridView1.Columns[0].Visible = false;
                    }
                }

            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
            string studentID = ((TextBox)row.Cells[1].Controls[0]).Text;
            string courseID = ((TextBox)row.Cells[2].Controls[0]).Text;
            string q1 = ((TextBox)row.Cells[3].Controls[0]).Text;
            string studentAnswer1 = ((TextBox)row.Cells[4].Controls[0]).Text;
            string correctAnswer1 = ((TextBox)row.Cells[5].Controls[0]).Text;
            string result1 = ((TextBox)row.Cells[6].Controls[0]).Text;
            string q2 = ((TextBox)row.Cells[7].Controls[0]).Text;
            string studentAnswer2 = ((TextBox)row.Cells[8].Controls[0]).Text;
            string correctAnswer2 = ((TextBox)row.Cells[9].Controls[0]).Text;
            string result2 = ((TextBox)row.Cells[10].Controls[0]).Text;
            string q3 = ((TextBox)row.Cells[11].Controls[0]).Text;
            string studentAnswer3 = ((TextBox)row.Cells[12].Controls[0]).Text;
            string correctAnswer3 = ((TextBox)row.Cells[13].Controls[0]).Text;
            string result3 = ((TextBox)row.Cells[14].Controls[0]).Text;
            string totalResult = ((TextBox) row.Cells[15].Controls[0]).Text;

            SqlDataSource1.UpdateParameters["Id"].DefaultValue = id;
            SqlDataSource1.UpdateParameters["StudentID"].DefaultValue = studentID;
            SqlDataSource1.UpdateParameters["CourseID"].DefaultValue = courseID;
            SqlDataSource1.UpdateParameters["Q1"].DefaultValue = q1;
            SqlDataSource1.UpdateParameters["StudentAnswer1"].DefaultValue = studentAnswer1;
            SqlDataSource1.UpdateParameters["CorrectAnswer1"].DefaultValue = correctAnswer1;
            SqlDataSource1.UpdateParameters["Result1"].DefaultValue = result1;
            SqlDataSource1.UpdateParameters["Q2"].DefaultValue = q2;
            SqlDataSource1.UpdateParameters["StudentAnswer2"].DefaultValue = studentAnswer2;
            SqlDataSource1.UpdateParameters["CorrectAnswer2"].DefaultValue = correctAnswer2;
            SqlDataSource1.UpdateParameters["Result2"].DefaultValue = result2;
            SqlDataSource1.UpdateParameters["Q3"].DefaultValue = q3;
            SqlDataSource1.UpdateParameters["StudentAnswer3"].DefaultValue = studentAnswer3;
            SqlDataSource1.UpdateParameters["CorrectAnswer3"].DefaultValue = correctAnswer3;
            SqlDataSource1.UpdateParameters["Result3"].DefaultValue = result3;
            SqlDataSource1.UpdateParameters["TotalResult"].DefaultValue = totalResult;
            SqlDataSource1.Update();

            GridView1.EditIndex = -1;
            GridView1.DataBind();

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex == e.Row.RowIndex)
            {
                // Find the DropDownList controls in edit mode
                DropDownList ddlResult1 = (DropDownList)e.Row.FindControl("DropDownListResult1");
                DropDownList ddlResult2 = (DropDownList)e.Row.FindControl("DropDownListResult2");
                DropDownList ddlResult3 = (DropDownList)e.Row.FindControl("DropDownListResult3");

                // Get the corresponding values from the database and set as selected values for the DropDownLists
                if (ddlResult1 != null)
                {
                    string result1 = ((DataRowView)e.Row.DataItem)["Result1"].ToString();
                    ddlResult1.SelectedValue = result1;
                }

                if (ddlResult2 != null)
                {
                    string result2 = ((DataRowView)e.Row.DataItem)["Result2"].ToString();
                    ddlResult2.SelectedValue = result2;
                }

                if (ddlResult3 != null)
                {
                    string result3 = ((DataRowView)e.Row.DataItem)["Result3"].ToString();
                    ddlResult3.SelectedValue = result3;
                }
            }
        }



        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("AttemptQuiz.aspx");
        }
    }
}