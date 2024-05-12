<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="course1.aspx.cs" Inherits="WebApplication2.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Smart Money Management</title>
    <style type="text/css">
        /* Your existing CSS styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }

        header {
            background: #005691;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: -webkit-sticky; /* Safari */
            position: sticky;
            top: 0;
        }

        nav ul {
            list-style: none;
            padding: 0;
        }

        nav ul li {
            display: inline;
            margin-right: 10px;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        .button-container {
            display: flex;
            justify-content: flex-end; 
        }

        .login-btn, .signup-btn {
            padding: 5px 10px;
            background: #f8c146;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-left: 10px;
            color: #fff;
        }

        .hero {
            background: #0077cc;
            color: white;
            padding: 50px 20px;
            text-align: center;
        }

        .cta-btn {
            padding: 10px 20px;
            background: green;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .courses-highlight {
            background: white;
            text-align: center;
            margin-bottom: 20px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .container {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
            padding:0 20px;
        }

        .left-content, .center-content, .right-content {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            width: calc(30% - 20px); 
            height: 350px; 
        }

        .center-content {
            text-align: center; 
        }

        .content{
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            width: calc(100% - 20px); 
            height: 350px; 
        }



        footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            background: #333;
            color: white;
            text-align: center;
            padding: 20px 0;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="logo">
                <a href="home.aspx"><img src="/img/logo.png" style="height: 68px; width: 159px; margin-right: 1px" /></a>
            </div>
            <nav>
                <ul>
                    <li><a href="home.aspx">Home</a></li>
                    <li><a href="courses.aspx">Courses</a></li>
                    <li><a href="forum.aspx">Forum</a></li>
                    <li><a href="resources.aspx">Resources</a></li>
                    <li><a href="about.aspx">About</a></li>
                    <li><a href="contact.aspx">Contact Us</a></li>
                    <li>
                        <div class="dropdown">
                            <button id="More_btn">More</button>
                            <div class="dropdown_content">
                                <a href="video.aspx">Video</a>
                                <a href="calculator.aspx">Calculator</a>
                            </div>
                        </div>
                    </li>
                </ul>
            </nav>
            <div class="button-container">
                <asp:PlaceHolder ID="loginPlaceHolder" runat="server">
                    <asp:Panel ID="loginPanel" runat="server">
                        <button class="login-btn">Login</button>
                        <button class="signup-btn">Sign Up</button>
                    </asp:Panel>
                </asp:PlaceHolder>
            </div>
        </header>

        <section class="courses-highlight">
            <h3>Smart Money Management: A Key to Financial Success</h3>
        </section>

        <div class="container">
            <div class="left-content">
                <h3>Concept</h3>
                <asp:Label ID="Label1" runat="server" Text="In today's dynamic economic landscape, the ability to effectively manage money is crucial for achieving financial stability and success. Smart money management goes beyond mere budgeting and expense tracking; it encompasses strategic decision-making, disciplined saving habits, and informed investment choices. Let's delve into the principles of smart money management and explore its diverse applications."></asp:Label>
            </div>
            <div class="center-content">
                <h4>Understanding Smart Money Management</h4>
            <p>Smart money management involves adopting a proactive approach towards personal finances to maximize wealth accumulation and minimize financial risks. It begins with setting clear financial goals, whether it's building an emergency fund, saving for retirement, or investing in education. By establishing measurable objectives, individuals can create a roadmap for their financial journey and stay focused on achieving long-term prosperity.</p>
            </div>
            <div class="right-content">
                <h5>Why Manage Money?</h5>
                <p>Effective money management is essential for various reasons. Firstly, it provides financial security by creating a safety net to handle unexpected expenses and emergencies. Secondly, it facilitates goal achievement by allowing individuals to set clear objectives and work towards them systematically. Thirdly, it helps in managing debt responsibly, avoiding financial pitfalls, and building wealth over time through saving, investing, and diversification. Ultimately, sound money management leads to financial independence, granting individuals the freedom to pursue their passions and live life on their terms. In summary, managing money wisely is not only about budgeting and saving but also about creating a foundation for a secure and prosperous future, enabling individuals to achieve their dreams and aspirations</p>
            </div>
        </div>

        <div class="container">
            <div class="content">
                <h6>Key Principles</h6>
            <p>
                <asp:Label ID="Label2" runat="server" Text="Budgeting: Creating a comprehensive budget is the cornerstone of smart money management. It entails tracking income, categorizing expenses, and identifying areas for potential savings. By living within one's means and prioritizing essential expenses, individuals can allocate resources efficiently and avoid unnecessary debt."></asp:Label>
            </p>
            <p>
                <asp:Label ID="Label3" runat="server" Text="Saving: Cultivating a habit of regular saving is essential for building a financial safety net and achieving future goals. Smart savers automate their savings by setting up automatic transfers to designated accounts, such as emergency funds, retirement accounts, and investment portfolios. Additionally, they take advantage of high-yield savings accounts and other financial instruments to optimize returns on their savings."></asp:Label>
            </p>
            <p>
                <asp:Label ID="Label4" runat="server" Text="Debt Management: Managing debt responsibly is integral to maintaining financial health. Smart money managers prioritize paying off high-interest debts, such as credit card balances, while making timely payments on other obligations. They explore debt consolidation options and negotiate lower interest rates to reduce the burden of debt and accelerate the path to financial freedom."></asp:Label>
                <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
            </p>
            </div>
        </div>

        <footer>
            <p>© 2024 Smart Money Mastery. All rights reserved.</p>
        </footer>

        <div style="display: grid; place-items: center;">
            <asp:Button ID="Button4" runat="server" Text="Edit Quiz" OnClick="Button4_Click" />
            <asp:Button ID="Button2" runat="server" Text="Quiz" OnClick="Button2_Click"/>
            <asp:Button ID="Button5" runat="server" Text="Back" OnClick="Button5_Click" />

        </div>

    </form>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</body>
</html>
