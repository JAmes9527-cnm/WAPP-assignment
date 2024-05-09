<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manageForum.aspx.cs" Inherits="WebApplication2.manageForum" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link rel="stylesheet" href="forum.css" />
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Existing Topics</h2>
            <div class="topics" id="topics" runat="server"></div>
        </div>
    </form>
</body>
</html>
