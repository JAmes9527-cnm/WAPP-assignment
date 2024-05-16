<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calculator.aspx.cs" Inherits="WebApplication2.calculator" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Financial Freedom Calculator</title>
    <link href="calculatordesign.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
    <script>
        // Function to validate input as numeric
        function validateInput(event) {
            var input = event.target.value;
            if (isNaN(input)) {
                alert("Please enter a valid number.");
                event.target.value = "";
            }
        }

        // Function to validate form before submission
        function validateForm() {
            var textboxes = document.querySelectorAll('.numeric-only');
            for (var i = 0; i < textboxes.length; i++) {
                if (textboxes[i].value === "") {
                    alert("Please fill in all the required fields.");
                    textboxes[i].focus();
                    return false;
                }
            }
            return true;
        }

        // Add event listeners to textboxes on page load
        window.onload = function () {
            var textboxes = document.querySelectorAll('.numeric-only');
            textboxes.forEach(function (textbox) {
                textbox.addEventListener('input', validateInput);
            });
            updateChart();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" onsubmit="return validateForm()">
        <asp:Label ID="Label1" runat="server" Text="What monthly amount would you want to have post-retirement?"></asp:Label>
        <br />
        <asp:Label ID="Monthlydesiredamount" runat="server" Text="Monthly Desired Amount:"></asp:Label>
        &nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="Your Current Age:"></asp:Label>
        &nbsp;&nbsp;
        <asp:Label ID="Desiredretirementage" runat="server" Text="Desired Retirement Age:"></asp:Label>
        <br /><br />
        <asp:TextBox ID="monthlyamount" runat="server" Width="180px" CssClass="numeric-only"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:TextBox ID="currentage" runat="server" Width="130px" CssClass="numeric-only"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:TextBox ID="retirementage" runat="server" Width="190px" CssClass="numeric-only"></asp:TextBox>
        <br /><br />
        <asp:Label ID="Label3" runat="server" Text="Interest Rate:"></asp:Label>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Expected Annual Return on Investment:"></asp:Label>
        <br /><br />
        <asp:TextBox ID="expectedannual" runat="server" Width="580px" CssClass="numeric-only"></asp:TextBox>
        <br /><br />
        <asp:Label ID="Label5" runat="server" Text="Initial Amount You Can Invest:"></asp:Label>
        <br />
        <asp:Label ID="Label6" runat="server" Text="Enter the initial amount that you can invest (optional):"></asp:Label>
        <br /><br />
        <asp:TextBox ID="initialamount" runat="server" Width="580px" CssClass="numeric-only"></asp:TextBox>
        <br /><br />
        <asp:CheckBox ID="Checkbox2" runat="server" AutoPostBack="true" OnCheckedChanged="Checkbox2_CheckedChanged" />
        <asp:Label ID="Label7" runat="server" Text="Include Inflation Rate in Calculation"></asp:Label>
        &nbsp;&nbsp;
        &nbsp;&nbsp;
        <br />
        <asp:TextBox ID="inflationRate" runat="server" Width="578px" CssClass="numeric-only"></asp:TextBox>
        <p>
            <asp:Button ID="reset" runat="server" Text="Reset to Default" OnClick="Reset_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="calculate" runat="server" Text="Calculate" OnClick="Calculate_Click" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Label ID="resultsLabel" runat="server"></asp:Label>
        </p>

        <!-- Chart -->
        <canvas id="financialChart" width="600" height="400"></canvas>
        <asp:HiddenField ID="chartData" runat="server" />
    </form>

    <script>
        // Function to update the chart with data from the hidden field
        function updateChart() {
            var chartData = JSON.parse(document.getElementById('<%= chartData.ClientID %>').value);
            var ctx = document.getElementById('financialChart').getContext('2d');
            new Chart(ctx, {
                type: 'bar',
                data: chartData,
                options: {
                    responsive: true,
                    scales: {
                        x: {
                            title: {
                                display: true,
                                text: 'Year'
                            }
                        },
                        y: {
                            title: {
                                display: true,
                                text: 'Amount (RM)'
                            }
                        }
                    }
                }
            });
        }
    </script>
</body>
</html>
