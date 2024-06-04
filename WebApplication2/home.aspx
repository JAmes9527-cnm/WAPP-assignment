<%@ Page Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="WebApplication2.newHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <title>Smart Money Mastery</title>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet" />
    <style>
        .content-wrapper{
                padding-top: 0px !important;
    padding-bottom: 0px !important;

        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <section class="hero-section">
            <div class="text-box">
                <h1>Smart Money Mastery</h1>
                <p>Manage your finances with confidence and achieve financial freedom.</p>
                <a href="courses.aspx" class="hero-btn">Learn More</a>
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
</asp:Content>