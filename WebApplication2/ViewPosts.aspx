<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewPosts.aspx.cs" MasterPageFile="~/masterPage.Master" Inherits="WebApplication2.ViewPosts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <title>Posts</title>
    <link rel="stylesheet" href="forum.css" />
    <link rel="stylesheet" href="styles.css" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/d426041f87.js" crossorigin="anonymous"></script>
    <style>body{
    margin-top:20px;
    background:#ebeef0;
}

.img-sm {
    width: 46px;
    height: 46px;
}

.panel {
    border-radius: 0;
    border: 0;
    margin-bottom: 15px;
}

.panel .panel-footer, .panel>:last-child {
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
}

.panel .panel-heading, .panel>:first-child {
    border-top-left-radius: 0;
    border-top-right-radius: 0;
}

.panel-body {
    padding: 25px 20px;
}


.media-block .media-left {
    display: block;
    float: left
}

.media-block .media-right {
    float: right
}

.media-block .media-body {
    display: block;
    overflow: hidden;
    width: auto
}

.middle .media-left,
.middle .media-right,
.middle .media-body {
    vertical-align: middle
}

.thumbnail {
    border-radius: 0;
    border-color: #e9e9e9
}

.tag.tag-sm, .btn-group-sm>.tag {
    padding: 5px 10px;
}

.tag:not(.label) {
    background-color: #fff;
    padding: 6px 12px;
    border-radius: 2px;
    border: 1px solid #cdd6e1;
    font-size: 12px;
    line-height: 1.42857;
    vertical-align: middle;
    -webkit-transition: all .15s;
    transition: all .15s;
}
.text-muted, a.text-muted:hover, a.text-muted:focus {
    color: #acacac;
}
.text-sm {
    font-size: 0.9em;
}
.text-5x, .text-4x, .text-5x, .text-2x, .text-lg, .text-sm, .text-xs {
    line-height: 1.25;
}

.btn-trans {
    background-color: transparent;
    border-color: transparent;
    color: #929292;
}

.btn-icon {
    padding-left: 9px;
    padding-right: 9px;
}

.btn-sm, .btn-group-sm>.btn, .btn-icon.btn-sm {
    padding: 5px 10px !important;
}

.mar-top {
    margin-top: 15px;
}

.searchButton {
            overflow: hidden;
            height: 35px;
            width: 100%;
            max-width: 80px;
            padding: 0 1rem;
            border-radius: 1.5rem;
            background: #3d3a4e;
            background-size: 400%;
            color: #fff;
            border: none;
            cursor: pointer;
        }

.input {
  width: 100%;
  max-width: 220px;
  height: auto;
  padding: 12px;
  border-radius: 12px;
  border: 1.5px solid lightgrey;
  outline: none;
  transition: all 0.3s cubic-bezier(0.19, 1, 0.22, 1);
  box-shadow: 0px 0px 20px -18px;
}

.input:hover {
  border: 2px solid lightgrey;
  box-shadow: 0px 0px 20px -17px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <h1>Posts in the Topic</h1>
            <!-- Container for displaying posts -->
            <asp:Label runat="server" id="label1" Visible="false" Text="There is no post in this topic yet"></asp:Label>
            <div class="post-form">
                <h2>Create a New Post</h2>
                <asp:textbox runat="server" ID="content" TextMode="MultiLine" placeholder="Your message" CssClass="Content" Rows="5"></asp:textbox><br />
                <asp:Button runat="server" ID="postBtn" CssClass="post" Text="Post to forum" OnClick="postBtn_Click" />
            </div>

            <h2>Search Posts</h2>
<asp:TextBox runat="server" ID="searchPostsBox" placeholder="Search posts..." CssClass="input" />
<asp:Button runat="server" ID="searchPostsBtn" Text="Search" OnClick="searchPostsBtn_Click" CssClass="searchButton" />

            <div class="topics" id="posts" runat="server"></div>
</asp:Content>
