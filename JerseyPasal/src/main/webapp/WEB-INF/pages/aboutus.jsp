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
    <i class="fa-solid fa-headset"></i>
    <h3>Dedicated Customer Support</h3>
    <p>Our support team is always ready to assist you with quick responses, reliable service, and a seamless shopping experience.</p>
</div>
   	 </div>
</section>
<div class="home-content-area">

 <section class="home-section">
    <div class="home-sec-title"><i class="fa-regular fa-star"></i> Why Choose Jersey Pasal</div>
    <div class="home-sec-sub">Your trusted destination for authentic football jerseys and World Cup 2026 merchandise</div>

    <div class="home-why-grid">
      <div class="home-why-card">
        <span class="home-why-icon"><i class="fa-regular fa-circle-check"></i></span>
        <h3>100% Authentic</h3>
        <p>Every jersey is sourced from licensed manufacturers authentic or clearly labelled replica. Never fake.</p>
      </div>
	<div class="home-why-card">
    	<span class="home-why-icon"><i class="fa-solid fa-globe"></i></span>
    	<h3>Inspired by Global Football Culture</h3>
    	<p>We bring the passion of world football closer to fans with stylish designs inspired by clubs and international teams.</p>
	</div>

      <div class="home-why-card">
        <span class="home-why-icon"><i class="fa-solid fa-arrow-rotate-left"></i></span>
        <h3>Easy Returns</h3>
        <p>Changed your mind? Free 30-day returns on all unworn jerseys with no questions asked.</p>
      </div>

      <div class="home-why-card">
        <span class="home-why-icon"><i class="fa-solid fa-lock"></i></span>
        <h3>Secure Payment</h3>
        <p>Shop with confidence. We accept all major cards, PayPal, and buy-now-pay-later options.</p>
      </div>

	 <div class="home-why-card">
    <span class="home-why-icon">
        <i class="fa-solid fa-users"></i>
    </span><h3>Customer First Approach</h3>
    <p>We are committed to providing trusted service, premium quality, and a seamless shopping experience for every football fan.</p>
</div>		

      <div class="home-why-card">
        <span class="home-why-icon"><i class="fa-solid fa-handshake"></i></span>
        <h3>Official Partnerships</h3>
        <p>Partnered with Adidas, Nike, Puma and more for direct access to the latest drops.</p>
      </div>

      <div class="home-why-card">
        <span class="home-why-icon"><i class="fa-solid fa-headset"></i></span>
        <h3>24/7 Support</h3>
        <p>Our fan support team is always online chat, email, or WhatsApp, any time of day.</p>
      </div>

      <div class="home-why-card">
        <span class="home-why-icon"><i class="fa-solid fa-certificate"></i></span>
        <h3>Nepal's Number One Store</h3>
        <p>10,000+ happy customers. Most trusted jersey pasal in Nepal.</p>
      </div>
    </div>
  </section>

  <section class="home-section">
    <div class="home-sec-title"><i class="fa-regular fa-star"></i> Our Journey</div>
    <div class="home-sec-sub">From a small shop to Nepal's Number One jersey store</div>

    <div class="home-timeline">
      <div class="home-timeline-item">
        <div class="home-timeline-date">2023</div>
        <div class="home-timeline-content">
          <h3><i class="fa-solid fa-store"></i> Humble Beginnings</h3>
          <p>Started as a small jersey shop in Kathmandu</p>
        </div>
        <div class="home-timeline-dot"></div>
      </div>

      <div class="home-timeline-item">
        <div class="home-timeline-date">2024</div>
        <div class="home-timeline-content">
          <h3><i class="fa-solid fa-globe"></i> Online Store Launch</h3>
          <p>Brought authentic jerseys to every corner of Nepal</p>
        </div>
        <div class="home-timeline-dot"></div>
      </div>

      <div class="home-timeline-item">
        <div class="home-timeline-date">2025</div>
        <div class="home-timeline-content">
          <h3><i class="fa-solid fa-users"></i> 10,000+ Happy Customers</h3>
          <p>Nepal's most trusted name for football jerseys</p>
        </div>
        <div class="home-timeline-dot"></div>
      </div>

      <div class="home-timeline-item">
        <div class="home-timeline-date">2026</div>
        <div class="home-timeline-content">
          <h3><i class="fa-solid fa-trophy"></i> World Cup Collection</h3>
          <p>Official jerseys for all 48 Nations. Available now</p>
        </div>
        <div class="home-timeline-dot"></div>
      </div>
    </div>
  </section>
</div>
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
                <img src="${pageContext.request.contextPath}/images/bisrutAdhikari.png" alt="Bisrut Adhikari">
            </div>
            <h3>Bishrut Raj Adhikari</h3>
            <p class="au-team-role">Backend &amp; Frontend Developer</p>
            <p>Designs modern and user-friendly interfaces for a better experience. Brings a creative mindset to backend systems, ensuring smooth functionality that powers the Jersey Pasal platform.</p>
        </div>

        <div class="au-team-card">
            <div class="au-team-image">
                <img src="${pageContext.request.contextPath}/images/kriteeKhadka.png" alt="Kritee Khadka">
            </div>
            <h3>Kritee Khadka</h3>
            <p class="au-team-role">Frontend Developer &amp; UI/UX Designer</p>
            <p>A Computing student passionate about frontend development and database management. Experienced in HTML, CSS, and MySQL building responsive, user-friendly interfaces with a sharp eye for design and structure.</p>
        </div>

        <div class="au-team-card">
            <div class="au-team-image">
                <img src="${pageContext.request.contextPath}/images/manishaShah.png" alt="Manisha Shah">
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
    <div class="au-button-wrapper">
        <a href="${pageContext.request.contextPath}/contact" class="au-contact-white-btn">
            <i class="fa-solid fa-headset"></i>
            Contact Us
        </a>
    </div>
</section>

<%@ include file="/components/footer.jsp" %>

</body>
</html>
