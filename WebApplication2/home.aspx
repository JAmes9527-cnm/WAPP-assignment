<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="WebApplication2.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Smart Money Mastery</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <div class="logo">
            <h1>``````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````Smart Money Mastery</h1>
        </div>
        <nav>
            <ul>
                <li><a href="index.html">Home</a></li>
                <li><a href="courses.html">Courses</a></li>
                <li><a href="forum.html">Forum</a></li>
                <li><a href="resources.html">Resources</a></li>
                <li><a href="about.html">About</a></li>
                <li><a href="contact.html">Contact Us</a></li>
            </ul>
        </nav>
        <div class="button-container">
            <asp:PlaceHolder ID="loginPlaceHolder" runat="server">
            <button class="login-btn">Login</button>
            <button class="signup-btn">Sign Up</button>
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
</body>
</html>
