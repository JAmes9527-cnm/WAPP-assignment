﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;


namespace WebApplication2
{
    public partial class UserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userName"] == null)
                {
                    Response.Redirect("login.aspx");
                }
                else
                {
                    String userID = Session["userID"].ToString();

                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    con.Open();

                    SqlDataAdapter da = new SqlDataAdapter("select * from userTable where UserID = '" + userID + "'", con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    id.Text = dt.Rows[0][0].ToString();
                    fname.Text = dt.Rows[0][1].ToString();
                    lname.Text = dt.Rows[0][2].ToString();
                    gender.Text = dt.Rows[0][3].ToString();
                    email.Text = dt.Rows[0][4].ToString();
                    username.Text = dt.Rows[0][5].ToString();
                    password.Text = dt.Rows[0][6].ToString();
                    Image1.ImageUrl = dt.Rows[0]["imgUrl"].ToString();
                    ImgUrl.Text = dt.Rows[0]["imgUrl"].ToString();
                }
            }
        }

        protected void confirmBtn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();

                string updateQuery = "UPDATE userTable SET fname = @fname, lname = @lname, gender = @gender, email = @email, username = @username, password = @password, imgUrl = @imgUrl WHERE UserID = @UserID";
                SqlCommand updateCmd = new SqlCommand(updateQuery, con);
                updateCmd.Parameters.AddWithValue("@fname", fname.Text);
                updateCmd.Parameters.AddWithValue("@lname", lname.Text);
                updateCmd.Parameters.AddWithValue("@gender", gender.Text);
                updateCmd.Parameters.AddWithValue("@email", email.Text);
                updateCmd.Parameters.AddWithValue("@username", username.Text);
                updateCmd.Parameters.AddWithValue("@password", password.Text);
                if (FileUpload1.HasFile)
                {
                    // Get the file name and extension
                    string fileName = Path.GetFileName(FileUpload1.FileName);
                    string fileExtension = Path.GetExtension(FileUpload1.FileName);

                    // Specify the directory where you want to save the file
                    string directoryPath = Server.MapPath("~/img/pfp/");

                    // Create the directory if it doesn't exist
                    if (!Directory.Exists(directoryPath))
                    {
                        Directory.CreateDirectory(directoryPath);
                    }

                    // Construct the full file path
                    string filePath = Path.Combine(directoryPath, fileName);

                    // Save the file to the server
                    FileUpload1.SaveAs(filePath);

                    if (!ImgUrl.Text.Equals("~/img/pfp/default_pfp.png"))
                    {
                        // Construct the full file path of the previous profile picture
                        string previousFilePath = Server.MapPath(ImgUrl.Text);

                        // Delete the previous profile picture file
                        File.Delete(previousFilePath);
                    }

                    // Set the imgUrl to the relative path
                    ImgUrl.Text = "~/img/pfp/" + fileName;
                    updateCmd.Parameters.AddWithValue("@imgUrl", ImgUrl.Text);
                }
                else
                {
                    updateCmd.Parameters.AddWithValue("@imgUrl", ImgUrl.Text);
                }
                updateCmd.Parameters.AddWithValue("@UserID", id.Text);
                updateCmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                Label9.Text = "Error: " + ex.Message;
                Label9.Visible = true;
            }
        }

        protected void deleteBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    // Step 1: Delete the user's vote records from the Votes table
                    string deleteVotesQuery = "DELETE FROM Votes WHERE UserID = @UserID";
                    using (SqlCommand deleteVotesCmd = new SqlCommand(deleteVotesQuery, con))
                    {
                        deleteVotesCmd.Parameters.AddWithValue("@UserID", id.Text);
                        deleteVotesCmd.ExecuteNonQuery();
                    }

                    // Step 2: Delete the user's post records from the Posts table
                    string deletePostsQuery = "DELETE FROM Posts WHERE UserID = @UserID";
                    using (SqlCommand deletePostsCmd = new SqlCommand(deletePostsQuery, con))
                    {
                        deletePostsCmd.Parameters.AddWithValue("@UserID", id.Text);
                        deletePostsCmd.ExecuteNonQuery();
                    }

                    // Step 3: Delete the user's topic records from the Topics table
                    string deleteTopicsQuery = "DELETE FROM Topics WHERE UserID = @UserID";
                    using (SqlCommand deleteTopicsCmd = new SqlCommand(deleteTopicsQuery, con))
                    {
                        deleteTopicsCmd.Parameters.AddWithValue("@UserID", id.Text);
                        deleteTopicsCmd.ExecuteNonQuery();
                    }

                    // Step 4: Delete the user record from the userTable
                    string deleteUserQuery = "DELETE FROM userTable WHERE UserID = @UserID";
                    using (SqlCommand deleteUserCmd = new SqlCommand(deleteUserQuery, con))
                    {
                        deleteUserCmd.Parameters.AddWithValue("@UserID", id.Text);
                        deleteUserCmd.ExecuteNonQuery();
                    }

                    Response.Redirect("login.aspx");
                }
            }
            catch (Exception ex)
            {
                Label9.Text = "Error: " + ex.Message;
                Label9.Visible = true;
            }
        }

        protected void password_TextChanged(object sender, EventArgs e)
        {

        }
    }
}