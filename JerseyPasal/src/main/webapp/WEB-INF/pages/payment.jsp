<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment – JerseyPasal</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/heaader.css">
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

        <form class="pf1" action="#" method="post">

            <div class="pg1">
                <p class="ps1">Delivery Information</p>

                <div class="pr1" style="margin-bottom: 16px;">
                    <div class="pfw1">
                        <label class="pla1" for="firstName">First Name</label>
                        <input class="pin1" type="text" id="firstName" name="firstName" placeholder="Cristiano" required>
                    </div>
                    <div class="pfw1">
                        <label class="pla1" for="lastName">Last Name</label>
                        <input class="pin1" type="text" id="lastName" name="lastName" placeholder="Ronaldo" required>
                    </div>
                </div>

                <div class="pfw1" style="margin-bottom: 16px;">
                    <label class="pla1" for="email">Email Address</label>
                    <input class="pin1" type="email" id="email" name="email" placeholder="cr7@example.com" required>
                </div>

                <div class="pfw1" style="margin-bottom: 16px;">
                    <label class="pla1" for="phone">Phone Number</label>
                    <input class="pin1" type="tel" id="phone" name="phone" placeholder="+44 7700 000000">
                </div>

                <div class="pfw1" style="margin-bottom: 16px;">
                    <label class="pla1" for="address">Street Address</label>
                    <input class="pin1" type="text" id="address" name="address" placeholder="10 Old Trafford Road" required>
                </div>

                <div class="pr1" style="margin-bottom: 16px;">
                    <div class="pfw1">
                        <label class="pla1" for="city">City</label>
                        <input class="pin1" type="text" id="city" name="city" placeholder="Manchester" required>
                    </div>
                    <div class="pfw1">
                        <label class="pla1" for="postcode">Postcode</label>
                        <input class="pin1" type="text" id="postcode" name="postcode" placeholder="M16 0RA" required>
                    </div>
                </div>

                <div class="pfw1">
                    <label class="pla1" for="country">Country</label>
                    <div class="psw1">
                        <select class="pse1" id="country" name="country" required>
                            <option value="" disabled selected>Select country</option>
                            <option value="GB">United Kingdom</option>
                            <option value="US">United States</option>
                            <option value="NP">Nepal</option>
                            <option value="DE">Germany</option>
                            <option value="FR">France</option>
                            <option value="ES">Spain</option>
                            <option value="IT">Italy</option>
                            <option value="PT">Portugal</option>
                            <option value="AR">Argentina</option>
                            <option value="BR">Brazil</option>
                        </select>
                    </div>
                </div>
            </div>

            <hr class="pd1">
            <div class="pg1">
                <p class="ps1">Card Details</p>

                <div class="pfw1" style="margin-bottom: 16px;">
                    <label class="pla1" for="cardName">Name on Card</label>
                    <input class="pin1" type="text" id="cardName" name="cardName" placeholder="Cristiano Ronaldo" required>
                </div>

                <div class="pfw1" style="margin-bottom: 16px;">
                    <label class="pla1" for="cardNumber">Card Number</label>
                    <div class="pcw1">
                        <input class="pin1" type="text" id="cardNumber" name="cardNumber"
                               placeholder="0000 0000 0000 0000" maxlength="19" required>
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
                            <select class="pse1" id="expiryMonth" name="expiryMonth" required>
                                <option value="" disabled selected>MM</option>
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
                            <select class="pse1" id="expiryYear" name="expiryYear" required>
                                <option value="" disabled selected>YY</option>
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
                        <input class="pin1" type="text" id="cvv" name="cvv"
                               placeholder="•••" maxlength="4" required>
                    </div>
                </div>
            </div>

        </form>

        <div class="pss1">
            <p class="pl3">Order Summary</p>

            <div class="pil1">
                <div class="pit1">
                    <div>
                        <p class="pin2">Portugal Home 2026</p>
                        <p class="pin3">Size: M Qty: 1</p>
                    </div>
                    <p class="pip1">£74.99</p>
                </div>
                <div class="pit1">
                    <div>
                        <p class="pin2">Argentina Home 2026</p>
                        <p class="pin3">Size: L  Qty: 1</p>
                    </div>
                    <p class="pip1">£79.99</p>
                </div>
                <div class="pit1">
                    <div>
                        <p class="pin2">AC Milan Home 2024/25</p>
                        <p class="pin3">Size: S  Qty: 1</p>
                    </div>
                    <p class="pip1">£79.99</p>
                </div>
            </div>

            <div class="prr1">
                <span>Subtotal</span>
                <span>£234.97</span>
            </div>
            <div class="prr1">
                <span>Shipping</span>
                <span>Free</span>
            </div>
            <div class="prr2">
                <span>Total</span>
                <span>£258.47</span>
            </div>

            <div class="pbx1">
                <button class="pb1" type="submit" form="paymentForm">
                    <i class="fa fa-lock" style="margin-right: 8px;"></i>Pay £258.47
                </button>
                <a href="#" class="pb2">Back to Cart</a>
            </div>
        </div>

    </div>
</section>

</body>
</html>
