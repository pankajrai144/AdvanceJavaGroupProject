<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>World Cup Nations – JerseyPasal</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/heaader.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Nations.css">
</head>
<body>

<jsp:include page="/components/header.jsp"/>

<section class="nation-top-section">
    <p class="small-red-title">2026 FIFA World Cup</p>
    <h1>Find Your <span>Nation</span></h1>
    <p class="top-section-text">Official jerseys from every competing nation. Pick your flag, own your kit.</p>
</section>

<section class="jersey-info-section">
    <p class="small-red-title">Official Kits</p>
    <h2>Newest 2026 FIFA Jerseys</h2>
    <p>Every strip is crafted to the official match specification — the same breathable, performance-grade fabric worn on the pitch by the world's best. Every shirt ships with the official FIFA World Cup tournament badge.</p>
</section>

<section class="nation-products-section">
    <div class="nation-products-container">
        <p class="nation-products-title">Nation Jerseys</p>

        <c:if test="${not empty error}">
            <p class="jersey-description">${error}</p>
        </c:if>

        <div class="nation-products-list">

            <c:choose>
                <c:when test="${not empty nationProducts}">

                    <c:forEach var="product" items="${nationProducts}">

                        <a href="${pageContext.request.contextPath}/product?productId=${product.productId}" class="product-link">
                            <div class="product-box">
                                <div class="product-image-area">
                                    <c:choose>
                                        <c:when test="${not empty product.productImage}">
                                            <img src="${pageContext.request.contextPath}/getimage?productImage=${product.productImage}" alt="${product.jerseyName}" />
                                        </c:when>
                                        <c:otherwise>
                                            <div class="pd-no-image">
                                                <i class="fa-solid fa-image"></i>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>

                                    <div class="view-product-text">
                                        <span>View Details</span>
                                    </div>
                                </div>

                                <div class="product-details">
                                    <p class="team-name">${product.teamName}</p>
                                    <p class="jersey-name">${product.jerseyName}</p>
                                    <p class="jersey-description">${product.description}</p>
                                    <p class="jersey-price">£${product.price}</p>
                                </div>
                            </div>
                        </a>

                    </c:forEach>

                </c:when>

                <c:otherwise>
                    <div class="product-box">
                        <div class="product-details">
                            <p class="team-name">No Nation Jerseys Available</p>
                            <p class="jersey-description">Nation products added by admin will appear here.</p>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>

        </div>
    </div>
</section>

<section class="authentic-jersey-section">
    <div class="authentic-jersey-container">

        <div class="authentic-left-box">
            <img src="${pageContext.request.contextPath}/images/worldcup-authentic.jpg" alt="Authentic World Cup Jersey" class="authentic-background-image" />
            <div class="authentic-text-box">
                <i class="fa-solid fa-shield-halved"></i>
                <h2>100% Authentic<br>World Cup Jerseys</h2>
                <ul>
                    <li><i class="fa-solid fa-circle-check"></i> Official FIFA-licensed product</li>
                    <li><i class="fa-solid fa-circle-check"></i> Match-grade performance fabric</li>
                    <li><i class="fa-solid fa-circle-check"></i> Holographic authenticity tag included</li>
                    <li><i class="fa-solid fa-circle-check"></i> Tournament badge embroidered on chest</li>
                    <li><i class="fa-solid fa-circle-check"></i> Sourced direct from manufacturer</li>
                </ul>
                <a href="${pageContext.request.contextPath}/product" class="shop-all-button">Shop All World Cup Kits</a>
            </div>
        </div>

        <div class="video-section-box">
            <video src="${pageContext.request.contextPath}/videos/jersey-story.mp4" autoplay muted loop poster="${pageContext.request.contextPath}/images/video-poster.jpg"></video>
            <div class="video-text-box">
                <span>Behind the Kit</span>
                <p>How the 2026 World Cup jerseys were made</p>
            </div>
        </div>

    </div>
</section>

<%@ include file="/components/footer.jsp" %>

</body>
</html>