<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FIFA 2026 Jersey Store</title>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">

<!-- FONT AWESOME -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">

  <!-- LEFT -->
  <div class="logo">⚽ FIFA 2026</div>

  <!-- CENTER -->
  <div class="nav-center">
    <div class="search-box">
      <input type="text" placeholder="Search here...">
      <button><i class="fa fa-search"></i></button>
    </div>
  </div>

  <!-- RIGHT -->
  <div class="nav-right">
    <a href="#">Home</a>

    <div class="dropdown">
      <a href="#">Jersey ▾</a>
      <div class="dropdown-menu">
        <a href="#">Club Jerseys</a>
        <a href="#">National Jerseys</a>
      </div>
    </div>

    <a href="#">Best Sellers</a>
    <a href="#">About Us</a>

    <a href="#" class="login-btn">Login</a>

    <div class="wishlist">
      <i class="fa-regular fa-heart"></i>
      <span id="wish-count">0</span>
    </div>

    <div class="cart">
      <i class="fa-solid fa-cart-shopping"></i>
      <span id="count">0</span>
    </div>
  </div>

</div>