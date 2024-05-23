<%@ Page Title="Manage Students" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="manageStudents.aspx.cs" Inherits="WebApplication2.manageStudents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <style>
        .table-container {
            padding: 20px;
        }
        .table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 18px;
            text-align: left;
        }
        .table th, .table td {
            padding: 12px 15px;
            border: 1px solid #ddd;
        }
        .table th {
            background-color: #f4f4f4;
        }
        .action-buttons {
            display: flex;
            gap: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="table-container">
        <h2>Manage Students</h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UserID" CssClass="table" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="UserID" HeaderText="ID" ReadOnly="True" SortExpression="UserID" />
                <asp:BoundField DataField="fname" HeaderText="First Name" SortExpression="fname" />
                <asp:BoundField DataField="lname" HeaderText="Last Name" SortExpression="lname" />
                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                <asp:TemplateField>
                    <HeaderTemplate>Actions</HeaderTemplate>
                    <ItemTemplate>
                        <div class="action-buttons">
                            <asp:LinkButton ID="ViewButton" runat="server" CommandName="View" CommandArgument='<%# Eval("UserID") %>' CssClass="btn btn-info">View</asp:LinkButton>
                            <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CommandArgument='<%# Eval("UserID") %>' CssClass="btn btn-danger">Delete</asp:LinkButton>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
