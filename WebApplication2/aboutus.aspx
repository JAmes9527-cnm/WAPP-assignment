<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="aboutus.aspx.cs" Inherits="WebApplication2.aboutus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Smart Money Mastery</title>
    <link rel="stylesheet" href="aboutusdesign.css" />
    <link rel="stylesheet" href="masterdesign.css" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    

</head>
<body>
    <form id="form1" runat="server">
        <section class="header">
            <nav>
                <a href="index.html">
                    <img src="D:/Web Aplication/web/images" alt="Smart Money Mastery Logo">

                </a>
                <div class="nav-links" id="navLinks">
                    <i class="fa fa-times" onclick="hideMenu()"></i>
                    <ul>
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Courses</a></li>
                        <li><a href="#">Forum</a></li>
                        <li><a href="#">Resources</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </div>
                <i class="fa fa-bars" onclick="showMenu()"></i>
            </nav>
          <div class="about-section">
            <h1>About Smart Money Mastery</h1>
            <p>Smart Money Mastery was founded in 2024 with the mission to empower individuals to take control of their financial futures. Our platform provides comprehensive financial education, interactive tools, and a vibrant community aimed at fostering financial literacy.</p>
        </div>
        <div class="mission-statement">
            <h2>Our Mission</h2>
            <p>Our mission is to create a platform for financial empowerment where users can learn, share, and grow their financial knowledge in pursuit of financial independence.</p>
        </div>
        <div class="team-section">
            <h2>Meet Our Team</h2>
            <p>Our team consists of experienced financial advisors, educators, and technologists dedicated to making financial education accessible to all.</p>
            <!-- Example of team member -->
            
        </div>
        <div class="testimonial-section">
            <h2>What Our Users Say</h2>
            <blockquote>
                "Smart Money Mastery has changed the way I understand and manage my finances. The courses are insightful, and the community is incredibly supportive." - Ming
            </blockquote>
        </div>
        <div class="history-section">
            <h2>Our History</h2>
            <p>From a small blog started in 2003 to a leading educational platform, learn about our journey and milestones.</p>
        </div>

        <footer>
    <div class="footer-container">
        <!-- Office Information -->
        <div class="footer-col office">
            <img src="images/logo.jpg" alt="Smart Money Mastery Logo">

            <p>Financial Freedom through education and resources.</p>
            <p>Technology Park</p>
            <p class="email-id">smartmoneymastery@gmail.com</p>
            <h4>010-1111188</h4>
        </div>

        <!-- Links Section -->
        <div class="footer-col links">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">Courses</a></li>
                <li><a href="#">Forum</a></li>
                <li><a href="#">Resources</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Contact Us</a></li>
            </ul>
        </div>

        <!-- Social Media Icons -->
        <div class="footer-col social">
            <h3>Stay Connected</h3>
            <div class="icons">
                <i class="fab fa-facebook"></i></a>
                <a href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram"></i></a>
                 <a href="https://twitter.com/" target="_blank"><i class="fab fa-x-twitter"></i></a>
                 <a href="https://www.linkedin.com/" target="_blank"><i class="fab fa-linkedin"></i></a>
             </div>

        </div>
    </div>

    <!-- Copyright Notice -->
    <div class="footer-bottom">
        <p>© 2024 Smart Money Mastery. All rights reserved.</p>
    </div>
</footer>
    </form>
</body>
</html>
