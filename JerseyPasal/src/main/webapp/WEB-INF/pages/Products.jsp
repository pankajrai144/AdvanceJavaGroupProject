<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product – JerseyPasal</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/heaader.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Products.css">
</head>
<body>

<%@ include file="/components/header.jsp" %>

<c:choose>
    <c:when test="${not empty products}">

        <c:forEach var="product" items="${products}" varStatus="status">

            <section class="pd1">
                <div class="pd2">

                    <div class="pd3">
                        <div class="pd4">
                            <c:choose>
                                <c:when test="${not empty selectedImage}">
                                    <img id="mainProductImage${status.index}"
                                         src="${pageContext.request.contextPath}/getimage?productImage=${selectedImage}" 
                                         alt="${product.jerseyName}" />
                                </c:when>
                                <c:when test="${not empty product.productImage}">
                                    <img id="mainProductImage${status.index}"
                                         src="${pageContext.request.contextPath}/getimage?productImage=${product.productImage}" 
                                         alt="${product.jerseyName}" />
                                </c:when>
                                <c:otherwise>
                                    <div class="pd-no-image">
                                        <i class="fa-solid fa-image"></i>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <div class="pd5">
                            <c:if test="${not empty product.productImage}">
                                <a href="${pageContext.request.contextPath}/product?productId=${product.productId}&selectedImage=${product.productImage}">
                                    <img src="${pageContext.request.contextPath}/getimage?productImage=${product.productImage}" 
                                         alt="${product.jerseyName}" 
                                         class="pd6" />
                                </a>
                            </c:if>

                            <c:if test="${not empty product.productImage2}">
                                <a href="${pageContext.request.contextPath}/product?productId=${product.productId}&selectedImage=${product.productImage2}">
                                    <img src="${pageContext.request.contextPath}/getimage?productImage=${product.productImage2}" 
                                         alt="${product.jerseyName}" 
                                         class="pd6" />
                                </a>
                            </c:if>

                            <c:if test="${not empty product.productImage3}">
                                <a href="${pageContext.request.contextPath}/product?productId=${product.productId}&selectedImage=${product.productImage3}">
                                    <img src="${pageContext.request.contextPath}/getimage?productImage=${product.productImage3}" 
                                         alt="${product.jerseyName}" 
                                         class="pd6" />
                                </a>
                            </c:if>

                            <c:if test="${not empty product.productImage4}">
                                <a href="${pageContext.request.contextPath}/product?productId=${product.productId}&selectedImage=${product.productImage4}">
                                    <img src="${pageContext.request.contextPath}/getimage?productImage=${product.productImage4}" 
                                         alt="${product.jerseyName}" 
                                         class="pd6" />
                                </a>
                            </c:if>
                        </div>
                    </div>

                    <div class="pd7">

                        <p class="pd8">${product.teamName}</p>
                        <h1 class="pd9">${product.jerseyName}</h1>
                        <p class="pd10">${product.category} Jersey</p>
                        <p class="pd11">£${product.price}</p>

                        <p class="pd12">
                            ${product.description}
                        </p>

                        <div class="pd13">
                            <p class="pd14">Select Size</p>

                            <div class="pd15">
                                <a href="${pageContext.request.contextPath}/product?productId=${product.productId}&selectedSize=XS" class="pd16 <c:if test='${selectedSize == "XS"}'>size-selected</c:if>">XS</a>
                                <a href="${pageContext.request.contextPath}/product?productId=${product.productId}&selectedSize=S" class="pd16 <c:if test='${selectedSize == "S"}'>size-selected</c:if>">S</a>
                                <a href="${pageContext.request.contextPath}/product?productId=${product.productId}&selectedSize=M" class="pd16 <c:if test='${selectedSize == "M"}'>size-selected</c:if>">M</a>
                                <a href="${pageContext.request.contextPath}/product?productId=${product.productId}&selectedSize=L" class="pd16 <c:if test='${selectedSize == "L"}'>size-selected</c:if>">L</a>
                                <a href="${pageContext.request.contextPath}/product?productId=${product.productId}&selectedSize=XL" class="pd16 <c:if test='${selectedSize == "XL"}'>size-selected</c:if>">XL</a>
                                <a href="${pageContext.request.contextPath}/product?productId=${product.productId}&selectedSize=XXL" class="pd16 <c:if test='${selectedSize == "XXL"}'>size-selected</c:if>">XXL</a>
                            </div>

                            <c:if test="${not empty sizeMessage}">
                                <p class="size-message ${sizeMessageType}">${sizeMessage}</p>
                            </c:if>

                            <c:if test="${param.cartError == 'size'}">
                                <p class="size-message size-error">Please select an available size before adding this product to cart.</p>
                            </c:if>

                            <c:if test="${param.cartError == 'stock'}">
                                <p class="size-message size-error">This product is currently out of stock.</p>
                            </c:if>
                        </div>

                        <div class="product-action-buttons">
                            <c:choose>
                                <c:when test="${product.stockQuantity > 0 && not empty selectedSize && sizeMessageType == 'size-success'}">
                                    <a href="${pageContext.request.contextPath}/payment?productId=${product.productId}&selectedSize=${selectedSize}" class="buy-now-button">
                                        Buy Now
                                    </a>

                                    <a href="${pageContext.request.contextPath}/cart?productId=${product.productId}&selectedSize=${selectedSize}" class="add-cart-button">
                                        Add to Cart
                                    </a>
                                </c:when>

                                <c:when test="${product.stockQuantity > 0}">
                                    <a href="${pageContext.request.contextPath}/payment?productId=${product.productId}&selectedSize=${selectedSize}" class="buy-now-button">
                                        Buy Now
                                    </a>

                                    <a href="${pageContext.request.contextPath}/product?productId=${product.productId}&cartError=size" class="add-cart-button">
                                        Add to Cart
                                    </a>
                                </c:when>

                                <c:otherwise>
                                    <span class="out-stock-button">Out of Stock</span>
                                </c:otherwise>
                            </c:choose>

                            <a href="${pageContext.request.contextPath}/wishlist?productId=${product.productId}&action=add" class="wishlist-button" title="Add to Wishlist">
                                <i class="fa-regular fa-heart"></i>
                            </a>
                        </div>

                    </div>
                </div>
            </section>

            <section class="pd20">
                <div class="pd21">

                    <details class="pd22">
                        <summary class="pd23">
                            <span>Reviews</span>
                            <i class="fa-solid fa-chevron-down"></i>
                        </summary>

                        <div class="pd24">

                            <div class="pd25">
                                <c:choose>
                                    <c:when test="${reviewCount > 0}">
                                        <p class="pd26"><fmt:formatNumber value="${averageRating}" pattern="0.0" /></p>

                                        <div class="pd27">
                                            <c:forEach var="star" begin="1" end="5">
                                                <c:choose>
                                                    <c:when test="${star <= averageRating}">
                                                        <i class="fa-solid fa-star"></i>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <i class="fa-regular fa-star"></i>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </div>

                                        <p class="pd28">Based on ${reviewCount} reviews</p>
                                    </c:when>

                                    <c:otherwise>
                                        <p class="pd26">0.0</p>

                                        <div class="pd27">
                                            <i class="fa-regular fa-star"></i>
                                            <i class="fa-regular fa-star"></i>
                                            <i class="fa-regular fa-star"></i>
                                            <i class="fa-regular fa-star"></i>
                                            <i class="fa-regular fa-star"></i>
                                        </div>

                                        <p class="pd28">No reviews yet</p>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${canReview == true}">
                                        <a href="${pageContext.request.contextPath}/review?productId=${product.productId}&orderId=${reviewOrderId}" class="pd29">
                                            Write a Review
                                        </a>
                                    </c:when>

                                    <c:when test="${alreadyReviewed == true}">
                                        <span class="pd29 review-info-label">Reviewed</span>
                                    </c:when>

                                    <c:otherwise>
                                        <span class="pd29 review-info-label">Verified buyers only</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>

                            <div class="pd30">

                                <c:choose>
                                    <c:when test="${not empty reviews}">
                                        <c:forEach var="review" items="${reviews}">
                                            <div class="pd31">
                                                <div class="pd32">
                                                    <div class="pd33">
                                                        <c:forEach var="star" begin="1" end="5">
                                                            <c:choose>
                                                                <c:when test="${star <= review.rating}">
                                                                    <i class="fa-solid fa-star"></i>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <i class="fa-regular fa-star"></i>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </div>

                                                    <span class="pd34">${review.reviewDate}</span>
                                                </div>

                                                <p class="pd35">${review.user.fullname}</p>
                                                <p class="pd36">${review.reviewText}</p>

                                                <c:if test="${not empty review.recommend}">
                                                    <p class="review-recommend-text">Recommended: ${review.recommend}</p>
                                                </c:if>
                                            </div>
                                        </c:forEach>
                                    </c:when>

                                    <c:otherwise>
                                        <div class="pd31">
                                            <p class="pd35">No reviews yet</p>
                                            <p class="pd36">This product has not received any verified customer reviews yet.</p>
                                        </div>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                        </div>
                    </details>

                    <details class="pd22">
                        <summary class="pd23">
                            <span>Jersey Details</span>
                            <i class="fa-solid fa-chevron-down"></i>
                        </summary>
                        <div class="pd24">

                            <table class="pd37">
                                <tr>
                                    <td class="pd38">Jersey Name</td>
                                    <td class="pd39">${product.jerseyName}</td>
                                </tr>
                                <tr>
                                    <td class="pd38">Team</td>
                                    <td class="pd39">${product.teamName}</td>
                                </tr>
                                <tr>
                                    <td class="pd38">Category</td>
                                    <td class="pd39">${product.category}</td>
                                </tr>
                                <tr>
                                    <td class="pd38">Available Sizes</td>
                                    <td class="pd39">${product.size}</td>
                                </tr>
                                <tr>
                                    <td class="pd38">Season</td>
                                    <td class="pd39">${product.season}</td>
                                </tr>
                                <tr>
                                    <td class="pd38">Stock</td>
                                    <td class="pd39">${product.stockQuantity}</td>
                                </tr>
                                <tr>
                                    <td class="pd38">Description</td>
                                    <td class="pd39">${product.description}</td>
                                </tr>
                            </table>

                        </div>
                    </details>

                </div>
            </section>

        </c:forEach>

    </c:when>

    <c:otherwise>
        <section class="pd1">
            <div class="pd-empty-box">
                <i class="fa-solid fa-box-open"></i>
                <h2>No products available</h2>
                <p>Products added by admin will appear here.</p>
            </div>
        </section>
    </c:otherwise>
</c:choose>

<%@ include file="/components/footer.jsp" %>

</body>
</html>
