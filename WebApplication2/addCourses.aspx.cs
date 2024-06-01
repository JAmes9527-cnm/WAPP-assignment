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
    public partial class addCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                // Get the file name and extension
                string fileName = Path.GetFileName(FileUpload1.FileName);
                string fileExtension = Path.GetExtension(FileUpload1.FileName);

                // Specify the directory where you want to save the file
                string directoryPath = Server.MapPath("/img/courseThumbnail/");

                // Create the directory if it doesn't exist
                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }

                // Construct the full file path
                string filePath = Path.Combine(directoryPath, fileName);

                // Save the file to the server
                FileUpload1.SaveAs(filePath);

                // Set the imgUrl to the relative path
                txtThumbnailUrl.Text = "/img/courseThumbnail/" + fileName;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string username = Session["userName"]?.ToString();

            if (string.IsNullOrEmpty(username))
            {
                ShowAlert("User not logged in.");
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                    INSERT INTO courses 
                        (name, description, thumbnailUrl, title1, content1, title2, content2, title3, content3, title4, content4, createdBy) 
                    VALUES 
                        (@name, @description, @thumbnailUrl, @title1, @content1, @title2, @content2, @title3, @content3, @title4, @content4, @username)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@name", txtName.Text);
                    cmd.Parameters.AddWithValue("@description", txtDescription.Text);
                    cmd.Parameters.AddWithValue("@thumbnailUrl", txtThumbnailUrl.Text);
                    cmd.Parameters.AddWithValue("@title1", txtTitle1.Text);
                    cmd.Parameters.AddWithValue("@content1", txtContent1.Text);
                    cmd.Parameters.AddWithValue("@title2", txtTitle2.Text);
                    cmd.Parameters.AddWithValue("@content2", txtContent2.Text);
                    cmd.Parameters.AddWithValue("@title3", txtTitle3.Text);
                    cmd.Parameters.AddWithValue("@content3", txtContent3.Text);
                    cmd.Parameters.AddWithValue("@title4", txtTitle4.Text);
                    cmd.Parameters.AddWithValue("@content4", txtContent4.Text);
                    cmd.Parameters.AddWithValue("@username", username);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        ShowAlert("Course added successfully!", "success");
                    }
                    catch (Exception ex)
                    {
                        ShowAlert("Error: " + ex.Message, "error");
                    }
                }

            }
        }

        private void ShowAlert(string message, string type = "error")
        {
            string alertMessage = type == "success" ? "success" : "danger";
            string script = $"alert('{message.Replace("'", "\\'")}');";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
        }
    }
}
