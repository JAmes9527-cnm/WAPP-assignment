<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="viewCourse.aspx.cs" Inherits="WebApplication2.viewCourse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <style>
        .course-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .course-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .course-thumbnail {
            text-align: center;
            margin-bottom: 20px;
        }

        .course-thumbnail img {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
        }

        .course-section {
            margin-bottom: 20px;
        }

        .course-section h3 {
            margin-bottom: 10px;
            color: #333;
        }

        .course-section p {
            margin-bottom: 10px;
            color: #555;
        }

        .course-meta {
            text-align: center;
            margin-top: 20px;
            color: #888;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script>function showErrorMessage() {
            Swal.fire({
                icon: 'error',
                title: 'Only the creator of the course can edit!',
                text: 'Create your course to add or edit quiz!',
                confirmButtonColor: '#1970ae',
                confirmButtonText: 'Continue'
            });
        }</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="course-container">
        <div class="course-header">
            <h2><asp:Label ID="lblName" runat="server" Text=""></asp:Label></h2>
        </div>
        <div class="course-thumbnail">
            <asp:Image ID="imgThumbnail" runat="server" />
        </div>
        <div class="course-section">
            <p><asp:Label ID="lblDescription" runat="server" Text=""></asp:Label></p>
        </div>
        <div class="course-section">
            <h3><asp:Label ID="lblTitle1" runat="server" Text=""></asp:Label></h3>
            <p><asp:Label ID="lblContent1" runat="server" Text=""></asp:Label></p>
        </div>
        <div class="course-section">
            <h3><asp:Label ID="lblTitle2" runat="server" Text=""></asp:Label></h3>
            <p><asp:Label ID="lblContent2" runat="server" Text=""></asp:Label></p>
        </div>
        <div class="course-section">
            <h3><asp:Label ID="lblTitle3" runat="server" Text=""></asp:Label></h3>
            <p><asp:Label ID="lblContent3" runat="server" Text=""></asp:Label></p>
        </div>
        <div class="course-section">
            <h3><asp:Label ID="lblTitle4" runat="server" Text=""></asp:Label></h3>
            <p><asp:Label ID="lblContent4" runat="server" Text=""></asp:Label></p>
        </div>
        <div class="course-meta">
            <p><asp:Label ID="lblCreatedBy" runat="server" Text=""></asp:Label></p>
            <p><asp:Label ID="lblCreatedAt" runat="server" Text=""></asp:Label></p>
        </div>
        <asp:PlaceHolder ID="quiz_buttons" Visible="false" runat="server">
        <asp:Button ID="AttemptQuizBtn" Text="Attemp quiz" OnClick="AttemptQuizBtn_Click" CssClass="btn" runat="server" Visible="false" />
        <asp:Button ID="EditQuizBtn" runat="server" OnClick="EditQuizBtn_Click" CssClass="btn" Visible="false" />
            <asp:Button ID="CheckResult" Text="Check Result" runat="server" CssClass="btn"  OnClick="CheckResult_Click" Visible="true" />
    </asp:PlaceHolder>
    </div>
    
</asp:Content>
