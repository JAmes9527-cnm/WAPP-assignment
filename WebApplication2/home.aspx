<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="WebApplication2.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Smart Money Mastery</title>
    <link rel="stylesheet" href="styles.css?v=1234567890">

</head>
<body>
    <form runat="server">
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
                <li><div class="dropdown">
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
                <asp:Panel ID="loginPanel" runat="server" Visible="false">
                <asp:Button CssClass="login-btn" Text="Login" runat="server" Onclick="Login_Click"/>
                <asp:Button CssClass="signup-btn" Text="Sign Up" runat="server" Onclick="SignUp_Click"/>
                </asp:Panel>

                <asp:Panel ID="UserPanel" runat="server" Visible="false">
                <asp:Label ID="WelcomeText" Text="Welcome, User" runat="server"/>
                <asp:ImageButton ID="pfp" ImageUrl="~/img/pfp/default_pfp.img" runat="server" OnClick="PfpButton_Click" CssClass="cropped-image circular-img-container"/>
                </asp:Panel>
            </asp:PlaceHolder>
        </div>
        
    </header>

    <section class="hero">
        <h2>Unlock Your Financial Potential</h2>
        <p>Join our community to explore courses and tools designed to empower your financial independence.</p>
        <button class="cta-btn">Get Started</button>
    </section>

    <section class="courses-highlight">
        <h3>Featured Courses</h3>
        <div class="course">
            <a href="course1.html">
                <img src="placeholder.jpg" alt="Course Thumbnail">
            </a>
            <div>
                <h4>Investing 101</h4>
                <p>asdfsadff.</p>
            </div>
        </div>
        <div class="course">
            <img src="placeholder.jpg" alt="Course Thumbnail">
            <div>
                <h4>Investing 101</h4>
                <p>Learn the bafghfghing your wealth.</p>
            </div>
        </div>
        <div class="course">
            <img src="placeholder.jpg" alt="Course Thumbnail">
            <div>
                <h4>Investing 101</h4>
                <p>Learn the basics of investing and how to start growing your wealth.</p>
            </div>
        </div>
        <div class="course">
            <img src="placeholder.jpg" alt="Course Thumbnail">
            <div>
                <h4>Investing 101</h4>
                <p>Learn the basics of investing and how to start growing your wealth.</p>
            </div>
        </div>
        <div class="course">
            <img src="placeholder.jpg" alt="Course Thumbnail">
            <div>
                <h4>Investing 101</h4>
                <p>Learn the basics of investing and how to start growing your wealth.</p>
            </div>
        </div>
        <div class="course">
            <img src="placeholder.jpg" alt="Course Thumbnail">
            <div>
                <h4>Investing 101</h4>
                <p>Learn the basics of investing and how to start growing your wealth.</p>
            </div>
        </div>
        <div class="course">
            <img src="placeholder.jpg" alt="Course Thumbnail">
            <div>
                <h4>Investing 101</h4>
                <p>Learn the basics of investing and how to start growing your wealth.</p>
            </div>
        </div>
        <!-- Repeat for other courses -->
    </section>

    <footer>
        <p>© 2024 Smart Money Mastery. All rights reserved.</p>
    </footer>
    </form>
</body>
</html>
