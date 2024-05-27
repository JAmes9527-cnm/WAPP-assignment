<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/masterPage.Master" CodeBehind="manageForum.aspx.cs" Inherits="WebApplication2.manageForum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <title>Manage Forum</title>
        <link rel="stylesheet" href="forum.css" />
    <link rel="stylesheet" href="styles.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <h2>Existing Topics</h2>
            <div class="topics" id="topics" runat="server"></div>
</asp:Content>
