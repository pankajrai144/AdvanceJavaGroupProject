<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Products | JerseyPasal</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/heaader.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/search.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>

<body>

<%@ include file="/components/header.jsp" %>

<section class="search-page-section">
    <div class="search-page-wrap">

        <div class="search-page-heading">
            <p>Product Search</p>

            <c:choose>
                <c:when test="${not empty searchKeyword}">
                    <h1>Search Results for "${searchKeyword}"</h1>
                </c:when>

                <c:otherwise>
                    <h1>Search Products</h1>
                </c:otherwise>
            </c:choose>
        </div>

        <c:if test="${not empty searchMessage}">
            <div class="search-message-box">
                ${searchMessage}
            </div>
        </c:if>

        <c:choose>
            <c:when test="${not empty searchProducts}">
                <div class="search-product-grid">

                    <c:forEach var="product" items="${searchProducts}">
                        <div class="search-product-card">

                            <a href="${pageContext.request.contextPath}/product?productId=${product.productId}" class="search-product-image-box">
                                <c:choose>
                                    <c:when test="${not empty product.productImage}">
                                        <img src="${pageContext.request.contextPath}/getimage?productImage=${product.productImage}" 
                                             alt="${product.jerseyName}">
                                    </c:when>

                                    <c:otherwise>
                                        <div class="search-no-image">
                                            <i class="fa-solid fa-image"></i>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </a>

                            <div class="search-product-info">
                                <p class="search-team-name">${product.teamName}</p>
                                <h3>${product.jerseyName}</h3>
                                <p class="search-category">${product.category} Jersey</p>
                                <p class="search-price">£${product.price}</p>

                                <a href="${pageContext.request.contextPath}/product?productId=${product.productId}" class="search-view-btn">
                                    View Details
                                </a>
                            </div>

                        </div>
                    </c:forEach>

                </div>
            </c:when>

            <c:otherwise>
                <div class="search-empty-box">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    <h2>No Products Found</h2>
                    <p>Try searching by jersey name, team name, category, season, or size.</p>
                    <a href="${pageContext.request.contextPath}/index" class="search-home-btn">Go Home</a>
                </div>
            </c:otherwise>
        </c:choose>

    </div>
</section>

<%@ include file="/components/footer.jsp" %>

</body>
</html>