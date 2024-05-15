<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manageTutors.aspx.cs" Inherits="WebApplication2.manageTutors" %>
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
                    <asp:GridView ID="GridViewExistingTutors" runat="server" AutoGenerateColumns="False" style="text-align: center" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="TutorID"  >
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="TutorID" HeaderText="TutorID" InsertVisible="False" ReadOnly="True" SortExpression="TutorID" />
                            <asp:BoundField HeaderText="TutorName" DataField="TutorName" SortExpression="TutorName" />
                            <asp:ButtonField HeaderText="Action" Text="Remove" />
                        </Columns>
              
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
              
                    </asp:GridView>
                    <asp:SqlDataSource ID="Tutor" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [TutorName], [TutorID] FROM [TutorsTable]"></asp:SqlDataSource>
                    <h2 style="text-align: justify">New Tutors Awaiting Approval</h2>
<asp:GridView ID="GridViewNewTutors" runat="server" AutoGenerateColumns="False" style="text-align: center" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="TutorID" DataSourceID="Existingtutor">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="TutorID" HeaderText="TutorID" InsertVisible="False" ReadOnly="True" SortExpression="TutorID" />
                            <asp:BoundField DataField="TutorName" HeaderText="TutorName" SortExpression="TutorName" />
                            <asp:BoundField HeaderText="RegistrationDate" DataField="RegistrationDate" SortExpression="RegistrationDate" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="Existingtutor" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [TutorID], [TutorName], [RegistrationDate] FROM [TutorsTable]"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
