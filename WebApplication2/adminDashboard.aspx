<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminDashboard.aspx.cs" MasterPageFile="~/masterPage.Master" Inherits="WebApplication2.adminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <title>Admin Dashboard</title>
    <style>
   .dashboard-container {
    width: calc(100% - 40px); /* Set width slightly larger than dashboard box */
    max-width: 850px; /* Maximum width for responsiveness */
    margin: 0 auto; /* Center the container horizontally */
    align-items: center;
    height: 100vh;
    background-color: #f5f5f5;
}

.dashboard-box {
    background-color: #ffffff;
    padding: 3vw; /* Use percentage padding for responsiveness */
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    text-align: center;
    display: flex;
    justify-content: center; /* Align items from left to right */
}


    .button-container {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin: 20px;
    }

    .icon-button {
        margin-bottom: 10px;
        width: 100px; /* Increase width */
        height: 100px; /* Increase height */
    }

    .dashboard-button {
        display: block;
        width: 150px;
        padding: 10px;
        background-color: #007bff;
        color: #ffffff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        text-align: center;
        font-size: 16px;
    }

    .dashboard-button:hover {
        background-color: #0056b3;
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
        <div class="dashboard-container">
        <div style="text-align:center"><h1>Admin dashboard</h1></div>
        <div class="dashboard-box">
            <div class="button-container">
                <asp:ImageButton runat="server" OnClick="courses_Click" ImageUrl="~/img/manageUserIcon.png" CssClass="icon-button" />
                <asp:Button Text="Manage Student" ID="editCourses" runat="server" CssClass="dashboard-button" OnClick="courses_Click" />
            </div>
            <div class="button-container">
                <asp:ImageButton runat="server" OnClick="addCourses_Click" ImageUrl="~/img/manageForumIcon.png" CssClass="icon-button" />
                <asp:Button Text="Manage Forum" ID="addCourses" runat="server" CssClass="dashboard-button" OnClick="addCourses_Click" />
            </div>
            <div class="button-container">
                <asp:ImageButton runat="server" OnClick="Button1_Click" ImageUrl="~/img/manageTutorIcon.png" CssClass="icon-button" />
                <asp:Button Text="Manage Tutor" ID="Button1" runat="server" CssClass="dashboard-button" OnClick="Button1_Click" />
            </div>
            <div class="button-container">
                <asp:ImageButton runat="server" OnClick="Button2_Click" ImageUrl="~/img/resultIcon.png" CssClass="icon-button" />
                <asp:Button Text="Manage Results" ID="Button2" runat="server" CssClass="dashboard-button" OnClick="Button2_Click" />
            </div>
        </div>
    </div>
</asp:Content>