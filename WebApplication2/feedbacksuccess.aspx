<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="feedbacksuccess.aspx.cs" Inherits="WebApplication2.feedbacksuccess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <title>Feedback Submitted</title>
    <link rel="stylesheet" href="feedbackdesign.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="container">
            <h2>Thank You!</h2>
            <p>Your feedback has been successfully submitted.</p>
            <asp:Button ID="btnHome" runat="server" Text="Back to Home" PostBackUrl="home.aspx" CssClass="btn-submit" />
        </div>
</asp:Content>
