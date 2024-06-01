<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="manageTutors.aspx.cs" Inherits="WebApplication2.manageTutor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <title>Manage Tutors</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
            <h1>Manage Tutors</h1>
            <div class="gridview-container">
                <h2>Existing Tutors</h2>
                <asp:GridView ID="GridViewExistingTutors" runat="server" AutoGenerateColumns="False" OnRowCommand="GridViewExistingTutors_RowCommand" CssClass="table">
    <Columns>
        <asp:BoundField DataField="UserID" HeaderText="Tutor ID" />
        <asp:BoundField DataField="fname" HeaderText="First Name" />
        <asp:BoundField DataField="lname" HeaderText="Last Name" />
        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <div class="action-buttons">
                <asp:Button ID="ViewProfileButton" runat="server" Text="View Profile" CommandName="ViewProfile" CommandArgument='<%# Eval("UserID") %>' CssClass="btn btn-info"></asp:Button>
                <asp:Button ID="RemoveButton" runat="server" Text="Remove" CommandName="Remove" CommandArgument='<%# Eval("UserID") %>' CssClass="btn btn-danger"/>
                    </div>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>


                <h2>New Tutors Awaiting Approval</h2>
                <asp:GridView ID="GridViewNewTutors" runat="server" AutoGenerateColumns="False" OnRowCommand="GridViewNewTutors_RowCommand" CssClass="table" >
                    <Columns>
                        <asp:TemplateField HeaderText="Tutor Name">
                            <ItemTemplate>
                                <asp:Label ID="lblTutorName" runat="server" Text='<%# Bind("fname") + " " + Bind("lname") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="UserID" HeaderText="Tutor ID" />
                        <asp:BoundField DataField="RegisterDate" HeaderText="Date of Registration" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnApprove" runat="server" Text="Approve" CommandName="Approve" CommandArgument='<%# Bind("UserID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnDecline" runat="server" Text="Decline" CommandName="Decline" CommandArgument='<%# Bind("UserID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
</asp:Content>
