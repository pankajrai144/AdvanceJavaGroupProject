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
  <h1>About JerseyPasal</h1>
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
      <h4>Eijkeyal Pakhrin</h4>
      <p class="role">Backend Engineer</p>
      <p class="desc">
        Through my journey in technology, I have built strong confidence in solving problems creatively and effectively.
         I approach challenges by breaking them into manageable parts and finding practical, innovative solutions. 
         This growth has strengthened both my skills and mindset, making me more resilient, continuously learning, and committed to creating value and helping others.
      </p>
    </div>
    <div class="team-card">
      <img src="https://randomuser.me/api/portraits/men/2.jpg">
      <h4>Pankaj Rai</h4>
      <p class="role">Team Leeadr & Backend Engineer</p>
      <p class="desc">
        A motivated and detail-oriented individual with a strong commitment to academic and professional growth. 
        Possesses excellent organizational, communication, and problem-solving skills, with the ability to adapt to new challenges and environments.
         Demonstrates a high level of responsibility, integrity, and dedication in all tasks undertaken. 
         Eager to learn and continuously improve, with a proactive approach to achieving goals. Capable of working both independently and collaboratively to deliver effective and efficient results.
      </p>
    </div>
    <div class="team-card">
      <img src="https://randomuser.me/api/portraits/men/3.jpg">
      <h4>Bishrut Adhikari</h4>
      <p class="role">Backend Engineer</p>
      <p class="desc">
        Designs modern and user-friendly interfaces for better experience.
      </p>
    </div>
    <div class="team-card">
      <img src="https://randomuser.me/api/portraits/women/4.jpg">
      <h4>Kritee Khadka</h4>
      <p class="role">Frontend Developer</p>
      <p class="desc">
        I am Kritee Khadka, a Bachelor in Computing student with an interest in frontend development and database management. 
        I have practical experience in HTML, CSS, and MySQL, allowing me to build responsive, user-friendly web interfaces and manage structured data efficiently. 
        I focus on creating functional and visually appealing applications, and I am currently developing a jersey selling system as part of my coursework, 
        which applies my skills in frontend design and database management to simulate an e-commerce platform.
      </p>
    </div>
    <div class="team-card">
      <img src="https://randomuser.me/api/portraits/women/5.jpg">
      <h4>Manisha Shah</h4>
      <p class="role">Frontend Developer</p>
      <p class="desc">
       I am Manisha Shah, a passionate computing student currently pursuing my bachelor’s degree.
       I have a strong interest in web development and enjoy learning technologies like HTML, Python, and Java.
        In this group project, I contributed to building a jersey-selling website while improving my teamwork, problem-solving, and practical development skills. 
        I am motivated to keep learning and growing in the field of technology.
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