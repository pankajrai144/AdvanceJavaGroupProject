<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JerseyPasal Football Jerseys</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/heaader.css">
</head>
<body>

<jsp:include page="/components/header.jsp"/>

<section class="section1">

    <div class="imgbg">
        <img src="images/landing.png" alt="Landing Page" class="img">
        <div class="overlay"></div>
    </div>

    <div class="info">

        <h2 class="infotitle">
            <span class="titlewhite">Where Legends</span><br>
            <span class="titlered">Wore Their</span><br>
            <span class="titlewhite">Colours.</span>
        </h2>

        <div class="subtags">
            <span class="subtag">Premium Jersey</span>
            <span class="subtag">World Cup Jersey</span>
            <span class="subtag">Player Grade</span>
        </div>

        <p class="infodesc">From Wembley roars to Champions League nights every stitch tells a story. Shop authentic, player-grade football jerseys from the clubs and eras that defined the beautiful game.</p>

        <a href="${pageContext.request.contextPath}/home" class="btn">Shop Now</a>

    </div>

    <div class="scroll">
        <span class="line"></span>
        <span>Scroll</span>
    </div>

</section>

<section class="section2">

    <div class="wrap">

        <div class="head">
            <p>Why JerseyPasal</p>
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
                <div class="number">4.9</div>
                <div class="title">Average Rating</div>
                <div class="desc">Thousands of verified reviews from real football fans.</div>
            </div>

        </div>

    </div>

</section>

<jsp:include page="/components/footer.jsp"/>

</body>
</html>
