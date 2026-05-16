<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<title>My Wishlist</title>

<link rel="stylesheet"
href="${pageContext.request.contextPath}/css/header.css">

<link rel="preconnect" href="https://fonts.googleapis.com">

<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500;600&family=DM+Sans:wght@300;400;500&display=swap"
rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

:root{
    --bg:#080808;
    --surface:#111;
    --surface2:#181818;
    --border:rgba(255,255,255,0.07);
    --border-h:rgba(255,255,255,0.14);
    --accent:#c0392b;
    --accent-glow:rgba(192,57,43,0.35);
    --accent-dim:rgba(192,57,43,0.18);
    --gold:#d4af37;
    --white:#f5f5f0;
    --muted:rgba(245,245,240,0.45);
}

body{
    background:var(--bg);
    color:var(--white);
    font-family:'DM Sans',sans-serif;
}

.wishlist-header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:24px 40px;
    border-bottom:1px solid var(--border);
}

.header-left{
    display:flex;
    align-items:center;
    gap:14px;
}

.header-title{
    font-family:'Playfair Display',serif;
    font-size:28px;
}

.header-count{
    font-size:12px;
    color:var(--muted);
    border:1px solid var(--border);
    padding:5px 12px;
    border-radius:30px;
}

.btn-outline{
    border:1px solid var(--border);
    background:transparent;
    color:var(--muted);
    padding:10px 18px;
    border-radius:10px;
    cursor:pointer;
    transition:0.3s;
}

.btn-outline:hover{
    border-color:var(--border-h);
    color:var(--white);
}

.container{
    padding:40px;
}

.grid{
    display:grid;
    grid-template-columns:repeat(auto-fill,minmax(320px,1fr));
    gap:28px;
}

.card{
    background:var(--surface);
    border:1px solid var(--border);
    border-radius:18px;
    overflow:hidden;
    transition:0.35s;
    position:relative;
}

.card:hover{
    transform:translateY(-6px);
    box-shadow:0 0 30px var(--accent-glow);
}

.img-wrapper{
    position:relative;
    height:240px;
    overflow:hidden;
}

.img-wrapper img{
    width:100%;
    height:100%;
    object-fit:cover;
    transition:0.4s;
}

.card:hover img{
    transform:scale(1.04);
}

.btn-heart{
    position:absolute;
    top:14px;
    right:14px;
    width:38px;
    height:38px;
    border:none;
    border-radius:50%;
    background:rgba(0,0,0,0.55);
    display:flex;
    align-items:center;
    justify-content:center;
    cursor:pointer;
    backdrop-filter:blur(8px);
}

.btn-heart i{
    color:var(--accent);
    font-size:16px;
}

.card-body{
    padding:22px;
}

.card-name{
    font-family:'Playfair Display',serif;
    font-size:22px;
    margin-bottom:18px;
    line-height:1.3;
}

.info-group{
    margin-bottom:14px;
}

.info-label{
    font-size:11px;
    text-transform:uppercase;
    letter-spacing:1px;
    color:var(--muted);
    margin-bottom:5px;
}

.info-value{
    font-size:14px;
    color:var(--white);
    line-height:1.5;
}

.sizes{
    display:flex;
    flex-wrap:wrap;
    gap:8px;
    margin-top:6px;
}

.size-badge{
    background:var(--surface2);
    border:1px solid var(--border-h);
    padding:5px 10px;
    border-radius:30px;
    font-size:12px;
}

.card-description{
    color:var(--muted);
    font-size:13px;
    line-height:1.7;
    margin:16px 0;
    display:-webkit-box;
    -webkit-line-clamp:3;
    -webkit-box-orient:vertical;
    overflow:hidden;
}

.card-price{
    color:var(--gold);
    font-size:24px;
    font-weight:600;
    margin-bottom:18px;
}

.btn-cart{
    width:100%;
    border:none;
    background:var(--accent);
    color:white;
    padding:13px;
    border-radius:12px;
    cursor:pointer;
    font-weight:600;
    letter-spacing:0.5px;
    transition:0.3s;
}

.btn-cart:hover{
    background:#d64535;
}

.empty-wrapper{
    height:70vh;
    display:flex;
    align-items:center;
    justify-content:center;
}

.empty-card{
    text-align:center;
}

.empty-icon{
    width:90px;
    height:90px;
    border-radius:50%;
    background:var(--accent-dim);
    display:flex;
    align-items:center;
    justify-content:center;
    margin:auto;
    margin-bottom:24px;
}

.empty-icon i{
    font-size:34px;
    color:var(--accent);
}

.empty-card h2{
    margin-bottom:10px;
    font-family:'Playfair Display',serif;
}

.empty-card p{
    color:var(--muted);
}

.browse-btn{
    display:inline-block;
    margin-top:22px;
    background:var(--accent);
    color:white;
    text-decoration:none;
    padding:12px 24px;
    border-radius:12px;
    transition:0.3s;
}

.browse-btn:hover{
    background:#d64535;
}

@media(max-width:768px){

    .wishlist-header{
        padding:20px;
    }

    .container{
        padding:20px;
    }

    .grid{
        grid-template-columns:1fr;
    }

}

</style>

</head>

<body>

<jsp:include page="/components/header.jsp"/>

<section class="wishlist-header">

    <div class="header-left">

        <div class="header-title">
            Wishlist
        </div>

        <div class="header-count">

            <c:choose>

                <c:when test="${not empty wishlistItems}">
                    ${fn:length(wishlistItems)} Items
                </c:when>

                <c:otherwise>
                    0 Items
                </c:otherwise>

            </c:choose>

        </div>

    </div>

    <button class="btn-outline">
        Clear All
    </button>

</section>

<div class="container">

    <c:if test="${not empty wishlistItems}">

        <div class="grid">

            <c:forEach var="item" items="${wishlistItems}">

                <div class="card">

                    <div class="img-wrapper">

                        <img src="${item.imageUrl}" alt="${item.name}">

                        <form action="removeWishlist" method="post">

                            <input type="hidden"
                            name="productId"
                            value="${item.id}">

                            <button class="btn-heart">

                                <i class="fa-solid fa-heart"></i>

                            </button>

                        </form>

                    </div>

                    <div class="card-body">

                        <div class="card-name">
                            ${item.name}
                        </div>

                        <div class="info-group">

                            <div class="info-label">
                                Team
                            </div>

                            <div class="info-value">
                                ${item.teamName}
                            </div>

                        </div>

                        <div class="info-group">

                            <div class="info-label">
                                Season
                            </div>

                            <div class="info-value">
                                ${item.season}
                            </div>

                        </div>

                        <div class="info-group">

                            <div class="info-label">
                                Category
                            </div>

                            <div class="info-value">
                                ${item.category}
                            </div>

                        </div>

                        <div class="info-group">

                            <div class="info-label">
                                Available Sizes
                            </div>

                            <div class="sizes">

                                <c:forEach var="size" items="${item.sizes}">

                                    <span class="size-badge">
                                        ${size}
                                    </span>

                                </c:forEach>

                            </div>

                        </div>

                        <div class="card-description">
                            ${item.description}
                        </div>

                        <div class="card-price">
                            $${item.price}
                        </div>

                        <form action="cart" method="post">

                            <input type="hidden"
                            name="productId"
                            value="${item.id}">

                            <button class="btn-cart">
                                Add To Cart
                            </button>

                        </form>

                    </div>

                </div>

            </c:forEach>

        </div>

    </c:if>

    <c:if test="${empty wishlistItems}">

        <div class="empty-wrapper">

            <div class="empty-card">

                <div class="empty-icon">
                    <i class="fa-regular fa-heart"></i>
                </div>

                <h2>
                    Nothing saved yet
                </h2>

                <p>
                    Save products you love for later
                </p>

                <a href="products" class="browse-btn">
                    Browse Products
                </a>

            </div>

        </div>

    </c:if>

</div>

</body>

</html>