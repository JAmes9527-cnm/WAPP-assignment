<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result Page.aspx.cs" Inherits="WebApplication2.WebForm5" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        header {
            background: #005691;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
        }

        nav ul {
            list-style: none;
            padding: 0;
        }

        nav ul li {
            display: inline;
            margin-right: 10px;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        .button-container {
            display: flex;
            justify-content: flex-end;
        }

        .login-btn,
        .signup-btn {
            padding: 5px 10px;
            background: #f8c146;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-left: 10px;
            color: #fff;
        }

        .courses-highlight {
            background: white;
            text-align: center;
            margin-bottom: 20px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .grid-view-container {
            overflow-x: auto;
            margin-bottom: 20px;
        }

        .grid-view {
            width: auto;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .grid-view th,
        .grid-view td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .grid-view th {
            background-color: #005691; /* Dark blue for header */
            font-weight: bold;
            color: white;
        }

        .grid-view tr:nth-child(even) {
            background-color: #f9f9f9; /* Light grey for alternate rows */
        }

        .grid-view tr:hover {
            background-color: #f1f1f1; /* Lighter grey on hover */
        }

        .grid-view .edit-button {
            background-color: #4CAF50; /* Green */
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            border-radius: 3px;
        }

        .grid-view .edit-button:hover {
            background-color: #45a049; /* Darker green on hover */
        }
        .auto-style2 {
            text-align: center;
        }
    </style>


</head>
<body>
    <form id="form2" runat="server">
        <header>
            <div class="logo">
                <a href="home.aspx"><img src="/img/logo.png" style="height: 68px; width: 159px; margin-right: 1px" /></a>
            </div>
            <nav>
                <ul>
                    <li><a href="home.aspx">Home</a></li>
                    <li><a href="courses.aspx">Courses</a></li>
                    <li><a href="forum.aspx">Forum</a></li>
                    <li><a href="resources.aspx">Resources</a></li>
                    <li><a href="about.aspx">About</a></li>
                    <li><a href="contact.aspx">Contact Us</a></li>
                    <li>
                        <div class="dropdown">
                            <button id="More_btn">More</button>
                            <div class="dropdown_content">
                                <a href="video.aspx">Video</a>
                                <a href="calculator.aspx">Calculator</a>
                            </div>
                        </div>
                    </li>
                </ul>
            </nav>
            <div class="button-container">
                <asp:PlaceHolder ID="loginPlaceHolder" runat="server">
                    <asp:Panel ID="loginPanel" runat="server">
                        <a class="login-btn" href="login.aspx">Login</a>
                        <a class="signup-btn" href="register.aspx">Sign Up</a>
                    </asp:Panel>
                </asp:PlaceHolder>
            </div>
        </header>

        <section class="courses-highlight">
            <h3>
                <asp:Label ID="Label13" runat="server" Font-Size="XX-Large" Text="Result Page"></asp:Label>
            </h3>
        </section>

        <div class="grid-view-container">
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="grid-view" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound">
    <Columns>
        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" />
        <asp:BoundField DataField="Quiz" HeaderText="Quiz" SortExpression="Quiz" />
        <asp:BoundField DataField="Q1" HeaderText="Q1" SortExpression="Q1" />
        <asp:BoundField DataField="StudentAnswer1" HeaderText="StudentAnswer1" SortExpression="StudentAnswer1" />
        <asp:BoundField DataField="CorrectAnswer1" HeaderText="CorrectAnswer1" SortExpression="CorrectAnswer1" />
        <asp:TemplateField HeaderText="Result1">
            <ItemTemplate>
                <%# Eval("Result1") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="DropDownListResult1" runat="server">
                    <asp:ListItem Text="Correct" Value="Correct"></asp:ListItem>
                    <asp:ListItem Text="False" Value="False"></asp:ListItem>
                </asp:DropDownList>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="Q2" HeaderText="Q2" SortExpression="Q2" />
        <asp:BoundField DataField="StudentAnswer2" HeaderText="StudentAnswer2" SortExpression="StudentAnswer2" />
        <asp:BoundField DataField="CorrectAnswer2" HeaderText="CorrectAnswer2" SortExpression="CorrectAnswer2" />
        <asp:TemplateField HeaderText="Result2">
            <ItemTemplate>
                <%# Eval("Result2") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="DropDownListResult2" runat="server">
                    <asp:ListItem Text="Correct" Value="Correct"></asp:ListItem>
                    <asp:ListItem Text="False" Value="False"></asp:ListItem>
                </asp:DropDownList>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="Q3" HeaderText="Q3" SortExpression="Q3" />
        <asp:BoundField DataField="StudentAnswer3" HeaderText="StudentAnswer3" SortExpression="StudentAnswer3" />
        <asp:BoundField DataField="CorrectAnswer3" HeaderText="CorrectAnswer3" SortExpression="CorrectAnswer3" />
        <asp:TemplateField HeaderText="Result3">
            <ItemTemplate>
                <%# Eval("Result3") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="DropDownListResult3" runat="server">
                    <asp:ListItem Text="Correct" Value="Correct"></asp:ListItem>
                    <asp:ListItem Text="False" Value="False"></asp:ListItem>
                </asp:DropDownList>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="TotalResult" HeaderText="TotalResult" SortExpression="TotalResult" />
        <asp:CommandField ShowEditButton="True" HeaderText="Actions" ButtonType="Button" EditText="Edit" UpdateText="Update" CancelText="Cancel" />
    </Columns>
</asp:GridView>

        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ResultTable]" UpdateCommand="UPDATE [ResultTable] SET StudentID=@StudentID, Quiz=@Quiz, Q1=@Q1, StudentAnswer1=@StudentAnswer1, CorrectAnswer1=@CorrectAnswer1, Result1=@Result1, Q2=@Q2, StudentAnswer2=@StudentAnswer2, CorrectAnswer2=@CorrectAnswer2, Result2=@Result2, Q3=@Q3, StudentAnswer3=@StudentAnswer3, CorrectAnswer3=@CorrectAnswer3, Result3=@Result3, TotalResult=@TotalResult WHERE Id=@Id">
            <UpdateParameters>
                <asp:Parameter Name="Id" Type="Int32" />
                <asp:Parameter Name="StudentID" Type="String" />
                <asp:Parameter Name="Quiz" Type="String" />
                <asp:Parameter Name="Q1" Type="String" />
                <asp:Parameter Name="StudentAnswer1" Type="String" />
                <asp:Parameter Name="CorrectAnswer1" Type="String" />
                <asp:Parameter Name="Result1" Type="String" />
                <asp:Parameter Name="Q2" Type="String" />
                <asp:Parameter Name="StudentAnswer2" Type="String" />
                <asp:Parameter Name="CorrectAnswer2" Type="String" />
                <asp:Parameter Name="Result2" Type="String" />
                <asp:Parameter Name="Q3" Type="String" />
                <asp:Parameter Name="StudentAnswer3" Type="String" />
                <asp:Parameter Name="CorrectAnswer3" Type="String" />
                <asp:Parameter Name="Result3" Type="String" />
                <asp:Parameter Name="TotalResult" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <p class="auto-style2">
            <asp:Button ID="Next" runat="server" OnClick="Button3_Click" Text="Back" />
        </p>
    </form>
</body>
</html>
