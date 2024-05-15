<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Quiz1Page.aspx.cs" Inherits="WebApplication2.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
        Quiz1
    </title>
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

        .auto-style1 {
            text-align: left;
        }

        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <div>
        </div>
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
                        <button class="login-btn">Login</button>
                        <button class="signup-btn">Sign Up</button>
                    </asp:Panel>
                </asp:PlaceHolder>
            </div>
        </header>

        <section class="courses-highlight">
            <h3>
                <asp:Label ID="Label13" runat="server" Font-Size="XX-Large" Text="Smart Money Management: A Key to Financial Success"></asp:Label>
            </h3>
            <h3>
                <asp:Label ID="Label12" runat="server" Font-Size="XX-Large" Text="Quiz 1"></asp:Label>
            </h3>
            <p class="auto-style1">
                <asp:Label ID="Label14" runat="server" Text="Question1"></asp:Label>
            </p>
            <p class="auto-style1">
                <asp:Label ID="Question1" runat="server" Text="(Question1)"></asp:Label>
            </p>
            <p class="auto-style1">
                <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
                <asp:Label ID="verify" runat="server" Text="verify" Visible="False"></asp:Label>
            </p>
            <p class="auto-style1">
                <asp:RadioButton ID="Choice1" runat="server" AutoPostBack="True" GroupName="Choices" OnCheckedChanged="Choice1_CheckedChanged" />
                <asp:RadioButton ID="Choice2" runat="server" AutoPostBack="True" GroupName="Choices" OnCheckedChanged="Choice2_CheckedChanged" />
                <asp:RadioButton ID="Choice3" runat="server" AutoPostBack="True" GroupName="Choices" OnCheckedChanged="Choice3_CheckedChanged" />
                <asp:RadioButton ID="Choice4" runat="server" AutoPostBack="True" GroupName="Choices" OnCheckedChanged="Choice4_CheckedChanged" />
            </p>
        </section>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;<asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Button2_Click" />
        <asp:Button ID="Next" runat="server" OnClick="Button3_Click" Text="Next" Visible="False" />
    </form>
</body>
</html>
