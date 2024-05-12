<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manageTutor.aspx.cs" Inherits="WebApplication2.manageTutor" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Tutors</title>
    <link rel="stylesheet" href="styles.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
       
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
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
                        <li><a href="contact.html">Contact Us</a></li>
                    </ul>
                </nav>
                <div class="button-container">
                 
                </div>
            </div>
        </header>
        <div class="container">
            <div class="sidebar">
               
                <div class="admin-options">
                 
                </div>
            </div>
            <div class="main-content">
                <h1 style="text-align: center">Manage Tutors</h1>
                <div style="margin-left: 1200px">
                    <h2>Existing Tutors</h2>
                    <asp:GridView ID="GridViewExistingTutors" runat="server" AutoGenerateColumns="False" style="text-align: center">
                        <Columns>
                            <asp:TemplateField HeaderText="Tutor Name"></asp:TemplateField>
                            <asp:BoundField HeaderText="Tutor ID" />
                            <asp:ButtonField Text="Remove" />
                        </Columns>
              
                    </asp:GridView>
                    <h2 style="text-align: justify">New Tutors Awaiting Approval</h2>
                    <asp:GridView ID="GridViewNewTutors" runat="server" AutoGenerateColumns="False" style="text-align: center">
                        <Columns>
                            <asp:TemplateField HeaderText="Tutor Name"></asp:TemplateField>
                            <asp:BoundField HeaderText="Tutor ID" />
                            <asp:BoundField HeaderText="Date of Registration" />
                            <asp:ButtonField Text="Approve" />
                            <asp:ButtonField Text="Decline" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
