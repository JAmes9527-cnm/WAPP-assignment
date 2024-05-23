<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/masterPage.Master" CodeBehind="forum.aspx.cs" Inherits="WebApplication2.forum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <title>Forum</title>
    <link rel="stylesheet" href="forum.css" />
    <link rel="stylesheet" href="styles.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="post-form">
                <h2>Create a New Topic</h2>
                <asp:TextBox runat="server" ID="title" placeholder="Title" /><br />
                <asp:TextBox runat="server" ID="content" TextMode="MultiLine" placeholder="Your message" CssClass="content" Rows="5"></asp:TextBox><br />
                <asp:Button runat="server" ID="postBtn" CssClass="post" Text="Post to forum" OnClick="postBtn_Click" />
            </div>

            <h2>Search Topics</h2>
            <asp:TextBox runat="server" ID="searchBox" placeholder="Search..." OnTextChanged="searchBox_TextChanged" CssClass="input"/>
            <asp:Button runat="server" ID="searchBtn" Text="Search" OnClick="searchBtn_Click" CssClass="searchButton" />

            <h2>Existing Topics</h2>
            <div class="topics" id="topics" runat="server"></div>
</asp:Content>