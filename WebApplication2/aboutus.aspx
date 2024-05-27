<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="aboutus.aspx.cs" Inherits="WebApplication2.aboutus" MasterPageFile="~/masterPage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <title>About Us - Smart Money Mastery</title>
    <link rel="stylesheet" href="aboutusdesign.css" />
    <link rel="stylesheet" href="masterdesign.css" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
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
</asp:Content>


