<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Write a Review — JerseyPasal</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/heaader.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/review.css">
</head>
<body>

<%@ include file="/components/header.jsp" %>

<section class="section2">
    <div class="wrap">
        <div class="head">
            <p>Share Your Experience</p>
            <h2>Write a Review</h2>
        </div>

        <div class="reviewbox">

            <c:if test="${not empty error}">
                <p class="review-error-message">${error}</p>
            </c:if>

            <c:choose>
                <c:when test="${not empty product}">
                    <div class="review-product-box">
                        <p class="review-product-label">Reviewing Product</p>
                        <h3>${product.jerseyName}</h3>
                        <p>${product.teamName} · ${product.category} Jersey</p>
                    </div>

                    <form action="${pageContext.request.contextPath}/review" method="post">

                        <input type="hidden" name="productId" value="${productId}">
                        <input type="hidden" name="orderId" value="${orderId}">

                        <div class="field">
                            <label class="label">Your Rating</label>
                            <div class="stars">
                                <input type="radio" name="rating" id="star5" value="5">
                                <label for="star5"><i class="fa-solid fa-star"></i></label>

                                <input type="radio" name="rating" id="star4" value="4">
                                <label for="star4"><i class="fa-solid fa-star"></i></label>

                                <input type="radio" name="rating" id="star3" value="3">
                                <label for="star3"><i class="fa-solid fa-star"></i></label>

                                <input type="radio" name="rating" id="star2" value="2">
                                <label for="star2"><i class="fa-solid fa-star"></i></label>

                                <input type="radio" name="rating" id="star1" value="1">
                                <label for="star1"><i class="fa-solid fa-star"></i></label>
                            </div>
                        </div>

                        <div class="line2"></div>

                        <div class="field">
                            <label class="label" for="reviewtext">Your Review</label>
                            <textarea class="input textarea" id="reviewtext" name="reviewText" placeholder="Tell us about the quality, fit, and your experience..."></textarea>
                        </div>

                        <div class="field">
                            <label class="label">Would you recommend this?</label>
                            <div class="radiogroup">
                                <label class="radiolabel">
                                    <input type="radio" name="recommend" value="Yes"> Yes, absolutely
                                </label>
                                <label class="radiolabel">
                                    <input type="radio" name="recommend" value="No"> Not really
                                </label>
                            </div>
                        </div>

                        <button class="btn" type="submit">Submit Review</button>

                    </form>
                </c:when>

                <c:otherwise>
                    <div class="review-product-box">
                        <p class="review-product-label">Review Not Available</p>
                        <h3>Unable to open review form</h3>
                        <p>You can only review products from delivered orders.</p>
                    </div>

                    <a href="${pageContext.request.contextPath}/userdashboard" class="btn review-back-btn">
                        Back to Dashboard
                    </a>
                </c:otherwise>
            </c:choose>

        </div>

    </div>
</section>

<%@ include file="/components/footer.jsp" %>

</body>
</html>