<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

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
      <a href="${pageContext.request.contextPath}/index.jsp" class="logo-link">JerseyPasal</a>
    </h2>

    <ul class="sidebar-menu">

      <li>
        <a href="${pageContext.request.contextPath}/home" class="menu-link">
          <i class="fa-solid fa-globe"></i> Home
        </a>
      </li>

      <li>
        <a href="#" class="menu-link active">
          <i class="fa-solid fa-house"></i> Dashboard
        </a>
      </li>

      <li>
        <a href="#myOrders" class="menu-link">
          <i class="fa-solid fa-box"></i> Orders
        </a>
      </li>

      <li>
        <a href="${pageContext.request.contextPath}/cart" class="menu-link">
          <i class="fa-solid fa-cart-shopping"></i> Cart
        </a>
      </li>

      <li>
        <a href="${pageContext.request.contextPath}/wishlist" class="menu-link">
          <i class="fa-regular fa-heart"></i> Wishlist
        </a>
      </li>

      <li>
        <a href="${pageContext.request.contextPath}/profile" class="menu-link">
          <i class="fa-solid fa-user"></i> Profile
        </a>
      </li>

      <li>
        <form action="${pageContext.request.contextPath}/confirmdelete" 
              method="get"
              class="delete-account-form">

          <button type="submit" class="menu-link delete-account-btn">
            <i class="fa-solid fa-user-slash"></i> Delete Account
          </button>

        </form>
      </li>

      <li class="logout-menu-item">
        <a href="${pageContext.request.contextPath}/logout" class="menu-link logout-link">
          <i class="fa-solid fa-right-from-bracket"></i>
          <span>Logout</span>
        </a>
      </li>

    </ul>
  </div>

  <div class="main-content">
    <div class="top-bar">

      <div></div>

      <div class="user-info">
        <span>${sessionScope.loggedInUser.email}</span>

        <div class="avatar-img-box">
          <img src="${pageContext.request.contextPath}/getimage?email=${sessionScope.loggedInUser.email}" 
               alt="Profile Picture"
               class="avatar-img">
        </div>
      </div>

    </div>

    <c:out value="${dashboardMessage}" escapeXml="false" />

    <div class="stats">

      <div class="stat-card">
        <i class="fa-solid fa-box"></i>
        <h4>Orders</h4>
        <p>${fn:length(userOrders)}</p>
      </div>

      <div class="stat-card">
        <i class="fa-solid fa-cart-shopping"></i>
        <h4>Cart</h4>
        <p>${cartCount}</p>
      </div>

      <div class="stat-card">
        <i class="fa-regular fa-heart"></i>
        <h4>Wishlist</h4>
        <p>${wishlistCount}</p>
      </div>

      <div class="stat-card">
        <i class="fa-solid fa-star"></i>
        <h4>Reviews</h4>
        <p>${reviewCount}</p>
      </div>

    </div>

    <div class="card-grid">

      <div class="card">
        <h3><i class="fa-solid fa-user"></i> Account Info</h3>
        <p><strong>Email:</strong> ${sessionScope.loggedInUser.email}</p>
        <a href="${pageContext.request.contextPath}/profile" class="back-link">
          <button>View Profile</button>
        </a>
      </div>

      <div class="card">
        <h3><i class="fa-solid fa-box"></i> Orders</h3>
        <p>You have ${fn:length(userOrders)} orders</p>
        <a href="#myOrders" class="back-link">
          <button>View Orders</button>
        </a>
      </div>

      <div class="card">
        <h3><i class="fa-solid fa-cart-shopping"></i> Cart</h3>
        <p>View products added to your cart</p>
        <a href="${pageContext.request.contextPath}/cart" class="back-link">
          <button>Go to Cart</button>
        </a>
      </div>

      <div class="card">
        <h3><i class="fa-regular fa-heart"></i> Wishlist</h3>
        <p>View your saved jerseys</p>
        <a href="${pageContext.request.contextPath}/wishlist" class="back-link">
          <button>View Wishlist</button>
        </a>
      </div>
    </div>

    <div class="bottom-section" id="myOrders">

      <div class="table-card order-history-card">
        <h3>My Orders</h3>

        <c:choose>
          <c:when test="${not empty userOrders}">

            <table>
              <thead>
                <tr>
                  <th>Order ID</th>
                  <th>Product</th>
                  <th>Size</th>
                  <th>Qty</th>
                  <th>Total</th>
                  <th>Status</th>
                  <th>Review</th>
                </tr>
              </thead>

              <tbody>
                <c:forEach var="order" items="${userOrders}">
                  <c:set var="orderItems" value="${orderItemsMap[order.orderId]}" />

                  <c:forEach var="item" items="${orderItems}">
                    <c:set var="reviewKey" value="${order.orderId}_${item.productId}" />
                    <c:set var="alreadyReviewed" value="${reviewedMap[reviewKey]}" />

                    <tr>
                      <td>#${order.orderId}</td>
                      <td>${item.product.jerseyName}</td>
                      <td>${item.selectedSize}</td>
                      <td>${item.quantity}</td>
                      <td>£${item.itemTotal}</td>

                      <td>
                        <c:choose>
                          <c:when test="${order.orderStatus == 'Delivered'}">
                            <span class="badge success">Delivered</span>
                          </c:when>

                          <c:when test="${order.orderStatus == 'Cancelled'}">
                            <span class="badge denied">Cancelled</span>
                          </c:when>

                          <c:otherwise>
                            <span class="badge pending">${order.orderStatus}</span>
                          </c:otherwise>
                        </c:choose>
                      </td>

                      <td>
                        <c:choose>
                          <c:when test="${order.orderStatus == 'Delivered' && alreadyReviewed == true}">
                            <span class="review-done-label">Reviewed</span>
                          </c:when>

                          <c:when test="${order.orderStatus == 'Delivered'}">
                            <a href="${pageContext.request.contextPath}/review?productId=${item.productId}&orderId=${order.orderId}" class="write-review-link">
                              Write Review
                            </a>
                          </c:when>

                          <c:otherwise>
                            <span class="review-disabled-label">Available after delivery</span>
                          </c:otherwise>
                        </c:choose>
                      </td>
                    </tr>
                  </c:forEach>
                </c:forEach>
              </tbody>
            </table>

          </c:when>

          <c:otherwise>
            <div class="notification">You have not placed any orders yet.</div>
          </c:otherwise>
        </c:choose>
      </div>

    </div>

  </div>

</div>

</body>
</html>