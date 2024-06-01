<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/masterPage.Master" CodeBehind="article.aspx.cs" Inherits="WebApplication2.article" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <title>Articles - Smart Money Mastery</title>
    <style>
       /* Articles Section */
.articles {
    padding: 80px 20px 20px;
}

    .articles .container {
        max-width: 900px;
        margin: 0 auto;
    }

    .articles h1 {
        text-align: center;
        margin-bottom: 20px;
        font-size: 32px;
        color: #2c3e50;
    }

    .articles .search-bar {
        display: flex;
        justify-content: center;
        margin-bottom: 20px;
    }

        .articles .search-bar input {
            width: 100%;
            max-width: 600px;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

    .articles .article-list {
        display: flex;
        flex-direction: column;
        gap: 20px;
    }

    .articles .article-item {
        background-color: #fff;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s;
    }

        .articles .article-item:hover {
            transform: translateY(-5px);
        }

        .articles .article-item h2 {
            color: #2c3e50;
            font-size: 24px;
            margin-bottom: 10px;
        }

        .articles .article-item p {
            color: #7f8c8d;
            font-size: 16px;
            line-height: 1.6;
        }

        .articles .article-item .read-more {
            color: #3498db;
            text-decoration: none;
            font-weight: 600;
        }

            .articles .article-item .read-more:hover {
                text-decoration: underline;
            }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
   <section class="articles">
            <div class="container">
                <h1>Our Latest Articles</h1>
                <div class="search-bar">
                    <input type="text" id="searchInput" placeholder="Search for articles..." oninput="debounceSearch()" />
                </div>
                <div class="article-list" id="articleList">
                    <div class="article-item">
                        <h2>Understanding Financial Freedom</h2>
                        <p>Financial freedom means having enough savings, investments, and cash on hand to afford the lifestyle we want for ourselves and our families...</p>
                        <a href="https://example.com/article1" class="read-more" target="_blank">Read more...</a>
                    </div>
                    <div class="article-item">
                        <h2>Investment Strategies for Beginners</h2>
                        <p>Investing can be intimidating for beginners, but with the right strategies and guidance, you can start building your portfolio with confidence...</p>
                        <a href="https://example.com/article2" class="read-more" target="_blank">Read more...</a>
                    </div>
                    <div class="article-item">
                        <h2>How to Manage Debt Effectively</h2>
                        <p>Debt management is crucial to achieving financial stability. Learn the best practices for managing and reducing debt in a structured way...</p>
                        <a href="https://example.com/article3" class="read-more" target="_blank">Read more...</a>
                    </div>
                    <div class="article-item">
                        <h2>The Importance of Budgeting</h2>
                        <p>Creating a budget is one of the most effective ways to manage your finances. It helps you track your spending, save money, and reach your financial goals...</p>
                        <a href="https://example.com/article4" class="read-more" target="_blank">Read more...</a>
                    </div>
                    <!-- Additional Articles -->
                    <div class="article-item">
                        <h2>Building a Solid Investment Portfolio</h2>
                        <p>Learn how to create a diversified investment portfolio that can help you achieve long-term financial goals and mitigate risks...</p>
                        <a href="https://example.com/article5" class="read-more" target="_blank">Read more...</a>
                    </div>
                    <div class="article-item">
                        <h2>Retirement Planning Tips</h2>
                        <p>Planning for retirement can be daunting, but with these tips, you can ensure a comfortable and financially secure retirement...</p>
                        <a href="https://example.com/article6" class="read-more" target="_blank">Read more...</a>
                    </div>
                </div>
                <div class="article-list" id="externalArticlesContainer">
                    <!-- External Articles will be appended here -->
                </div>
            </div>
        </section>

<!-- JavaScript -->
        <script>
            let debounceTimeout;

            function debounceSearch() {
                clearTimeout(debounceTimeout);
                debounceTimeout = setTimeout(searchArticles, 300); // Delay of 300ms
            }

            async function searchArticles() {
                const query = document.getElementById('searchInput').value.toLowerCase();

                // Local search
                const articles = document.querySelectorAll('.article-item');
                articles.forEach(article => {
                    const title = article.querySelector('h2').innerText.toLowerCase();
                    const description = article.querySelector('p').innerText.toLowerCase();
                    if (title.includes(query) || description.includes(query)) {
                        article.style.display = 'block';
                    } else {
                        article.style.display = 'none';
                    }
                });

                // Fetch articles from an external API
                if (query.length > 0) {
                    try {
                        const response = await fetch(`https://newsapi.org/v2/everything?q=${query}&apiKey=cb89ed164041409fb107770099be9cc0`);
                        if (!response.ok) {
                            throw new Error('Network response was not ok');
                        }
                        const data = await response.json();
                        displayExternalArticles(data.articles);
                    } catch (error) {
                        console.error('There was a problem with the fetch operation:', error);
                    }
                } else {
                    document.getElementById('externalArticlesContainer').innerHTML = ''; // Clear external articles if query is empty
                }
            }

            function displayExternalArticles(articles) {
                const container = document.getElementById('externalArticlesContainer');
                container.innerHTML = ''; // Clear previous results

                articles.forEach(article => {
                    const articleSection = document.createElement('div');
                    articleSection.className = 'article-item';
                    articleSection.innerHTML = `
            <h2>${article.title}</h2>
            <p>${article.description}</p>
            <p><a href="${article.url}" target="_blank" class="read-more">Read more...</a></p>
        `;
                    container.appendChild(articleSection);
                });
            }

            function toggleDropdown() {
                var dropdownContent = document.querySelector('.dropdown-content');
                dropdownContent.style.display = dropdownContent.style.display === 'block' ? 'none' : 'block';
            }

        </script>
</asp:Content>
