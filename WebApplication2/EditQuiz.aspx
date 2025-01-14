﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/masterPage.Master" CodeBehind="EditQuiz.aspx.cs" Inherits="WebApplication2.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <style>
        .container {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
            padding:0 20px;
        }

        .left-content {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            width: calc(30% - 20px); 
            height: 350px; 
        }

        .center-content {
            text-align: center; 
        }

        .center-content {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            width: calc(30% - 20px); 
            height: 350px; 
        }

        .right-content {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            width: calc(30% - 20px); 
            height: 350px; 
        }

        .content{
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            width: calc(100% - 20px); 
            height: 350px; 
        }



        footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            background: #333;
            color: white;
            text-align: center;
            padding: 20px 0;
        }

        .auto-style1 {
            width: 67%;
            margin-right: 0px;
            margin-bottom: 26px;
        }
        .auto-style2 {
            width: 448px;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            width: 122px;
        }
        .auto-style8 {
            width: 448px;
            height: 34px;
        }
        .auto-style9 {
            width: 122px;
            height: 34px;
        }
        .auto-style20 {
            width: 1014px;
            text-align: left;
            margin-left: 40px;
        }
        .auto-style21 {
            height: 34px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <table class="auto-style1">
            <tr>
                <td class="auto-style3" colspan="4">
                    <asp:Label ID="Label1" runat="server" Text="Edit Quiz 1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label9" runat="server" Text="Choose Question To Edit"></asp:Label>
                </td>
                <td class="auto-style4">:</td>
                <td colspan="2">
                    <asp:DropDownList ID="Number" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Question" DataValueField="Question" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="596px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Quiz]"></asp:SqlDataSource>
                    <asp:Label ID="ErrMsg" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    Question-ID</td>
                <td class="auto-style4">:</td>
                <td class="auto-style20">
                    <asp:Label ID="QuizID" runat="server" Text="0"></asp:Label>
                &nbsp;&nbsp;
                </td>
                <td class="auto-style15">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="Label2" runat="server" Text="Question"></asp:Label>
                </td>
                <td class="auto-style9">:</td>
                <td class="auto-style21" colspan="2">
                    <asp:TextBox ID="Question" runat="server" Width="800px" OnTextChanged="Question_TextChanged"  ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label7" runat="server" Text="Choice1"></asp:Label>
                </td>
                <td class="auto-style4">:</td>
                <td colspan="2">
                    <asp:TextBox ID="Choice1" runat="server" Width="799px" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label4" runat="server" Text="Choice2"></asp:Label>
                </td>
                <td class="auto-style4">:</td>
                <td colspan="2">
                    <asp:TextBox ID="Choice2" runat="server" Width="800px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label5" runat="server" Text="Choice3"></asp:Label>
                </td>
                <td class="auto-style4">:</td>
                <td colspan="2">
                    <asp:TextBox ID="Choice3" runat="server" Width="800px" OnTextChanged="TextBox5_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label6" runat="server" Text="Choice4"></asp:Label>
                </td>
                <td class="auto-style4">:</td>
                <td colspan="2">
                    <asp:TextBox ID="Choice4" runat="server" Width="800px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label8" runat="server" Text="Answer"></asp:Label>
                </td>
                <td class="auto-style4">:</td>
                <td colspan="2">
                    <asp:TextBox ID="Answer" runat="server" Width="800px"></asp:TextBox>
                </td>
            </tr>
        </table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add/Edit" />
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Remove" OnClientClick="return confirm('Are you sure you want to delete this item?');" />
        <asp:Button ID="Button2" runat="server" Text="Quiz" OnClick="Button2_Click" />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Back" />
</asp:Content>