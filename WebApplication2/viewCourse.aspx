<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="viewCourse.aspx.cs" Inherits="WebApplication2.viewCourse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div>
            <h2><asp:Label ID="lblName" runat="server" Text=""></asp:Label></h2>
            <asp:Image ID="imgThumbnail" runat="server" />
            <p><asp:Label ID="lblDescription" runat="server" Text=""></asp:Label></p>
            <h3><asp:Label ID="lblTitle1" runat="server" Text=""></asp:Label></h3>
            <p><asp:Label ID="lblContent1" runat="server" Text=""></asp:Label></p>
            <h3><asp:Label ID="lblTitle2" runat="server" Text=""></asp:Label></h3>
            <p><asp:Label ID="lblContent2" runat="server" Text=""></asp:Label></p>
            <h3><asp:Label ID="lblTitle3" runat="server" Text=""></asp:Label></h3>
            <p><asp:Label ID="lblContent3" runat="server" Text=""></asp:Label></p>
            <h3><asp:Label ID="lblTitle4" runat="server" Text=""></asp:Label></h3>
            <p><asp:Label ID="lblContent4" runat="server" Text=""></asp:Label></p>
            <p><asp:Label ID="lblCreatedBy" runat="server" Text=""></asp:Label></p>
            <p><asp:Label ID="lblCreatedAt" runat="server" Text=""></asp:Label></p>
        </div>
</asp:Content>
