<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KitKing | Football Jerseys</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <!-- HEADER -->
    <header>
        <div class="header-inner">

            <div class="brand">
                <span>Logo</span>
            </div>

            <nav class="nav-links">
                <a href="${pageContext.request.contextPath}/home">Home</a>

                <div class="dropdown">
                    <a href="#">Jerseys</a>
                    <div class="dropdown-menu">
                        <div class="dropdown-col">
                            <p class="col-title">Nations</p>
                            <a href="#">Argentina</a>
                            <a href="#">Portugal</a>
                        </div>
                        <div class="dropdown-col">
                            <p class="col-title">Clubs</p>
                            <a href="#">Manchester United</a>
                            <a href="#">PSG</a>
                        </div>
                    </div>
                </div>

                <a href="#">Best Sellers</a>
            </nav>

            <div class="header-icons">
                <input type="text" class="search-box" placeholder="Search...">
                <a href="${pageContext.request.contextPath}/login" title="Login"></a>
                <a href="#" title="Wishlist"></a>
                <a href="#" title="Cart"></a>
            </div>

        </div>
    </header>

    <!-- HERO / SLIDER -->
    <section class="hero">
        <img src="images/hero-banner.jpg" alt="Hero Banner">
        <div class="hero-text">
            <p class="hero-tag">New Season 2025/26</p>
            <h1>Own the Pitch.<br>Wear the Legend.</h1>
            <a href="#" class="btn-primary">Shop Now</a>
        </div>
        <div class="dots">
            <span class="dot active"></span>
            <span class="dot"></span>
            <span class="dot"></span>
        </div>
    </section>

    <!-- PRODUCT GRID -->
    <section class="products">
        <h2 class="section-title">Featured Jerseys</h2>

        <div class="product-grid">

            <div class="product-card">
                <div class="product-img-wrap">
                    <img src="images/jersey1.jpg" alt="Argentina Home">
                    <span class="badge">New</span>
                </div>
                <div class="product-info">
                    <p class="team">Argentina</p>
                    <h3>Home Jersey 2025</h3>
                    <p class="price">Rs. 3,500</p>
                    <button>Add to Cart</button>
                </div>
            </div>

            <div class="product-card">
                <div class="product-img-wrap">
                    <img src="images/jersey2.jpg" alt="Portugal Away">
                    <span class="badge sale">Sale</span>
                </div>
                <div class="product-info">
                    <p class="team">Portugal</p>
                    <h3>Away Jersey 2025</h3>
                    <p class="price">Rs. 3,200 <span class="old-price">Rs. 4,000</span></p>
                    <button>Add to Cart</button>
                </div>
            </div>

            <div class="product-card">
                <div class="product-img-wrap">
                    <img src="images/jersey3.jpg" alt="Man Utd Home">
                </div>
                <div class="product-info">
                    <p class="team">Manchester United</p>
                    <h3>Home Jersey 2025</h3>
                    <p class="price">Rs. 4,000</p>
                    <button>Add to Cart</button>
                </div>
            </div>

            <div class="product-card">
                <div class="product-img-wrap">
                    <img src="images/jersey4.jpg" alt="PSG Home">
                    <span class="badge">Hot</span>
                </div>
                <div class="product-info">
                    <p class="team">PSG</p>
                    <h3>Home Jersey 2025</h3>
                    <p class="price">Rs. 3,800</p>
                    <button>Add to Cart</button>
                </div>
            </div>

            <div class="product-card">
                <div class="product-img-wrap">
                    <img src="images/jersey5.jpg" alt="Argentina Away">
                </div>
                <div class="product-info">
                    <p class="team">Argentina</p>
                    <h3>Away Jersey 2025</h3>
                    <p class="price">Rs. 3,300</p>
                    <button>Add to Cart</button>
                </div>
            </div>

            <div class="product-card">
                <div class="product-img-wrap">
                    <img src="images/jersey6.jpg" alt="Portugal Third">
                    <span class="badge sale">Sale</span>
                </div>
                <div class="product-info">
                    <p class="team">Portugal</p>
                    <h3>Third Jersey 2025</h3>
                    <p class="price">Rs. 2,900 <span class="old-price">Rs. 3,500</span></p>
                    <button>Add to Cart</button>
                </div>
            </div>

        </div>
    </section>

    <!-- FOOTER --> 
    <footer>
        <div class="footer-inner">

            <div class="footer-brand">
                <div class="brand">KitKing</div>
                <p>Your destination for authentic football jerseys.</p>
            </div>

            <div class="footer-col">
                <h4>Quick Links</h4>
                <a href="#">Home</a>
                <a href="#">Best Sellers</a>
                <a href="#">About Us</a>
                <a href="#">Contact</a>
            </div>

            <div class="footer-col">
                <h4>Categories</h4>
                <a href="#">Argentina</a>
                <a href="#">Portugal</a>
                <a href="#">Manchester United</a>
                <a href="#">PSG</a>
            </div>

            <div class="footer-socials">
                <h4>Follow Us</h4>
                <div class="social-icons">
                    <a href="#" title="Instagram"></a>
                    <a href="#" title="YouTube"></a>
                    <a href="#" title="Facebook"></a>
                    <a href="#" title="X / Twitter"></a>
                    <a href="#" title="TikTok"></a>
                </div>
            </div>

        </div>
        <div class="footer-bottom">
            &copy; 2025 KitKing. All rights reserved.
        </div>
    </footer>

</body>
</html>
