<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product – JerseyPasal</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="../css/Product.css">
</head>
<body>

<%@ include file="header.jsp" %>

<section class="section1">
    <div class="wrap">

        <div class="images">
            <div class="mainimg">
                <img src="../images/ronaldo2.jpg" alt="Portugal Home Kit 2026" />
            </div>
            <div class="thumbs">
                <img src="../images/ronaldo3.jpg"   alt="View 1" class="img" />
                <img src="../images/portugal4.jpg" alt="View 2" class="img" />
                <img src="../images/jersey.jpg" alt="View 3" class="img" />
                <img src="../images/portugal3.jpg" alt="View 4" class="img" />
            </div>
        </div>

        <div class="info">

            <p class="nation">Portugal</p>
            <h1 class="title">Home Kit 2026</h1>
            <p class="badge">Official FIFA Licensed</p>

            <p class="price">£74.99</p>

            <p class="desc">
                Classic deep red with the federation crest. Clima-dry performance weave with mesh ventilation panels and a tailored athletic fit built for match intensity. Worn by Portugal's squad throughout the 2026 FIFA World Cup campaign.
            </p>

            <div class="sizebox">
                <p class="label">Select Size</p>
                <div class="options">
                    <input type="radio" name="size" id="xs" />
                    <label for="xs" class="btn">XS</label>

                    <input type="radio" name="size" id="s" />
                    <label for="s" class="btn">S</label>

                    <input type="radio" name="size" id="m" checked />
                    <label for="m" class="btn">M</label>

                    <input type="radio" name="size" id="l" />
                    <label for="l" class="btn">L</label>

                    <input type="radio" name="size" id="xl" />
                    <label for="xl" class="btn">XL</label>

                    <input type="radio" name="size" id="xxl" />
                    <label for="xxl" class="btn">XXL</label>
                </div>
            </div>

            <div class="actions">
                <a href="#" class="cart">Add to Bag</a>
                <button class="wish" title="Add to Wishlist">
                    <i class="fa-regular fa-heart"></i>
                </button>
            </div>

        </div>
    </div>
</section>

<section class="section2">
    <div class="wrap2">

        <details class="item">
            <summary class="toggle">
                <span>Reviews</span>
                <i class="fa-solid fa-chevron-down"></i>
            </summary>
            <div class="body">

                <div class="box1">
                    <p class="score">4.8</p>
                    <div class="stars">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star-half-stroke"></i>
                    </div>
                    <p class="count">Based on 124 reviews</p>
                    <a href="#" class="reviewbtn">Write a Review</a>
                </div>

                <div class="list">

                    <div class="card">
                        <div class="top">
                            <div class="stars2">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                            </div>
                            <span class="date">March 2026</span>
                        </div>
                        <p class="author">Carlos M.</p>
                        <p class="text">Absolutely brilliant quality. Looks and feels exactly like the match-worn version. Delivery was fast and the packaging was great.</p>
                    </div>

                    <div class="card">
                        <div class="top">
                            <div class="stars2">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                            </div>
                            <span class="date">February 2026</span>
                        </div>
                        <p class="author">Sophie R.</p>
                        <p class="text">Great jersey, true to size. The fabric is lightweight and breathable. Only minor thing is the badge stitching could be a bit cleaner but overall very happy.</p>
                    </div>

                    <div class="card">
                        <div class="top">
                            <div class="stars2">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                            </div>
                            <span class="date">January 2026</span>
                        </div>
                        <p class="author">Arjun T.</p>
                        <p class="text">Best football jersey I have ever bought. The authenticity tag gave me real confidence in the purchase. Will be ordering the away kit next.</p>
                    </div>

                </div>
            </div>
        </details>

        <details class="item">
            <summary class="toggle">
                <span>Jersey Details</span>
                <i class="fa-solid fa-chevron-down"></i>
            </summary>
            <div class="body">

                <table class="table">
                    <tr>
                        <td class="label2">Material</td>
                        <td class="value">100% Recycled Polyester</td>
                    </tr>
                    <tr>
                        <td class="label2">Colour</td>
                        <td class="value">Deep Red / White</td>
                    </tr>
                    <tr>
                        <td class="label2">Fit</td>
                        <td class="value">Athletic Tailored Fit</td>
                    </tr>
                    <tr>
                        <td class="label2">Technology</td>
                        <td class="value">Clima-Dry Moisture Wicking</td>
                    </tr>
                    <tr>
                        <td class="label2">Badge</td>
                        <td class="value">Embroidered Federation Crest</td>
                    </tr>
                    <tr>
                        <td class="label2">License</td>
                        <td class="value">Official FIFA World Cup 2026</td>
                    </tr>
                    <tr>
                        <td class="label2">Care</td>
                        <td class="value">Machine wash 30°C, do not tumble dry</td>
                    </tr>
                    <tr>
                        <td class="label2">Origin</td>
                        <td class="value">Made in Portugal</td>
                    </tr>
                </table>

            </div>
        </details>

    </div>
</section>

<%@ include file="footer.jsp" %>

</body>
</html>
