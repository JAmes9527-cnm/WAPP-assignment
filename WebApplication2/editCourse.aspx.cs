using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Web.UI;
using System.Data;
using System.IO;


namespace WebApplication2
{
    public partial class editCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();
                string courseID = Request.QueryString["courseID"];
                if (string.IsNullOrEmpty(courseID))
                {
                    // Handle missing courseID, show an error or redirect
                    return;
                }
                SqlCommand cmdType = new SqlCommand("select createdBy from courses where CourseID = '" + courseID + "'", con);
                SqlDataReader dr = cmdType.ExecuteReader();
                string username = "unknown";
                if (dr.Read())
                {
                    username = dr["CreatedBy"].ToString().Trim();
                }
                dr.Close();

                if (Session["userName"] == null)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "showErrorMessage('login.aspx');", true);
                }
                else if (Session["userName"].ToString() != username)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "showTutorErrorMessage('viewCourse.aspx);", true);
                }
                else
                {

                    SqlDataAdapter da = new SqlDataAdapter("select name, description, thumbnailUrl, title1, content1, title2, content2, title3, content3, title4, content4 from courses where CourseID = '" + courseID + "'", con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    txtName.Text = dt.Rows[0][0].ToString();
                    txtDescription.Text = dt.Rows[0][1].ToString();
                    txtThumbnailUrl.Text = dt.Rows[0][2].ToString();
                    Image1.ImageUrl = dt.Rows[0][2].ToString();
                    txtTitle1.Text = dt.Rows[0][3].ToString();
                    txtContent1.Text = dt.Rows[0][4].ToString();
                    txtTitle2.Text = dt.Rows[0][5].ToString();
                    txtContent2.Text = dt.Rows[0][6].ToString();
                    txtTitle3.Text = dt.Rows[0][7].ToString();
                    txtContent3.Text = dt.Rows[0][8].ToString();
                    txtTitle4.Text = dt.Rows[0][9].ToString();
                    txtContent4.Text = dt.Rows[0][10].ToString();
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string courseID = Request.QueryString["courseID"];
            if (string.IsNullOrEmpty(courseID))
            {
                // Handle missing courseID, show an error or redirect
                return;
            }

            string name = txtName.Text.Trim();
            string description = txtDescription.Text.Trim();
            string thumbnailUrl = txtThumbnailUrl.Text.Trim();
            string title1 = txtTitle1.Text.Trim();
            string content1 = txtContent1.Text.Trim();
            string title2 = txtTitle2.Text.Trim();
            string content2 = txtContent2.Text.Trim();
            string title3 = txtTitle3.Text.Trim();
            string content3 = txtContent3.Text.Trim();
            string title4 = txtTitle4.Text.Trim();
            string content4 = txtContent4.Text.Trim();

            if (FileUpload1.HasFile)
            {
                string fileExtension = Path.GetExtension(FileUpload1.FileName);
                if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".png")
                {
                    string fileName = Path.GetFileName(FileUpload1.FileName);
                    string filePath = "~/img/courseThumbnail/" + fileName;
                    FileUpload1.SaveAs(Server.MapPath(filePath));
                    thumbnailUrl = filePath;
                }
                else
                {
                    lblMessage.Text = "Only .jpg and .png file types are allowed.";
                    lblMessage.Visible = true;
                    return;
                }
            }

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            SqlCommand cmd = new SqlCommand("UPDATE courses SET name = @name, description = @description, thumbnailUrl = @thumbnailUrl, title1 = @title1, content1 = @content1, title2 = @title2, content2 = @content2, title3 = @title3, content3 = @content3, title4 = @title4, content4 = @content4 WHERE CourseID = @courseID", con);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@description", description);
            cmd.Parameters.AddWithValue("@thumbnailUrl", thumbnailUrl);
            cmd.Parameters.AddWithValue("@title1", title1);
            cmd.Parameters.AddWithValue("@content1", content1);
            cmd.Parameters.AddWithValue("@title2", title2);
            cmd.Parameters.AddWithValue("@content2", content2);
            cmd.Parameters.AddWithValue("@title3", title3);
            cmd.Parameters.AddWithValue("@content3", content3);
            cmd.Parameters.AddWithValue("@title4", title4);
            cmd.Parameters.AddWithValue("@content4", content4);
            cmd.Parameters.AddWithValue("@courseID", courseID);

            try
            {
                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "showSuccessMessage();", true);
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred: " + ex.Message;
                lblMessage.Visible = true;
            }
            finally
            {
                con.Close();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Courses.aspx");
        }
    }
}