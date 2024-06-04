using System;
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
            if (Session["userName"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                if (!IsPostBack || Image1.ImageUrl == null)
                {
                    LoadUserData();
                }
            }
        }

        private void LoadUserData()
        {
            String userID = Session["userID"].ToString();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter("select * from userTable where UserID = '" + userID + "'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                id.Text = dt.Rows[0]["UserID"].ToString();
                fname.Text = dt.Rows[0]["fname"].ToString();
                lname.Text = dt.Rows[0]["lname"].ToString();
                gender.Text = dt.Rows[0]["gender"].ToString();
                email.Text = dt.Rows[0]["email"].ToString();
                username.Text = dt.Rows[0]["username"].ToString();
                password.Text = dt.Rows[0]["password"].ToString();
                Image1.ImageUrl = dt.Rows[0]["imgUrl"].ToString();
                ImgUrl.Text = dt.Rows[0]["imgUrl"].ToString();
            }

            con.Close();
        }


        protected void confirmBtn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();

                // Define a base query without the password.
                string updateQuery = "UPDATE userTable SET fname = @fname, lname = @lname, gender = @gender, email = @email, username = @username, imgUrl = @imgUrl WHERE UserID = @UserID";

                SqlCommand updateCmd = new SqlCommand(updateQuery, con);
                updateCmd.Parameters.AddWithValue("@fname", fname.Text);
                updateCmd.Parameters.AddWithValue("@lname", lname.Text);
                updateCmd.Parameters.AddWithValue("@gender", gender.Text);
                updateCmd.Parameters.AddWithValue("@email", email.Text);
                updateCmd.Parameters.AddWithValue("@username", username.Text);
                updateCmd.Parameters.AddWithValue("@imgUrl", ProcessFileUploadAndGetImageUrl());
                updateCmd.Parameters.AddWithValue("@UserID", id.Text);

                // Check if the password field is not empty.
                if (!string.IsNullOrWhiteSpace(password.Text))
                {
                    // Add password to the update query if it's not empty.
                    updateQuery = "UPDATE userTable SET fname = @fname, lname = @lname, gender = @gender, email = @email, username = @username, password = @password, imgUrl = @imgUrl WHERE UserID = @UserID";
                    updateCmd.CommandText = updateQuery; // Set the command text to include password.
                    updateCmd.Parameters.AddWithValue("@password", password.Text);
                }

                updateCmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("UserProfile.aspx");
            }
            catch (Exception ex)
            {
                Label9.Text = "Error: " + ex.Message;
                Label9.Visible = true;
            }
        }

        private string ProcessFileUploadAndGetImageUrl()
        {
            if (FileUpload1.HasFile)
            {
                // Handle file upload and return the new image URL.
                string fileName = Path.GetFileName(FileUpload1.FileName);
                string directoryPath = Server.MapPath("/img/pfp/");
                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }
                string filePath = Path.Combine(directoryPath, fileName);
                FileUpload1.SaveAs(filePath);

                if (!ImgUrl.Text.Equals("/img/pfp/default_pfp.png"))
                {
                    string previousFilePath = Server.MapPath(ImgUrl.Text);
                    File.Delete(previousFilePath);
                }
                ImgUrl.Text = filePath;
                return "/img/pfp/" + fileName; // Return new image URL.
            }
            return ImgUrl.Text; // Return existing image URL if no file is uploaded.
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
                    Session.Clear();
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