<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="addCourses.aspx.cs" Inherits="WebApplication2.addCourses" %>


<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <h2>Add New Course</h2>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" />
    <asp:Panel ID="Panel1" runat="server">
        <asp:Label ID="lblName" runat="server" Text="Course Name:" AssociatedControlID="txtName"></asp:Label>
        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Course name is required." CssClass="text-danger" />

        <asp:Label ID="lblDescription" runat="server" Text="Description:" AssociatedControlID="txtDescription"></asp:Label>
        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" />

        <asp:Label ID="lblThumbnailUrl" runat="server" Text="Thumbnail URL:" AssociatedControlID="txtThumbnailUrl"></asp:Label>
        <asp:Label ID="txtThumbnailUrl" runat="server"  Visible="False" >/img/courseThumbnail/defaultCourse.png</asp:Label>
        <br />
        <asp:Image ID="Image1" runat="server" Height="130px" ImageUrl="~/img/courseThumbnail/defaultCourse.png" Width="130px" />
        <br />
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <br />

        <asp:Label ID="lblTitle1" runat="server" Text="Title 1:" AssociatedControlID="txtTitle1"></asp:Label>
        <asp:TextBox ID="txtTitle1" runat="server" CssClass="form-control" />
        <asp:RequiredFieldValidator ID="rfvTitle1" runat="server" ControlToValidate="txtTitle1" ErrorMessage="Title 1 is required." CssClass="text-danger" />

        <asp:Label ID="lblContent1" runat="server" Text="Content 1:" AssociatedControlID="txtContent1"></asp:Label>
        <asp:TextBox ID="txtContent1" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" />
        <asp:RequiredFieldValidator ID="rfvContent1" runat="server" ControlToValidate="txtContent1" ErrorMessage="Content 1 is required." CssClass="text-danger" />

        <asp:Label ID="lblTitle2" runat="server" Text="Title 2:" AssociatedControlID="txtTitle2"></asp:Label>
        <asp:TextBox ID="txtTitle2" runat="server" CssClass="form-control" />

        <asp:Label ID="lblContent2" runat="server" Text="Content 2:" AssociatedControlID="txtContent2"></asp:Label>
        <asp:TextBox ID="txtContent2" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" />

        <asp:Label ID="lblTitle3" runat="server" Text="Title 3:" AssociatedControlID="txtTitle3"></asp:Label>
        <asp:TextBox ID="txtTitle3" runat="server" CssClass="form-control" />

        <asp:Label ID="lblContent3" runat="server" Text="Content 3:" AssociatedControlID="txtContent3"></asp:Label>
        <asp:TextBox ID="txtContent3" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" />

        <asp:Label ID="lblTitle4" runat="server" Text="Title 4:" AssociatedControlID="txtTitle4"></asp:Label>
        <asp:TextBox ID="txtTitle4" runat="server" CssClass="form-control" />

        <asp:Label ID="lblContent4" runat="server" Text="Content 4:" AssociatedControlID="txtContent4"></asp:Label>
        <asp:TextBox ID="txtContent4" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" />

        <asp:Button ID="btnSubmit" runat="server" Text="Add Course" OnClick="btnSubmit_Click" CssClass="btn btn-primary mt-3" />
        <asp:Label ID="lblMessage" runat="server" Text="[errMsg]" Visible="false" AssociatedControlID="txtContent4"></asp:Label>
    </asp:Panel>
</asp:Content>
