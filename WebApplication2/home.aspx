<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="WebApplication2.newHome" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Smart Money Mastery</title>
    <link rel="stylesheet" href="homedesign.css" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <header class="header">
            <nav>
                <a href="home.aspx">
                    <img src="img/logo.png" alt="Smart Money Mastery Logo" class="logo" />
                </a>
                <div class="nav-links" id="navLinks">
                    <i class="fa fa-times" onclick="hideMenu()"></i>
                    <ul>
                        <li><a href="home.aspx">Home</a></li>
                        <li><a href="course.aspx">Courses</a></li>
                        <li><a href="forum.aspx">Forum</a></li>
                        <li><a href="resources.aspx">Resources</a></li>
                        <li><a href="aboutus.aspx">About</a></li>
                        <li><a href="contact.aspx">Contact Us</a></li>
                        <li class="more-dropdown">
                            <a href="javascript:void(0);" onclick="toggleDropdown()">More</a>
                            <ul class="dropdown-content">
                                <li><a href="#">Article</a></li>
                                <li><a href="#">Testimonials</a></li>
                                <li><a href="#">FAQ</a></li>
                            </ul>
                        </li>
                    </ul>

                    <!-- Sign In and User Info -->
                    <ul class="auth-links">
                        <div class="button-container">
            <asp:PlaceHolder ID="loginPlaceHolder" runat="server">
                <asp:Panel ID="loginPanel" runat="server" Visible="false">
                <asp:Button  Text="Login" runat="server" Onclick="Login_Click" CssClass="btn" />
                <asp:Button  Text="Sign Up" runat="server" Onclick="SignUp_Click" CssClass="btn"/>
                </asp:Panel>

                <asp:Panel ID="UserPanel" runat="server" Visible="false">
                <asp:Label CssClass="mid_text" ID="WelcomeText" Text="Welcome, User" runat="server"/>
                <asp:ImageButton ID="pfp" ImageUrl="~/img/pfp/default_pfp.img" runat="server" OnClick="PfpButton_Click" CssClass="cropped-image circular-img-container" AlternateText="Profile picture"/>
                <asp:Button  Text="Log Out" runat="server" Onclick="LogOut_Click" CssClass="btn"/>
                </asp:Panel>
            </asp:PlaceHolder></div>
                    </ul>
                </div>
                <i class="fa fa-bars" onclick="showMenu()"></i>
            </nav>
        </header>

        <section class="hero-section">
            <div class="text-box">
                <h1>Smart Money Mastery</h1>
                <p>Manage your finances with confidence and achieve financial freedom.</p>
                <a href="#" class="hero-btn">Learn More</a>
            </div>
        </section>

        <!-- Course Section -->
        <section class="course">
            <h1>Courses We Offer</h1>
            <p>Learn how to calculate your cash flow, get out of debt, and the basics of investing with this financial freedom course.</p>
            <div class="row">
                <div class="course-col">
                    <h3>Financial Freedom: A Beginner's Guide</h3>
                    <p>Learn how to calculate your cash flow, get out of debt, and the basics of investing with this financial freedom course.</p>
                </div>
                <div class="course-col">
                    <h3>The Ultimate Guide to Financial Freedom</h3>
                    <p>Master personal finance with this complete guide to budgeting, credit, student loans, investing, and retirement saving.</p>
                </div>
            </div>
        </section>

        <!-- Contact Section -->
        <section class="cta">
            <h1>Know more about us</h1>
            <a href="contact.aspx" class="hero-btn">CONTACT US</a>
        </section>

        <!-- Footer -->
        <footer>
            <div class="footer-container">
                <!-- Office Information -->
                <div class="footer-col">
                    <img src="img/logo.png" alt="Smart Money Mastery Logo">
                    <p>Financial Freedom through education and resources.</p>
                    <p>Technology Park</p>
                    <p class="email-id">smartmoneymastery@gmail.com</p>
                    <h4>010-1111188</h4>
                </div>
                <!-- Links Section -->
                <div class="footer-col">
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
                <div class="footer-col">
                    <h3>Stay Connected</h3>
                    <div class="icons">
                        <a href="https://www.facebook.com/" target="_blank"><i class="fab fa-facebook"></i></a>
                        <a href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram"></i></a>
                        <a href="https://twitter.com/" target="_blank"><i class="fab fa-twitter"></i></a>
                        <a href="https://www.linkedin.com/" target="_blank"><i class="fab fa-linkedin"></i></a>
                    </div>
                </div>
            </div>
            <!-- Copyright Notice -->
            <div class="footer-bottom">
                <p>© 2024 Smart Money Mastery. All rights reserved.</p>
            </div>
        </footer>

        <script>
            var navLinks = document.getElementById("navLinks");

            function showMenu() {
                navLinks.classList.add('showMenu');
            }
            function hideMenu() {
                navLinks.classList.remove('showMenu');
            }

            function toggleDropdown() {
                var dropdown = document.querySelector('.dropdown-content');
                if (dropdown.style.display === "block") {
                    dropdown.style.display = "none";
                } else {
                    dropdown.style.display = "block";
                }
            }

            // Close the dropdown if the user clicks outside of it
            window.onclick = function (event) {
                if (!event.target.matches('.more-dropdown > a')) {
                    var dropdowns = document.getElementsByClassName("dropdown-content");
                    for (var i = 0; i < dropdowns.length; i++) {
                        var openDropdown = dropdowns[i];
                        if (openDropdown.style.display === "block") {
                            openDropdown.style.display = "none";
                        }
                    }
                }
            }

            function updateUserInfo(profilePhotoUrl) {
                var loginLink = document.getElementById('loginLink');
                var userInfo = document.getElementById('userInfo');
                var profilePhotoElem = document.getElementById('profilePhoto');

                loginLink.style.display = 'none';
                profilePhotoElem.src = profilePhotoUrl;
                userInfo.style.display = 'flex';
            }

            // Example: Simulate a user login (this would normally come from your backend)
            var user = {
                photo: "images/profile.jpg" // Replace with the actual profile photo URL
            };
            updateUserInfo(user.photo);
        </script>
    </form>
</body>
</html>
