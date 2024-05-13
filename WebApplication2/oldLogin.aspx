<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="oldLogin.aspx.cs" Inherits="WebApplication2.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <link rel="stylesheet" href="styles.css" />
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
    function showSuccessMessage(redirectPage) {
        Swal.fire({
            icon: 'success',
            title: 'Login Successfully!',
            text: 'Account Created !',
            confirmButtonColor: '#1970ae',
            confirmButtonText: 'Continue'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = redirectPage;
            }
        });
    }
    </script>
</head>


<body>
    <header>
        <div class="logo">
            <h1>Smart Money Mastery</h1>
        </div>
        <nav>
            <ul>
                <li><a href="home.aspx">Home</a></li>
                <li><a href="courses.aspx">Courses</a></li>
                <li><a href="forum.aspx">Forum</a></li>
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
                        <asp:TextBox ID="pwd" runat="server" OnTextChanged="pwd_TextChanged"></asp:TextBox>
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
    &nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" Text="Not yet registered? "></asp:Label>
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Register here</asp:LinkButton>
    </form>
</body>
</html>
