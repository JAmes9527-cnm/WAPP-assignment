﻿using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace WebApplication2
{
    public partial class manageStudents : System.Web.UI.Page
    {

        protected int StudentCount { get; set; }
        protected int TutorCount { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
                RetrieveUserCounts();
                RegisterChartScript();
            }
        }

        private void RegisterChartScript()
        {
            string script = $"document.addEventListener('DOMContentLoaded', function() {{ initChart({StudentCount}, {TutorCount}); }});";
            ClientScript.RegisterStartupScript(this.GetType(), "initChartScript", script, true);
        }

        protected void SearchUsers(object sender, EventArgs e)
        {
            BindGrid(txtSearch.Text.Trim(), ddlUserType.SelectedValue);
        }

        private void BindGrid(string search = "", string userType = "")
        {
            string query = "SELECT * FROM userTable WHERE (@search = '' OR username LIKE '%' + @search + '%' OR email LIKE '%' + @search + '%')";
            if (!string.IsNullOrEmpty(userType))
            {
                query += " AND usertype = @userType";
            }

            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@search", search);
                    cmd.Parameters.AddWithValue("@userType", userType);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }
        private void RetrieveUserCounts()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(CASE WHEN usertype = 'member' THEN 1 END) AS StudentCount, " +
                               "COUNT(CASE WHEN usertype = 'tutor' THEN 1 END) AS TutorCount FROM userTable";

                SqlCommand cmd = new SqlCommand(query, conn);

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            StudentCount = reader.GetInt32(0);
                            TutorCount = reader.GetInt32(1);
                        }
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    // Handle exceptions
                    Console.WriteLine("Error: " + ex.Message);
                }
            }
        }


        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM userTable", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int userId = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "View")
            {
                Response.Redirect($"viewProfile.aspx?UserID={userId}");
            }
            else if (e.CommandName == "Delete")
            {
                DeleteUser(userId);
            }
        }

        private void DeleteUser(int userId)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM userTable WHERE UserID = @UserID", con))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            BindGrid();
        }
    }
}