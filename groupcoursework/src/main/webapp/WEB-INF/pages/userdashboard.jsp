<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userdashboard.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>

<body>

<div class="dashboard-container">
  <div class="sidebar">

    <h2>
      <a href="index.jsp" class="logo-link">JerseyPasal</a>
    </h2>

    <ul class="sidebar-menu">

      <li>
        <a href="index.jsp" class="menu-link">
          <i class="fa-solid fa-globe"></i> Home
        </a>
      </li>

      <li>
        <a href="#" class="menu-link active">
          <i class="fa-solid fa-house"></i> Dashboard
        </a>
      </li>

      <li>
        <a href="orders.jsp" class="menu-link">
          <i class="fa-solid fa-box"></i> Orders
        </a>
      </li>

      <li>
        <a href="cart.jsp" class="menu-link">
          <i class="fa-solid fa-cart-shopping"></i> Cart
        </a>
      </li>

      <li>
        <a href="wishlist.jsp" class="menu-link">
          <i class="fa-regular fa-heart"></i> Wishlist
        </a>
      </li>

      <li>
        <a href="profile.jsp" class="menu-link">
          <i class="fa-solid fa-user"></i> Profile
        </a>
      </li>

      <li>
        <a href="settings.jsp" class="menu-link">
          <i class="fa-solid fa-gear"></i> Settings
        </a>
      </li>

      <li>
        <a href="logout" class="menu-link">
          <i class="fa-solid fa-right-from-bracket"></i> Logout
        </a>
      </li>

    </ul>
  </div>
  <div class="main-content">
    <div class="top-bar">

      <div class="search-box">
        <input type="text" placeholder="Search...">
        <i class="fa fa-search"></i>
      </div>

      <div class="user-info">
        <span>Pankaj Rai</span>
        <div class="avatar">P</div>
      </div>

    </div>
    <div class="stats">

      <div class="stat-card">
        <i class="fa-solid fa-box"></i>
        <h4>Orders</h4>
        <p>3</p>
      </div>

      <div class="stat-card">
        <i class="fa-solid fa-cart-shopping"></i>
        <h4>Cart</h4>
        <p>3</p>
      </div>

      <div class="stat-card">
        <i class="fa-regular fa-heart"></i>
        <h4>Wishlist</h4>
        <p>2</p>
      </div>

      <div class="stat-card">
        <i class="fa-solid fa-star"></i>
        <h4>Reviews</h4>
        <p>4</p>
      </div>

    </div>
    <div class="card-grid">

      <div class="card">
        <h3><i class="fa-solid fa-user"></i> Account Info</h3>
        <p><strong>Name:</strong> Pankaj Rai</p>
        <p><strong>Email:</strong> pankajraiokladhunga@gmail.com</p>
        <button>Edit Profile</button>
      </div>

      <div class="card">
        <h3><i class="fa-solid fa-box"></i> Orders</h3>
        <p>You have 3 orders</p>
        <button>View Orders</button>
      </div>

      <div class="card">
        <h3><i class="fa-solid fa-cart-shopping"></i> Cart</h3>
        <p>3 items in cart</p>
        <button>Go to Cart</button>
      </div>

      <div class="card">
        <h3><i class="fa-regular fa-heart"></i> Wishlist</h3>
        <p>2 saved items</p>
        <button>View Wishlist</button>
      </div>
    </div>
    <div class="bottom-section">

      <div class="table-card">
        <h3>Recent Orders</h3>

        <table>
          <thead>
            <tr>
              <th>ID</th>
              <th>Product</th>
              <th>Status</th>
            </tr>
          </thead>

          <tbody>
            <tr>
              <td>#1</td>
              <td>Argentina Jersey</td>
              <td><span class="badge success">Delivered</span></td>
            </tr>

            <tr>
              <td>#2</td>
              <td>Brazil Jersey</td>
              <td><span class="badge pending">Pending</span></td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="table-card">
        <h3>Notifications</h3>

        <div class="notification">New offer available</div>
        <div class="notification">Order is being processed</div>

      </div>

    </div>

  </div>

</div>

</body>
</html>
