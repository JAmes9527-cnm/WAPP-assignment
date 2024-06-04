<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="ViewResult.aspx.cs" Inherits="WebApplication2.ViewResult" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
   <title>Quiz Result</title>
    <style>
        .form-container {
            padding: 20px;
            background-color: #f7f7f7;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .courses-highlight h3 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .grid-view-container {
            margin: 20px auto;
            width: 100%;
            max-height: 400px; /* Adjust the height as needed */
            overflow-y: auto;
        }

        .grid-view {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
            font-family: Arial, sans-serif;
            border: 1px solid #ddd;
        }

        .grid-view th, .grid-view td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .grid-view th {
            background-color: #4CAF50;
            color: white;
            position: sticky;
            top: 0;
            z-index: 1;
        }

        .grid-view tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .grid-view tr:hover {
            background-color: #f1f1f1;
        }

        .grid-view .edit-button, .grid-view .update-button, .grid-view .cancel-button {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 5px 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin: 2px 1px;
            cursor: pointer;
            border-radius: 4px;
        }

        .grid-view .cancel-button {
            background-color: #f44336; /* Red */
        }

        .grid-view .edit-button:hover, .grid-view .update-button:hover, .grid-view .cancel-button:hover {
            opacity: 0.8;
        }
        .auto-style1 {
            margin-top: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="form-container">
        <section class="courses-highlight">
            <h3>
                <asp:Label ID="Label13" runat="server" Font-Size="XX-Large" Text="Result Page"></asp:Label>
            </h3>
        </section>
        <div class="grid-view-container">
            <asp:GridView ID="GridView1" runat="server" CssClass="grid-view" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:TemplateField HeaderText="Actions" HeaderStyle-CssClass="actions-column" >
                        <ItemTemplate>
                            <asp:Button ID="EditButton" runat="server" Text="Edit" CommandName="Edit" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="UpdateButton" runat="server" Text="Update" CommandName="Update" />
                            <asp:Button ID="CancelButton" runat="server" Text="Cancel" CommandName="Cancel" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT * FROM [ResultTable]" 
            UpdateCommand="UPDATE [ResultTable] SET StudentID=@StudentID, CourseID=@Quiz, Q1=@Q1, StudentAnswer1=@StudentAnswer1, CorrectAnswer1=@CorrectAnswer1, Result1=@Result1, Q2=@Q2, StudentAnswer2=@StudentAnswer2, CorrectAnswer2=@CorrectAnswer2, Result2=@Result2, Q3=@Q3, StudentAnswer3=@StudentAnswer3, CorrectAnswer3=@CorrectAnswer3, Result3=@Result3, TotalResult=@TotalResult WHERE Id=@Id">
            <UpdateParameters>
                <asp:Parameter Name="Id" Type="Int32" />
                <asp:Parameter Name="StudentID" Type="String" />
                <asp:Parameter Name="Quiz" Type="String" />
                <asp:Parameter Name="Q1" Type="String" />
                <asp:Parameter Name="StudentAnswer1" Type="String" />
                <asp:Parameter Name="CorrectAnswer1" Type="String" />
                <asp:Parameter Name="Result1" Type="String" />
                <asp:Parameter Name="Q2" Type="String" />
                <asp:Parameter Name="StudentAnswer2" Type="String" />
                <asp:Parameter Name="CorrectAnswer2" Type="String" />
                <asp:Parameter Name="Result2" Type="String" />
                <asp:Parameter Name="Q3" Type="String" />
                <asp:Parameter Name="StudentAnswer3" Type="String" />
                <asp:Parameter Name="CorrectAnswer3" Type="String" />
                <asp:Parameter Name="Result3" Type="String" />
                <asp:Parameter Name="TotalResult" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <p class="auto-style2">
            <asp:Button ID="Next" runat="server" OnClick="Button3_Click" Text="Back" CssClass="back-button" />
        </p>
    </div>
</asp:Content>
