<%@ Page Title="User Profile" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="WebApplication2.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <style>
        .profile-container {
            width: 50%;
            margin: 0 auto;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 5px;
        }
        .profile-container h2 {
            text-align: center;
        }
        .profile-container .profile-field {
            margin-bottom: 10px;
        }
        .profile-container .profile-label {
            font-weight: bold;
        }
        .circular-img-containe {
            width: 20vw; /* 30% of the viewport width */
            height: 20vw; /* 30% of the viewport height */
            max-width: 200px; /* Maximum size limit */
            max-height: 200px; /* Maximum size limit */
            overflow: hidden;
            border-radius: 50%;
            margin: 0 auto 20px;
        }
        .cropped-image {
            width: 100%;
            height: auto;
            object-fit: cover;
            object-position: center;
        }
         .center {
            display: flex;
            justify-content: center;
            margin-top: 20px; /* Add some margin-top for spacing */
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="profile-container">
        <div class="circular-img-containe">
            <asp:Image id="imgProfile" CssClass="cropped-image" runat="server" alt="Profile Picture" />
        </div>
        <h2>User Profile</h2>
        <div class="profile-field">
            <span class="profile-label">First Name:</span>
            <asp:Label ID="lblFirstName" runat="server" Text=""></asp:Label>
        </div>
        <div class="profile-field">
            <span class="profile-label">Last Name:</span>
            <asp:Label ID="lblLastName" runat="server" Text=""></asp:Label>
        </div>
        <div class="profile-field">
            <span class="profile-label">Gender:</span>
            <asp:Label ID="lblGender" runat="server" Text=""></asp:Label>
        </div>
        <div class="profile-field">
            <span class="profile-label">Email:</span>
            <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
        </div>
        <div class="profile-field">
            <span class="profile-label">Username:</span>
            <asp:Label ID="lblUsername" runat="server" Text=""></asp:Label>
        </div>
        <div class="profile-field">
            <span class="profile-label">Register Date:</span>
            <asp:Label ID="lblRegisterDate" runat="server" Text=""></asp:Label>
        </div>
        <div class="profile-field">
            <span class="profile-label">User Type:</span>
            <asp:Label ID="lblUserType" runat="server" Text=""></asp:Label>
        </div>
        <div class="profile-field">
            <span class="profile-label">Verified:</span>
            <asp:Label ID="lblVerified" runat="server" Text=""></asp:Label>
        </div>
        <div class="center">
            <asp:Button ID="editProfile" Text="Edit Profile" CssClass="button1" runat="server" OnClick="editProfile_Click" />
        </div>
    </div>
</asp:Content>
