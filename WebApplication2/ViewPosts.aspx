<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewPosts.aspx.cs" Inherits="WebApplication2.ViewPosts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Posts in the Topic</h1>
            <!-- Container for displaying posts -->
            <asp:Label runat="server" id="label1" Visible="false" Text="There is no post in this topic yet"></asp:Label>
            <div class="posts" id="posts" runat="server"></div>
        </div>
        
    </form>
</body>
</html>
