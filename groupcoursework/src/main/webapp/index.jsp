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
    <section class="bigpicture-section">
        <div class="bigpicture-left">
            <p class="ghost-text">Man Utd</p>
            <img src="images/beckham.jpg" alt="Manchester United Home Jersey 2025" class="bigpicture-jersey-img">
            <div class="bigpicture-kit-label">
                <span class="kit-season">1998/99 Season</span>
                <span class="kit-name">Home Kit Jersey</span>
            </div>
            <div class="scroll-hint">
                <span class="scroll-line"></span>
                <span>Scroll</span>
            </div>
        </div>

        <div class="bigpicture-divider"></div>

        <div class="bigpicture-right">
            <p class="bigpicture-tag">Featured Jersey</p>
            <h1>Manchester<br>United FC</h1>
            <div class="stats-row">
                <div class="stat-item">
                    <p class="stat-value">1878</p>
                    <p class="stat-label">Club Founded</p>
                </div>
                <div class="stat-item">
                    <p class="stat-value">20x</p>
                    <p class="stat-label">League Titles</p>
                </div>
                <div class="stat-item">
                    <p class="stat-value">England</p>
                    <p class="stat-label">Country</p>
                </div>
                <div class="stat-item">
                    <p class="stat-value">3x</p>
                    <p class="stat-label">UCL Titles</p>
                </div>
            </div>
            <div class="info-divider"></div>
            <ul class="why-list">
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
            <div class="jersey-story">
                <p class="story-date">26 May 1999 — Champions League Final, Barcelona</p>
                <p>
                    This shirt was worn during the legendary Treble-winning season.
                    Beckham, Scholes, and Keane wore this exact kit as United came back
                    from behind to lift the trophy now you can own a piece of that history.
                </p>
            </div>
            <a href="#" class="btn-bigpicture">Shop This Jersey</a>
        </div>

    </section>

    <!-- TRUST / STATS SECTION -->
    <section class="trust-section">
        <div class="trust-inner">

            <div class="trust-heading">
                <p>Why KitKing</p>
                <h2>The World's Kit Store</h2>
            </div>

            <!-- Key numbers -->
            <div class="trust-grid">
                <div class="trust-card">
                     <i class="fa-solid fa-users trust-icon"></i>
                    <div class="trust-number">100K+</div>
                    <div class="trust-card-title">Customers Worldwide</div>
                    <div class="trust-card-desc">Fans across 60+ countries trust KitKing for their kits.</div>
                </div>
                <div class="trust-card">
                	<i class="fa-solid fa-shirt trust-icon"></i>
                    <div class="trust-number">1,000+</div>
                    <div class="trust-card-title">Jerseys in Stock</div>
                    <div class="trust-card-desc">The largest selection of club and international kits online.</div>
                </div>
                <div class="trust-card">
                	<i class="fa-solid fa-globe trust-icon"></i>
                    <div class="trust-number">32</div>
                    <div class="trust-card-title">World Cup Nations</div>
                    <div class="trust-card-desc">Every team from the tournament, all in one place.</div>
                </div>
                <div class="trust-card">
                	<i class="fa-solid fa-star trust-icon"></i>
                    <div class="trust-number">4.9★</div>
                    <div class="trust-card-title">Average Rating</div>
                    <div class="trust-card-desc">Thousands of verified reviews from real football fans.</div>
                </div>
            </div>
            <div class="trust-categories">
                <div class="cat-strip">
                    <div class="cat-strip-text">
                        <strong>World Cup Jerseys</strong>
                        <span>All 32 nations. Home, away, and third kits ready to ship.</span>
                    </div>
                </div>
                <div class="cat-strip">
                    <div class="cat-strip-text">
                        <strong>Player Worn</strong>
                        <span>Match-issued kits worn by professionals on the biggest stages.</span>
                    </div>
                </div>
                <div class="cat-strip">
                    <div class="cat-strip-text">
                        <strong>Retro Jerseys</strong>
                        <span>Iconic kits from the 80s, 90s, and 00s the classics never die.</span>
                    </div>
                </div>
            </div>

        </div>
    </section>

    <%@ include file="components/footer.jsp" %>

</body>
</html>