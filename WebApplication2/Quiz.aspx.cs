using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace WebApplication2
{
    public partial class Quiz : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadQuestions();
        }

        private void LoadQuestions()
        {
            // Get the connection string from web.config
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            // Create a SQL connection
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Define the SQL query to select topics
                string query = "SELECT Question, Choice1, Choice2, Choice3, Choice4, Answer FROM Quiz";

                // Create a SQL command
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Open the connection
                    con.Open();

                    // Execute the command and get a data reader
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        // Loop through the results and generate HTML for each topic
                        while (reader.Read())
                        {
                            string question = reader["Question"].ToString();
                            string choice1 = reader["Choice1"].ToString();
                            string choice2 = reader["Choice2"].ToString();
                            string choice3 = reader["Choice3"].ToString();
                            string choice4 = reader["Choice4"].ToString();
                            string answer = reader["Answer"].ToString();

                            // Create HTML elements for the topic
                            Panel topicPanel = new Panel();
                            topicPanel.CssClass = "topic";
                            LiteralControl titleControl = new LiteralControl("<h3>" + question + "</h3>");

                            string groupName = "Choices_" + question;

                            RadioButton btn1 = new RadioButton
                            {
                                Text = choice1,
                                GroupName = groupName, // Set the unique group name
                                AutoPostBack = true
                            };
                            btn1.CheckedChanged += Choice_CheckedChanged; // Attach event handler

                            RadioButton btn2 = new RadioButton
                            {
                                Text = choice2,
                                GroupName = groupName, // Set the unique group name
                                AutoPostBack = true
                            };
                            btn2.CheckedChanged += Choice_CheckedChanged; // Attach event handler

                            RadioButton btn3 = new RadioButton
                            {
                                Text = choice3,
                                GroupName = groupName, // Set the unique group name
                                AutoPostBack = true
                            };
                            btn3.CheckedChanged += Choice_CheckedChanged; // Attach event handler

                            RadioButton btn4 = new RadioButton
                            {
                                Text = choice4,
                                GroupName = groupName, // Set the unique group name
                                AutoPostBack = true
                            };
                            btn4.CheckedChanged += Choice_CheckedChanged; // Attach event handler

                            LiteralControl contentControl = new LiteralControl("<p>" + answer + "</p>");
                            contentControl.Visible = false;

                            // Create a button to view posts
                            Button answerButton = new Button
                            {
                                Text = "Answer"
                            };
                            answerButton.Click += answerButton_Click; // Attach event handler

                            topicPanel.Controls.Add(titleControl);
                            topicPanel.Controls.Add(btn1);
                            topicPanel.Controls.Add(btn2);
                            topicPanel.Controls.Add(btn3);
                            topicPanel.Controls.Add(btn4);
                            topicPanel.Controls.Add(answerButton);

                            questions.Controls.Add(topicPanel); // Add the topic panel to the existing topics div 
                        }
                    }
                }
            }


        }

        protected void Choice_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton selectedChoice = (RadioButton)sender;
            if (selectedChoice.Checked)
            {
                ViewState["SelectedAnswer"] = selectedChoice.Text;
            }
        }

        protected void answerButton_Click(object sender, EventArgs e)
        {

        }
    }
}