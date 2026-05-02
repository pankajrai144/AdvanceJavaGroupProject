<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About Us – Jersey Pasal</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/aboutus.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

</head>
<body>

<jsp:include page="/components/header.jsp"/>

<nav>
  <a class="nav-logo" href="#"><span>Jersey</span> Pasal</a>
  <a class="shop-btn" href="#">Shop Now ↗</a>
</nav>
<div class="image-banner">
  <img
    src="${pageContext.request.contextPath}/images/aboutus.jpg"
    alt="The Home of Authentic Jerseys in Nepal  Jersey Pasal"
  >
  <div class="banner-overlay">
    <div class="banner-line"></div>
    <span class="banner-tag">Nepal's Number One Jersey Store</span>
    <h2>The Home of <span>Authentic</span><br>Jerseys in Nepal</h2>
    <p>From the biggest leagues to your doorstep we deliver passion, identity, and pride to fans across all 77 districts.</p>
  </div>
</div>

<section class="story">
  <div class="fade-up">
    <div class="story-label">How We Started</div>
    <h2>Born Out of a Simple Frustration</h2>
    <p>Finding authentic, high-quality jerseys in Nepal was nearly impossible. In 2020, we set out to change that. Today we are Nepal's trusted destination for football, basketball, cricket, and esports jerseys from clubs and national teams around the world.</p>
  </div>
  <div class="stats-grid fade-up">
    <div class="stat-box">
      <div class="stat-num">5,000+</div>
      <div class="stat-desc">Happy Customers</div>
    </div>
    <div class="stat-box">
      <div class="stat-num">200+</div>
      <div class="stat-desc">Jersey Styles</div>
    </div>
    <div class="stat-box">
      <div class="stat-num">77</div>
      <div class="stat-desc">Districts Delivered</div>
    </div>
    <div class="stat-box">
      <div class="stat-num">4+ Yrs</div>
      <div class="stat-desc">In Business</div>
    </div>
  </div>
</section>
<div class="promise">
  <div class="promise-icon">
    <i class="fa-solid fa-circle-check"></i>
  </div>
  <div class="promise-text">
    <h3>Our Promise to You</h3>
    <p>Every jersey on Jersey Pasal is 100% authentic or clearly labeled as a premium replica. From official licensed products to fan editions, we ensure every product meets our strict quality standards before it reaches you.</p>
  </div>
</div>
<section class="offer">
  <div class="section-header fade-up">
    <div class="label">What We Offer</div>
    <h2>Everything a True Football Fan Needs</h2>
  </div>
  <div class="offer-grid">
    <div class="offer-card fade-up">
      <i class="fa-solid fa-shirt offer-icon"></i>
      <h3>Club Jerseys</h3>
      <p>Official and fan jerseys from top clubs including Premier League, La Liga, Serie A, Bundesliga and more.</p>
    </div>
    <div class="offer-card fade-up">
      <i class="fa-solid fa-flag offer-icon"></i>
      <h3>National Team Kits</h3>
      <p>Support your country with international jerseys from World Cup teams including Nepal and global giants.</p>
    </div>
    <div class="offer-card fade-up">
      <i class="fa-solid fa-trophy offer-icon"></i>
      <h3>Champions League</h3>
      <p>Exclusive kits and editions from UEFA Champions League and major European competitions.</p>
    </div>
    <div class="offer-card fade-up">
      <i class="fa-solid fa-star offer-icon"></i>
      <h3>Authentic &amp; Replica</h3>
      <p>Choose between official player versions and premium fan replicas with top-quality materials.</p>
    </div>
    <div class="offer-card fade-up">
      <i class="fa-solid fa-pen-nib offer-icon"></i>
      <h3>Custom Name &amp; Number</h3>
      <p>Personalize your jersey with your favorite player name or your own — perfect for match days.</p>
    </div>
    <div class="offer-card fade-up">
      <i class="fa-solid fa-truck-fast offer-icon"></i>
      <h3>Nationwide Delivery</h3>
      <p>Fast and reliable delivery across all 77 districts of Nepal with secure packaging.</p>
    </div>
  </div>
</section>
<section class="why">
  <div class="section-header fade-up">
    <div class="label">Why Choose Us</div>
    <h2>The Jersey Pasal Difference</h2>
  </div>
  <div class="why-grid">
    <div class="why-card fade-up">
      <div class="why-num">01</div>
      <h3>100% Quality Guarantee</h3>
      <p>Every product is inspected before dispatch. Not satisfied? We offer easy returns, no questions asked.</p>
    </div>
    <div class="why-card fade-up">
      <div class="why-num">02</div>
      <h3>Trusted &amp; Verified Products</h3>
      <p>We source directly from licensed suppliers. Every jersey is verified for authenticity before it reaches our store.</p>
    </div>
    <div class="why-card fade-up">
      <div class="why-num">03</div>
      <h3>Fast Order Processing</h3>
      <p>Orders processed within 24 hours. Kathmandu Valley in 1–2 days, nationwide in 3–5 days.</p>
    </div>
    <div class="why-card fade-up">
      <div class="why-num">04</div>
      <h3>Dedicated Customer Support</h3>
      <p>Our team is available on WhatsApp, Messenger, and email 7 days a week to help with orders and sizing.</p>
    </div>
    <div class="why-card fade-up">
      <div class="why-num">05</div>
      <h3>Best Prices in Nepal</h3>
      <p>Fair, transparent pricing with no hidden charges — plus regular deals, discounts, and loyalty rewards.</p>
    </div>
    <div class="why-card fade-up">
      <div class="why-num">06</div>
      <h3>5,000+ Satisfied Fans</h3>
      <p>A growing community of sports fans across Nepal who trust us for every match day and special occasion.</p>
    </div>
  </div>
</section>
<section class="reviews">
  <div class="section-header fade-up">
    <div class="label">What Our Clients Say</div>
    <h2>Fans Love Jersey Pasal</h2>
  </div>
  <div class="reviews-grid">
    <div class="review-card fade-up">
      <div class="stars">★★★★★</div>
      <p class="review-text">I ordered a Real Madrid jersey and it arrived in just 2 days in Kathmandu. The quality is exactly as described — stitching is clean and the material feels premium. Will definitely order again!</p>
      <div class="reviewer">
        <div class="reviewer-avatar">RK</div>
        <div>
          <div class="reviewer-name">Roshan K.</div>
          <div class="reviewer-loc">Kathmandu</div>
        </div>
      </div>
    </div>
    <div class="review-card fade-up">
      <div class="stars">★★★★★</div>
      <p class="review-text">Got a custom name &amp; number added to my Barcelona jersey as a birthday gift for my brother. They did it perfectly. Jersey Pasal is the best sports store in Nepal — no doubt!</p>
      <div class="reviewer">
        <div class="reviewer-avatar">PS</div>
        <div>
          <div class="reviewer-name">Prasansha M.</div>
          <div class="reviewer-loc">Pokhara</div>
        </div>
      </div>
    </div>
    <div class="review-card fade-up">
      <div class="stars">★★★★☆</div>
      <p class="review-text">Bought 3 football jerseys and the quality is surprisingly solid for the price. Everything arrived in Chitwan safely packed and on time. Great service — definitely recommended!</p>
      <div class="reviewer">
        <div class="reviewer-avatar">BT</div>
        <div>
          <div class="reviewer-name">Bikash T.</div>
          <div class="reviewer-loc">Chitwan</div>
        </div>
      </div>
    </div>
    <div class="review-card fade-up">
      <div class="stars">★★★★★</div>
      <p class="review-text">Very smooth experience from browsing to checkout to delivery. I was skeptical at first buying online but Jersey Pasal really delivered — literally and figuratively. The Nepal cricket jersey looks amazing!</p>
      <div class="reviewer">
        <div class="reviewer-avatar">AM</div>
        <div>
          <div class="reviewer-name">Sampada R.</div>
          <div class="reviewer-loc">Lalitpur</div>
        </div>
      </div>
    </div>
    <div class="review-card fade-up">
      <div class="stars">★★★★★</div>
      <p class="review-text">I've ordered from Jersey Pasal three times now — football, basketball, and esports jerseys. Each time the quality and service has been consistent. This is the only place I shop for jerseys in Nepal.</p>
      <div class="reviewer">
        <div class="reviewer-avatar">SL</div>
        <div>
          <div class="reviewer-name">Tisa R.</div>
          <div class="reviewer-loc">Bhaktapur</div>
        </div>
      </div>
    </div>
  </div>
</section>
<section class="team">
  <div class="section-header fade-up">
    <div class="label">The People Behind It</div>
    <h2>Meet Our Team</h2>
  </div>
  <div class="team-grid">
    <div class="team-card fade-up">
      <div class="team-avatar-wrap">
        <img src="https://randomuser.me/api/portraits/men/1.jpg" alt="Eijkeyal Pakhrin">
      </div>
      <div class="team-info">
        <h4>Eijkeyal Pakhrin</h4>
        <span class="team-role">Backend Engineer</span>
        <p>Through my journey in technology, I've built strong confidence in solving problems creatively. I approach challenges by breaking them into manageable parts and finding practical, innovative solutions — making me more resilient and continuously learning.</p>
      </div>
    </div>
    <div class="team-card fade-up">
      <div class="team-avatar-wrap">
        <img src="https://randomuser.me/api/portraits/men/2.jpg" alt="Pankaj Rai">
      </div>
      <div class="team-info">
        <h4>Pankaj Rai</h4>
        <span class="team-role">Team Leader &amp; Backend Engineer</span>
        <p>A motivated, detail-oriented individual with strong organizational, communication, and problem-solving skills. Demonstrates high responsibility and dedication — capable of working both independently and collaboratively to deliver efficient results.</p>
      </div>
    </div>
    <div class="team-card fade-up">
      <div class="team-avatar-wrap">
        <img src="https://randomuser.me/api/portraits/men/3.jpg" alt="Bishrut Adhikari">
      </div>
      <div class="team-info">
        <h4>Bishrut Adhikari</h4>
        <span class="team-role">Backend Engineer</span>
        <p>Designs modern and user-friendly interfaces for a better experience. Brings a creative mindset to backend systems, ensuring smooth functionality that powers the Jersey Pasal platform.</p>
      </div>
    </div>
    <div class="team-card fade-up">
      <div class="team-avatar-wrap">
        <img src="https://randomuser.me/api/portraits/women/4.jpg" alt="Kritee Khadka">
      </div>
      <div class="team-info">
        <h4>Kritee Khadka</h4>
        <span class="team-role">Frontend Developer</span>
        <p>A Computing student passionate about frontend development and database management. Experienced in HTML, CSS, and MySQL — building responsive, user-friendly interfaces with a sharp eye for design and structure.</p>
      </div>
    </div>
    <div class="team-card fade-up">
      <div class="team-avatar-wrap">
        <img src="https://randomuser.me/api/portraits/women/5.jpg" alt="Manisha Shah">
      </div>
      <div class="team-info">
        <h4>Manisha Shah</h4>
        <span class="team-role">Frontend Developer</span>
        <p>A passionate computing student with a strong interest in web development. Skilled in HTML, Python, and Java — motivated to keep learning and growing. Contributed meaningfully to Jersey Pasal's frontend and user experience.</p>
      </div>
    </div>
  </div>
</section>
<section class="cta">
  <h2>Ready to Wear Your Passion?</h2>
  <p>Browse our full collection and find your perfect jersey today.</p>
  <a href="#">Shop Now ↗</a>
</section>
<footer>
  <div class="footer-logo"><span>Jersey</span> Pasal</div>
  <p>© 2025 Jersey Pasal. All rights reserved. Nepal's Home of Authentic Jerseys.</p>
</footer>

<jsp:include page="/components/footer.jsp"/>

<script>
  const observer = new IntersectionObserver((entries) => {
    entries.forEach((e, i) => {
      if (e.isIntersecting) {
        setTimeout(() => e.target.classList.add('visible'), i * 80);
      }
    });
  }, { threshold: 0.12 });
  document.querySelectorAll('.fade-up').forEach(el => observer.observe(el));
</script>

</body>
</html>
