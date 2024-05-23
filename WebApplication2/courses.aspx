<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="WebApplication2.newCourses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <title>Courses</title>
    <style>
        body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
}

.courses {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    padding: 20px;
    justify-content: center;
    margin: 0 auto; /* Center the container */
}

.course {
    background-color: #ffffff;
    border: 1px solid #dddddd;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    width: calc(30% - 26.67px); /* Adjust width for responsiveness and gap */
    margin: 10px; /* Adjust margin for responsiveness and gap */
    display: flex;
    flex-direction: column;
    transition: transform 0.3s ease;
}

.course:hover {
    transform: translateY(-5px);
}

.thumbnail {
    max-width: 100%; /* Set maximum width for the thumbnail */
    max-height: 200px; /* Set maximum height for the thumbnail */
    overflow: hidden;
}

.thumbnail img {
    width: auto;
    height: auto;
    max-width: 100%; /* Ensure the image doesn't exceed the thumbnail's width */
    max-height: 100%; /* Ensure the image doesn't exceed the thumbnail's height */
    display: block;
    margin: auto; /* Center the image horizontally */
}


.details {
    padding: 15px;
    display: flex;
    flex-direction: column;
    flex-grow: 1;
}

.details h3 {
    margin: 0 0 10px 0;
    font-size: 1.5em;
    color: #333333;
}

.details p {
    margin: 10px 0;
    color: #666666;
    flex-grow: 1;
}

.viewCourseButton {
    background-color: #007bff;
    border: none;
    border-radius: 4px;
    color: #ffffff;
    padding: 10px;
    text-align: center;
    text-decoration: none;
    font-size: 14px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    align-self: center;
    margin-top: auto;
}

.viewCourseButton:hover {
    background-color: #0056b3;
}

.details p i {
    font-size: 0.9em;
    color: #999999;
}



    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <h1>Courses</h1>
    <div id="courses" class="courses" runat="server">
    </div>
</asp:Content>
