 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="WebApplication2.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Page</title>
    <link rel="stylesheet" href="styles.css" />
    <script src="https://smtpjs.com/v3/smtp.js"></script>
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
        .input {
  border: none;
  outline: none;
  border-radius: 15px;
  padding: 1em;
  background-color: #ccc;
  box-shadow: inset 2px 5px 10px rgba(0,0,0,0.3);
  transition: 300ms ease-in-out;
}

.input:focus {
  background-color: white;
  transform: scale(1.05);
  box-shadow: 13px 13px 100px #969696,
             -13px -13px 100px #ffffff;
}
:focus {
  outline: 0;
  border-color: #2260ff;
  box-shadow: 0 0 0 4px #b5c9fc;
}

.mydict div {
  display: flex;
  flex-wrap: wrap;
  margin-top: 0.5rem;
  justify-content: center;
}

.mydict input[type="radio"] {
  clip: rect(0 0 0 0);
  clip-path: inset(100%);
  height: 1px;
  overflow: hidden;
  position: absolute;
  white-space: nowrap;
  width: 1px;
}

.mydict input[type="radio"]:checked + span {
  box-shadow: 0 0 0 0.0625em #0043ed;
  background-color: #dee7ff;
  z-index: 1;
  color: #0043ed;
}

label span {
  display: block;
  cursor: pointer;
  background-color: #fff;
  padding: 0.375em .75em;
  position: relative;
  margin-left: .0625em;
  box-shadow: 0 0 0 0.0625em #b5bfd9;
  letter-spacing: .05em;
  color: #3e4963;
  text-align: center;
  transition: background-color .5s ease;
}

label:first-child span {
  border-radius: .375em 0 0 .375em;
}

label:last-child span {
  border-radius: 0 .375em .375em 0;
}

.styled-dropdown {
        appearance: none;
        -webkit-appearance: none;
        -moz-appearance: none;
        border: none;
        outline: none;
        padding: 10px 15px;
        background-color: #ccc;
        border-radius: 15px;
        box-shadow: inset 2px 5px 10px rgba(0, 0, 0, 0.3);
        transition: background-color 300ms ease-in-out, box-shadow 300ms ease-in-out;
        cursor: pointer;
        font-size: 16px;
        color: #3e4963;
    }

    .styled-dropdown:focus {
        background-color: white;
        transform: scale(1.05);
        box-shadow: 13px 13px 100px #969696, -13px -13px 100px #ffffff;
    }

    .styled-dropdown option {
        background-color: #fff;
        color: #3e4963;
        padding: 10px;
    }

    .styled-dropdown-container {
        position: relative;
    }

    .styled-dropdown-container::after {
        content: '\25BC'; /* Down arrow */
        position: absolute;
        top: 50%;
        right: 10px;
        transform: translateY(-50%);
        pointer-events: none;
    }
    .button {
  padding: 1.3em 3em;
  font-size: 12px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 500;
  color: #000;
  background-color: #fff;
  border: none;
  border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
}

.button:hover {
  background-color: #23c483;
  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
  color: #fff;
  transform: translateY(-7px);
}

.button:active {
  transform: translateY(-1px);
}

    </style>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
    function showSuccessMessage() {
        Swal.fire({
            icon: 'success',
            title: 'Registered Successfully!',
            text: 'Account Created !',
            confirmButtonColor: '#1970ae',
            confirmButtonText: 'Continue'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = 'Login.aspx';
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
        <div>
            <h1>Registration</h1>
            <table>
                <tr>

                    <td>
                        <asp:TextBox ID="fname" runat="server" CssClass="input" Placeholder="First Name"></asp:TextBox>
                    </td>
                    <td>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fname" ErrorMessage="First Name cannot be empty!"></asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="lname" runat="server" CssClass="input" Placeholder="Last Name"></asp:TextBox>
                    </td>
                    <td>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lname" ErrorMessage="Last Name cannot be empty!"></asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="gender" runat="server" CssClass="styled-dropdown">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="email" runat="server" CssClass="input" Placeholder="Email"></asp:TextBox>
                    </td>
                    <td>
                        <div style="position: relative; display:inline-block">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="Invalid email format!" ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b" ForeColor="Red"></asp:RegularExpressionValidator>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="username" runat="server" CssClass="input" Placeholder="Username"></asp:TextBox>
                    </td>
                    <td>

                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
    ControlToValidate="username" 
    ErrorMessage="Username must be alphanumeric and between 8 to 20 characters long!" 
    ValidationExpression="^[a-zA-Z0-9]{8,20}$">
</asp:RegularExpressionValidator>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="pwd" runat="server" CssClass="input" Placeholder="Password" TextMode="Password"></asp:TextBox>
                    </td>
                    <td>

                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
    ControlToValidate="pwd"
    ErrorMessage="Password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, one digit, and one special character."
    ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$">
</asp:RegularExpressionValidator>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="input" Placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                    </td>
                    <td>

                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox1" ControlToValidate="pwd" ErrorMessage="Not same with password!"></asp:CompareValidator>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="errMsg" runat="server" Text="[errMsg]" Visible="False"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="usertype" runat="server" CssClass="styled-dropdown">
                            <asp:ListItem>member</asp:ListItem>
                            <asp:ListItem>tutor</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            
            <br />
            <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" CssClass="button" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="login.aspx">Already registered? Log in here</a>
        </div>
        
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
