<%@ Page Language="C#" MasterPageFile="~/masterPage.master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication2.newLogin" %>

    
    <asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <title>Login Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script>
        function showSuccessMessage(redirectPage, fname) {
            Swal.fire({
                icon: 'success',
                title: 'Login Successfully!',
                text: 'Welcome, ' + fname + '!',
                confirmButtonColor: '#1970ae',
                confirmButtonText: 'Continue'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = redirectPage;
                }
                else {
                    window.location.href = redirectPage;
                }
            });
        }
        function showErrorMessage() {
            Swal.fire({
                icon: 'error',
                title: 'Wrong username or password!',
                text: 'Try again !',
                confirmButtonColor: '#1970ae',
                confirmButtonText: 'Continue'
            });
        }
    </script>
    <style>
        .login-form {
            width: 340px;
            margin: 50px auto;
            font-size: 15px;
        }
        .login-form form {
            margin-bottom: 15px;
            background: #f7f7f7;
            box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            padding: 30px;
        }
        .login-form h2 {
            margin: 0 0 15px;
        }
        .form-control, .btn {
            min-height: 38px;
            border-radius: 2px;
        }
        .btn {
            font-size: 15px;
            font-weight: bold;
        }
    </style>

</asp:Content>


<asp:Content ContentPlaceHolderID="content" Runat="Server">
        <asp:ScriptManager runat="server" />
            <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                        <!-- Login Section -->
                        <asp:View ID="LoginView" runat="server">

        <div class="login-form">
        <h2 class="text-center">Log in</h2>       
        <div class="form-group">
            <asp:Textbox ID="username" type="text" CssClass="form-control" placeholder="Username" required="required" runat="server"/>
        </div>
        <div class="form-group">
            <asp:Textbox ID="pwd" type="text" CssClass="form-control" placeholder="Password" required="required" runat="server"/>
        </div>
        <div class="form-group">
            <asp:Button CssClass="btn btn-primary btn-block" Text="Log in" runat="server" ID="Button1" OnClick="Button1_Click"></asp:Button>
        </div>
        <div class="clearfix">
          <asp:LinkButton ID="forgotPasswordLink" runat="server" OnClick="forgotPasswordLink_Click" CssClass="float-right">Forgot Password?</asp:LinkButton>
        </div>
            <p class="text-center"><a href="register.aspx">Create an Account</a></p>
</div>
            </asp:View>

                        <!-- Forgot Password Section -->
                        <asp:View ID="ForgotPasswordView" runat="server">
                            <div class="login-form">
                            <h2 class="text-center">Forgot Password</h2>
                            <div class="form-group">
                                <asp:TextBox ID="forgotEmail" runat="server" CssClass="form-control" placeholder="Email" required="required"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorForgotEmail" runat="server" ControlToValidate="forgotEmail" ErrorMessage="Email is required!" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:Button CssClass="btn btn-primary btn-block" Text="Send OTP" runat="server" ID="SendOTPButton" OnClick="SendOTPButton_Click"></asp:Button>
                            </div>
                                </div>
                        </asp:View>

                        <!-- OTP Section -->
                        <asp:View ID="OTPView" runat="server">
                            <div class="login-form">
                            <h2 class="text-center">Enter OTP</h2>
                            <div class="form-group">
                                <asp:TextBox ID="otp" runat="server" CssClass="form-control" placeholder="Enter OTP" required="required"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorOTP" runat="server" ControlToValidate="otp" ErrorMessage="OTP is required!" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:Button CssClass="btn btn-primary btn-block" Text="Validate OTP" runat="server" ID="ValidateOTPButton" OnClick="ValidateOTPButton_Click"></asp:Button>
                            </div>
                        </asp:View>
                        </div>

                        <!-- New Password Section -->
                        <asp:View ID="NewPasswordView" runat="server">
                            <div class="login-form">
                            <h2 class="text-center">New Password</h2>
                            <div class="form-group">
                                <asp:TextBox ID="newPassword" runat="server" CssClass="form-control" placeholder="New Password" required="required" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorNewPassword" runat="server" ControlToValidate="newPassword" ErrorMessage="New Password is required!" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="confirmPassword" runat="server" CssClass="form-control" placeholder="Confirm Password" required="required" TextMode="Password"></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidatorNewPassword" runat="server" ControlToCompare="newPassword" ControlToValidate="confirmPassword" ErrorMessage="Passwords do not match!" ForeColor="Red"></asp:CompareValidator>
                            </div>
                            <div class="form-group">
                                <asp:Button CssClass="btn btn-primary btn-block" Text="Reset Password" runat="server" ID="ResetPasswordButton" OnClick="ResetPasswordButton_Click"></asp:Button>
                            </div>
                                </div>
                        </asp:View>
                    </asp:MultiView>
                </ContentTemplate>
            </asp:UpdatePanel>
    </asp:Content>

