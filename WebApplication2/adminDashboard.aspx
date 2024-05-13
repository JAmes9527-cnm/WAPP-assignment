<<<<<<< HEAD
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminDashboard.aspx.cs" Inherits="WebApplication2.adminDashboard" %>
=======
﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminDashboard.aspx.cs" Inherits="WebApplication2.adminDashboard" %>
>>>>>>> 55de89819cc9ccfe88b4ce308b19fa13f450d7d1
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="styles.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        /* Responsive styles - adjust as needed */
        @media (max-width: 768px) {
            .container {
                grid-template-columns: 1fr;
            }

            .sidebar,
            .main-content {
                padding: 10px;
            }
        }
        .auto-style1 {
            text-align: center;
        }
        .admin-options {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header class="header">
            <div class="container">
                <div class="logo">
                    <a href="home.aspx"><img src="/img/logo.png" style="height: 68px; width: 159px; margin-right: 1px" /></a></div>
                <nav>
                    <ul>
                        <li><a href="index.html">Home</a></li>
                        <li><a href="courses.html">Courses</a></li>
                        <li><a href="forum.html">Forum</a></li>
                        <li><a href="resources.html">Resources</a></li>
                        <li><a href="about.html">About</a></li>
                        <li><a href="contact.html">Contact Us</a> </li>
                    </ul>
                </nav>
                <div class="button-container">
                </div>
            </div>
        </header>

        <div class="container">
            <div class="sidebar">
                <h1 class="auto-style1">Admin Dashboard</h1>
                <h2 style="text-align: center">Admin Profile</h2>
                <div class="admin-profile">
                    <p style="text-align: center">Welcome, Admin!</p>
                    <p style="margin-left: 1320px">
                        <asp:Image ID="Image1" runat="server" Height="263px" style="text-align: center" Width="241px" />
                    </p>
                <p style="text-align: center">
                    Welcome to the Admin Dashboard!</p>
                </div>
                <div class="admin-options">
                    <!-- Navigation buttons for managing students, tutors, forum, and quizzes -->
                    <asp:Button ID="ManageStudentsButton" runat="server" CssClass="admin-option-btn" Text="Manage Students" OnClick="ManageStudentsButton_Click" />
                    <asp:Button ID="ManageTutorsButton" runat="server" CssClass="admin-option-btn" Text="Manage Tutors" OnClick="ManageTutorsButton_Click" />
                    <asp:Button ID="ManageForumButton" runat="server" CssClass="admin-option-btn" Text="Manage Forum" OnClick="ManageForumButton_Click" />
                    <asp:Button ID="EditQuizButton" runat="server" CssClass="admin-option-btn" Text="Edit Quiz" OnClick="EditQuizButton_Click" />
                    <asp:Button ID="ManagePostsButton" runat="server" CssClass="admin-option-btn" Text="Manage Posts" OnClick="ManagePostsButton_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
