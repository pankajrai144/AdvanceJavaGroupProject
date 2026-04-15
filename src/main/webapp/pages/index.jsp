<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jersey Pasal</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
</head>
<body>
<jsp:include page="/components/header.jsp"/>
<div class="hero">
  <h1>World Cup 2026 Jerseys</h1>
</div>
<div class="container">
  <h2>Featured Jerseys</h2>
  <div class="grid">

    <div class="card">
      <div class="image-box">
        <img src="https://via.placeholder.com/200?text=Argentina">
      </div>
      <h3>Argentina</h3>
      <p class="price">$59</p>
      <button class="btn" onclick="add()">Add to Cart</button>
    </div>

    <div class="card">
      <div class="image-box">
        <img src="https://via.placeholder.com/200?text=Brazil">
      </div>
      <h3>Brazil</h3>
      <p class="price">$55</p>
      <button class="btn" onclick="add()">Add to Cart</button>
    </div>

    <div class="card">
      <div class="image-box">
        <img src="https://via.placeholder.com/200?text=France">
      </div>
      <h3>France</h3>
      <p class="price">$60</p>
      <button class="btn" onclick="add()">Add to Cart</button>
    </div>
  </div>
</div>
<jsp:include page="/components/footer.jsp"/>

</body>
</html>