<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="WebApplication2.feedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <title>Feedback</title>
    <link rel="stylesheet" href="feedbackdesign.css" />
    <style>
        .star-rating {
            display: flex;
            flex-direction: row-reverse;
            justify-content: center;
        }

        .star-rating input[type=radio] {
            display: none;
        }

        .star-rating label {
            font-size: 2em;
            color: #ddd;
            cursor: pointer;
            transition: color 0.2s;
        }

        .star-rating input[type=radio]:checked ~ label {
            color: #f7c508;
        }

        .star-rating label:hover,
        .star-rating label:hover ~ label {
            color: #f7c508;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="container">
            <h2>Feedback Form</h2>
            <asp:Label ID="lblName" runat="server" Text="Name:" AssociatedControlID="name"></asp:Label>
            <asp:TextBox ID="name" runat="server" CssClass="form-control"></asp:TextBox>
            
            <asp:Label ID="lblEmail" runat="server" Text="Email:" AssociatedControlID="email"></asp:Label>
            <asp:TextBox ID="email" runat="server" CssClass="form-control"></asp:TextBox>
            
            <asp:Label ID="lblRating" runat="server" Text="Rating:"></asp:Label>
            <div id="star-rating" class="star-rating">
                <asp:RadioButton ID="star5" runat="server" GroupName="rating" Text="5" CssClass="hidden" />
                <label for="star5" title="5 stars">★</label>
                <asp:RadioButton ID="star4" runat="server" GroupName="rating" Text="4" CssClass="hidden" />
                <label for="star4" title="4 stars">★</label>
                <asp:RadioButton ID="star3" runat="server" GroupName="rating" Text="3" CssClass="hidden" />
                <label for="star3" title="3 stars">★</label>
                <asp:RadioButton ID="star2" runat="server" GroupName="rating" Text="2" CssClass="hidden" />
                <label for="star2" title="2 stars">★</label>
                <asp:RadioButton ID="star1" runat="server" GroupName="rating" Text="1" CssClass="hidden" />
                <label for="star1" title="1 star">★</label>
            </div>
            
            <asp:Label ID="lblReview" runat="server" Text="Review:" AssociatedControlID="review"></asp:Label>
            <asp:TextBox ID="review" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control"></asp:TextBox>
            
            <asp:Button ID="submit" runat="server" Text="Submit" OnClick="submit_Click" CssClass="btn-submit" />
            <asp:Label ID="lblError" runat="server" Text="" CssClass="error"></asp:Label>
        </div>
    <script src="feedbackscript.js"></script>
</asp:Content>
