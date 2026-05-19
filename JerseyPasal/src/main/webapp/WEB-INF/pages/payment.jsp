<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment – JerseyPasal</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/heaader.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/payment.css">
</head>
<body>

<jsp:include page="/components/header.jsp"/>

<section class="pt1">
    <div class="pw1">
        <p class="pl1">Secure Checkout</p>
        <h1 class="ph1">Payment</h1>
        <p class="pl2">Complete your order below</p>
    </div>
</section>

<section class="pt2">
    <div class="pw2">

        <form class="pf1" id="paymentForm" action="${pageContext.request.contextPath}/payment" method="post">

            <input type="hidden" name="paymentSource" value="${paymentSource}">
            <input type="hidden" name="productId" value="${product.productId}">
            <input type="hidden" name="selectedSize" value="${selectedSize}">

            <c:if test="${not empty error}">
                <p class="size-message size-error">${error}</p>
            </c:if>

            <div class="pg1">
                <p class="ps1">Delivery Information</p>

                <div class="pfw1" style="margin-bottom: 16px;">
                    <label class="pla1" for="fullName">Full Name</label>
                    <input class="pin1" type="text" id="fullName" name="fullName" value="${loggedInUser.fullname}">
                </div>

                <div class="pfw1" style="margin-bottom: 16px;">
                    <label class="pla1" for="email">Email Address</label>
                    <input class="pin1" type="email" id="email" name="email" value="${loggedInUser.email}">
                </div>

                <div class="pfw1" style="margin-bottom: 16px;">
                    <label class="pla1" for="phone">Phone Number</label>
                    <input class="pin1" type="text" id="phone" name="phone" value="${loggedInUser.phone}">
                </div>

                <div class="pfw1">
                    <label class="pla1" for="address">Delivery Address</label>
                    <input class="pin1" type="text" id="address" name="address" value="${loggedInUser.address}">
                </div>
            </div>

            <hr class="pd1">

            <div class="pg1 payment-choice-area">
                <p class="ps1">Payment Details</p>

                <input type="radio" id="paymentCard" name="paymentMethod" value="Card" class="payment-radio" checked>
                <input type="radio" id="paymentCash" name="paymentMethod" value="Cash on Delivery" class="payment-radio">

                <div class="pfw1" style="margin-bottom: 16px;">
                    <label class="pla1">Payment Method</label>

                    <div class="payment-method-box">
                        <label for="paymentCard" class="payment-method-option">Card</label>
                        <label for="paymentCash" class="payment-method-option">Cash on Delivery</label>
                    </div>
                </div>

                <div class="card-details-box">
                    <div class="pfw1" style="margin-bottom: 16px;">
                        <label class="pla1" for="cardHolderName">Name on Card</label>
                        <input class="pin1" type="text" id="cardHolderName" name="cardHolderName" placeholder="Name on card">
                    </div>

                    <div class="pfw1" style="margin-bottom: 16px;">
                        <label class="pla1" for="cardNumber">Card Number</label>
                        <div class="pcw1">
                            <input class="pin1" type="text" id="cardNumber" name="cardNumber" placeholder="0000 0000 0000 0000">
                            <div class="pci1">
                                <span>Visa</span>
                                <span>MC</span>
                                <span>Amex</span>
                            </div>
                        </div>
                    </div>

                    <div class="pr2" style="margin-bottom: 16px;">
                        <div class="pfw1">
                            <label class="pla1" for="expiryMonth">Expiry Month</label>
                            <div class="psw1">
                                <select class="pse1" id="expiryMonth" name="expiryMonth">
                                    <option value="">MM</option>
                                    <option value="01">01 – Jan</option>
                                    <option value="02">02 – Feb</option>
                                    <option value="03">03 – Mar</option>
                                    <option value="04">04 – Apr</option>
                                    <option value="05">05 – May</option>
                                    <option value="06">06 – Jun</option>
                                    <option value="07">07 – Jul</option>
                                    <option value="08">08 – Aug</option>
                                    <option value="09">09 – Sep</option>
                                    <option value="10">10 – Oct</option>
                                    <option value="11">11 – Nov</option>
                                    <option value="12">12 – Dec</option>
                                </select>
                            </div>
                        </div>

                        <div class="pfw1">
                            <label class="pla1" for="expiryYear">Expiry Year</label>
                            <div class="psw1">
                                <select class="pse1" id="expiryYear" name="expiryYear">
                                    <option value="">YY</option>
                                    <option value="26">2026</option>
                                    <option value="27">2027</option>
                                    <option value="28">2028</option>
                                    <option value="29">2029</option>
                                    <option value="30">2030</option>
                                    <option value="31">2031</option>
                                    <option value="32">2032</option>
                                </select>
                            </div>
                        </div>

                        <div class="pfw1">
                            <label class="pla1" for="cvv">CVV</label>
                            <input class="pin1" type="text" id="cvv" name="cvv" placeholder="•••">
                        </div>
                    </div>
                </div>
            </div>

        </form>

        <div class="pss1">
            <p class="pl3">Order Summary</p>

            <div class="pil1">

                <c:choose>
                    <c:when test="${paymentSource == 'cart'}">

                        <c:forEach var="item" items="${cartItems}">
                            <div class="pit1">
                                <div>
                                    <p class="pin2">${item.product.jerseyName}</p>
                                    <p class="pin3">Size: ${item.selectedSize} Qty: ${item.quantity}</p>
                                </div>
                                <p class="pip1">£${item.product.price * item.quantity}</p>
                            </div>
                        </c:forEach>

                    </c:when>

                    <c:otherwise>

                        <div class="pit1">
                            <div>
                                <p class="pin2">${product.jerseyName}</p>
                                <p class="pin3">Size: ${selectedSize} Qty: 1</p>
                            </div>
                            <p class="pip1">£${paymentAmount}</p>
                        </div>

                    </c:otherwise>
                </c:choose>

            </div>

            <div class="prr1">
                <span>Subtotal</span>
                <span>£${paymentAmount}</span>
            </div>

            <div class="prr1">
                <span>Shipping</span>
                <span>Free</span>
            </div>

            <div class="prr2">
                <span>Total</span>
                <span>£${paymentAmount}</span>
            </div>

            <div class="pbx1">
                <button class="pb1" type="submit" form="paymentForm">
                    <i class="fa fa-lock" style="margin-right: 8px;"></i>Pay £${paymentAmount}
                </button>

                <c:choose>
                    <c:when test="${paymentSource == 'cart'}">
                        <a href="${pageContext.request.contextPath}/cart" class="pb2">Back to Cart</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/product?productId=${product.productId}" class="pb2">Back to Product</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

    </div>
</section>

</body>
</html>