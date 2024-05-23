<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminDashboard.aspx.cs" MasterPageFile="~/masterPage.Master" Inherits="WebApplication2.adminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
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
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

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
                    <asp:Button ID="ManageStudentsButton" runat="server" CssClass="admin-option-btn" Text="Manage Users" OnClick="ManageStudentsButton_Click" />
                    <asp:Button ID="ManageTutorsButton" runat="server" CssClass="admin-option-btn" Text="Manage Tutors" OnClick="ManageTutorsButton_Click" />
                    <asp:Button ID="ManageForumButton" runat="server" CssClass="admin-option-btn" Text="Manage Forum" OnClick="ManageForumButton_Click" />
                </div>
            </div>
        </div>
</asp:Content>