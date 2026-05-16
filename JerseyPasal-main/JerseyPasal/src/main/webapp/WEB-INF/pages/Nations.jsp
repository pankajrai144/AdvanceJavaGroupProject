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

<section class="ns1">
    <p class="nt1">2026 FIFA World Cup</p>
    <h1>Find Your <span>Nation</span></h1>
    <p class="nt2">Official jerseys from every competing nation. Pick your flag, own your kit.</p>
</section>

<section class="ns3">
    <p class="nt1">Official Kits</p>
    <h2>Newest 2026 FIFA Jerseys</h2>
    <p>Every strip is crafted to the official match specification — the same breathable, performance-grade fabric worn on the pitch by the world's best. Every shirt ships with the official FIFA World Cup tournament badge.</p>
</section>

<section class="ns4">
    <div class="nw2">
        <p class="nt3">Nation Jerseys</p>

        <c:if test="${not empty error}">
            <p class="nt6">${error}</p>
        </c:if>

        <div class="ng1">

            <c:choose>
                <c:when test="${not empty nationProducts}">

                    <c:forEach var="product" items="${nationProducts}">

                        <a href="${pageContext.request.contextPath}/product?productId=${product.productId}" class="nc-link">
                            <div class="nc1">
                                <div class="ni2">
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

                                <div class="ni3">
                                    <p class="nt4">${product.teamName}</p>
                                    <p class="nt5">${product.jerseyName}</p>
                                    <p class="nt6">${product.description}</p>
                                    <p class="nt7">£${product.price}</p>
                                </div>
                            </div>
                        </a>

                    </c:forEach>

                </c:when>

                <c:otherwise>
                    <div class="nc1">
                        <div class="ni3">
                            <p class="nt4">No Nation Jerseys Available</p>
                            <p class="nt6">Nation products added by admin will appear here.</p>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>

        </div>

        <c:if test="${totalPages > 1}">
            <div class="np-section">

                <c:choose>
                    <c:when test="${currentPage > 1}">
                        <a href="${pageContext.request.contextPath}/nation?page=${currentPage - 1}" class="np-link">Previous</a>
                    </c:when>
                    <c:otherwise>
                        <span class="np-link np-disabled">Previous</span>
                    </c:otherwise>
                </c:choose>

                <div class="np-number-box">
                    <c:forEach begin="1" end="${totalPages}" var="pageNumber">
                        <c:choose>
                            <c:when test="${pageNumber == currentPage}">
                                <span class="np-number np-active">${pageNumber}</span>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/nation?page=${pageNumber}" class="np-number">${pageNumber}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>

                <c:choose>
                    <c:when test="${currentPage < totalPages}">
                        <a href="${pageContext.request.contextPath}/nation?page=${currentPage + 1}" class="np-link">Next</a>
                    </c:when>
                    <c:otherwise>
                        <span class="np-link np-disabled">Next</span>
                    </c:otherwise>
                </c:choose>

            </div>
        </c:if>

    </div>
</section>

<section class="ns5">
    <div class="nw3">

        <div class="nl1">
            <img src="${pageContext.request.contextPath}/images/worldcup-authentic.jpg" alt="Authentic World Cup Jersey" class="ni4" />
            <div class="nc2">
                <i class="fa-solid fa-shield-halved"></i>
                <h2>100% Authentic<br>World Cup Jerseys</h2>
                <ul>
                    <li><i class="fa-solid fa-circle-check"></i> Official FIFA-licensed product</li>
                    <li><i class="fa-solid fa-circle-check"></i> Match-grade performance fabric</li>
                    <li><i class="fa-solid fa-circle-check"></i> Holographic authenticity tag included</li>
                    <li><i class="fa-solid fa-circle-check"></i> Tournament badge embroidered on chest</li>
                    <li><i class="fa-solid fa-circle-check"></i> Sourced direct from manufacturer</li>
                </ul>
                <a href="${pageContext.request.contextPath}/product" class="nb5">Shop All World Cup Kits</a>
            </div>
        </div>

        <div class="nr1">
            <video src="${pageContext.request.contextPath}/videos/jersey-story.mp4" autoplay muted loop poster="${pageContext.request.contextPath}/images/video-poster.jpg"></video>
            <div class="nc3">
                <span>Behind the Kit</span>
                <p>How the 2026 World Cup jerseys were made</p>
            </div>
        </div>

    </div>
</section>

<%@ include file="/components/footer.jsp" %>

</body>
</html>