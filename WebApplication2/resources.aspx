<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="resources.aspx.cs" Inherits="WebApplication2.resources" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <title>Resources</title>
    <link rel="stylesheet" href="masterdesign.css" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style>
        .resource-section {
            margin: 20px;
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 8px;
        }
        .resource-section h2 {
            color: #2c3e50;
            margin-bottom: 10px;
        }
        .resource-section ul {
            list-style: none;
            padding: 0;
        }
        .resource-section li {
            margin-bottom: 10px;
            display: flex;
            align-items: center;
        }
        .resource-section img {
            max-width: 50px;
            margin-right: 15px;
            border-radius: 4px;
        }
        .resource-section a {
            color: #2980b9;
            text-decoration: none;
            font-weight: 500;
        }
        .resource-section a:hover {
            text-decoration: underline;
        }
       .video-item {
            margin-bottom: 20px;
            padding: 15px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .video-item h3 {
            margin-bottom: 5px;
            color: #2c3e50;
        }
        .video-item iframe {
            width: 100%;
            max-width: 712px;
            height: 402px;
            border: none;
            border-radius: 8px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="resource-section">
        <h2>Recommended Books</h2>
        <ul>
            <li>
                <img src="https://d26olvxuieoyaa.cloudfront.net/catalog/product/cache/1/small_image/1000x1000/9df78eab33525d08d6e5fb8d27136e95/9/7/9780060555665_1.jpg" alt="The Intelligent Investor">
                <a href="https://www.amazon.com/gp/product/B000WJVK26" target="_blank">"The Intelligent Investor" by Benjamin Graham</a>
            </li>
            <li>
                <img src="https://images-na.ssl-images-amazon.com/images/I/81bsw6fnUiL.jpg" alt="Rich Dad Poor Dad">
                <a href="https://www.amazon.com/gp/product/B07C7M8SX9" target="_blank">"Rich Dad Poor Dad" by Robert Kiyosaki</a>
            </li>
            <li>
                <img src="https://cdn.kobo.com/book-images/ec5d491a-a384-41e7-835d-3a5b0235caa8/1200/1200/False/the-total-money-makeover-classic-edition.jpg" alt="The Total Money Makeover">
                <a href="https://www.amazon.com/gp/product/B078J1863S" target="_blank">"The Total Money Makeover" by Dave Ramsey</a>
            </li>
            <li>
                <img src="https://m.media-amazon.com/images/I/71-byw29G4L._AC_UF1000,1000_QL80_.jpg" alt="Principles: Life and Work">
                <a href="https://www.amazon.com/gp/product/B01N4ND1D8" target="_blank">"Principles: Life and Work" by Ray Dalio</a>
            </li>
            <li>
                <img src="https://cdn.kobo.com/book-images/9af249d8-9aa4-4c1c-b535-12fade8dcb2d/1200/1200/False/the-millionaire-next-door-3.jpg" alt="The Millionaire Next Door">
                <a href="https://www.amazon.com/gp/product/B00HXYAV6I" target="_blank">"The Millionaire Next Door" by Thomas J. Stanley</a>
            </li>
        </ul>
    </div>
    <div class="resource-section">
        <h2>Inspirational Videos</h2>
        <div class="video-item">
            <h3>The Basics of Investing</h3>
            <iframe width="712" height="402" src="https://www.youtube.com/embed/qIw-yFC-HNU" title="The Basics of Investing (Stocks, Bonds, Mutual Funds, and Types of Interest)" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>
        <div class="video-item">
            <h3>How The Stock Market Works</h3>
            <iframe width="712" height="402" src="https://www.youtube.com/embed/p7HKvqRI_Bo" title="How does the stock market work? - Oliver Elfenbaum" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>
        <div class="video-item">
            <h3>7 Steps to Financial Freedom</h3>
            <iframe width="712" height="402" src="https://www.youtube.com/embed/oM_qBYEY80g" title="7 Steps to Achieve Financial Freedom | Brian Tracy" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>
        <div class="video-item">
            <h3>The Power of Compound Interest</h3>
            <iframe width="712" height="402" src="https://www.youtube.com/embed/wBcGTc4MPG0" title="Power of compound interest - Warren Buffett explains" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>
        <div class="video-item">
            <h3>The Psychology of Money</h3>
           <iframe width="712" height="402" src="https://www.youtube.com/embed/TJDcGv9OH4Q" title="THE PSYCHOLOGY OF MONEY (BY MORGAN HOUSEL)" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>
    </div>
    <div class="resource-section">
        <h2>Useful Websites</h2>
        <ul>
            <li>
                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Investopedia_Logo.svg/1280px-Investopedia_Logo.svg.png" alt="Investopedia" style="max-width: 100px;">
                <a href="https://www.investopedia.com" target="_blank">Investopedia</a>
            </li>
            <li>
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRs-Niq3tezDR1agHYNep-tDLCYmQiISmw2Vg&s" alt="NerdWallet" style="max-width: 100px;">
                <a href="https://www.nerdwallet.com" target="_blank">NerdWallet</a>
            </li>
            <li>
                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Morningstar_Logo.svg/2560px-Morningstar_Logo.svg.png" alt="Morningstar" style="max-width: 100px;">
                <a href="https://www.morningstar.com" target="_blank">Morningstar</a>
            </li>
            <li>
                <img src="https://mw3.wsj.net/mw5/content/logos/mw_logo_social.png" alt="MarketWatch" style="max-width: 100px;">
                <a href="https://www.marketwatch.com" target="_blank">MarketWatch</a>
            </li>
            <li>
                <img src="https://upload.wikimedia.org/wikipedia/commons/d/db/CNBC_2023.svg" alt="CNBC Personal Finance" style="max-width: 100px;">
                <a href="https://www.cnbc.com/personal-finance/" target="_blank">CNBC Personal Finance</a>
            </li>
        </ul>
    </div>
    <div class="resource-section">
        <h2>Financial Tools</h2>
        <ul>
            <li>
                <img src="https://i.pcmag.com/imagery/reviews/05OMSsUmroXJ6F6sETKpH9R-43..v1630353377.jpg" alt="Mint" style="max-width: 100px;">
                <a href="https://www.mint.com" target="_blank">Mint: Budget Tracker & Planner</a>
            </li>
            <li>
                <img src="https://www.wallstreetsurvivor.com/wp-content/uploads/2022/02/Personal-Capital-Logo.png" alt="Personal Capital" style="max-width: 100px;">
                <a href="https://www.personalcapital.com" target="_blank">Personal Capital: Financial Dashboard</a>
            </li>
            <li>
                <img src="https://asset.brandfetch.io/idxES0beo5/idn3ICd7Gn.png" alt="You Need A Budget (YNAB)" style="max-width: 100px;">
                <a href="https://www.youneedabudget.com" target="_blank">You Need A Budget (YNAB)</a>
            </li>
            <li>
                <img src="https://1000logos.net/wp-content/uploads/2021/05/Robinhood-logo.png" alt="Robinhood" style="max-width: 100px;">
                <a href="https://www.robinhood.com" target="_blank">Robinhood: Commission-Free Investing</a>
            </li>
            <li>
                <img src="https://logowik.com/content/uploads/images/acorns3539.jpg" alt="Acorns" style="max-width: 100px;">
                <a href="https://www.acorns.com" target="_blank">Acorns: Invest Spare Change</a>
            </li>
        </ul>
    </div>
</asp:Content>
