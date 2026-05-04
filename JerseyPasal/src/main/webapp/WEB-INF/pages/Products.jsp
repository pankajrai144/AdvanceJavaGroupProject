<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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
                                <c:when test="${not empty product.productImage}">
                                    <img src="${pageContext.request.contextPath}/getimage?productImage=${product.productImage}" 
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
                            <img src="${pageContext.request.contextPath}/images/portugal2.jpg" 
                                 alt="View 1" 
                                 class="pd6" />

                            <img src="${pageContext.request.contextPath}/images/ronaldo3.jpg" 
                                 alt="View 2" 
                                 class="pd6" />

                            <img src="${pageContext.request.contextPath}/images/portugal4.jpg" 
                                 alt="View 3" 
                                 class="pd6" />

                            <img src="${pageContext.request.contextPath}/images/portugal3.jpg" 
                                 alt="View 4" 
                                 class="pd6" />
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
                                <input type="radio" name="size${status.index}" id="xs${status.index}" />
                                <label for="xs${status.index}" class="pd16">XS</label>

                                <input type="radio" name="size${status.index}" id="s${status.index}" 
                                    <c:if test="${product.size == 'S'}">checked</c:if> />
                                <label for="s${status.index}" class="pd16">S</label>

                                <input type="radio" name="size${status.index}" id="m${status.index}" 
                                    <c:if test="${product.size == 'M'}">checked</c:if> />
                                <label for="m${status.index}" class="pd16">M</label>

                                <input type="radio" name="size${status.index}" id="l${status.index}" 
                                    <c:if test="${product.size == 'L'}">checked</c:if> />
                                <label for="l${status.index}" class="pd16">L</label>

                                <input type="radio" name="size${status.index}" id="xl${status.index}" 
                                    <c:if test="${product.size == 'XL'}">checked</c:if> />
                                <label for="xl${status.index}" class="pd16">XL</label>

                                <input type="radio" name="size${status.index}" id="xxl${status.index}" 
                                    <c:if test="${product.size == 'XXL'}">checked</c:if> />
                                <label for="xxl${status.index}" class="pd16">XXL</label>
                            </div>
                        </div>


                        <div class="pd17">
                            <c:choose>
                                <c:when test="${product.stockQuantity > 0}">
                                    <a href="#" class="pd18">Add to Bag</a>
                                </c:when>
                                <c:otherwise>
                                    <span class="pd18 pd-out-stock">Out of Stock</span>
                                </c:otherwise>
                            </c:choose>

                            <button class="pd19" title="Add to Wishlist">
                                <i class="fa-regular fa-heart"></i>
                            </button>
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
                                <p class="pd26">4.8</p>
                                <div class="pd27">
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star-half-stroke"></i>
                                </div>
                                <p class="pd28">Based on 124 reviews</p>
                                <a href="${pageContext.request.contextPath}/review" class="pd29">Write a Review</a>
                            </div>

                            <div class="pd30">

                                <div class="pd31">
                                    <div class="pd32">
                                        <div class="pd33">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                        </div>
                                        <span class="pd34">March 2026</span>
                                    </div>
                                    <p class="pd35">Carlos M.</p>
                                    <p class="pd36">Absolutely brilliant quality. Looks and feels exactly like the match-worn version. Delivery was fast and the packaging was great.</p>
                                </div>

                                <div class="pd31">
                                    <div class="pd32">
                                        <div class="pd33">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-regular fa-star"></i>
                                        </div>
                                        <span class="pd34">February 2026</span>
                                    </div>
                                    <p class="pd35">Sophie R.</p>
                                    <p class="pd36">Great jersey, true to size. The fabric is lightweight and breathable. Only minor thing is the badge stitching could be a bit cleaner but overall very happy.</p>
                                </div>

                                <div class="pd31">
                                    <div class="pd32">
                                        <div class="pd33">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                        </div>
                                        <span class="pd34">January 2026</span>
                                    </div>
                                    <p class="pd35">Arjun T.</p>
                                    <p class="pd36">Best football jersey I have ever bought. The authenticity tag gave me real confidence in the purchase. Will be ordering the away kit next.</p>
                                </div>

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
                                    <td class="pd38">Size</td>
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