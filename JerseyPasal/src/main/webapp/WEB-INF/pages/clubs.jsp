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

<section class="cs4">
    <div class="cw2">

        <c:if test="${not empty error}">
            <p class="ct6">${error}</p>
        </c:if>

        <div class="cg1">

            <c:choose>
                <c:when test="${not empty clubProducts}">

                    <c:forEach var="product" items="${clubProducts}">

                        <a href="${pageContext.request.contextPath}/product?productId=${product.productId}" class="cc-link">
                            <div class="cc1">
                                <div class="ci2">
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

                                    <div class="view-details-box">
                                        <span>View Details</span>
                                    </div>
                                </div>

                                <div class="ci3">
                                    <p class="ct4">${product.teamName}</p>
                                    <p class="ct5">${product.jerseyName}</p>
                                    <p class="ct6">${product.description}</p>
                                    <p class="ct7">£${product.price}</p>
                                </div>
                            </div>
                        </a>

                    </c:forEach>

                </c:when>

                <c:otherwise>
                    <div class="cc1">
                        <div class="ci3">
                            <p class="ct4">No Club Jerseys Available</p>
                            <p class="ct6">Club products added by admin will appear here.</p>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>

        </div>

        <c:if test="${totalPages > 1}">
            <div class="cp-section">

                <c:choose>
                    <c:when test="${currentPage > 1}">
                        <a href="${pageContext.request.contextPath}/clubs?page=${currentPage - 1}" class="cp1">Previous</a>
                    </c:when>
                    <c:otherwise>
                        <span class="cp1 ca2">Previous</span>
                    </c:otherwise>
                </c:choose>

                <div class="cpg1">
                    <c:forEach begin="1" end="${totalPages}" var="pageNumber">
                        <c:choose>
                            <c:when test="${pageNumber == currentPage}">
                                <span class="cp2 ca3">${pageNumber}</span>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/clubs?page=${pageNumber}" class="cp2">${pageNumber}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>

                <c:choose>
                    <c:when test="${currentPage < totalPages}">
                        <a href="${pageContext.request.contextPath}/clubs?page=${currentPage + 1}" class="cp1">Next</a>
                    </c:when>
                    <c:otherwise>
                        <span class="cp1 ca2">Next</span>
                    </c:otherwise>
                </c:choose>

            </div>
        </c:if>

    </div>
</section>

<section class="cs5">
    <div class="cw3">

        <div class="cl1">
            <img src="${pageContext.request.contextPath}/images/club-authentic.jpg" alt="Authentic Club Jersey" class="ci4" />
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
                <a href="${pageContext.request.contextPath}/product" class="cb5">Shop All Club Kits</a>
            </div>
        </div>

        <div class="cr1">
            <video src="${pageContext.request.contextPath}/videos/club-story.mp4" autoplay muted loop poster="${pageContext.request.contextPath}/images/club-video-poster.jpg"></video>
            <div class="cc3">
                <span>Behind the Kit</span>
                <p>How the 2024/25 club jerseys were made</p>
            </div>
        </div>

    </div>
</section>

<%@ include file="/components/footer.jsp" %>

</body>
</html>
