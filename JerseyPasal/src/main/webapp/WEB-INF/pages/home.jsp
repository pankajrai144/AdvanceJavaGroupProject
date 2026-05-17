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
        <span class="white-text">Where Football</span><br>
        <span class="white-text">Dreams Begin in</span>
        <span class="red-text">Nepal</span>
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
    <div class="home-sec-title"><i class="fa-regular fa-star"></i> Why Choose Jersey Pasal</div>
    <div class="home-sec-sub">Your trusted destination for authentic football jerseys and World Cup 2026 merchandise</div>

    <div class="home-why-grid">
      <div class="home-why-card">
        <span class="home-why-icon"><i class="fa-regular fa-circle-check"></i></span>
        <h3>100% Authentic</h3>
        <p>Every jersey is sourced from licensed manufacturers authentic or clearly labelled replica. Never fake.</p>
      </div>

      <div class="home-why-card">
        <span class="home-why-icon"><i class="fa-solid fa-money-bill-wave"></i></span>
        <h3>Cash on Delivery</h3>
        <p>Pay when you receive your jersey. Available across Nepal. No hidden charges.</p>
      </div>

      <div class="home-why-card">
        <span class="home-why-icon"><i class="fa-solid fa-arrow-rotate-left"></i></span>
        <h3>Easy Returns</h3>
        <p>Changed your mind? Free 30-day returns on all unworn jerseys with no questions asked.</p>
      </div>

      <div class="home-why-card">
        <span class="home-why-icon"><i class="fa-solid fa-lock"></i></span>
        <h3>Secure Payment</h3>
        <p>Shop with confidence. We accept all major cards, PayPal, and buy-now-pay-later options.</p>
      </div>

      <div class="home-why-card">
        <span class="home-why-icon"><i class="fa-solid fa-print"></i></span>
        <h3>Custom Printing</h3>
        <p>Add your name and number to any jersey. Official font, official feel ready in 48 hours.</p>
      </div>

      <div class="home-why-card">
        <span class="home-why-icon"><i class="fa-solid fa-handshake"></i></span>
        <h3>Official Partnerships</h3>
        <p>Partnered with Adidas, Nike, Puma and more for direct access to the latest drops.</p>
      </div>

      <div class="home-why-card">
        <span class="home-why-icon"><i class="fa-solid fa-headset"></i></span>
        <h3>24/7 Support</h3>
        <p>Our fan support team is always online chat, email, or WhatsApp, any time of day.</p>
      </div>

      <div class="home-why-card">
        <span class="home-why-icon"><i class="fa-solid fa-certificate"></i></span>
        <h3>Nepal's Number One Store</h3>
        <p>10,000+ happy customers. Most trusted jersey pasal in Nepal.</p>
      </div>
    </div>
  </section>

  <section class="home-section">
    <div class="home-sec-title"><i class="fa-regular fa-star"></i> Our Journey</div>
    <div class="home-sec-sub">From a small shop to Nepal's Number One jersey store</div>

    <div class="home-timeline">
      <div class="home-timeline-item">
        <div class="home-timeline-date">2013</div>
        <div class="home-timeline-content">
          <h3><i class="fa-solid fa-store"></i> Humble Beginnings</h3>
          <p>Started as a small jersey shop in Kathmandu</p>
        </div>
        <div class="home-timeline-dot"></div>
      </div>

      <div class="home-timeline-item">
        <div class="home-timeline-date">2024</div>
        <div class="home-timeline-content">
          <h3><i class="fa-solid fa-globe"></i> Online Store Launch</h3>
          <p>Brought authentic jerseys to every corner of Nepal</p>
        </div>
        <div class="home-timeline-dot"></div>
      </div>

      <div class="home-timeline-item">
        <div class="home-timeline-date">2025</div>
        <div class="home-timeline-content">
          <h3><i class="fa-solid fa-users"></i> 10,000+ Happy Customers</h3>
          <p>Nepal's most trusted name for football jerseys</p>
        </div>
        <div class="home-timeline-dot"></div>
      </div>

      <div class="home-timeline-item">
        <div class="home-timeline-date">2026</div>
        <div class="home-timeline-content">
          <h3><i class="fa-solid fa-trophy"></i> World Cup Collection</h3>
          <p>Official jerseys for all 48 Nations. Available now</p>
        </div>
        <div class="home-timeline-dot"></div>
      </div>
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