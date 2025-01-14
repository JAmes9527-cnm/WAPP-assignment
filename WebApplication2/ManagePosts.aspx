﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManagePosts.aspx.cs" Inherits="WebApplication2.ManagePosts" MasterPageFile="~/masterPage.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <title>Manage posts</title>
    <link rel="stylesheet" href="forum.css" />
    <link rel="stylesheet" href="styles.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <h1>Posts in the Topic</h1>
            <!-- Container for displaying posts -->
            <asp:Label runat="server" id="label1" Visible="false" Text="There is no post in this topic yet"></asp:Label>
            <div class="post-form">
                <h2>Create a New Post</h2>
                <asp:textbox runat="server" ID="content" TextMode="MultiLine" placeholder="Your message" CssClass="content"></asp:textbox><br />
                <asp:Button runat="server" ID="postBtn" CssClass="post" Text="Post to forum" OnClick="postBtn_Click" />
            </div>
            <div class="posts" id="posts" runat="server"></div>
</asp:Content>