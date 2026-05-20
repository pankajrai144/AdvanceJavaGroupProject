<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Club Jerseys – JerseyPasal</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/heaader.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/clubs.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Products.css">
</head>
<body>

<jsp:include page="/components/header.jsp"/>

<section class="cs1">
    <p class="ct1">2024 / 25 Season</p>
    <h1>Find Your <span>Club</span></h1>
    <p class="ct2">Official kits from the world's biggest clubs. Home, away, and third strips — straight from the manufacturer.</p>
</section>

<section class="cs3">
    <p class="ct1">Official Kits</p>
    <h2>Latest 2024/25 Club Jerseys</h2>
    <p>Every strip is crafted to official match specification — the same breathable, performance-grade fabric worn on the pitch by the world's best. Includes the official season badge and club crest.</p>
</section>

<section class="product-list-section">
    <div class="product-list-wrap">

        <div class="product-list-heading">
            <p>Club Jerseys</p>
            <h1>Latest Club Kits</h1>

            <c:if test="${not empty error}">
                <span class="product-list-count">${error}</span>
            </c:if>

            <c:if test="${not empty filterError}">
                <span class="product-list-count">${filterError}</span>
            </c:if>

            <c:if test="${totalPages > 0}">
                <span class="product-list-count">
                    Showing page ${currentPage} of ${totalPages}
                </span>
            </c:if>
        </div>

        <form action="${pageContext.request.contextPath}/clubs" method="get" class="product-filter-box">

            <div class="product-filter-field">
                <label for="size">Size</label>
                <select name="size" id="size">
                    <option value="" ${empty param.size ? 'selected' : ''}>All Sizes</option>
                    <option value="XS" ${param.size == 'XS' ? 'selected' : ''}>XS</option>
                    <option value="S" ${param.size == 'S' ? 'selected' : ''}>S</option>
                    <option value="M" ${param.size == 'M' ? 'selected' : ''}>M</option>
                    <option value="L" ${param.size == 'L' ? 'selected' : ''}>L</option>
                    <option value="XL" ${param.size == 'XL' ? 'selected' : ''}>XL</option>
                    <option value="XXL" ${param.size == 'XXL' ? 'selected' : ''}>XXL</option>
                </select>
            </div>

            <div class="product-filter-field">
                <label for="minPrice">Min Price</label>
                <input type="number" name="minPrice" id="minPrice" placeholder="Min price" value="${param.minPrice}">
            </div>

            <div class="product-filter-field">
                <label for="maxPrice">Max Price</label>
                <input type="number" name="maxPrice" id="maxPrice" placeholder="Max price" value="${param.maxPrice}">
            </div>

            <div class="product-filter-actions">
                <button type="submit">Filter</button>
                <a href="${pageContext.request.contextPath}/clubs">Clear</a>
            </div>

        </form>

        <c:choose>
            <c:when test="${not empty clubProducts}">

                <div class="product-list-grid">

                    <c:forEach var="product" items="${clubProducts}">
                        <div class="product-list-card">

                            <a href="${pageContext.request.contextPath}/product?productId=${product.productId}" class="product-list-image-box">
                                <c:choose>
                                    <c:when test="${not empty product.productImage}">
                                        <img src="${pageContext.request.contextPath}/getimage?productImage=${product.productImage}" 
                                             alt="${product.jerseyName}">
                                    </c:when>

                                    <c:otherwise>
                                        <div class="product-list-no-image">
                                            <i class="fa-solid fa-image"></i>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </a>

                            <div class="product-list-info">
                                <p class="product-list-team">${product.teamName}</p>
                                <h3>${product.jerseyName}</h3>
                                <p class="product-list-category">${product.category} Jersey</p>
                                <p class="product-list-description">${product.description}</p>
                                <p class="product-list-price">£${product.price}</p>

                                <a href="${pageContext.request.contextPath}/product?productId=${product.productId}" class="product-list-btn">
                                    View Details
                                </a>
                            </div>

                        </div>
                    </c:forEach>

                </div>

            </c:when>

            <c:otherwise>
                <div class="pd-empty-box">
                    <i class="fa-solid fa-box-open"></i>
                    <h2>No Club Jerseys Available</h2>
                    <p>Club products added by admin will appear here.</p>
                </div>
            </c:otherwise>
        </c:choose>

        <c:if test="${totalPages > 1}">
            <div class="product-pagination">

                <c:choose>
                    <c:when test="${currentPage > 1}">
                        <a href="${pageContext.request.contextPath}/clubs?page=${currentPage - 1}${filterQuery}" class="pagination-btn">
                            Previous
                        </a>
                    </c:when>

                    <c:otherwise>
                        <span class="pagination-btn pagination-disabled">Previous</span>
                    </c:otherwise>
                </c:choose>

                <c:forEach begin="1" end="${totalPages}" var="pageNumber">
                    <c:choose>
                        <c:when test="${pageNumber == currentPage}">
                            <span class="pagination-number pagination-active">${pageNumber}</span>
                        </c:when>

                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/clubs?page=${pageNumber}${filterQuery}" class="pagination-number">
                                ${pageNumber}
                            </a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:choose>
                    <c:when test="${currentPage < totalPages}">
                        <a href="${pageContext.request.contextPath}/clubs?page=${currentPage + 1}${filterQuery}" class="pagination-btn">
                            Next
                        </a>
                    </c:when>

                    <c:otherwise>
                        <span class="pagination-btn pagination-disabled">Next</span>
                    </c:otherwise>
                </c:choose>

            </div>
        </c:if>

    </div>
</section>

<section class="cs5">
    <div class="cw3">

        <div class="cl1">
            <div class="cc2">
                <i class="fa-solid fa-shield-halved"></i>
                <h2>100% Authentic<br>Club Jerseys</h2>
                <ul>
                    <li><i class="fa-solid fa-circle-check"></i> Officially licensed club product</li>
                    <li><i class="fa-solid fa-circle-check"></i> Match-grade performance fabric</li>
                    <li><i class="fa-solid fa-circle-check"></i> Holographic authenticity tag included</li>
                    <li><i class="fa-solid fa-circle-check"></i> Season badge embroidered on chest</li>
                    <li><i class="fa-solid fa-circle-check"></i> Sourced direct from manufacturer</li>
                </ul>
                <a href="${pageContext.request.contextPath}/clubs" class="cb5">Shop All Club Kits</a>
            </div>
        </div>

        <div class="cr1">

		<video src="${pageContext.request.contextPath}/Videos/Nike2.mp4" autoplay muted loop></video>
            <div class="cc3">
                <span>Nike Football The Last Game</span>
            </div>
        </div>

    </div>
</section>

<%@ include file="/components/footer.jsp" %>

</body>
</html>