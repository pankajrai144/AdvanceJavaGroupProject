<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JerseyPasal Football Jerseys</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/header.css">
	<link rel="stylesheet" href="css/footer.css">
</head>
<body>

<%@ include file="components/header.jsp" %>

<section class="section1">

    <div class="left">
        <p class="textbg">Man Utd</p>

        <img src="images/beckham.jpg" alt="Manchester United Home Jersey 2025" class="img">

        <div class="info">
            <span class="season">1998/99 Season</span>
            <span class="name">Home Kit Jersey</span>
        </div>

        <div class="scroll">
            <span class="line"></span>
            <span>Scroll</span>
        </div>
    </div>

    <div class="divider"></div>

    <div class="right">
        <p class="tag">Featured Jersey</p>

        <h1>Manchester<br>United FC</h1>

        <div class="stats">
            <div class="item">
                <p class="value">1878</p>
                <p class="label">Club Founded</p>
            </div>
            <div class="item">
                <p class="value">20x</p>
                <p class="label">League Titles</p>
            </div>
            <div class="item">
                <p class="value">England</p>
                <p class="label">Country</p>
            </div>
            <div class="item">
                <p class="value">3x</p>
                <p class="label">UCL Titles</p>
            </div>
        </div>

        <div class="line2"></div>

        <ul class="list">
            <li>
                <div>
                    <strong>Premium Quality</strong>
                    <span>Official grade fabric breathable, durable, match-ready.</span>
                </div>
            </li>
            <li>
                <div>
                    <strong>Player Worn Jerseys</strong>
                    <span>Authentic kits worn by your favourite players on the pitch.</span>
                </div>
            </li>
            <li>
                <div>
                    <strong>Legendary Retro Kits</strong>
                    <span>Relive the classics iconic jerseys from historic seasons.</span>
                </div>
            </li>
        </ul>

        <div class="story">
            <p class="date">26 May 1999 — Champions League Final, Barcelona</p>
            <p>
                This shirt was worn during the legendary Treble-winning season.
                Beckham, Scholes, and Keane wore this exact kit as United came back
                from behind to lift the trophy now you can own a piece of that history.
            </p>
        </div>

        <a href="#" class="btn">Shop This Jersey</a>
    </div>

</section>

<section class="section2">

    <div class="wrap">

        <div class="head">
            <p>Why KitKing</p>
            <h2>The World's Kit Store</h2>
        </div>

        <div class="grid">

            <div class="card">
                <i class="fa-solid fa-users icon"></i>
                <div class="number">100K+</div>
                <div class="title">Customers Worldwide</div>
                <div class="desc">Fans across 60+ countries trust KitKing for their kits.</div>
            </div>

            <div class="card">
                <i class="fa-solid fa-shirt icon"></i>
                <div class="number">1,000+</div>
                <div class="title">Jerseys in Stock</div>
                <div class="desc">The largest selection of club and international kits online.</div>
            </div>

            <div class="card">
                <i class="fa-solid fa-globe icon"></i>
                <div class="number">32</div>
                <div class="title">World Cup Nations</div>
                <div class="desc">Every team from the tournament, all in one place.</div>
            </div>

            <div class="card">
                <i class="fa-solid fa-star icon"></i>
                <div class="number">4.9★</div>
                <div class="title">Average Rating</div>
                <div class="desc">Thousands of verified reviews from real football fans.</div>
            </div>

        </div>

    </div>

</section>

<%@ include file="components/footer.jsp" %>

</body>
</html>
