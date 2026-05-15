<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
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
        <p class="rl2">3 items in your cart</p>
    </div>
</section>

<section class="rt2">
    <div class="rw2">

        <div class="rg1">

            <div class="rc1">
                <div class="ri1">
                    <img src="${pageContext.request.contextPath}/images/ronaldo2.jpg" alt="Portugal Home 2026" />
                </div>
                <div class="rd1">
                    <p class="rn1">Portugal</p>
                    <p class="rn2">Home Kit 2026</p>
                    <p class="rn3">Size: M</p>
                    <p class="rn4">Qty: 1</p>
                </div>
                <div class="rp1">
                    <p class="rn5">£74.99</p>
                    <a href="#" class="rb1">Remove</a>
                </div>
            </div>

            <div class="rc1">
                <div class="ri1">
                    <img src="${pageContext.request.contextPath}/images/messi2.jpg" alt="Argentina Home 2026" />
                </div>
                <div class="rd1">
                    <p class="rn1">Argentina</p>
                    <p class="rn2">Home Kit 2026</p>
                    <p class="rn3">Size: L</p>
                    <p class="rn4">Qty: 1</p>
                </div>
                <div class="rp1">
                    <p class="rn5">£79.99</p>
                    <a href="#" class="rb1">Remove</a>
                </div>
            </div>

            <div class="rc1">
                <div class="ri1">
                    <img src="${pageContext.request.contextPath}/images/acmilan-home.jpg" alt="AC Milan Home 2024/25" />
                </div>
                <div class="rd1">
                    <p class="rn1">AC Milan</p>
                    <p class="rn2">Home Kit 2024/25</p>
                    <p class="rn3">Size: S</p>
                    <p class="rn4">Qty: 1</p>
                </div>
                <div class="rp1">
                    <p class="rn5">£79.99</p>
                    <a href="#" class="rb1">Remove</a>
                </div>
            </div>

        </div>

        <div class="rs1">
            <p class="rl3">Order Summary</p>
            <div class="rr1">
                <span>Subtotal</span>
                <span>£234.97</span>
            </div>
            <div class="rr1">
                <span>Shipping</span>
                <span>Free</span>
            </div>
            <div class="rr1">
                <span>Tax</span>
                <span>£23.50</span>
            </div>
            <div class="rr2">
                <span>Total</span>
                <span>£258.47</span>
            </div>
            <div class="rbx1">
                <a href="#" class="rb2">Continue Shopping</a>
                <a href="#" class="rb3">Checkout</a>
            </div>
        </div>

    </div>
</section>

</body>
</html>
