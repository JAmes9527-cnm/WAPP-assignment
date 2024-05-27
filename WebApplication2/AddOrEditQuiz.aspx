<%@ Page Title="Add or Edit Quiz" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="AddOrEditQuiz.aspx.cs" Inherits="WebApplication2.AddOrEditQuiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <style>

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <table class="auto-style1">
            <tr>
                <td class="auto-style3" colspan="4">
                    <asp:Label ID="Label1" runat="server" Text="Edit Quiz"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label9" runat="server" Text="Choose Question To Edit"></asp:Label>
                </td>
                <td class="auto-style4">:</td>
                <td colspan="2">
                    <asp:DropDownList ID="SelectedQuestion" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Question" DataValueField="Question" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="596px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    SelectCommand="SELECT * FROM [Questions] WHERE [CourseID] = @CourseID">
    <SelectParameters>
        <asp:Parameter Name="CourseID" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
                    <asp:Label ID="ErrMsg" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    Question-ID</td>
                <td class="auto-style4">:</td>
                <td class="auto-style20">
                    <asp:Label ID="QuestionID" runat="server" Text="0"></asp:Label>
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
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Back" />
</asp:Content>
