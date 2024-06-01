<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/masterPage.Master" CodeBehind="AttemptQuiz.aspx.cs" Inherits="WebApplication2.AttemptQuiz" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <title>Attempt Quiz</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="form-container">
        <div class="quiz-form">
            <h1>Attempt Quiz</h1>
            <asp:Label ID="lblCourseTitle" runat="server" Font-Size="Large"></asp:Label>

            <p class="auto-style1">
                <asp:Label ID="Label14" runat="server" Text="Question1"></asp:Label>
            </p>
            <p class="auto-style1">
                <asp:Label ID="Question1" runat="server" Text="(Question1)"></asp:Label>
            </p>
            <p class="auto-style1">
                <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
                <asp:Label ID="verify" runat="server" Text="verify" Visible="False"></asp:Label>
            </p>
            <p class="auto-style1">
                <asp:RadioButton ID="Choice1" runat="server" AutoPostBack="True" GroupName="Choices" OnCheckedChanged="Choice1_CheckedChanged" />
                <asp:RadioButton ID="Choice2" runat="server" AutoPostBack="True" GroupName="Choices" OnCheckedChanged="Choice2_CheckedChanged" />
                <asp:RadioButton ID="Choice3" runat="server" AutoPostBack="True" GroupName="Choices" OnCheckedChanged="Choice3_CheckedChanged" />
                <asp:RadioButton ID="Choice4" runat="server" AutoPostBack="True" GroupName="Choices" OnCheckedChanged="Choice4_CheckedChanged" />
            </p>

            <p class="auto-style1">
    <asp:Label ID="Label15" runat="server" Text="Question 2"></asp:Label>
</p>
<p class="auto-style1">
    <asp:Label ID="Question2" runat="server" Text="(Question 2)"></asp:Label>
</p>
<p class="auto-style1">
    <asp:TextBox ID="Answer2" runat="server"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;
    <asp:Label ID="verify2" runat="server" Text="verify" Visible="False"></asp:Label>
</p>
<p class="auto-style1">
    <asp:RadioButton ID="Choice5" runat="server" AutoPostBack="True" GroupName="Choices2" OnCheckedChanged="Choice5_CheckedChanged" />
    <asp:RadioButton ID="Choice6" runat="server" AutoPostBack="True" GroupName="Choices2" OnCheckedChanged="Choice6_CheckedChanged" />
    <asp:RadioButton ID="Choice7" runat="server" AutoPostBack="True" GroupName="Choices2" OnCheckedChanged="Choice6_CheckedChanged" />
    <asp:RadioButton ID="Choice8" runat="server" AutoPostBack="True" GroupName="Choices2" OnCheckedChanged="Choice6_CheckedChanged" />
</p>

<p class="auto-style1">
    <asp:Label ID="Label16" runat="server" Text="Question 3"></asp:Label>
</p>
<p class="auto-style1">
    <asp:Label ID="Question3" runat="server" Text="(Question 3)"></asp:Label>
</p>
<p class="auto-style1">
    <asp:TextBox ID="Answer3" runat="server"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;
    <asp:Label ID="verify3" runat="server" Text="verify" Visible="False"></asp:Label>
</p>
<p class="auto-style1">
    <asp:RadioButton ID="Choice9" runat="server" AutoPostBack="True" GroupName="Choices3" OnCheckedChanged="Choice9_CheckedChanged" />
    <asp:RadioButton ID="Choice10" runat="server" AutoPostBack="True" GroupName="Choices3" OnCheckedChanged="Choice10_CheckedChanged" />
    <asp:RadioButton ID="Choice11" runat="server" AutoPostBack="True" GroupName="Choices3" OnCheckedChanged="Choice10_CheckedChanged" />
    <asp:RadioButton ID="Choice12" runat="server" AutoPostBack="True" GroupName="Choices3" OnCheckedChanged="Choice10_CheckedChanged" />
</p>

        
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;


        
        <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Button2_Click" />
        <asp:Button ID="Next" runat="server" OnClick="Button3_Click" Text="Try Again" Visible="False" />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Check Result" Visible="False" />
    
            
        </div>
    </div>
</asp:Content>
