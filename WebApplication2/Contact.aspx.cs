using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

namespace WebApplication2
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string email = txtEmail.Text;
            string message = txtMessage.Text;

            // Save to database
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO contactTable (Name, Email, Message) VALUES (@Name, @Email, @Message)";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Name", name);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Message", message);

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }

            // Send confirmation email
            bool emailSent = SendConfirmationEmail(name, email);

            if (emailSent)
            {
                // Display success message
                lblMessage.Text = "Your message has been sent successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;

                // Clear the form
                txtName.Text = "";
                txtEmail.Text = "";
                txtMessage.Text = "";
            }
            else
            {
                lblMessage.Text = "There was an error sending the confirmation email. Please try again later.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        private bool SendConfirmationEmail(string name, string email)
        {
            string subject = "Thank you for contacting us";
            string body = $"Dear {name},\n\nThank you for reaching out to us. We have received your message and will get back to you shortly.\n\nBest regards,\nSmart Money Mastery";

            MailMessage mailMessage = new MailMessage("mjyak118@gmail.com", email);
            mailMessage.Subject = subject;
            mailMessage.Body = body;

            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.Credentials = new NetworkCredential("mjyak118@gmail.com", "nbpl oguu osvl ygpr");
            smtpClient.EnableSsl = true;

            try
            {
                smtpClient.Send(mailMessage);
                return true;
            }
            catch (Exception ex)
            {
                // Log the exception (you can log it to a file, database, or event log as needed)
                Console.WriteLine("Error sending email: " + ex.Message);
                return false;
            }
        }
    }
}