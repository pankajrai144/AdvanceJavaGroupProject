<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored='false' %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PrimeJerseys Dashboard</title>

<link rel="stylesheet" type="text/css"
    href="${pageContext.request.contextPath}/css/dashboard.css" />
</head>
<body>

<!-- 🔥 HEADER -->
<div class="header">
    <div class="logo">PrimeJerseys</div>

    <div class="header-right">
        <input type="text" placeholder="Search jerseys..." class="search-box">

        <a href="#" class="header-link">Cart</a>
        <a href="#" class="header-link">Wishlist</a>

        <div class="user-icon">P</div>
    </div>
</div>

<div class="dashboard-container">

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Dashboard</h2>

        <div class="profile-box">
            <div class="profile-circle">P</div>
            <h3>Pankaj Rai</h3>
            <p>pankaj123</p>
        </div>

        <ul class="sidebar-menu">
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Cart</a></li>
            <li><a href="#">Wishlist</a></li>
            <li><a href="#">Logout</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="top-bar">
            <h1>Welcome to PrimeJerseys 👋</h1>
            <p>Manage your account, cart, and wishlist from here.</p>
        </div>

        <div class="card-grid">

            <!-- Account Info -->
            <div class="card">
                <h2>Account Info</h2>

                <div class="info-row">
                    <span class="label">Username</span>
                    <span class="value">pankaj123</span>
                </div>

                <div class="info-row">
                    <span class="label">Full Name</span>
                    <span class="value">Pankaj Rai</span>
                </div>

                <div class="info-row">
                    <span class="label">Contact</span>
                    <span class="value">+61 412 345 678</span>
                </div>
            </div>

            <!-- Profile -->
            <div class="card">
                <h2>Profile</h2>

                <div class="info-row">
                    <span class="label">Gender</span>
                    <span class="value">Male</span>
                </div>

                <div class="info-row">
                    <span class="label">Address</span>
                    <span class="value">Sydney, NSW, Australia</span>
                </div>
            </div>

            <!-- Cart -->
            <div class="card">
                <h2>Cart</h2>
                <div class="info-row">
                    <span class="label">Items in Cart</span>
                    <span class="value">3 Jerseys added</span>
                </div>
                <a href="#" class="action-btn cart-btn">Go to Cart</a>
            </div>

            <!-- Wishlist -->
            <div class="card">
                <h2>Wishlist</h2>
                <div class="info-row">
                    <span class="label">Saved Items</span>
                    <span class="value">2 Jerseys saved</span>
                </div>
                <a href="#" class="action-btn wishlist-btn">Go to Wishlist</a>
            </div>

            <!-- Logout -->
            <div class="card">
                <h2>Logout</h2>
                <div class="info-row">
                    <span class="label">Session</span>
                    <span class="value">Click below to logout safely.</span>
                </div>
                <a href="#" class="action-btn logout-btn">Logout</a>
            </div>

        </div>
    </div>

</div>

</body>
</html>