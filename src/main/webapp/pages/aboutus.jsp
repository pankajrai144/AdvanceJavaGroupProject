<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us -Jersey Pasal</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/aboutus.css">

</head>

<body class="about-page">
<jsp:include page="/components/header.jsp"/>
<div class="page-content">
<section class="hero">
  <h1>About PrimeJerseys</h1>
  <p>More than jerseys — we deliver passion, identity, and pride.</p>
</section>
<section class="about">
  <h2>Who We Are</h2>
  <p>
    At PrimeJerseys, we believe that a jersey is more than just clothing — 
    it represents identity, loyalty, and emotion.
  </p>
  <p>
    We connect fans with their favorite teams through high-quality, 
    authentic, and stylish jerseys.
  </p>
</section>
<section class="stats">
  <div class="stat-box">
    <h3>10K+</h3>
    <p>Customers</p>
  </div>
  <div class="stat-box">
    <h3>500+</h3>
    <p>Products</p>
  </div>
  <div class="stat-box">
    <h3>99%</h3>
    <p>Satisfaction</p>
  </div>
</section>
<section class="team">
  <h2>Meet Our Team</h2>
  <div class="team-grid">
    <div class="team-card">
      <img src="https://randomuser.me/api/portraits/men/1.jpg">
      <h4>Eijkeyal Pankaj</h4>
      <p class="role">Founder & Developer</p>
      <p class="desc">
        Problem-solving focused developer with strong analytical thinking 
        and creative approach to challenges.
      </p>
    </div>
    <div class="team-card">
      <img src="https://randomuser.me/api/portraits/men/2.jpg">
      <h4>Pankaj Rai</h4>
      <p class="role">Backend Engineer</p>
      <p class="desc">
        Builds secure and scalable backend systems ensuring smooth performance.
      </p>
    </div>
    <div class="team-card">
      <img src="https://randomuser.me/api/portraits/men/3.jpg">
      <h4>Bishrut Adhikari</h4>
      <p class="role">UI/UX Designer</p>
      <p class="desc">
        Designs modern and user-friendly interfaces for better experience.
      </p>
    </div>
    <div class="team-card">
      <img src="https://randomuser.me/api/portraits/women/4.jpg">
      <h4>Kriti Shah</h4>
      <p class="role">Marketing Manager</p>
      <p class="desc">
        Drives brand growth through smart marketing strategies.
      </p>
    </div>
    <div class="team-card">
      <img src="https://randomuser.me/api/portraits/women/5.jpg">
      <h4>Manisha Shah</h4>
      <p class="role">Customer Support</p>
      <p class="desc">
        Ensures smooth and friendly customer experience.
      </p>
    </div>
  </div>
</section>
<section class="about" style="padding-top:20px;">
  <h2>Our Mission</h2>
  <p>
    Our mission is to bring fans closer to their favorite teams by providing 
    high-quality jerseys with authenticity, comfort, and style.
  </p>
</section>
</div>
<jsp:include page="/components/footer.jsp"/>s
</body>
</html>