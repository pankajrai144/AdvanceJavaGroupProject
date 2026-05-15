<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart – JerseyPasal</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/heaader.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css">
</head>
<body>

<jsp:include page="/components/header.jsp"/>

<section class="rt1">
    <div class="rw1">
        <p class="rl1">Your Order</p>
        <h1 class="rh1">Cart</h1>

        <c:choose>
            <c:when test="${not empty cartItems}">
                <p class="rl2">${cartItems.size()} items in your cart</p>
            </c:when>
            <c:otherwise>
                <p class="rl2">Your cart is empty</p>
            </c:otherwise>
        </c:choose>
    </div>
</section>

<section class="rt2">
    <div class="rw2">

        <div class="rg1">

            <c:choose>
                <c:when test="${not empty cartItems}">

                    <c:forEach var="item" items="${cartItems}">

                        <div class="rc1">
                            <div class="ri1">
                                <c:choose>
                                    <c:when test="${not empty item.product.productImage}">
                                        <img src="${pageContext.request.contextPath}/getimage?productImage=${item.product.productImage}" 
                                             alt="${item.product.jerseyName}" />
                                    </c:when>
                                    <c:otherwise>
                                        <div class="cart-no-image">
                                            <i class="fa-solid fa-image"></i>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>

                            <div class="rd1">
                                <p class="rn1">${item.product.teamName}</p>
                                <p class="rn2">${item.product.jerseyName}</p>
                                <p class="rn3">Category: ${item.product.category}</p>
                                <p class="rn3">Size: ${item.selectedSize}</p>

                                <div class="cart-quantity-box">
                                    <a href="${pageContext.request.contextPath}/cart?productId=${item.product.productId}&selectedSize=${item.selectedSize}&action=decrease" class="quantity-btn">
                                        <i class="fa-solid fa-minus"></i>
                                    </a>

                                    <span class="quantity-text">Qty: ${item.quantity}</span>

                                    <a href="${pageContext.request.contextPath}/cart?productId=${item.product.productId}&selectedSize=${item.selectedSize}&action=increase" class="quantity-btn">
                                        <i class="fa-solid fa-plus"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="rp1">
                                <p class="rn5">£${item.product.price * item.quantity}</p>
                                <a href="${pageContext.request.contextPath}/cart?productId=${item.product.productId}&selectedSize=${item.selectedSize}&action=remove" class="rb1">Remove</a>
                            </div>
                        </div>

                    </c:forEach>

                </c:when>

                <c:otherwise>
                    <div class="empty-cart-box">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <h2>Your cart is empty</h2>
                        <p>Products added from the product page will appear here.</p>
                        <a href="${pageContext.request.contextPath}/product" class="empty-cart-button">Continue Shopping</a>
                    </div>
                </c:otherwise>
            </c:choose>

        </div>

        <div class="rs1">
            <p class="rl3">Order Summary</p>

            <div class="rr1">
                <span>Subtotal</span>
                <span>£${cartTotal}</span>
            </div>

            <div class="rr1">
                <span>Shipping</span>
                <span>Free</span>
            </div>

            <div class="rr2">
                <span>Total</span>
                <span>£${cartTotal}</span>
            </div>

            <div class="rbx1">
                <a href="${pageContext.request.contextPath}/product" class="rb2">Continue Shopping</a>
                <a href="${pageContext.request.contextPath}/payment?source=cart" class="rb3">Checkout</a>
            </div>
        </div>

    </div>
</section>

</body>
</html>
