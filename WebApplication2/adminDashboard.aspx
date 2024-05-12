<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_dashboard.aspx.cs" Inherits="WebApplication2.admin_dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="adminDashboard.css" />
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        header {
            background-color: #333;
            color: #fff;
            padding: 20px 0;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            display: flex;
            justify-content: space-between;
        }

        .sidebar {
            width: 250px;
            background-color: #222;
            color: #fff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .admin-options {
            margin-top: 20px;
            text-align: center;
        }

        .admin-option-btn {
            display: block;
            margin: 10px auto;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .admin-option-btn:hover {
            background-color: #45a049;
        }

        .main-content {
            flex: 1;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            margin-top: 0;
        }

        .admin-profile {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="container">
                <div class="logo">
                    <h1>Smart Money Mastery</h1>
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
                    <button class="login-btn">Login</button>
                    <button class="signup-btn">Sign Up</button>
                </div>
            </div>
        </header>

        <div class="container">
            <div class="sidebar">
                <h2>Admin Profile</h2>
                <div class="admin-profile">
                    <!-- Add admin profile information here -->
                    <p>Welcome, Admin!</p>
                    <p>Email: admin@example.com</p>
                </div>
                <div class="admin-options">
                    <asp:Button ID="ManageStudentsButton" runat="server" CssClass="admin-option-btn" Text="Manage Students" OnClick="ManageStudentsButton_Click" />
                    <asp:Button ID="ManageTutorsButton" runat="server" CssClass="admin-option-btn" Text="Manage Tutors" OnClick="ManageTutorsButton_Click" />
                    <asp:Button ID="ManageForumButton" runat="server" CssClass="admin-option-btn" Text="Manage Forum" OnClick="ManageForumButton_Click" />
                </div>
            </div>
            <div class="main-content">
                <h1>Admin Dashboard</h1>
                <!-- Add main content here -->
                <p>Welcome to the Admin Dashboard!</p>
            </div>
        </div>
    </form>
</body>
</html>
