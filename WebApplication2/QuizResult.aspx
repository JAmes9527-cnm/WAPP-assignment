<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/masterPage.Master" CodeBehind="QuizResult.aspx.cs" Inherits="WebApplication2.QuizResult" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <title>Quiz Result</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="form-container">
        <div class="quiz-form">
            <h1>Quiz Result</h1>
            <asp:Label ID="lblResult" runat="server" Font-Size="Large"></asp:Label>
            <asp:Repeater ID="rptQuestions" runat="server">
                <HeaderTemplate>
                    <table class="quiz-result-table">
                        <tr>
                            <th>Question</th>
                            <th>Your Answer</th>
                            <th>Correct Answer</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("QuestionText") %></td>
                        <td><%# Eval("UserAnswer") %></td>
                        <td><%# Eval("CorrectAnswer") %></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
