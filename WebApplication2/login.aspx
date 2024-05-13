<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication2.newLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
    function showSuccessMessage(redirectPage,fname) {
        Swal.fire({
            icon: 'success',
            title: 'Login Successfully!',
            text: 'Welcome, '+fname + '!',
            confirmButtonColor: '#1970ae',
            confirmButtonText: 'Continue'
        }).then((result) => {
            if (result.isConfirmed) {
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
</head>
<body>
        <div class="login-form">
    <form  method="post" runat="server">
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
        <div class="form-group">
            <asp:Button CssClass="btn btn-primary btn-block" Text="Sign Up" runat="server" ID="register_btn" OnClick="register_btn_Click"></asp:Button>
        </div>
        <div class="clearfix">
            <a href="#" class="float-right">Forgot Password?</a>
        </div>
    </form>
</div>
</body>
</html>
