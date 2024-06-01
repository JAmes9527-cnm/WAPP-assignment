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
                        <li><a href="courses.aspx">Courses</a></li>
                        <li><a href="forum.aspx">Forum</a></li>
                        <li><a href="resources.aspx">Resources</a></li>
                        <li><a href="aboutus.aspx">About</a></li>
                        <li><a href="contact.aspx">Contact Us</a></li>
                        <li><asp:LinkButton runat="server" text="User Dashboard" OnClick="dashboardBtn_Click" CssClass="a" id="dashboardBtn"></asp:LinkButton></li>
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

        <!-- Testimonials Section -->
        <section class="testimonials">
            <h1>What Our Students Say</h1>
            <p>See what our satisfied students have to say about Smart Money Mastery.</p>
            <div class="row">
                <div class="testimonial-col">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/3/30/Wee_Ka_Siong_IMO_%28cropped%29.jpg" alt="User Photo">
                    <div>
                        <p>"This course has transformed my financial life. I now feel confident about managing my money and planning for the future."</p>
                        <h3>John Doe</h3>
                        <p>Financial Freedom Course Graduate</p>
                    </div>
                </div>
                <div class="testimonial-col">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbq-_ezBly8iuP8Oo4qgj7j66VJWjybvwnbQ&s" alt="User Photo">
                    <div>
                        <p>"The Ultimate Guide to Financial Freedom is a must-take course. It covered everything I needed to know to take control of my finances."</p>
                        <h3>Jane Smith</h3>
                        <p>Financial Freedom Course Graduate</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- FAQ Section -->
        <section class="faq">
            <h1>Frequently Asked Questions</h1>
            <div class="faq-item">
                <h3>What is Smart Money Mastery?</h3>
                <p>Smart Money Mastery is an educational platform that offers courses and resources to help you manage your finances effectively and achieve financial freedom.</p>
            </div>
            <div class="faq-item">
                <h3>How can I enroll in a course?</h3>
                <p>You can enroll in any of our courses by visiting the Courses section and selecting the course you're interested in. Follow the prompts to complete your registration.</p>
            </div>
        </section>

        <!-- Blog Highlights Section -->
        <section class="blog-highlights">
            <h1>From Our Blog</h1>
            <div class="row">
                <div class="blog-col">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlJOAB5WRDMzEjDl5Mh7OcFmkYsqSONp_2Ow&s" alt="Blog Post Image">
                    <h3>5 Tips to Improve Your Financial Health</h3>
                    <p>Learn five simple yet effective tips to improve your financial health and secure your financial future.</p>
                    <a href="https://www.macquarie.com.au/investing/financial-health-money-management-tips.html" class="read-more-btn">Read More</a>
                </div>
                <div class="blog-col">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiHg1d-LjmLVj6uRq9CYuwq7YtgJiKUoXirg&s" alt="Blog Post Image">
                    <h3>Investing for Beginners: Where to Start</h3>
                    <p>New to investing? Discover the basics of investing and how to get started on your investment journey.</p>
                    <a href="https://fortune.com/recommends/investing/how-to-start-investing/" class="read-more-btn">Read More</a>
                </div>
            </div>
        </section>

       <!-- User Feedback Section -->
        <section class="user-feedback" runat="server" id="feedbackSection" visible="false">
            <h1>User Feedback</h1>
            <asp:Repeater ID="feedbackRepeater" runat="server">
                <ItemTemplate>
                     <div class="feedback-item">
                     <h3><%# Eval("Name") %></h3>
                     <div>
                        <%# GenerateStarsHtml((int)Eval("Rating")) %>
                      </div>
                         <p><%# Eval("Review") %></p>
                         <small class="feedback-timestamp"><%# Eval("Timestamp", "{0:dd MMM yyyy HH:mm:ss}") %></small>
                     </div>
             </ItemTemplate>
        </asp:Repeater>

        </section>



        <!-- Contact Section -->
        <section class="cta">
            <h1>Know more about us</h1>
            <a href="contact.aspx" class="hero-btn">CONTACT US</a>
        </section>

        <!-- Floating Feedback Button -->
        <button class="feedback-button" onclick="feedback.aspx">Feedback</button>

        <a href="feedback.aspx" class="feedback-button">Feedback</a>

        <!-- Footer -->
        <footer>
            <div class="footer-container">
                <!-- Office Information -->
                <div class="footer-col">
                    <img src="images/logo.jpg" alt="Smart Money Mastery Logo">
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

        <!-- JavaScript -->
        <script>
            function showMenu() {
                var navLinks = document.getElementById('navLinks');
                navLinks.classList.add('showMenu');
            }
            function hideMenu() {
                var navLinks = document.getElementById('navLinks');
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
