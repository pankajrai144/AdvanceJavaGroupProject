<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Wishlist | Jersey Pasal</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/heaader.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  background: #0f0f0f;
  color: #ffffff;
  font-family: Arial, sans-serif;
  min-height: 100vh;
}

.wishlist-page {
  background: #0f0f0f;
  padding: 55px 40px 80px;
}

.wishlist-container {
  max-width: 1200px;
  margin: 0 auto;
}

.wishlist-top-section {
  margin-bottom: 36px;
  text-align: center;
}

.small-red-title {
  font-size: 0.68rem;
  font-weight: 800;
  letter-spacing: 3px;
  text-transform: uppercase;
  color: #8b0d1f;
  margin-bottom: 14px;
}

.wishlist-top-section h1 {
  font-size: 2.8rem;
  font-weight: 900;
  text-transform: uppercase;
  color: #ffffff;
  letter-spacing: -1px;
  margin-bottom: 12px;
}

.wishlist-top-section h1 span {
  color: #8b0d1f;
}

.wishlist-top-section p {
  max-width: 540px;
  margin: 0 auto;
  color: #9b9b9b;
  font-size: 0.9rem;
  line-height: 1.7;
}

.wishlist-summary-row {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 18px;
  margin-bottom: 34px;
}

.wishlist-summary-box {
  background: #1a1a1a;
  border: 1px solid #292929;
  border-radius: 10px;
  padding: 22px;
  display: flex;
  align-items: center;
  gap: 16px;
}

.wishlist-summary-box i {
  width: 46px;
  height: 46px;
  background: rgba(139, 13, 31, 0.2);
  color: #ffccd5;
  border: 1px solid rgba(139, 13, 31, 0.45);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.1rem;
}

.summary-text span {
  display: block;
  color: #9b9b9b;
  font-size: 0.75rem;
  text-transform: uppercase;
  letter-spacing: 1.2px;
  margin-bottom: 5px;
  font-weight: 700;
}

.summary-text p {
  color: #ffffff;
  font-size: 1.35rem;
  font-weight: 900;
}

.wishlist-list {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 22px;
}

.wishlist-product-box {
  background: #161616;
  border: 1px solid #252525;
  border-radius: 8px;
  overflow: hidden;
  display: flex;
  flex-direction: column;
  transition: transform 0.25s ease, border-color 0.25s ease, box-shadow 0.25s ease;
}

.wishlist-product-box:hover {
  transform: translateY(-6px);
  border-color: #8b0d1f;
  box-shadow: 0 14px 30px rgba(0, 0, 0, 0.45);
}

.wishlist-image-area {
  position: relative;
  aspect-ratio: 3 / 4;
  background: #111111;
  overflow: hidden;
}

.wishlist-image-area img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
  transition: transform 0.35s ease, opacity 0.35s ease;
}

.wishlist-product-box:hover .wishlist-image-area img {
  transform: scale(1.04);
  opacity: 0.65;
}

.wishlist-heart {
  position: absolute;
  top: 14px;
  right: 14px;
  width: 38px;
  height: 38px;
  border-radius: 50%;
  background: rgba(15, 15, 15, 0.85);
  border: 1px solid #333333;
  color: #8b0d1f;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1rem;
}

.wishlist-product-info {
  padding: 20px;
  display: flex;
  flex-direction: column;
  flex: 1;
}

.team-name {
  font-size: 0.62rem;
  font-weight: 800;
  letter-spacing: 2.5px;
  text-transform: uppercase;
  color: #8b0d1f;
  margin-bottom: 6px;
}

.jersey-name {
  font-size: 1rem;
  font-weight: 900;
  text-transform: uppercase;
  color: #ffffff;
  margin-bottom: 10px;
}

.jersey-description {
  font-size: 0.8rem;
  color: #9b9b9b;
  line-height: 1.6;
  margin-bottom: 18px;
  min-height: 78px;
}

.jersey-price {
  font-size: 1.18rem;
  font-weight: 900;
  color: #ffffff;
  margin-bottom: 18px;
}

.wishlist-button-row {
  display: flex;
  gap: 10px;
  margin-top: auto;
}

.view-product-button,
.remove-wishlist-button {
  height: 42px;
  border-radius: 5px;
  font-size: 0.72rem;
  font-weight: 900;
  text-transform: uppercase;
  letter-spacing: 1px;
  text-decoration: none;
  border: none;
  cursor: pointer;
  transition: 0.22s ease;
  display: flex;
  align-items: center;
  justify-content: center;
}

.view-product-button {
  flex: 1;
  background: #8b0d1f;
  color: #ffffff;
}

.view-product-button:hover {
  background: #6a0917;
}

.remove-wishlist-button {
  width: 46px;
  background: #111111;
  color: #e74c3c;
  border: 1px solid #333333;
}

.remove-wishlist-button:hover {
  border-color: #e74c3c;
  background: rgba(231, 76, 60, 0.12);
}

.empty-note-box {
  background: #161616;
  border: 1px solid #252525;
  border-radius: 10px;
  padding: 34px;
  text-align: center;
  margin-top: 24px;
}

.empty-note-box i {
  color: #8b0d1f;
  font-size: 2.2rem;
  margin-bottom: 14px;
}

.empty-note-box h2 {
  font-size: 1.4rem;
  text-transform: uppercase;
  margin-bottom: 10px;
}

.empty-note-box p {
  color: #9b9b9b;
  font-size: 0.9rem;
  line-height: 1.6;
  margin-bottom: 20px;
}

.empty-note-box a {
  display: inline-block;
  background: #8b0d1f;
  color: #ffffff;
  text-decoration: none;
  padding: 12px 26px;
  border-radius: 5px;
  font-size: 0.75rem;
  font-weight: 900;
  text-transform: uppercase;
  letter-spacing: 1px;
}

.empty-note-box a:hover {
  background: #6a0917;
}

.wishlist-no-image {
  width: 100%;
  height: 100%;
  background: #111111;
  color: #9b9b9b;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 2rem;
}

@media (max-width: 950px) {
  .wishlist-summary-row,
  .wishlist-list {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 650px) {
  .wishlist-page {
    padding: 40px 18px 60px;
  }

  .wishlist-top-section h1 {
    font-size: 2rem;
  }

  .wishlist-summary-row,
  .wishlist-list {
    grid-template-columns: 1fr;
  }

  .wishlist-button-row {
    flex-direction: row;
  }
}
</style>
</head>

<body>

<jsp:include page="/components/header.jsp"/>

<section class="wishlist-page">
  <div class="wishlist-container">

    <div class="wishlist-top-section">
      <p class="small-red-title">Saved Jerseys</p>
      <h1>My <span>Wishlist</span></h1>
      <p>Products saved from the product page will appear here so they can be viewed again later.</p>
    </div>

    <c:set var="clubCount" value="0" />
    <c:set var="nationCount" value="0" />

    <c:forEach var="wish" items="${wishlistItems}">
      <c:if test="${wish.product.category == 'Club'}">
        <c:set var="clubCount" value="${clubCount + 1}" />
      </c:if>

      <c:if test="${wish.product.category == 'Nation'}">
        <c:set var="nationCount" value="${nationCount + 1}" />
      </c:if>
    </c:forEach>

    <div class="wishlist-summary-row">
      <div class="wishlist-summary-box">
        <i class="fa-regular fa-heart"></i>
        <div class="summary-text">
          <span>Saved Items</span>
          <p>${wishlistCount}</p>
        </div>
      </div>

      <div class="wishlist-summary-box">
        <i class="fa-solid fa-shirt"></i>
        <div class="summary-text">
          <span>Club Kits</span>
          <p>${clubCount}</p>
        </div>
      </div>

      <div class="wishlist-summary-box">
        <i class="fa-solid fa-globe"></i>
        <div class="summary-text">
          <span>Nation Kits</span>
          <p>${nationCount}</p>
        </div>
      </div>
    </div>

    <c:if test="${not empty error}">
      <div class="empty-note-box">
        <i class="fa-solid fa-triangle-exclamation"></i>
        <h2>Wishlist Error</h2>
        <p>${error}</p>
      </div>
    </c:if>

    <c:choose>
      <c:when test="${not empty wishlistItems}">

        <div class="wishlist-list">

          <c:forEach var="wish" items="${wishlistItems}">
            <div class="wishlist-product-box">

              <div class="wishlist-image-area">
                <c:choose>
                  <c:when test="${not empty wish.product.productImage}">
                    <img src="${pageContext.request.contextPath}/getimage?productImage=${wish.product.productImage}" alt="${wish.product.jerseyName}">
                  </c:when>
                  <c:otherwise>
                    <div class="wishlist-no-image">
                      <i class="fa-solid fa-image"></i>
                    </div>
                  </c:otherwise>
                </c:choose>

                <div class="wishlist-heart">
                  <i class="fa-solid fa-heart"></i>
                </div>
              </div>

              <div class="wishlist-product-info">
                <p class="team-name">${wish.product.teamName}</p>
                <p class="jersey-name">${wish.product.jerseyName}</p>
                <p class="jersey-description">${wish.product.description}</p>
                <p class="jersey-price">£${wish.product.price}</p>

                <div class="wishlist-button-row">
                  <a href="${pageContext.request.contextPath}/product?productId=${wish.product.productId}" class="view-product-button">View Product</a>

                  <a href="${pageContext.request.contextPath}/wishlist?productId=${wish.product.productId}&action=remove" class="remove-wishlist-button">
                    <i class="fa-solid fa-trash"></i>
                  </a>
                </div>
              </div>

            </div>
          </c:forEach>

        </div>

      </c:when>

      <c:otherwise>
        <div class="empty-note-box">
          <i class="fa-regular fa-heart"></i>
          <h2>Your wishlist is empty</h2>
          <p>Save products from the product page and they will appear here.</p>
          <a href="${pageContext.request.contextPath}/product">Browse Products</a>
        </div>
      </c:otherwise>
    </c:choose>

  </div>
</section>

</body>
</html>
