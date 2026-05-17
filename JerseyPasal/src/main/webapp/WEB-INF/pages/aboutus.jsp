<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About Us JerseyPasal</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/heaader.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/aboutus.css">
</head>
<body>

<jsp:include page="/components/header.jsp"/>

<section class="au-hero-section">
    <img src="${pageContext.request.contextPath}/images/aboutus.jpg" alt="About Jersey Pasal" class="au-hero-image">

    <div class="au-hero-content">
        <a href="${pageContext.request.contextPath}/product" class="au-shop-btn">
            Shop Now
            <i class="fa-solid fa-arrow-up-right-from-square"></i>
        </a>

        <p class="au-hero-label">Nepal's Number One Jersey Store</p>
        <h1>
            The Home of <span>Authentic</span><br>
            <span class="au-white-line">Jerseys in Nepal</span>
        </h1>

        <p class="au-hero-text">
            From the biggest leagues to your doorstep we deliver passion, identity, and<br>
            pride to fans across all 77 districts.
        </p>
    </div>
</section>

<section class="au-story-section">
    <div class="au-story-wrapper">
        <div class="au-story-text">
            <p class="au-small-title">How We Started</p>
            <h2>Born Out of a<br>Simple Frustration</h2>
            <p>
                Finding authentic, high-quality jerseys in Nepal was nearly impossible.
                In 2020, we set out to change that. Today we are Nepal's trusted destination
                for football, basketball, cricket, and esports jerseys from clubs and national
                teams around the world.
            </p>
        </div>

        <div class="au-stats-grid">
            <div class="au-stat-card">
                <h3>5,000<span>+</span></h3>
                <p>Happy Customers</p>
            </div>

            <div class="au-stat-card">
                <h3>200<span>+</span></h3>
                <p>Jersey Styles</p>
            </div>

            <div class="au-stat-card">
                <h3>77</h3>
                <p>District Delivered</p>
            </div>

            <div class="au-stat-card">
                <h3>4<span>+ Yrs</span></h3>
                <p>In Business</p>
            </div>
        </div>
    </div>
</section>

<section class="au-promise-section">
    <div class="au-promise-icon">
        <i class="fa-solid fa-circle-check"></i>
    </div>

    <div class="au-promise-text">
        <h2>Our Promise to You</h2>
        <p>
            Every jersey on Jersey Pasal is 100% authentic or clearly labeled as a premium replica.
            From official licensed products to fan editions, we ensure every product meets our strict
            quality standards before it reaches you.
        </p>
    </div>
</section>

<section class="au-offer-section">
    <div class="au-heading-box">
        <p class="au-small-title">What We Offer</p>
        <h2>Everything a True Football Fan Needs</h2>
    </div>

    <div class="au-offer-grid">
        <div class="au-offer-card">
            <i class="fa-solid fa-shirt"></i>
            <h3>Club Jerseys</h3>
            <p>Official and fan jerseys from top clubs including Premier League, La Liga, Serie A, Bundesliga and more.</p>
        </div>

        <div class="au-offer-card">
            <i class="fa-solid fa-flag"></i>
            <h3>National Team Kits</h3>
            <p>Support your country with international jerseys from World Cup teams including Nepal and global giants.</p>
        </div>

        <div class="au-offer-card">
            <i class="fa-solid fa-trophy"></i>
            <h3>Champions League</h3>
            <p>Exclusive kits and editions from UEFA Champions League and major European competitions.</p>
        </div>

        <div class="au-offer-card">
            <i class="fa-solid fa-star"></i>
            <h3>Authentic &amp; Replica</h3>
            <p>Choose between official player versions and premium fan replicas with top-quality materials.</p>
        </div>

        <div class="au-offer-card">
            <i class="fa-solid fa-pen-nib"></i>
            <h3>Custom Name &amp; Number</h3>
            <p>Personalize your jersey with your favorite player name or your own — perfect for match days.</p>
        </div>
    </div>
</section>

<section class="au-why-section">
    <div class="au-heading-box">
        <p class="au-small-title">Why Choose Us</p>
        <h2>The Jersey Pasal Difference</h2>
    </div>

    <div class="au-why-grid">
        <div class="au-why-card">
            <p class="au-card-number">01</p>
            <h3>100% Quality Guarantee</h3>
            <p>Every product is inspected before dispatch. Not satisfied? We offer easy returns, no questions asked.</p>
        </div>

        <div class="au-why-card">
            <p class="au-card-number">02</p>
            <h3>Trusted &amp; Verified Products</h3>
            <p>We source directly from licensed suppliers. Every jersey is verified for authenticity before it reaches our store.</p>
        </div>

        <div class="au-why-card">
            <p class="au-card-number">03</p>
            <h3>Fast Order Processing</h3>
            <p>Orders processed within 24 hours. Kathmandu Valley in 1–2 days, nationwide in 3–5 days.</p>
        </div>

        <div class="au-why-card">
            <p class="au-card-number">04</p>
            <h3>Dedicated Customer Support</h3>
            <p>Our team is available on WhatsApp, Messenger, and email 7 days a week to help with orders and sizing.</p>
        </div>

        <div class="au-why-card">
            <p class="au-card-number">05</p>
            <h3>Best Prices in Nepal</h3>
            <p>Fair, transparent pricing with no hidden charges — plus regular deals, discounts, and loyalty rewards.</p>
        </div>
    </div>
</section>

<section class="au-team-section">
    <div class="au-heading-box">
        <p class="au-small-title">The People Behind It</p>
        <h2>Meet Our Team</h2>
    </div>

    <div class="au-team-grid">
        <div class="au-team-card">
            <div class="au-team-image">
                <img src="${pageContext.request.contextPath}/images/pankajRai.jpg" alt="Pankaj Rai">
            </div>
            <h3>Pankaj Rai</h3>
            <p class="au-team-role">Team Leader &amp; Backend Developer</p>
            <p>A motivated, detail-oriented individual with strong organizational, communication, and problem solving skills. Demonstrates high responsibility and dedication capable of working both independently and collaboratively to deliver efficient results.</p>
        </div>

        <div class="au-team-card">
            <div class="au-team-image">
                <img src="${pageContext.request.contextPath}/images/eijkeyalPakhrin.jpeg" alt="Eijkeyal Pakhrin">
            </div>
            <h3>Eijkeyal Pakhrin</h3>
            <p class="au-team-role">Backend &amp; Frontend Developer</p>
            <p>Through my journey in technology, I've built strong confidence in solving problems creatively. I approach challenges by breaking them into manageable parts and finding practical, innovative solutions making me more resilient and continuously learning.</p>
        </div>

        <div class="au-team-card">
            <div class="au-team-image">
                <img src="${pageContext.request.contextPath}/images/bisrutAdhikari.jpg" alt="Bisrut Adhikari">
            </div>
            <h3>Bishrut Raj Adhikari</h3>
            <p class="au-team-role">Backend &amp; Frontend Developer</p>
            <p>Designs modern and user-friendly interfaces for a better experience. Brings a creative mindset to backend systems, ensuring smooth functionality that powers the Jersey Pasal platform.</p>
        </div>

        <div class="au-team-card">
            <div class="au-team-image">
                <img src="${pageContext.request.contextPath}/images/kriteeKhadka.jpg" alt="Kritee Khadka">
            </div>
            <h3>Kritee Khadka</h3>
            <p class="au-team-role">Frontend Developer &amp; UI/UX Designer</p>
            <p>A Computing student passionate about frontend development and database management. Experienced in HTML, CSS, and MySQL building responsive, user-friendly interfaces with a sharp eye for design and structure.</p>
        </div>

        <div class="au-team-card">
            <div class="au-team-image">
                <img src="${pageContext.request.contextPath}/images/manishaShah.jpg" alt="Manisha Shah">
            </div>
            <h3>Manisha Shah</h3>
            <p class="au-team-role">Frontend Developer &amp; UI/UX Designer</p>
            <p>A passionate computing student with a strong interest in web development. Skilled in HTML, Python, and Java motivated to keep learning and growing. Contributed meaningfully to Jersey Pasal's frontend and user experience.</p>
        </div>
    </div>
</section>

<section class="au-bottom-section">
    <h2>Ready to Wear Your Passion?</h2>
    <p>Browse our full collection and find your perfect jersey today.</p>

    <a href="${pageContext.request.contextPath}/product">
        Shop Now
        <i class="fa-solid fa-arrow-up-right-from-square"></i>
    </a>
</section>

<%@ include file="/components/footer.jsp" %>

</body>
</html>