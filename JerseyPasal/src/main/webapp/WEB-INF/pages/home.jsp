<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=yes">
<title>Jersey Pasal | Official Football Jerseys Nepal</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/heaader.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
</head>
<body>

<jsp:include page="/components/header.jsp"/>

<div class="home-content-area">

  <div class="home-image-banner">
    <img src="<c:url value='/images/home.jpg'/>" alt="Fifa WorldCup">

    <div class="home-banner-overlay">
      <div class="home-banner-line"></div>
      <span class="home-banner-tag">Trusted by Football Fans Across Nepal</span>
		
		  <h2>
		    <span class="white-text">Where</span>
		    <span class="red-text">Football</span><br>
		    <span class="white-text">Dreams</span>
		    <span class="red-text">Begin</span>
		    <span class="white-text">in</span>
		    <span class="white-text">Nepal</span>
		</h2>

      <p>
        48 Nations. One Trophy. History Awaits. The biggest FIFA World Cup in history.
        Three nations, 104 matches, and the world watching every kick. Don't miss a moment.
      </p>

      <div class="home-banner-buttons">
        <form action="${pageContext.request.contextPath}/product" method="get">
          <button type="submit" class="home-btn-red">
            Shop Collection <i class="fas fa-store"></i>
          </button>
        </form>

        <form action="${pageContext.request.contextPath}/nation" method="get">
          <button type="submit" class="home-btn-outline">
            Team Jerseys <i class="fa-solid fa-shirt"></i>
          </button>
        </form>
      </div>
    </div>
  </div>

  <section class="home-section">
    <div class="home-sec-title"><i class="fa-solid fa-trophy"></i> The 48-Team Revolution</div>
    <div class="home-sec-sub">For the first time ever, 48 nations will battle for football's ultimate prize. More dreams. More drama. More history.</div>

    <div class="home-story-grid">
      <div class="home-story-card">
        <div class="home-story-icon"><i class="fa-solid fa-globe-americas"></i></div>
        <h3>Global Expansion</h3>
        <p>16 additional nations get their shot at glory. From debutants to dark horses, every continent is represented like never before.</p>
      </div>

      <div class="home-story-card">
        <div class="home-story-icon"><i class="fa-solid fa-diagram-project"></i></div>
        <h3>New Format</h3>
        <p>12 groups of 4, then a knockout round of 32. Every match matters from the very first whistle.</p>
      </div>

      <div class="home-story-card">
        <div class="home-story-icon"><i class="fa-solid fa-users"></i></div>
        <h3>5 Million Fans</h3>
        <p>Expected attendance across 16 world-class stadiums. The largest sporting event in human history.</p>
      </div>
    </div>
  </section>

  <section class="home-section">
    <div class="home-sec-title"><i class="fa-solid fa-fire"></i> Top Selling Jerseys</div>
    <div class="home-sec-sub">Fan favorites that everyone is wearing right now</div>

    <div class="home-cities-grid">

      <c:choose>
        <c:when test="${not empty topSellingProducts}">
          <c:forEach var="product" items="${topSellingProducts}">
            <a href="${pageContext.request.contextPath}/product?productId=${product.productId}" class="home-city-card">
              <c:choose>
                <c:when test="${not empty product.productImage}">
                  <img src="${pageContext.request.contextPath}/getimage?productImage=${product.productImage}" alt="${product.jerseyName}">
                </c:when>

                <c:otherwise>
                  <div class="home-no-product-image">
                    <i class="fa-solid fa-image"></i>
                  </div>
                </c:otherwise>
              </c:choose>

              <div class="home-city-overlay">
                <h3>${product.jerseyName}</h3>
                <p>${product.teamName} · £${product.price}</p>
              </div>
            </a>
          </c:forEach>
        </c:when>

        <c:otherwise>
          <div class="home-empty-product-box">
            <p>No top selling jerseys available yet.</p>
          </div>
        </c:otherwise>
      </c:choose>

    </div>
  </section>

  <section class="home-section">
    <div class="home-stadium-section">
      <div class="home-stadium-text">
        <h3><i class="fa-solid fa-gift"></i> The Perfect Gift for Football Lovers</h3>

        <p>
          Birthday? Anniversary? Just because? A personalized jersey is the ultimate gift.
          We'll pack it beautifully and deliver with a smile.
        </p>

        <form action="${pageContext.request.contextPath}/product" method="get" class="home-gift-form">
          <button type="submit" class="home-btn-red home-gift-btn">
            Shop to Gift <i class="fa-solid fa-arrow-right"></i>
          </button>
        </form>
      </div>

      <div class="home-stadium-image">
        <img src="<c:url value='/images/gift.jpg'/>" alt="Gift Box with Jersey">
      </div>
    </div>
  </section>

  <section class="home-section">
    <div class="home-sec-title"><i class="fa-regular fa-bell"></i> New Arrivals</div>
    <div class="home-sec-sub">Fresh jerseys just landed in Nepal</div>

    <div class="home-cities-grid">

      <c:choose>
        <c:when test="${not empty newArrivalProducts}">
          <c:forEach var="product" items="${newArrivalProducts}">
            <a href="${pageContext.request.contextPath}/product?productId=${product.productId}" class="home-city-card">
              <c:choose>
                <c:when test="${not empty product.productImage}">
                  <img src="${pageContext.request.contextPath}/getimage?productImage=${product.productImage}" alt="${product.jerseyName}">
                </c:when>

                <c:otherwise>
                  <div class="home-no-product-image">
                    <i class="fa-solid fa-image"></i>
                  </div>
                </c:otherwise>
              </c:choose>

              <div class="home-city-overlay">
                <h3>${product.jerseyName}</h3>
                <p>${product.teamName} · £${product.price}</p>
              </div>
            </a>
          </c:forEach>
        </c:when>

        <c:otherwise>
          <div class="home-empty-product-box">
            <p>No new arrivals available yet.</p>
          </div>
        </c:otherwise>
      </c:choose>

    </div>
  </section>

  <div class="home-contact-simple">
    <h2><i class="fa-regular fa-message"></i> Questions?</h2>
    <p>Call or WhatsApp us: <strong>+977 9843411719</strong></p>
    <p>Or DM us on Instagram <strong>@jerseypasal</strong></p>
  </div>

</div>

<%@ include file="/components/footer.jsp" %>

</body>
</html>
