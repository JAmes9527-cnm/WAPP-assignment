<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication2.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <link rel="stylesheet" href="styles.css" />
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'/>
    <style>
        table tr{
            padding:4px;
        }

        table td{
            padding:4px 7px;
        }

        textbox{
            background-color: transparent;
        }

        .login{
            display: flex;
            justify-content:center;
            align-items:center;
            min-height:100vh;
        }
    </style>
</head>


<body>
    <header>
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
    </header>

    <form id="form1" runat="server">
        <div class="login">
            <table>
                <tr>
                    <td><h1>Login</h1></td>
                </tr>
                <tr>
                    <td>
                        <i class="bx bxs-user"></i><asp:Label ID="Label1" runat="server" Text="Username: "></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="username" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <i class='bx bxs-lock-alt'></i><asp:Label ID="Label2" runat="server" Text="Password: "></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="pwd" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="errMsg" runat="server" Text="[errMsg]" Visible="false"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
    </form>
</body>
</html>
