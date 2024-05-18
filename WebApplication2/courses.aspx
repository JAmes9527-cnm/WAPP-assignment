<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="courses.aspx.cs" Inherits="WebApplication2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">


header {
    background: #005691;
    color: white;
    padding: 10px 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: -webkit-sticky; /* Safari */
    position: sticky;
    top: 0;
}

    

nav ul {
    list-style: none;
    padding: 0;
}

    nav ul li {
        display: inline;
        margin-right: 10px;
    }

        nav ul li a {
            color: white;
            text-decoration: none;
        }

.button-container {
    display: flex;
    justify-content: flex-end; 
}

.login-btn, .signup-btn {
    padding: 5px 10px 0px 10px;
    background: #f8c146;
    border: 10px;
    border-radius: 5px;
    cursor: pointer;
}

.hero {
    background: #0077cc;
    color: white;
    padding: 20px;
    text-align: center;
}

.cta-btn {
    padding: 10px 20px;
    background: green;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.courses-highlight {
    background: white;
    padding: 20px;
}

    .courses-highlight .course {
        background: #eeeeee;
        padding: 10px;
        margin-bottom: 10px;
        display: flex;
        align-items: center;
    }

        footer {
    background: #333;
    color: white;
    text-align: center;
    padding: 10px;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
    <header>
        <div class="logo">
            <a href="home.aspx"><img src="/img/logo.png" style="height: 68px; width: 159px; margin-right: 1px" /></a>
        </div>
        <nav>
            <ul>
                <li><a href="home.aspx">Home</a></li>
                <li><a href="courses.aspx">Courses</a></li>
                <li><a href="forum.aspx">Forum</a></li>
                <li><a href="resources.aspx">Resources</a></li>
                <li><a href="about.aspx">About</a></li>
                <li><a href="contact.aspx">Contact Us</a></li>
                <li><div class="dropdown">
                    <button id="More_btn">More</button>
                    <div class="dropdown_content">
                        <a href="video.aspx">Video</a>
                        <a href="calculator.aspx">Calculator</a>
                    </div>
                    </div>

                </li>
            </ul>
        </nav>
        <div class="button-container">
            <asp:PlaceHolder ID="loginPlaceHolder" runat="server">
                <asp:Panel ID="loginPanel" runat="server">
                <button class="login-btn">Login</button>
                <button class="signup-btn">Sign Up</button>
                </asp:Panel>
            </asp:PlaceHolder>
        </div>
        
    </header>

    <section class="hero">
        <h2>Unlock Your Financial Potential</h2>
        <p>Join our community to explore courses and tools designed to empower your financial independence.</p>
        <button class="cta-btn">Get Started</button>
    </section>

    <section class="courses-highlight">
        <h3>Courses</h3>
        <div>
            <a href="course1.aspx">
                <asp:Label ID="course1" runat="server" Font-Bold="True" Font-Overline="False" Font-Size="Larger" ForeColor="Black" Text=" Smart Money Concept"></asp:Label>
            </a>
            <br />
                <asp:Label ID="Label1" runat="server" Font-Overline="False" ForeColor="Black" Text="Describe the concept of smart money"></asp:Label>
            <br />
            <br />
                <img src="placeholder.jpg" alt="Course Thumbnail"/> 
        </div>

        <!-- Repeat for other courses -->
        <h3>Courses</h3>
        <div>
            <a href="course2.aspx">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Overline="False" Font-Size="Larger" ForeColor="Black" Text=" Managed Your Money"></asp:Label>
            </a>
            <br />
                <asp:Label ID="Label3" runat="server" Font-Overline="False" ForeColor="Black" Text="Manage Your Money spend and Save"></asp:Label>
            <br />
            <br />
                <img src="placeholder.jpg" alt="Course Thumbnail"/> 
        </div>


        <h3>Courses</h3>
        <div>
            <a href="course3.aspx">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Overline="False" Font-Size="Larger" ForeColor="Black" Text=" Make Big Profit!"></asp:Label>
            </a>
            <br />
                <asp:Label ID="Label5" runat="server" Font-Overline="False" ForeColor="Black" Text="Use Your Money To Make Profit!"></asp:Label>
            <br />
            <br />
                <img src="placeholder.jpg" alt="Course Thumbnail"/> 
        </div>

    </section>

    <footer>
        <p>© 2024 Smart Money Mastery. All rights reserved.</p>
    </footer>
        </div>
    </form>
</body>
</html>
