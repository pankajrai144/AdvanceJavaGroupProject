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
      <li><i class="fa fa-cog"></i> Settings</li>
    </ul>

    <a href="${pageContext.request.contextPath}/logout" class="logout">
      <i class="fa fa-sign-out-alt"></i> Logout
    </a>
  </aside>

  <main class="main">
    <div class="topbar">
      <h1>Dashboard Overview</h1>
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

    </div>

    <div class="section">
      <h2>Product Management</h2>

      <c:out value="${adminMessage}" escapeXml="false" />

      <form class="form-grid" action="${pageContext.request.contextPath}/adminproduct" method="post" enctype="multipart/form-data">
        <input type="text" name="jerseyName" placeholder="Jersey Name">
        <input type="text" name="teamName" placeholder="Team Name">

        <div class="product-size-group">
          <span class="product-size-title">Available Sizes</span>

          <label>
            <input type="checkbox" name="size" value="XS">
            <span>XS</span>
          </label>

          <label>
            <input type="checkbox" name="size" value="S">
            <span>S</span>
          </label>

          <label>
            <input type="checkbox" name="size" value="M">
            <span>M</span>
          </label>

          <label>
            <input type="checkbox" name="size" value="L">
            <span>L</span>
          </label>

          <label>
            <input type="checkbox" name="size" value="XL">
            <span>XL</span>
          </label>

          <label>
            <input type="checkbox" name="size" value="XXL">
            <span>XXL</span>
          </label>
        </div>

        <input type="text" name="season" placeholder="Season (2025/26)">
        <input type="number" step="0.01" name="price" placeholder="Price">
        <input type="number" name="stockQuantity" placeholder="Stock Quantity">

        <select name="category">
          <option value="">Select Category</option>
          <option value="Club">Club</option>
          <option value="Nation">Nation</option>
        </select>

        <input type="text" name="description" placeholder="Descriptions">

        <div class="product-image-upload">
          <input type="file" id="productImages" name="productImages" accept="image/*" multiple>
          <label for="productImages" class="product-upload-label">
            <i class="fa-solid fa-cloud-arrow-up"></i>
            <span>Choose 4 Product Images</span>
          </label>
        </div>

        <button type="submit">Add Product</button>
      </form>

      <h3 class="table-title">Product List</h3>

      <table>
        <tr>
          <th>Image</th>
          <th>Jersey</th>
          <th>Team</th>
          <th>Size</th>
          <th>Season</th>
          <th>Price</th>
          <th>Stock</th>
          <th>Category</th>
          <th>Action</th>
        </tr>

        <c:out value="${productRows}" escapeXml="false" />
      </table>
    </div>

    <div class="section">
      <h2>Order Management</h2>

      <table>
        <tr>
          <th>Order ID</th>
          <th>Customer Name</th>
          <th>Total</th>
          <th>Status</th>
          <th>Order Date</th>
          <th>Update Status</th>
        </tr>

        <c:out value="${orderRows}" escapeXml="false" />
      </table>
    </div>

    <div class="section">
      <h2>User Management</h2>

      <table>
        <tr>
          <th>Name</th>
          <th>Email</th>
          <th>Status</th>
          <th>Action</th>
        </tr>

        <c:out value="${userRows}" escapeXml="false" />
      </table>
    </div>

  </main>
</div>

</body>
</html>