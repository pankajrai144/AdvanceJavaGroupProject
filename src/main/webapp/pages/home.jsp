<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=yes">
<title>Jersey Pasal |Official Football Jerseys Nepal</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@400;600;700;800;900&family=Barlow:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

</head>
<body>
<jsp:include page="/components/header.jsp"/>
<div class="page-start">

  <div class="image-banner">
    <img src="<c:url value='/images/worldcupbanner.jpg'/>" alt="The Home of Authentic Jerseys in Nepal Jersey Pasal">
    <div class="banner-overlay">
      <div class="banner-line"></div>
      <span class="banner-tag">Nepal's Number One Jersey Store</span>
      <h2>The Home of <span>Authentic</span><br>Jerseys in Nepal</h2>
      <p>48 Nations. One Trophy. History Awaits. The biggest FIFA World Cup in history. Three nations, 104 matches, and the world watching every kick. Don't miss a moment.</p>
      <div class="banner-btns">
        <button class="btn-red">Shop Collection <i class="fas fa-store"></i></button>
        <button class="btn-outline">Team Jerseys <i class="fa-solid fa-shirt"></i></button>
      </div>
    </div>
  </div>

  <div class="stats-bar">
    <div class="stat"><div class="stat-n">48</div><div class="stat-l">Nations</div></div>
    <div class="stat"><div class="stat-n">104</div><div class="stat-l">Matches</div></div>
    <div class="stat"><div class="stat-n">3</div><div class="stat-l">Host Nations</div></div>
    <div class="stat"><div class="stat-n" id="cd-days">--</div><div class="stat-l">Days to Go</div></div>
  </div>
  <div class="countdown-section">
    <h3>Road to World Cup 2026 <i class="fa-regular fa-clock"></i></h3>
    <div class="countdown">
      <span id="days">--</span>d : <span id="hours">--</span>h : <span id="minutes">--</span>m : <span id="seconds">--</span>s
    </div>
  </div>
  <section class="section">
    <div class="sec-title"><i class="fa-solid fa-trophy"></i> The 48-Team Revolution</div>
    <div class="sec-sub">For the first time ever, 48 nations will battle for football's ultimate prize. More dreams. More drama. More history.</div>
    <div class="story-grid">
      <div class="story-card"><div class="story-icon"><i class="fa-solid fa-globe-americas"></i></div><h3>Global Expansion</h3><p>16 additional nations get their shot at glory. From debutants to dark horses, every continent is represented like never before.</p></div>
      <div class="story-card"><div class="story-icon"><i class="fa-solid fa-diagram-project"></i></div><h3>New Format</h3><p>12 groups of 4, then a knockout round of 32. Every match matters from the very first whistle.</p></div>
      <div class="story-card"><div class="story-icon"><i class="fa-solid fa-users"></i></div><h3>5 Million Fans</h3><p>Expected attendance across 16 world-class stadiums. The largest sporting event in human history.</p></div>
    </div>
  </section>

  <section class="section">
    <div class="sec-title"><i class="fa-solid fa-fire"></i> Top Selling Jerseys</div>
    <div class="sec-sub">Fan favorites that everyone is wearing right now</div>

    <div class="cities-grid">
      <div class="city-card">
        <img src="https://images.unsplash.com/photo-1560272564-c83b66b1ad12?w=600" alt="Argentina Home Jersey Messi 10">
        <div class="city-overlay">
          <h3>Argentina Home Jersey</h3>
          <p>Messi #10 · #1 Best Seller</p>
        </div>
      </div>

      <div class="city-card">
        <img src="https://images.unsplash.com/photo-1522778119026-d647f0598c86?w=600" alt="Portugal Away Jersey CR7">
        <div class="city-overlay">
          <h3>Portugal Away Jersey</h3>
          <p>Ronaldo #7 · 2,500+ Sold</p>
        </div>
      </div>

      <div class="city-card">
        <img src="https://images.unsplash.com/photo-1508098682722-e99c43a406b2?w=600" alt="Brazil Home Jersey Neymar Jr">
        <div class="city-overlay">
          <h3>Brazil Home Jersey</h3>
          <p>Neymar #10 · Limited Stock</p>
        </div>
      </div>
    </div>
  </section>

  <section class="section">
    <div class="sec-title"><i class="fa-regular fa-star"></i> Why Choose Jersey Pasal</div>
    <div class="sec-sub">Your trusted destination for authentic football jerseys and World Cup 2026 merchandise</div>
    <div class="why-grid">
      <div class="why-card">
        <span class="why-icon"><i class="fa-regular fa-circle-check"></i></span>
        <h3>100% Authentic</h3>
        <p>Every jersey is sourced from licensed manufacturers authentic or clearly labelled replica. Never fake.</p>
      </div>
      <div class="why-card">
        <span class="why-icon"><i class="fa-solid fa-money-bill-wave"></i></span>
        <h3>Cash on Delivery</h3>
        <p>Pay when you receive your jersey. Available across Nepal. No hidden charges.</p>
      </div>
      <div class="why-card">
        <span class="why-icon"><i class="fa-solid fa-arrow-rotate-left"></i></span>
        <h3>Easy Returns</h3>
        <p>Changed your mind? Free 30-day returns on all unworn jerseys with no questions asked.</p>
      </div>
      <div class="why-card">
        <span class="why-icon"><i class="fa-solid fa-lock"></i></span>
        <h3>Secure Payment</h3>
        <p>Shop with confidence. We accept all major cards, PayPal, and buy-now-pay-later options.</p>
      </div>
      <div class="why-card">
        <span class="why-icon"><i class="fa-solid fa-print"></i></span>
        <h3>Custom Printing</h3>
        <p>Add your name and number to any jersey. Official font, official feel ready in 48 hours.</p>
      </div>
      <div class="why-card">
        <span class="why-icon"><i class="fa-solid fa-handshake"></i></span>
        <h3>Official Partnerships</h3>
        <p>Partnered with Adidas, Nike, Puma and more for direct access to the latest drops.</p>
      </div>
      <div class="why-card">
        <span class="why-icon"><i class="fa-solid fa-headset"></i></span>
        <h3>24/7 Support</h3>
        <p>Our fan support team is always online chat, email, or WhatsApp, any time of day.</p>
      </div>
      <div class="why-card">
        <span class="why-icon"><i class="fa-solid fa-certificate"></i></span>
        <h3>Nepal's Number One Store</h3>
        <p>10,000+ happy customers. Most trusted jersey pasal in Nepal.</p>
      </div>
    </div>
  </section>

  <section class="section">
    <div class="sec-title"><i class="fa-solid fa-crown"></i> Legends of the Game</div>
    <div class="sec-sub">Icons who defined world football. Their legacy lives on.</div>
    <div class="legends-grid">
      <div class="legend-card"><img src="<c:url value='/images/messi2.jpg'/>" alt="Messi"><h4>Lionel Messi</h4><p>The GOAT</p></div>
      <div class="legend-card"><img src="<c:url value='/images/ronaldo2.jpg'/>" alt="Ronaldo"><h4>Cristiano Ronaldo</h4><p>Mr.Champions League</p></div>
      <div class="legend-card"><img src="<c:url value='/images/neymar2.jpg'/>" alt="Nemyar"><h4>Neymar Jr</h4><p>Heart of Brazil</p></div>
      <div class="legend-card"><img src="<c:url value='/images/kylian.jpg'/>" alt="Kylian Mbappe"><h4>Kylian Mbappe</h4><p>Fastest Man Alive</p></div>
    </div>
  </section>

  <section class="section">
    <div class="sec-title"><i class="fa-regular fa-star"></i> Our Journey</div>
    <div class="sec-sub">From a small shop to Nepal's Number One jersey store</div>
    <div class="timeline">
      <div class="timeline-item">
        <div class="timeline-date">2018</div>
        <div class="timeline-content">
          <h3><i class="fa-solid fa-store"></i> Humble Beginnings</h3>
          <p>Started as a small jersey shop in Kathmandu</p>
        </div>
        <div class="timeline-dot"></div>
      </div>
      <div class="timeline-item">
        <div class="timeline-date">2020</div>
        <div class="timeline-content">
          <h3><i class="fa-solid fa-globe"></i> Online Store Launch</h3>
          <p>Brought authentic jerseys to every corner of Nepal</p>
        </div>
        <div class="timeline-dot"></div>
      </div>
      <div class="timeline-item">
        <div class="timeline-date">2024</div>
        <div class="timeline-content">
          <h3><i class="fa-solid fa-users"></i> 10,000+ Happy Customers</h3>
          <p>Nepal's most trusted name for football jerseys</p>
        </div>
        <div class="timeline-dot"></div>
      </div>
      <div class="timeline-item">
        <div class="timeline-date">2026</div>
        <div class="timeline-content">
          <h3><i class="fa-solid fa-trophy"></i> World Cup Collection</h3>
          <p>Official jerseys for all 48 Nations. Available now</p>
        </div>
        <div class="timeline-dot"></div>
      </div>
    </div>
  </section>

  <section class="section">
    <div class="stadium-section">
      <div class="stadium-text">
        <h3><i class="fa-solid fa-gift"></i> The Perfect Gift for Football Lovers</h3>
        <p>Birthday? Anniversary? Just because? A personalized jersey is the ultimate gift. We'll pack it beautifully and deliver with a smile.</p>
        <button class="btn-red" style="margin-top:1rem">Shop to Gift<i class="fa-solid fa-arrow-right"></i></button>
      </div>
      <div class="stadium-image"><img src="<c:url value='/images/gift.jpg'/>" alt="Gift BOx with Jersey"></div>
    </div>
  </section>

  <section class="section">
    <div class="sec-title"><i class="fa-regular fa-bell"></i> New Arrivals</div>
    <div class="sec-sub">Fresh jerseys just landed in Nepal</div>
    <div class="news-grid">
      <div class="news-card">
        <img src="https://images.unsplash.com/photo-1551958219-acbc608c6377?w=600" alt="England Jersey">
        <div class="news-info">
          <div class="news-date"><i class="fa-regular fa-calendar"></i> Just Arrived</div>
          <h3>England Home 2026</h3>
          <p>Clean white. Classic style. Limited stock.</p>
          <button class="btn-red" style="margin-top: 0.8rem; padding: 0.5rem 1rem; font-size: 0.8rem;">Buy Now</button>
        </div>
      </div>
      <div class="news-card">
        <img src="https://images.unsplash.com/photo-1517927033932-b3d18e61fb3a?w=600" alt="Germany Jersey">
        <div class="news-info">
          <div class="news-date"><i class="fa-regular fa-calendar"></i> Just Arrived</div>
          <h3>Germany Home 2026</h3>
          <p>Classic white and black. Pre-order open.</p>
          <button class="btn-red" style="margin-top: 0.8rem; padding: 0.5rem 1rem; font-size: 0.8rem;">Buy Now</button>
        </div>
      </div>
      <div class="news-card">
        <img src="https://images.unsplash.com/photo-1508098682722-e99c643e7485?w=600" alt="Portugal Jersey">
        <div class="news-info">
          <div class="news-date"><i class="fa-regular fa-calendar"></i> Limited Edition</div>
          <h3>Portugal Ronaldo Edition</h3>
          <p>CR7 special. Only 50 pieces in Nepal.</p>
          <button class="btn-red" style="margin-top: 0.8rem; padding: 0.5rem 1rem; font-size: 0.8rem;">Buy Now</button>
        </div>
      </div>
    </div>
  </section>

  <div class="contact-simple" style="text-align: center; padding: 3rem 5%;">
    <h2><i class="fa-regular fa-message"></i> Questions?</h2>
    <p>Call or WhatsApp us: <strong style="color: #e31b23;">+977 9800000000</strong></p>
    <p style="margin-top: 0.5rem;">Or DM us on Instagram <strong>@jerseypasal</strong></p>
  </div>

</div> 
<jsp:include page="/components/footer.jsp"/>
<script>
  const target = new Date("June 11, 2026 00:00:00 UTC").getTime();
  function tick() {
    const diff = target - Date.now();
    if (diff <= 0) return;
    const d = Math.floor(diff / 86400000);
    const h = Math.floor((diff % 86400000) / 3600000);
    const m = Math.floor((diff % 3600000) / 60000);
    const s = Math.floor((diff % 60000) / 1000);
    document.getElementById('days').textContent = d;
    document.getElementById('hours').textContent = h;
    document.getElementById('minutes').textContent = m;
    document.getElementById('seconds').textContent = s;
    document.getElementById('cd-days').textContent = d;
  }
  setInterval(tick, 1000);
  tick();
</script>
</body>
</html>