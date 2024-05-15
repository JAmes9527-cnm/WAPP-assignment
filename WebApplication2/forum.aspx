<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forum.aspx.cs" Inherits="WebApplication2.forum" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forum</title>
    <link rel="stylesheet" href="forum.css" />
    <link rel="stylesheet" href="styles.css" />
    <style>.button {
  overflow: hidden;
  height: 100%; /* Make the button fill the height of its parent */
  width: 100%; /* Make the button fill the width of its parent */
  padding: 0 1rem; /* Adjust as needed */
  border-radius: 1.5rem;
  background: #3d3a4e;
  background-size: 400%;
  color: #fff;
  border: none;
  cursor: pointer;
}


.button:hover::before {
  transform: scaleX(1);
}

.button-content {
  position: relative;
  z-index: 1;
}

.button::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  transform: scaleX(0);
  transform-origin: 0 50%;
  width: 100%;
  height: inherit;
  border-radius: inherit;
  background: linear-gradient(
    82.3deg,
    rgba(150, 93, 233, 1) 10.8%,
    rgba(99, 88, 238, 1) 94.3%
  );
  transition: all 0.475s;


}
</style>
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
                <li><a href="courses.aspx">Courses</a></li>
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
        <form runat="server">
            <div class="post-form">
                <h2>Create a New Topic</h2>
                <asp:textbox runat="server" ID="title" placeholder="Title" /><br />
                <asp:textbox runat="server" ID="content" TextMode="MultiLine" placeholder="Your message" CssClass="content" Rows="5"></asp:textbox><br />
                <asp:Button runat="server" ID="postBtn" CssClass="post" Text="Post to forum" OnClick="postBtn_Click" />
            </div>
            <h2>Existing Topics</h2>
            <div class="topics" id="topics" runat="server"></div>
        </form>
    </section>

</body>
</html>
