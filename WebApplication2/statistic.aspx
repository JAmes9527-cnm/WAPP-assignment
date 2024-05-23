<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="statistic.aspx.cs" Inherits="WebApplication2.statistic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div style="width: 50%;">
        <canvas id="myChart"></canvas>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var ctx = document.getElementById('myChart').getContext('2d');
            var studentCount = parseInt('<%= StudentCount %>');
            var tutorCount = parseInt('<%= TutorCount %>');

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
        });
    </script>
</asp:Content>
