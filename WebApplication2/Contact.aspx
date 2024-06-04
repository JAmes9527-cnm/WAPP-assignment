<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/masterPage.Master" CodeBehind="Contact.aspx.cs" Inherits="WebApplication2.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
<title>Contact Us - Smart Money Mastery</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }

        .contact-info, .social-links, .map-link, .map-embed, .contact-form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }

        .contact-info h2, .social-links h3, .map-link h3, .contact-form h3 {
            margin-top: 0;
        }

        .map-embed iframe {
            width: 100%;
            height: 400px;
            border: none;
            border-radius: 8px;
        }

        .contact-form label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        .contact-form input, .contact-form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .contact-form button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }

        .contact-form button:hover {
            background-color: #45a049;
        }
    </style>
    <script type="text/javascript">
        function validateForm() {
            var name = document.getElementById('<%= txtName.ClientID %>').value;
            var email = document.getElementById('<%= txtEmail.ClientID %>').value;
            var message = document.getElementById('<%= txtMessage.ClientID %>').value;

            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            if (name === "" || email === "" || message === "") {
                alert("Please ensure all required fields are completed before submitting the form.");
                return false;
            }

            if (!emailPattern.test(email)) {
                alert("Please enter a valid email address in the correct format (e.g., user@example.com).");
                return false;
            }

            return true;
        }
    </script>
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
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3984.14662745759!2d101.6979864752936!3d3.055405696920368!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31cc4abb795025d9%3A0x1c37182a714ba968!2sAsia%20Pacific%20University%20of%20Technology%20%26%20Innovation%20(APU)!5e0!3m2!1sen!2smy!4v1717430118639!5m2!1sen!2smy" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
        <div class="contact-form">
            <h3>Contact Form</h3>
            <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
            <label for="txtName">Name:</label>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>

            <label for="txtEmail">Email:</label>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>

            <label for="txtMessage">Message:</label>
            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>

            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClientClick="return validateForm();" OnClick="btnSubmit_Click" />
        </div>
</asp:Content>
