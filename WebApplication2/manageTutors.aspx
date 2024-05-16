<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manageTutors.aspx.cs" Inherits="WebApplication2.manageTutors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Manage Tutors</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .gridview-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 20px;
        }

        .centered-gridview {
            margin: 0 auto;
            border-collapse: collapse;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        .centered-gridview th {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: left;
        }

        .centered-gridview td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .centered-gridview tr:last-child td {
            border-bottom: none;
        }

        .centered-gridview tr:hover {
            background-color: #f5f5f5;
        }

        .centered-gridview button {
            background-color: #333;
            color: #fff;
            border: none;
            padding: 8px 12px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .centered-gridview button:hover {
            background-color: #555;
        }

        h1, h2 {
            text-align: center;
            color: #333;
            margin-top: 30px;
        }
    </style>
</head>

<body>
    <form runat="server">
        <div class="main-content">
            <h1>Manage Tutors</h1>
            <div class="gridview-container">
                <h2>Existing Tutors</h2>
                <asp:GridView ID="GridViewExistingTutors" runat="server" AutoGenerateColumns="False" OnRowCommand="GridViewExistingTutors_RowCommand" CssClass="centered-gridview">
                    <Columns>
                        <asp:TemplateField HeaderText="Tutor Name">
                            <ItemTemplate>
                                <asp:Label ID="lblTutorName" runat="server" Text='<%# Bind("fname") + " " + Bind("lname") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="UserID" HeaderText="Tutor ID" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnRemove" runat="server" Text="Remove" CommandName="Remove" CommandArgument='<%# Bind("UserID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <h2>New Tutors Awaiting Approval</h2>
                <asp:GridView ID="GridViewNewTutors" runat="server" AutoGenerateColumns="False" OnRowCommand="GridViewNewTutors_RowCommand" CssClass="centered-gridview">
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
    </form>
</body>

</html>