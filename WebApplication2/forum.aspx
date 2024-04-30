<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forum.aspx.cs" Inherits="WebApplication2.forum" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forum</title>
    <link rel="stylesheet" href="forum.css" />
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
        <div>
            <header>
        <div class="logo">
            <h1>Smart Money Mastery</h1>
        </div>
        <nav>
            <ul>
                <li><a href="index.html">Home</a></li>
                <li><a href="courses.html">Courses</a></li>
                <li><a href="forum.html">Forum</a></li>
                <li><a href="resources.html">Resources</a></li>
                <li><a href="about.html">About</a></li>
                <li><a href="contact.html">Contact Us</a></li>
            </ul>
        </nav>
        <div class="button-container">
            <button class="login-btn">Login</button>
            <button class="signup-btn">Sign Up</button>
        </div>
    </header>
        </div>
    <section>
        <div class="post-form">
            <h2>Create a New Topic</h2>
            <form action="#" method="post">
                <input type="text" name="title" placeholder="Title"/><br/>
                <textarea name="content" placeholder="Your message" rows="5" ></textarea><br/>
                <input type="submit" value="Post Topic"/>
            </form>
        </div>
        <h2>Existing Topics</h2>
        <div class="topics">
            <!-- Existing topics will be displayed here -->
            <div class="topic">
                <h3>Sample Topic Title</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed et metus sit amet nibh luctus feugiat.</p>
                <p>Posted by: John Doe</p>
            </div>
            <div class="topic">
                <h3>Another Topic Title</h3>
                <p>Integer eget felis lectus. Quisque nec turpis nec neque lobortis tristique non quis tortor.</p>
                <p>Posted by: Jane Smith</p>
            </div>
        </div>
    </section>

</body>
</html>
