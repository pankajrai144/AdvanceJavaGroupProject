<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<style>
.navbar {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 15px 60px;
  border-bottom: 1px solid #eee;
  gap: 20px;
  background: #fff;
}
.logo {
  font-size: 22px;
  font-weight: 600;
  white-space: nowrap;
}
.nav-center {
  flex: 1;
  display: flex;
  justify-content: center;
}
.search-box {
  display: flex;
  align-items: center;
  background: #f5f5f5;
  border-radius: 30px;
  border: 1px solid #ddd;
  padding: 5px 10px;
  width: 320px;
}

.search-box input {
  border: none;
  outline: none;
  background: transparent;
  padding: 8px;
  width: 100%;
}

.search-box button {
  background: black;
  border: none;
  color: white;
  border-radius: 50%;
  width: 34px;
  height: 34px;
  cursor: pointer;
}
.nav-right {
  display: flex;
  align-items: center;
  gap: 18px;
}

.nav-right a {
  text-decoration: none;
  color: #333;
  font-size: 14px;
}
.dropdown {
  position: relative;
}

.dropdown-menu {
  position: absolute;
  top: 110%;
  left: 0;
  background: white;
  border: 1px solid #eee;
  border-radius: 8px;
  display: none;
  min-width: 180px;
  padding: 8px 0;
  box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

.dropdown:hover .dropdown-menu {
  display: block;
}
.dropdown-menu a {
  display: block;
  padding: 12px 16px;
  color: #333;
  border-bottom: 1px solid #eee;   
}

.dropdown-menu a:last-child {
  border-bottom: none;   
}
.login-btn {
  background: black;
  color: white !important;
  padding: 8px 18px;
  border-radius: 20px;
}
.wishlist,
.cart {
  background: black;
  color: white;
  padding: 8px 12px;
  border-radius: 20px;
  display: flex;
  align-items: center;
  gap: 6px;
  cursor: pointer;
}
.wishlist i,
.cart i {
  color: white !important;
  font-size: 15px;
}

</style>
<div class="navbar">

  <div class="logo"></div>

  <div class="nav-center">
    <div class="search-box">
      <input type="text" placeholder="Search here...">
      <button><i class="fa-solid fa-magnifying-glass"></i></button>
    </div>
  </div>

  <div class="nav-right">
    
    <a href="index.jsp">Home</a>

    <div class="dropdown">
      <a href="#">Jersey ▾</a>
      <div class="dropdown-menu">
        <a href="#">Club Jerseys</a>
        <a href="#">National Jerseys</a>
      </div>
    </div>

    <a href="#">Best Sellers</a>
    <a href="about.jsp">About Us</a>

    <a href="login.jsp" class="login-btn">Sign In</a>
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