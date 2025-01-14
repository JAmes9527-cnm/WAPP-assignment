﻿using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class manageTutor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindExistingTutorsGrid();
                BindNewTutorsGrid();
            }
        }

        protected void SearchTutors(object sender, EventArgs e)
        {
            BindExistingTutorsGrid(txtSearch.Text.Trim());
            BindNewTutorsGrid(txtSearch.Text.Trim()); // Assuming you want to search new tutors as well
        }

        private void BindExistingTutorsGrid(string searchTerm = "")
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query = @"SELECT UserID, fname, lname FROM userTable 
                     WHERE Verified = 1 AND usertype = 'tutor' 
                     AND (fname LIKE '%' + @searchTerm + '%' OR lname LIKE '%' + @searchTerm + '%')";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@searchTerm", searchTerm);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        GridViewExistingTutors.DataSource = dt;
                        GridViewExistingTutors.DataBind();
                    }
                }
            }
        }

        private void BindNewTutorsGrid(string searchTerm = "")
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query = @"SELECT UserID, fname, lname, RegisterDate FROM userTable 
                     WHERE Verified = 0 AND usertype = 'tutor' 
                     AND (fname LIKE '%' + @searchTerm + '%' OR lname LIKE '%' + @searchTerm + '%')";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@searchTerm", searchTerm);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        GridViewNewTutors.DataSource = dt;
                        GridViewNewTutors.DataBind();
                    }
                }
            }
        }

        protected void GridViewExistingTutors_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                int userId = Convert.ToInt32(e.CommandArgument);
                RemoveTutor(userId);
                BindExistingTutorsGrid();
            }
            else if (e.CommandName == "ViewProfile")
            {
                int userId = Convert.ToInt32(e.CommandArgument);
                Response.Redirect($"viewProfile.aspx?UserID={userId}");
            }
        }

        protected void GridViewNewTutors_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int userId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Approve")
            {
                ApproveTutor(userId);
            }
            else if (e.CommandName == "ViewProfile")
            {
                Response.Redirect($"viewProfile.aspx?UserID={userId}");
            }
            else if (e.CommandName == "Decline")
            {
                DeclineTutor(userId);
            }

            BindNewTutorsGrid();
        }

        private void RemoveTutor(int userId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM userTable WHERE UserID = @UserID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
        }

        private void ApproveTutor(int userId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "UPDATE userTable SET Verified = 1 WHERE UserID = @UserID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
        }

        private void DeclineTutor(int userId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM userTable WHERE UserID = @UserID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
        }
    }
}
