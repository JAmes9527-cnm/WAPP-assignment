using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication2
{
    public partial class viewProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["UserID"] != null)
                {
                    int userId;
                    if (int.TryParse(Request.QueryString["UserID"], out userId))
                    {
                        LoadUserProfile(userId);
                    }
                    else
                    {
                        // Handle the error, maybe redirect to an error page or show a message
                    }
                }
                else
                {
                    // Handle the error, maybe redirect to an error page or show a message
                }
            }
        }

        private void LoadUserProfile(int userId)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM userTable WHERE UserID = @UserID", con))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            DataTable dt = new DataTable();
                            dt.Load(reader);
                            DetailsView1.DataSource = dt;
                            DetailsView1.DataBind();
                        }
                        else
                        {
                            // Handle the case when there is no data found for the given UserID
                            // Maybe show a message to the user
                        }
                    }
                }
            }
        }
    }
}