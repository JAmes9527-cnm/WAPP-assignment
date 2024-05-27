<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/masterPage.Master" CodeBehind="AttemptQuiz.aspx.cs" Inherits="WebApplication2.AttemptQuiz" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <title>Attempt Quiz</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="form-container">
        <div class="quiz-form">
            <h1>Attempt Quiz</h1>
            <asp:Label ID="lblCourseTitle" runat="server" Font-Size="Large"></asp:Label>
            <asp:PlaceHolder ID="phQuestions" runat="server"></asp:PlaceHolder>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="button" />
        </div>
    </div>
</asp:Content>
