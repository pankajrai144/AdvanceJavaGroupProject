<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admindashboard.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

</head>
<body>

<div class="dashboard">
  <aside class="sidebar">
    <div class="logo">Admin Dashboard</div>

    <div class="admin-profile">
      <div class="admin-profile-img-box">
        <img src="${pageContext.request.contextPath}/getimage?email=${sessionScope.loggedInUser.email}" 
             alt="Admin Profile"
             class="admin-profile-img">
      </div>

      <h4>Admin</h4>
      <p>${sessionScope.loggedInUser.email}</p>
    </div>

    <ul>
      <li class="active"><i class="fa fa-chart-line"></i> Dashboard</li>
      <li><i class="fa fa-box"></i> Products</li>
      <li><i class="fa fa-shopping-cart"></i> Orders</li>
      <li><i class="fa fa-users"></i> Customers</li>
      <li><i class="fa fa-credit-card"></i> Payments</li>
      <li><i class="fa fa-chart-pie"></i> Analytics</li>
      <li><i class="fa fa-tags"></i> Categories</li>
      <li><i class="fa fa-cog"></i> Settings</li>
    </ul>

    <a href="${pageContext.request.contextPath}/logout" class="logout">
      <i class="fa fa-sign-out-alt"></i> Logout
    </a>
  </aside>

  <main class="main">
    <div class="topbar">
      <h1>Dashboard Overview</h1>
      <div class="top-right">
        <input type="text" placeholder="Search..." />
        <i class="fa fa-bell"></i>
      </div>
    </div>

    <div class="stats">
      <div class="card"><h4>Total Revenue</h4><p>$12,400</p></div>
      <div class="card"><h4>Orders</h4><p>320</p></div>
      <div class="card"><h4>Customers</h4><p>150</p></div>
      <div class="card"><h4>Products</h4><p>85</p></div>
    </div>

    <div class="grid">

      <div class="box">
        <h3>Recent Orders</h3>
        <table>
          <tr><th>ID</th><th>Customer</th><th>Status</th></tr>
          <tr><td>#101</td><td>John</td><td><span class="badge success">Delivered</span></td></tr>
          <tr><td>#102</td><td>Alice</td><td><span class="badge pending">Pending</span></td></tr>
        </table>
      </div>

      <div class="box">
        <h3>Top Selling Jerseys</h3>
        <p>Argentina - 120 sales</p>
        <p>Brazil - 95 sales</p>
        <p>France - 80 sales</p>
      </div>

      <div class="box">
        <h3>Inventory (Rack)</h3>
        <p>Argentina → Rack A2</p>
        <p>Brazil → Rack B1</p>
        <p>France → Rack C3</p>
      </div>

      <div class="box">
        <h3>Payments</h3>
        <p>eSewa: $4000</p>
        <p>Khalti: $2500</p>
        <p>Stripe: $1900</p>
      </div>

    </div>

    <div class="section">
      <h2>Product Management</h2>

      <form class="form-grid">
        <input type="text" placeholder="Jersey Name">
        <input type="text" placeholder="Team Name">
        <input type="text" placeholder="Size (S, M, L, XL)">
        <input type="text" placeholder="Season (2025/26)">
        <input type="number" placeholder="Price">
        <input type="number" placeholder="Stock Quantity">
        <input type="text" placeholder="Category">
        <input type="file">
        <button type="submit">Add Product</button>
      </form>
    </div>

    <div class="section">
      <h2>Order Management</h2>

      <table>
        <tr>
          <th>ID</th>
          <th>Customer</th>
          <th>Status</th>
          <th>Action</th>
        </tr>
        <tr>
          <td>#101</td>
          <td>John</td>
          <td>Pending</td>
          <td>
            <button>Ship</button>
            <button>Deliver</button>
            <button>Cancel</button>
          </td>
        </tr>
      </table>
    </div>

    <!-- USER MANAGEMENT SECTION -->
    <div class="section">
      <h2>User Management</h2>

      <c:if test="${param.denied == 'true'}">
        <p class="success-message">User account has been denied successfully.</p>
      </c:if>

      <c:if test="${param.error == 'true'}">
        <p class="error-message">Something went wrong. Please try again.</p>
      </c:if>

      <table>
        <tr>
          <th>Name</th>
          <th>Email</th>
          <th>Status</th>
          <th>Action</th>
        </tr>

        <c:forEach var="user" items="${users}">
          <tr>
            <td>${user.fullname}</td>
            <td>${user.email}</td>

            <td>
              <c:choose>
                <c:when test="${user.approval_status == 'denied'}">
                  <span class="badge denied">Denied</span>
                </c:when>

                <c:when test="${user.approval_status == 'deleted'}">
                  <span class="badge denied">Deleted</span>
                </c:when>

                <c:otherwise>
                  <span class="badge success">Approved</span>
                </c:otherwise>
              </c:choose>
            </td>

            <td>
              <c:choose>
                <c:when test="${user.approval_status == 'denied'}">
                  <button disabled>Denied</button>
                </c:when>

                <c:when test="${user.approval_status == 'deleted'}">
                  <button disabled>Deleted</button>
                </c:when>

                <c:otherwise>
                  <form action="${pageContext.request.contextPath}/denyuser" method="post"
                        onsubmit="return confirm('Are you sure you want to deny this user?');">
                    <input type="hidden" name="userid" value="${user.userid}">
                    <button type="submit" class="deny-btn">Deny</button>
                  </form>
                </c:otherwise>
              </c:choose>
            </td>
          </tr>
        </c:forEach>
      </table>

      <c:if test="${empty users}">
        <p>No users found.</p>
      </c:if>
    </div>

    <div class="section">
      <h2>Category Management</h2>

      <input type="text" placeholder="New Category">
      <button>Add Category</button>

      <p>Club Jerseys</p>
      <p>National Jerseys</p>
      <p>Retro Jerseys</p>
    </div>

    <div class="section">
      <h2>Analytics</h2>

      <p>Sales Trend</p>
      <p>Top Categories</p>
      <p>Most Viewed Products</p>
    </div>

  </main>
</div>

</body>
</html>