<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dbconnect.aspx.cs" Inherits="WebApplication2.dbconnect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="CREATE TABLE [dbo].[userTable] (
    [UserID]   INT            IDENTITY (1, 1) NOT NULL,
    [fname]    NVARCHAR (50)  NOT NULL,
    [lname]    NVARCHAR (50)  NOT NULL,
    [gender]   NCHAR (10)     NOT NULL,
    [email]    NVARCHAR (50)  NOT NULL,
    [username] NVARCHAR (50)  NOT NULL,
    [password] NVARCHAR (50)  NOT NULL,
    [usertype] NCHAR (10)     NOT NULL,
    [Verified] INT            DEFAULT ((0)) NULL,
    [imgUrl]   NVARCHAR (MAX) DEFAULT ('/img/pfp/default_pfp.png') NULL,
    PRIMARY KEY CLUSTERED ([UserID] ASC)
);"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
