<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="tutorDashboard.aspx.cs" Inherits="WebApplication2.tutorDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <asp:Button Text="Edit Courses" ID="editCourses" runat="server" OnClick="courses_Click" />
    <asp:Button Text="Add Courses" ID="Button1" runat="server" OnClick="courses_Click" />
    <asp:Button Text="Add Courses" ID="Button2" runat="server" OnClick="courses_Click" />
</asp:Content>
