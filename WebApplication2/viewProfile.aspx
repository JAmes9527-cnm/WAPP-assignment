<%@ Page Title="View Profile" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="viewProfile.aspx.cs" Inherits="WebApplication2.viewProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <style>
        .profile-container {
            max-width: 600px;
            width:100%;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }
        .profile-heading {
            margin-bottom: 20px;
            text-align: center;
        }
        .profile-image {
            display: block;
            margin: auto;
            border-radius: 50%;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        }
       .details-view-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            font-size: 16px;
            text-align: left;
        }
        .details-view-table th, .details-view-table td {
            padding: 12px 15px;
            border: 1px solid #ddd;
        }
        .details-view-table th {
            background-color: #f4f4f4;
            font-weight: bold;
        }
        .details-view-table td {
            background-color: #fff;
        }
        .details-view-table thead th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }
        .details-view-table tbody tr:first-child {
            background-color: #f9f9f9;
        }
        .profile-info {
            padding: 10px;
            margin-bottom: 10px;
        }
        .profile-info label {
            font-weight: bold;
            margin-right: 5px;
        }
        .profile-info .detail {
            margin-left: 10px;
        }


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="profile-container">
        <h2 class="profile-heading">User Profile</h2>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="UserID" CssClass="details-view-table">
    <Fields>
        <asp:BoundField DataField="fname" HeaderText="First Name" ItemStyle-CssClass="profile-info" />
        <asp:BoundField DataField="lname" HeaderText="Last Name" ItemStyle-CssClass="profile-info" />
        <asp:BoundField DataField="gender" HeaderText="Gender" ItemStyle-CssClass="profile-info" />
        <asp:BoundField DataField="email" HeaderText="Email" ItemStyle-CssClass="profile-info" />
        <asp:BoundField DataField="username" HeaderText="Username" ItemStyle-CssClass="profile-info" />
        <asp:BoundField DataField="RegisterDate" HeaderText="Register Date" DataFormatString="{0:MM/dd/yyyy}" ItemStyle-CssClass="profile-info" />
        <asp:BoundField DataField="usertype" HeaderText="User Type" ItemStyle-CssClass="profile-info" />
        <asp:ImageField DataImageUrlField="imgUrl" HeaderText="Profile Image"  ControlStyle-Height="100px" />
    </Fields>
    <RowStyle CssClass="profile-info" />
    <FieldHeaderStyle CssClass="profile-info" />
</asp:DetailsView>

    </div>
</asp:Content>
