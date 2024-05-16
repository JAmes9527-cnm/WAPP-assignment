<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="WebApplication2.UserProfile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>user Profile</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <style>
        body {
            font-family: 'Varela Round', sans-serif;
        }

        .modal-confirm {
            color: #636363;
            width: 550px;
        }

            .modal-confirm .modal-content {
                padding: 20px;
                border-radius: 5px;
                border: none;
            }

            .modal-confirm .modal-header {
                padding: 0 15px;
                border-bottom: none;
                position: relative;
            }

            .modal-confirm h4 {
                display: inline-block;
                font-size: 26px;
            }

            .modal-confirm .close {
                position: absolute;
                top: -5px;
                right: -5px;
            }

            .modal-confirm .modal-body {
                color: #999;
            }

            .modal-confirm .modal-footer {
                background: #ecf0f1;
                border-color: #e6eaec;
                text-align: right;
                margin: 0 -20px -20px;
                border-radius: 0 0 5px 5px;
            }

            .modal-confirm .btn {
                color: #fff;
                border-radius: 4px;
                transition: all 0.4s;
                border: none;
                padding: 8px 20px;
                outline: none !important;
            }

            .modal-confirm .btn-info {
                background: #b0c1c6;
            }

                .modal-confirm .btn-info:hover, .modal-confirm .btn-info:focus {
                    background: #92a9af;
                }

            .modal-confirm .btn-danger {
                background: #f15e5e;
            }

                .modal-confirm .btn-danger:hover, .modal-confirm .btn-danger:focus {
                    background: #ee3535;
                }

            .modal-confirm .modal-footer .btn + .btn {
                margin-left: 10px;
            }

        .trigger-btn {
            display: inline-block;
            margin: 100px auto;
        }

        header {
            background: #005691;
            color: darkblue;
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
            padding: 0 20px;
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

        .content {
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
            width: 55%;
            margin-right: 0px;
            margin-bottom: 26px;
        }

        .auto-style2 {
            width: 230px;
        }

        .auto-style3 {
            text-align: center;
        }

        .auto-style4 {
            width: 109px;
        }

        .auto-style5 {
            width: 230px;
            height: 36px;
        }

        .auto-style6 {
            width: 109px;
            height: 36px;
        }

        .auto-style8 {
            width: 230px;
            height: 34px;
        }

        .auto-style9 {
            width: 109px;
            height: 34px;
        }

        .auto-style11 {
            height: 36px;
            width: 311px;
        }

        .auto-style12 {
            height: 34px;
        }

        .auto-style15 {
            width: 331px;
            height: 36px;
        }

        .auto-style16 {
            height: 36px;
            text-align: center;
        }

        .auto-style17 {
            height: 36px;
        }

        .cropped-image {
            width: 100%; /* Take the full width of the container */
            height: auto; /* Maintain aspect ratio */
            object-fit: cover; /* Cover the entire container, cropping the image if necessary */
            object-position: center; /* Center the image within the container */
        }

        .circular-img-container {
            width: 100px; /* Adjust the size as needed */
            height: 100px; /* Adjust the size as needed */
            overflow: hidden;
            border-radius: 50%;
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
            <h3>Smart Money Management: A Key to Financial Success</h3>
        </section>
        <table class="auto-style1">
            <tr>
                <td class="auto-style3" colspan="4">
                    <asp:Label ID="Label1" runat="server" Text="Edit User"></asp:Label>
                </td>
            </tr>
            <tr>
                <td  class="auto-style16" colspan="3">
                     <asp:Image ID="Image1" runat="server" CssClass="cropped-image circular-img-container" ImageUrl="your_image_url.jpg" />
                </td>
                <td class="auto-style17">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <br />
                    <asp:Label ID="ImgUrl" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label3" runat="server" Text="UserID"></asp:Label>
                </td>
                <td class="auto-style6">:</td>
                <td class="auto-style11">
                    <asp:Label ID="id" runat="server"></asp:Label>
&nbsp;
                </td>
                <td class="auto-style15">
                    <asp:Label ID="Label9" runat="server" Text="Label" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="Label2" runat="server" Text="First Name"></asp:Label>
                </td>
                <td class="auto-style9">:</td>
                <td class="auto-style12" colspan="2">
                    <asp:TextBox ID="fname" runat="server" Width="800px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label7" runat="server" Text="Last Name"></asp:Label>
                </td>
                <td class="auto-style4">:</td>
                <td colspan="2">
                    <asp:TextBox ID="lname" runat="server" Width="799px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label4" runat="server" Text="Gender"></asp:Label>
                </td>
                <td class="auto-style4">:</td>
                <td colspan="2">
                    <asp:Label ID="gender" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label5" runat="server" Text="Email"></asp:Label>
                </td>
                <td class="auto-style4">:</td>
                <td colspan="2">
                    <asp:TextBox ID="email" runat="server" Width="800px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label6" runat="server" Text="Username"></asp:Label>
                </td>
                <td class="auto-style4">:</td>
                <td colspan="2">
                    <asp:TextBox ID="username" runat="server" Width="800px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label8" runat="server" Text="Password"></asp:Label>
                </td>
                <td class="auto-style4">:</td>
                <td colspan="2">
                    <asp:TextBox ID="password" runat="server" Width="800px"></asp:TextBox>
                </td>
            </tr>
        </table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;<button type="button" href="#myModal" class="trigger-btn" data-toggle="modal">Confirm Changes</button>
        &nbsp;&nbsp;&nbsp;<button type="button" href="#deleteModal" class="trigger-btn" data-toggle="modal">Delete account</button>
        <!-- Modal HTML -->
<div id="myModal" class="modal fade">
	<div class="modal-dialog modal-confirm">
		<div class="modal-content">
			<div class="modal-header">			
				<h4 class="modal-title">Confirmation</h4>	
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">
				<p>Are you sure you want to save your changes?</p>
			</div>
			<div class="modal-footer">
                <asp:Button id="cancelBtn" runat="server" CssClass="btn btn-info" data-dismiss="modal" Text="Cancel"></asp:Button>
				<asp:Button id="confirmBtn" CssClass="btn btn-danger" runat="server" Text="Yes, change it!" OnClick="confirmBtn_Click"></asp:Button>
			</div>
		</div>
	</div>
</div>
        <div id="deleteModal" class="modal fade">
	<div class="modal-dialog modal-confirm">
		<div class="modal-content">
			<div class="modal-header">			
				<h4 class="modal-title">Confirmation</h4>	
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">
				<p>Are you sure you want to delete your account?</p>
			</div>
			<div class="modal-footer">
                <asp:Button id="Button1" runat="server" CssClass="btn btn-info" data-dismiss="modal" Text="Cancel"></asp:Button>
				<asp:Button id="Button2" CssClass="btn btn-danger" runat="server" Text="Yes, I want to delete it!" OnClick="deleteBtn_Click"></asp:Button>
			</div>
		</div>
	</div>
</div>     
    </form>
    </body>
</html>

