<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/masterPage.Master" CodeBehind="Contact.aspx.cs" Inherits="WebApplication2.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <title>Contact Us - Smart Money Mastery</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }

        .contact-info, .social-links, .map-link, .map-embed {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }

        .contact-info h2, .social-links h3, .map-link h3 {
            margin-top: 0;
        }

        .map-embed iframe {
            width: 100%;
            height: 400px;
            border: none;
            border-radius: 8px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="contact-info">
            <h2>Contact Us</h2>
            <p>If you have any questions, please contact us:</p>
            <p>Email: <a href="mailto:info@smartmoneymastery.com">info@smartmoneymastery.com</a></p>
            <p>Phone: <a href="tel:+6010-1111188">+6010-1111188</a></p>
        </div>
        <div class="social-links">
            <h3>Follow us on Facebook</h3>
            <p><a href="https://www.facebook.com/SmartMoneyMastery" target="_blank">Smart Money Mastery on Facebook</a></p>
        </div>
        <div class="map-link">
            <h3>Visit us</h3>
            <p>See our location on <a href="https://maps.google.com/?q=Your+Location+Address" target="_blank">Google Maps</a></p>
        </div>
        <div class="map-embed">
            <h3>Our Location</h3>
            <iframe 
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.885431709822!2d-122.08424968469299!3d37.42199977982588!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x808fb5a6e4a15b1f%3A0x23a4e3ec1a0ec8f2!2sGoogleplex!5e0!3m2!1sen!2sus!4v1629236934562!5m2!1sen!2sus" 
                allowfullscreen="" 
                loading="lazy">
            </iframe>
        </div>
</asp:Content>
