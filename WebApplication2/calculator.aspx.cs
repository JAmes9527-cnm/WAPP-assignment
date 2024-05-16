using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class calculator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set default values
                monthlyamount.Text = "10000";
                currentage.Text = "25";
                retirementage.Text = "65";
                expectedannual.Text = "10";
                initialamount.Text = "1000";
                inflationRate.Text = "2";
                inflationRate.Visible = Checkbox2.Checked;
            }
        }

        protected void Checkbox2_CheckedChanged(object sender, EventArgs e)
        {
            inflationRate.Visible = Checkbox2.Checked;
        }

        protected void Calculate_Click(object sender, EventArgs e)
        {
            double monthlyDesiredAmount = double.Parse(monthlyamount.Text);
            int currentAge = int.Parse(currentage.Text);
            int retirementAge = int.Parse(retirementage.Text);
            double annualROI = double.Parse(expectedannual.Text) / 100; // Convert percentage to decimal
            double initialInvestment = string.IsNullOrEmpty(initialamount.Text) ? 0 : double.Parse(initialamount.Text);
            double inflationRates = Checkbox2.Checked ? double.Parse(inflationRate.Text) / 100 : 0; // Convert percentage to decimal

            // Calculate the number of months until retirement
            int monthsUntilRetirement = (retirementAge - currentAge) * 12;

            // Calculate monthly ROI
            double monthlyROI = Math.Pow(1 + annualROI, 1.0 / 12) - 1;

            // Calculate future value of initial investment
            double futureValueOfInitialInvestment = initialInvestment * Math.Pow(1 + monthlyROI, monthsUntilRetirement);

            // Calculate future value of monthly contributions needed
            double futureValueMonthlyInvestment = monthlyDesiredAmount * ((Math.Pow(1 + monthlyROI, 240) - 1) / monthlyROI);

            // Calculate monthly contributions needed
            double monthlyContributionsNeeded = (futureValueMonthlyInvestment - futureValueOfInitialInvestment) / ((Math.Pow(1 + monthlyROI, monthsUntilRetirement) - 1) / monthlyROI);

            // Adjust for inflation if necessary
            if (inflationRates > 0)
            {
                monthlyContributionsNeeded *= Math.Pow(1 + inflationRates, retirementAge - currentAge);
            }

            // Calculate total deposits
            double totalDeposits = monthlyContributionsNeeded * monthsUntilRetirement;

            // Calculate final capital
            double finalCapital = futureValueOfInitialInvestment + futureValueMonthlyInvestment;

            // Display results
            resultsLabel.Text = $"Monthly Savings Needed: {monthlyContributionsNeeded:C2}<br/>" +
                                $"Total Deposits: {totalDeposits:C2}<br/>" +
                                $"Final Capital at Retirement: {finalCapital:C2}";

            // Prepare data for the chart
            List<int> years = new List<int>();
            List<double> totalDepositsData = new List<double>();
            List<double> interestPaymentsData = new List<double>();

            double totalDepositAccumulated = 0;
            double interestAccumulated = 0;

            for (int year = 1; year <= (retirementAge - currentAge); year++)
            {
                int monthsInYear = 12;
                double interestForYear = 0;

                for (int month = 1; month <= monthsInYear; month++)
                {
                    totalDepositAccumulated += monthlyContributionsNeeded;
                    interestForYear += (totalDepositAccumulated + initialInvestment) * monthlyROI;
                }

                interestAccumulated += interestForYear;

                years.Add(currentAge + year);
                totalDepositsData.Add(totalDepositAccumulated);
                interestPaymentsData.Add(interestAccumulated);
            }

            // Convert data to JSON format for the chart
            string chartDataJson = Newtonsoft.Json.JsonConvert.SerializeObject(new
            {
                labels = years,
                datasets = new[]
                {
                    new { label = "Total Deposits", data = totalDepositsData, backgroundColor = "rgba(75, 192, 192, 0.2)", borderColor = "rgba(75, 192, 192, 1)", borderWidth = 1 },
                    new { label = "Interest Payments", data = interestPaymentsData, backgroundColor = "rgba(153, 102, 255, 0.2)", borderColor = "rgba(153, 102, 255, 1)", borderWidth = 1 }
                }
            });

            // Store the JSON data in the hidden field
            chartData.Value = chartDataJson;

            // Register a script to update the chart
            ClientScript.RegisterStartupScript(this.GetType(), "updateChart", "updateChart();", true);
        }

        protected void Reset_Click(object sender, EventArgs e)
        {
            // Reset all controls to default
            monthlyamount.Text = "";
            currentage.Text = "";
            retirementage.Text = "";
            expectedannual.Text = "";
            initialamount.Text = "";
            inflationRate.Text = "";
            Checkbox2.Checked = false;
            inflationRate.Visible = false;
        }
    }
}