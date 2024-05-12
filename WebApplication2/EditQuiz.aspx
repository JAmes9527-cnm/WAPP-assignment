<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditQuiz.aspx.cs" Inherits="WebApplication2.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">


        header {
            background: #005691;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: -webkit-sticky; /* Safari */
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

        .login-btn {
            padding: 5px 10px;
            background: #f8c146;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-left: 10px;
            color: #fff;
        }

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

        .container {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
            padding:0 20px;
        }

        .left-content {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            width: calc(30% - 20px); 
            height: 350px; 
        }

        .center-content {
            text-align: center; 
        }

        .center-content {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            width: calc(30% - 20px); 
            height: 350px; 
        }

        .right-content {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            width: calc(30% - 20px); 
            height: 350px; 
        }

        .content{
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            width: calc(100% - 20px); 
            height: 350px; 
        }



        footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            background: #333;
            color: white;
            text-align: center;
            padding: 20px 0;
        }

        .auto-style1 {
            width: 66%;
            margin-right: 0px;
            margin-bottom: 26px;
        }
        .auto-style2 {
            width: 448px;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            width: 122px;
        }
        .auto-style8 {
            width: 448px;
            height: 34px;
        }
        .auto-style9 {
            width: 122px;
            height: 34px;
        }
        .auto-style18 {
            width: 1014px;
            height: 34px;
        }
        .auto-style19 {
            width: 1014px;
        }

    </style>
</head>
<body>
    <form id="No" runat="server">
        <div>
        </div>
        <header>
            <div class="logo">
                <a href="home.aspx"><img src="/img/logo.png" style="height: 68px; width: 159px; margin-right: 1px" /></a>
            </div>
            <nav>
                <ul>
                    <li><a href="index.aspx">Home</a></li>
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
                        <button class="login-btn">Login</button>
                        <button class="signup-btn">Sign Up</button>
                    </asp:Panel>
                </asp:PlaceHolder>
            </div>
        </header>

        <section class="courses-highlight">
            <h3>Smart Money Management: A Key to Financial Success</h3>
        </section>
        <table class="auto-style1">
            <tr>
                <td class="auto-style3" colspan="3">
                    <asp:Label ID="Label1" runat="server" Text="Edit Quiz 1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label9" runat="server" Text="Choose Question To Edit"></asp:Label>
                </td>
                <td class="auto-style4">:</td>
                <td class="auto-style19">
                    <asp:DropDownList ID="Number" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Question" DataValueField="Question" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="596px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Quiz]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="Label2" runat="server" Text="Question"></asp:Label>
                </td>
                <td class="auto-style9">:</td>
                <td class="auto-style18">
                    <asp:TextBox ID="Question" runat="server" Width="800px"  ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label7" runat="server" Text="Choice1"></asp:Label>
                </td>
                <td class="auto-style4">:</td>
                <td class="auto-style19">
                    <asp:TextBox ID="Choice1" runat="server" Width="799px" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label4" runat="server" Text="Choice2"></asp:Label>
                </td>
                <td class="auto-style4">:</td>
                <td class="auto-style19">
                    <asp:TextBox ID="Choice2" runat="server" Width="800px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label5" runat="server" Text="Choice3"></asp:Label>
                </td>
                <td class="auto-style4">:</td>
                <td class="auto-style19">
                    <asp:TextBox ID="Choice3" runat="server" Width="800px" OnTextChanged="TextBox5_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label6" runat="server" Text="Choice4"></asp:Label>
                </td>
                <td class="auto-style4">:</td>
                <td class="auto-style19">
                    <asp:TextBox ID="Choice4" runat="server" Width="800px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label8" runat="server" Text="Answer"></asp:Label>
                </td>
                <td class="auto-style4">:</td>
                <td class="auto-style19">
                    <asp:TextBox ID="Answer" runat="server" Width="800px"></asp:TextBox>
                </td>
            </tr>
        </table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add/Edit" />
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Remove" />
        <asp:Button ID="Button2" runat="server" Text="Quiz" OnClick="Button2_Click" />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Back" />
    </form>
    </body>
</html>
