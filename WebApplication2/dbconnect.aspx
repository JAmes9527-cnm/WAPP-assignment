﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dbconnect.aspx.cs" Inherits="WebApplication2.dbconnect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [userTable]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
