<%@ Page Title="Manage Students" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="manageStudents.aspx.cs" Inherits="WebApplication2.manageStudents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .table-container {
            padding: 20px;
        }
        .table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 18px;
            text-align: left;
        }
        .table th, .table td {
            padding: 12px 15px;
            border: 1px solid #ddd;
        }
        .table th {
            background-color: #f4f4f4;
        }
        .action-buttons {
            display: flex;
            gap: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="table-container">
        <h2>Manage Students</h2>
        <div style="margin-bottom: 20px;">
            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" Placeholder="Enter username or email"></asp:TextBox>
            <asp:DropDownList ID="ddlUserType" runat="server" CssClass="form-control" AutoPostBack="true">
                <asp:ListItem Value="" Text="All Users" />
                <asp:ListItem Value="member" Text="Students" />
                <asp:ListItem Value="tutor" Text="Tutors" />
            </asp:DropDownList>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="SearchUsers" CssClass="btn btn-primary" />
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UserID" CssClass="table" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="UserID" HeaderText="ID" ReadOnly="True" SortExpression="UserID" />
                <asp:BoundField DataField="fname" HeaderText="First Name" SortExpression="fname" />
                <asp:BoundField DataField="lname" HeaderText="Last Name" SortExpression="lname" />
                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
                <asp:BoundField DataField="RegisterDate" HeaderText="Registered Date" SortExpression="RegisterDate" DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="False" />
                <asp:BoundField DataField="usertype" HeaderText="User Type" SortExpression="usertype" />
                <asp:ImageField DataImageUrlField="imgUrl" ControlStyle-Width="100" HeaderText="Profile Image" NullDisplayText="No image available"/>
                <asp:TemplateField>
                    <HeaderTemplate>Actions</HeaderTemplate>
                    <ItemTemplate>
                        <div class="action-buttons">
                            <asp:LinkButton ID="ViewButton" runat="server" CommandName="View" CommandArgument='<%# Eval("UserID") %>' CssClass="btn btn-info">View</asp:LinkButton>
                            <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CommandArgument='<%# Eval("UserID") %>' CssClass="btn btn-danger">Delete</asp:LinkButton>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <div style="display: flex; justify-content: center; align-items: center; height: 400px;">
    <canvas id="myChart" style="max-width: 600px;"></canvas>
</div>
   <script>
       function initChart(studentCount, tutorCount) {
           var ctx = document.getElementById('myChart').getContext('2d');
           var myChart = new Chart(ctx, {
               type: 'pie', // or 'bar'
               data: {
                   labels: ['Students', 'Tutors'],
                   datasets: [{
                       label: '# of Users',
                       data: [studentCount, tutorCount],
                       backgroundColor: [
                           'rgba(75, 192, 192, 0.2)',
                           'rgba(153, 102, 255, 0.2)'
                       ],
                       borderColor: [
                           'rgba(75, 192, 192, 1)',
                           'rgba(153, 102, 255, 1)'
                       ],
                       borderWidth: 1
                   }]
               },
               options: {
                   responsive: true,
                   plugins: {
                       legend: {
                           position: 'top',
                       },
                       tooltip: {
                           callbacks: {
                               label: function (context) {
                                   var total = context.dataset.data.reduce(function (a, b) {
                                       return a + b;
                                   }, 0);
                                   var percentage = (context.raw / total * 100).toFixed(2) + '%';
                                   return context.label + ': ' + context.raw + ' (' + percentage + ')';
                               }
                           }
                       }
                   }
               }
           });
       }
   </script>

</asp:Content>
