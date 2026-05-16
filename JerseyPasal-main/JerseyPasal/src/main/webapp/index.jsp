<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Jersey Pasal Nepal's Number One Jersey Store</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Barlow+Condensed:wght@400;600;700;800;900&family=Barlow:wght@300;400;500&display=swap"
rel="stylesheet">

<link rel="stylesheet"
href="${pageContext.request.contextPath}/css/style.css">

<link rel="stylesheet"
href="${pageContext.request.contextPath}/css/footer.css">

<link rel="stylesheet"
href="${pageContext.request.contextPath}/css/heaader.css">

</head>

<body>

<%@ include file="components/header.jsp" %>

<section class="hero">

    <div class="badge">

        <span class="badge-dot"></span>

        Nepal's Ultimate Football Jersey Destination

    </div>

    <img class="hero-img"
         src="${pageContext.request.contextPath}/images/landingPage.jpg"
         alt="Jersey Pasal Banner">

    <div class="content">

        <h1 class="headline">

            Own

            <em>The</em>

            Passion

        </h1>

        <p class="sub-headline">

            Premium · Authentic · Worldwide Clubs

        </p>

        <div class="divider"></div>

        <p class="body-copy">

            Discover authentic football jerseys from the world's biggest clubs and leagues
            from Premier League giants to legendary European teams.
            Jersey Pasal delivers premium fanwear across all 77 districts of Nepal with
            trusted quality, fast delivery, and unmatched passion for the game.

        </p>

        <div class="feature-tags">

            <span>
                <i class="fas fa-check-circle"></i>
                Official Quality
            </span>

            <span>
                <i class="fas fa-shipping-fast"></i>
                Fast Delivery
            </span>

            <span>
                <i class="fas fa-futbol"></i>
                Latest Club Kits
            </span>

        </div>

    </div>

    <div class="stats">

        <div class="stat-item">

            <span class="stat-num">

                500<i class="fa-solid fa-plus"></i>

            </span>

            <span class="stat-label">

                Jerseys In Stock

            </span>

        </div>

        <div class="stat-item">

            <span class="stat-num">

                77

            </span>

            <span class="stat-label">

                Districts Delivered

            </span>

        </div>

        <div class="stat-item">

            <span class="stat-num">

                10K<i class="fa-solid fa-plus"></i>

            </span>

            <span class="stat-label">

                Happy Fans

            </span>

        </div>

    </div>

</section>

<%@include file="components/footer.jsp" %>

</body>

</html>