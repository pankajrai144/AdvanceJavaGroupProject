<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
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

<section class="pd1">
    <div class="pd2">

        <div class="pd3">
            <div class="pd4">
                <img src="${pageContext.request.contextPath}/images/ronaldo2.jpg" alt="Portugal Home Kit 2026" />
            </div>
            <div class="pd5">
                <img src="${pageContext.request.contextPath}/images/portugal2.jpg" alt="View 1" class="pd6" />
                <img src="${pageContext.request.contextPath}/images/ronaldo3.jpg" alt="View 2" class="pd6" />
                <img src="${pageContext.request.contextPath}/images/portugal4.jpg" alt="View 3" class="pd6" />
                <img src="${pageContext.request.contextPath}/images/portugal3.jpg" alt="View 4" class="pd6" />
            </div>
        </div>

        <div class="pd7">

            <p class="pd8">Portugal</p>
            <h1 class="pd9">Home Kit 2026</h1>
            <p class="pd10">Official FIFA Licensed</p>
            <p class="pd11">£74.99</p>
            <p class="pd12">
                Classic deep red with the federation crest. Clima-dry performance weave with mesh ventilation panels and a tailored athletic fit built for match intensity. Worn by Portugal's squad throughout the 2026 FIFA World Cup campaign.
            </p>

            <div class="pd13">
                <p class="pd14">Select Size</p>
                <div class="pd15">
                    <input type="radio" name="size" id="xs" />
                    <label for="xs" class="pd16">XS</label>

                    <input type="radio" name="size" id="s" />
                    <label for="s" class="pd16">S</label>

                    <input type="radio" name="size" id="m" checked />
                    <label for="m" class="pd16">M</label>

                    <input type="radio" name="size" id="l" />
                    <label for="l" class="pd16">L</label>

                    <input type="radio" name="size" id="xl" />
                    <label for="xl" class="pd16">XL</label>

                    <input type="radio" name="size" id="xxl" />
                    <label for="xxl" class="pd16">XXL</label>
                </div>
            </div>

            <div class="pd17">
                <a href="#" class="pd18">Add to Bag</a>
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
                        <td class="pd38">Material</td>
                        <td class="pd39">100% Recycled Polyester</td>
                    </tr>
                    <tr>
                        <td class="pd38">Colour</td>
                        <td class="pd39">Deep Red / White</td>
                    </tr>
                    <tr>
                        <td class="pd38">Fit</td>
                        <td class="pd39">Athletic Tailored Fit</td>
                    </tr>
                    <tr>
                        <td class="pd38">Technology</td>
                        <td class="pd39">Clima-Dry Moisture Wicking</td>
                    </tr>
                    <tr>
                        <td class="pd38">Badge</td>
                        <td class="pd39">Embroidered Federation Crest</td>
                    </tr>
                    <tr>
                        <td class="pd38">License</td>
                        <td class="pd39">Official FIFA World Cup 2026</td>
                    </tr>
                    <tr>
                        <td class="pd38">Care</td>
                        <td class="pd39">Machine wash 30°C, do not tumble dry</td>
                    </tr>
                    <tr>
                        <td class="pd38">Origin</td>
                        <td class="pd39">Made in Portugal</td>
                    </tr>
                </table>

            </div>
        </details>

    </div>
</section>

<%@ include file="/components/footer.jsp" %>

</body>
</html>
