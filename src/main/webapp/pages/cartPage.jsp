<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.text.DecimalFormat" %>
<%
    // ─── Mock Cart Data (replace with your session/DB logic) ───────────────────
    // In real usage: List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");

    class CartItem {
        String id, name, club, size, number, player;
        double price;
        int qty;
        CartItem(String id, String name, String club, String size, String number, String player, double price, int qty) {
            this.id = id; this.name = name; this.club = club;
            this.size = size; this.number = number; this.player = player;
            this.price = price; this.qty = qty;
        }
        double subtotal() { return price * qty; }
    }

    List<CartItem> cartItems = new ArrayList<>();
    cartItems.add(new CartItem("1", "Home Jersey 2024/25", "Manchester United", "L", "7",  "Rashford",  89.99, 1));
    cartItems.add(new CartItem("2", "Away Jersey 2024/25", "Liverpool FC",      "M", "11", "Salah",     79.99, 2));
    cartItems.add(new CartItem("3", "Third Kit Jersey",    "Arsenal FC",        "XL","9",  "Jesus",     74.99, 1));

    double grandTotal = 0;
    for (CartItem item : cartItems) grandTotal += item.subtotal();
    double shipping = grandTotal >= 100 ? 0 : 9.99;
    double orderTotal = grandTotal + shipping;

    DecimalFormat df = new DecimalFormat("0.00");
    String[] sizes = {"XS","S","M","L","XL","XXL"};
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Kit Cart — FootballKits Pro</title>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;600;700&family=Barlow:wght@300;400;500;600&display=swap" rel="stylesheet"/>
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        :root {
            --primary:       #8b0d1f;
            --primary-dark:  #6a0a17;
            --primary-light: #b01428;
            --primary-glow:  rgba(139,13,31,0.18);
            --bg:            #0d0d0d;
            --surface:       #161616;
            --surface2:      #1e1e1e;
            --surface3:      #252525;
            --white:         #ffffff;
            --white-90:      rgba(255,255,255,0.9);
            --white-60:      rgba(255,255,255,0.6);
            --white-20:      rgba(255,255,255,0.08);
            --white-10:      rgba(255,255,255,0.05);
            --border:        rgba(255,255,255,0.1);
            --border-hover:  rgba(255,255,255,0.2);
            --red-border:    rgba(139,13,31,0.5);
        }

        html { scroll-behavior: smooth; }

        body {
            font-family: 'Barlow', sans-serif;
            background: var(--bg);
            color: var(--white);
            min-height: 100vh;
            overflow-x: hidden;
        }

        /* ── Diagonal stripes background texture ─────────────────── */
        body::before {
            content: '';
            position: fixed; inset: 0;
            background-image: repeating-linear-gradient(
                -45deg,
                transparent,
                transparent 40px,
                rgba(139,13,31,0.025) 40px,
                rgba(139,13,31,0.025) 41px
            );
            pointer-events: none;
            z-index: 0;
        }

        /* ── Header / Navbar ────────────────────────────────────────── */
        .navbar {
            position: sticky; top: 0; z-index: 100;
            background: rgba(13,13,13,0.92);
            backdrop-filter: blur(14px);
            -webkit-backdrop-filter: blur(14px);
            border-bottom: 1px solid var(--border);
            padding: 0 40px;
            display: flex; align-items: center; justify-content: space-between;
            height: 64px;
        }
        .nav-brand {
            display: flex; align-items: center; gap: 10px;
            text-decoration: none;
        }
        .nav-logo {
            width: 36px; height: 36px;
            background: var(--primary);
            border-radius: 8px;
            display: flex; align-items: center; justify-content: center;
        }
        .nav-logo svg { width: 20px; height: 20px; fill: white; }
        .brand-name {
            font-family: 'Oswald', sans-serif;
            font-size: 20px; font-weight: 700;
            color: var(--white);
            letter-spacing: 1px;
        }
        .brand-name span { color: var(--primary); }
        .nav-right {
            display: flex; align-items: center; gap: 24px;
        }
        .nav-link {
            color: var(--white-60);
            text-decoration: none;
            font-size: 13px; font-weight: 500;
            letter-spacing: 0.5px;
            transition: color 0.2s;
        }
        .nav-link:hover { color: var(--white); }

        /* ── Page Layout ────────────────────────────────────────────── */
        .page-wrapper {
            position: relative; z-index: 1;
            max-width: 1140px;
            margin: 0 auto;
            padding: 40px 24px 80px;
        }

        /* ── Breadcrumb ─────────────────────────────────────────────── */
        .breadcrumb {
            display: flex; align-items: center; gap: 8px;
            font-size: 12px; color: var(--white-60);
            margin-bottom: 32px;
            letter-spacing: 0.5px; text-transform: uppercase;
        }
        .breadcrumb a { color: var(--white-60); text-decoration: none; transition: color 0.2s; }
        .breadcrumb a:hover { color: var(--primary); }
        .breadcrumb .sep { color: var(--primary); font-size: 10px; }
        .breadcrumb .current { color: var(--white); }

        /* ── Page Title ─────────────────────────────────────────────── */
        .page-title-row {
            display: flex; align-items: flex-end; justify-content: space-between;
            margin-bottom: 36px;
            border-bottom: 2px solid var(--primary);
            padding-bottom: 18px;
        }
        .page-title {
            font-family: 'Oswald', sans-serif;
            font-size: 38px; font-weight: 700;
            letter-spacing: 1px; line-height: 1;
            color: var(--white);
        }
        .page-title span { color: var(--primary); }
        .item-counter {
            font-size: 13px; color: var(--white-60);
            font-weight: 400; margin-bottom: 4px;
        }
        .item-counter strong { color: var(--white); font-weight: 600; }

        /* ── Two-Column Grid ────────────────────────────────────────── */
        .cart-grid {
            display: grid;
            grid-template-columns: 1fr 360px;
            gap: 28px;
            align-items: start;
        }
        @media (max-width: 900px) {
            .cart-grid { grid-template-columns: 1fr; }
        }

        /* ── Column Headers ─────────────────────────────────────────── */
        .col-header {
            display: grid;
            grid-template-columns: 1fr 90px 110px 90px;
            gap: 12px;
            padding: 10px 20px;
            font-family: 'Oswald', sans-serif;
            font-size: 11px; font-weight: 500;
            letter-spacing: 1.5px; text-transform: uppercase;
            color: var(--white-60);
            background: var(--surface);
            border-radius: 8px;
            margin-bottom: 10px;
            border: 1px solid var(--border);
        }
        .col-header .align-center { text-align: center; }
        .col-header .align-right  { text-align: right; }
        @media (max-width: 600px) { .col-header { display: none; } }

        /* ── Cart Item Card ─────────────────────────────────────────── */
        .cart-item {
            display: grid;
            grid-template-columns: 1fr 90px 110px 90px;
            gap: 12px;
            align-items: center;
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 12px;
            transition: border-color 0.25s, box-shadow 0.25s;
            position: relative;
            overflow: hidden;
        }
        .cart-item::before {
            content: '';
            position: absolute; left: 0; top: 0; bottom: 0;
            width: 4px;
            background: var(--primary);
            opacity: 0;
            transition: opacity 0.25s;
        }
        .cart-item:hover {
            border-color: var(--red-border);
            box-shadow: 0 0 30px rgba(139,13,31,0.12);
        }
        .cart-item:hover::before { opacity: 1; }

        /* ── Item Info ──────────────────────────────────────────────── */
        .item-info {
            display: flex; align-items: center; gap: 16px;
            min-width: 0;
        }
        .jersey-visual {
            flex-shrink: 0;
            width: 72px; height: 80px;
            background: var(--surface2);
            border: 1px solid var(--border);
            border-radius: 10px;
            display: flex; align-items: center; justify-content: center;
            position: relative;
            overflow: hidden;
        }
        /* SVG jersey shape */
        .jersey-visual svg { width: 48px; height: 54px; }
        .jersey-visual .number-badge {
            position: absolute; bottom: 6px; left: 50%; transform: translateX(-50%);
            background: var(--primary);
            color: white; font-family: 'Oswald', sans-serif;
            font-size: 10px; font-weight: 700;
            padding: 1px 6px; border-radius: 4px;
        }
        .item-details { min-width: 0; }
        .item-name {
            font-family: 'Oswald', sans-serif;
            font-size: 15px; font-weight: 600;
            color: var(--white); letter-spacing: 0.3px;
            white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
            margin-bottom: 3px;
        }
        .item-club {
            font-size: 12px; color: var(--primary);
            font-weight: 500; margin-bottom: 6px;
            text-transform: uppercase; letter-spacing: 0.5px;
        }
        .item-meta {
            display: flex; flex-wrap: wrap; gap: 6px;
        }
        .meta-tag {
            background: var(--white-10);
            border: 1px solid var(--border);
            border-radius: 5px;
            padding: 2px 8px;
            font-size: 11px; color: var(--white-60);
            font-weight: 500;
        }
        .remove-btn {
            display: inline-flex; align-items: center; gap: 4px;
            margin-top: 8px;
            background: none; border: none;
            color: #666; font-size: 11px;
            cursor: pointer; padding: 0;
            transition: color 0.2s;
            font-family: 'Barlow', sans-serif;
        }
        .remove-btn:hover { color: var(--primary); }

        /* ── Price ──────────────────────────────────────────────────── */
        .item-unit-price {
            text-align: center;
            font-size: 14px; font-weight: 500;
            color: var(--white-60);
        }

        /* ── Qty Control ────────────────────────────────────────────── */
        .qty-wrap {
            display: flex; justify-content: center;
        }
        .qty-control {
            display: inline-flex; align-items: center;
            background: var(--bg);
            border: 1px solid var(--border);
            border-radius: 8px; overflow: hidden;
        }
        .qty-btn {
            background: none; border: none;
            color: var(--white-60);
            width: 32px; height: 34px;
            cursor: pointer; font-size: 16px; line-height: 1;
            transition: background 0.15s, color 0.15s;
            display: flex; align-items: center; justify-content: center;
        }
        .qty-btn:hover { background: var(--primary-glow); color: var(--primary); }
        .qty-display {
            min-width: 32px; text-align: center;
            font-family: 'Oswald', sans-serif;
            font-size: 15px; font-weight: 600;
            border-left: 1px solid var(--border);
            border-right: 1px solid var(--border);
            padding: 0 4px;
            height: 34px; line-height: 34px;
        }

        /* ── Row Total ──────────────────────────────────────────────── */
        .item-total {
            text-align: right;
            font-family: 'Oswald', sans-serif;
            font-size: 17px; font-weight: 600;
            color: var(--white);
        }

        @media (max-width: 600px) {
            .cart-item { grid-template-columns: 1fr 1fr; gap: 16px; }
            .item-info  { grid-column: 1 / -1; }
            .item-unit-price { text-align: left; font-size: 13px; }
            .item-unit-price::before { content: 'Price: '; color: var(--white-60); font-size: 11px; }
            .item-total  { text-align: right; }
        }

        /* ── Empty Cart ─────────────────────────────────────────────── */
        .empty-cart {
            text-align: center;
            background: var(--surface);
            border: 1px dashed var(--border);
            border-radius: 16px;
            padding: 60px 24px;
        }
        .empty-cart-icon {
            width: 80px; height: 80px;
            background: var(--surface2);
            border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
            margin: 0 auto 20px;
            border: 2px solid var(--border);
        }
        .empty-cart-icon svg { width: 36px; height: 36px; stroke: var(--primary); fill: none; stroke-width: 1.5; }
        .empty-cart h3 {
            font-family: 'Oswald', sans-serif;
            font-size: 22px; margin-bottom: 8px;
        }
        .empty-cart p { color: var(--white-60); font-size: 14px; margin-bottom: 20px; }
        .shop-btn {
            display: inline-flex; align-items: center; gap: 8px;
            background: var(--primary);
            color: white;
            text-decoration: none;
            padding: 12px 28px;
            border-radius: 30px;
            font-family: 'Oswald', sans-serif;
            font-size: 14px; font-weight: 600; letter-spacing: 1px;
            transition: background 0.2s;
        }
        .shop-btn:hover { background: var(--primary-light); }

        /* ── Order Summary Card ──────────────────────────────────────── */
        .summary-card {
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: 14px;
            overflow: hidden;
            position: sticky;
            top: 84px;
        }
        .summary-header {
            background: var(--primary);
            padding: 18px 22px;
            display: flex; align-items: center; gap: 10px;
        }
        .summary-header svg { width: 18px; height: 18px; fill: white; }
        .summary-header-title {
            font-family: 'Oswald', sans-serif;
            font-size: 16px; font-weight: 700;
            letter-spacing: 1px; text-transform: uppercase;
            color: white;
        }
        .summary-body { padding: 22px; }

        .summary-row {
            display: flex; justify-content: space-between; align-items: center;
            font-size: 13px; color: var(--white-60);
            padding: 9px 0;
            border-bottom: 1px solid var(--border);
        }
        .summary-row:last-of-type { border-bottom: none; }
        .summary-row .s-label { display: flex; align-items: center; gap: 6px; }
        .summary-row .s-val { font-weight: 600; color: var(--white); }
        .summary-row .free-tag {
            background: rgba(0,180,80,0.15);
            color: #2ecc71;
            font-size: 10px; font-weight: 700;
            padding: 2px 7px; border-radius: 30px;
            letter-spacing: 0.5px;
        }
        .summary-row .items-tag {
            background: var(--white-10);
            border: 1px solid var(--border);
            font-size: 10px; color: var(--white-60);
            padding: 2px 7px; border-radius: 30px;
        }

        .summary-divider {
            border: none;
            border-top: 2px solid var(--primary);
            margin: 18px 0 16px;
        }
        .summary-total-row {
            display: flex; justify-content: space-between; align-items: baseline;
        }
        .total-label {
            font-family: 'Oswald', sans-serif;
            font-size: 13px; font-weight: 500;
            letter-spacing: 1px; text-transform: uppercase;
            color: var(--white-60);
        }
        .total-amount {
            font-family: 'Oswald', sans-serif;
            font-size: 30px; font-weight: 700;
            color: var(--white);
            letter-spacing: -0.5px;
        }
        .total-currency {
            font-size: 16px; font-weight: 400;
            color: var(--white-60);
            vertical-align: super;
            margin-right: 2px;
        }

        .checkout-btn {
            display: flex; align-items: center; justify-content: center; gap: 10px;
            width: 100%;
            background: var(--primary);
            color: white;
            border: none;
            border-radius: 8px;
            padding: 16px;
            margin-top: 22px;
            font-family: 'Oswald', sans-serif;
            font-size: 16px; font-weight: 700;
            letter-spacing: 1.5px; text-transform: uppercase;
            cursor: pointer;
            transition: background 0.2s, transform 0.1s;
        }
        .checkout-btn:hover { background: var(--primary-light); }
        .checkout-btn:active { transform: scale(0.98); }
        .checkout-btn svg { width: 18px; height: 18px; fill: white; }

        .continue-link {
            display: flex; align-items: center; justify-content: center; gap: 6px;
            margin-top: 14px;
            color: var(--white-60);
            text-decoration: none;
            font-size: 13px;
            transition: color 0.2s;
        }
        .continue-link:hover { color: var(--white); }

        .secure-note {
            display: flex; align-items: center; justify-content: center; gap: 6px;
            margin-top: 16px;
            padding-top: 16px;
            border-top: 1px solid var(--border);
            font-size: 11px; color: #555;
        }
        .secure-note svg { width: 12px; height: 12px; stroke: #555; fill: none; stroke-width: 2; }

        .delivery-note {
            display: flex; align-items: flex-start; gap: 10px;
            background: rgba(0,180,80,0.07);
            border: 1px solid rgba(0,180,80,0.2);
            border-radius: 8px;
            padding: 10px 14px;
            margin-top: 16px;
            font-size: 12px; color: #2ecc71;
        }
        .delivery-note svg { width: 14px; height: 14px; stroke: #2ecc71; fill: none; stroke-width: 2; flex-shrink: 0; margin-top: 1px; }

        /* ── Footer ─────────────────────────────────────────────────── */
        .footer {
            position: relative; z-index: 1;
            border-top: 1px solid var(--border);
            padding: 24px 40px;
            display: flex; align-items: center; justify-content: space-between;
            font-size: 12px; color: #444;
        }
        .footer-brand {
            font-family: 'Oswald', sans-serif;
            color: var(--primary);
            font-size: 14px;
        }

        /* ── Fade-in animation ───────────────────────────────────────── */
        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(16px); }
            to   { opacity: 1; transform: translateY(0); }
        }
        .cart-item {
            animation: fadeUp 0.35s ease both;
        }
        <% for (int i = 0; i < cartItems.size(); i++) { %>
        .cart-item:nth-child(<%= i+1 %>) { animation-delay: <%= i * 0.08 %>s; }
        <% } %>
    </style>
</head>
<body>
<nav class="navbar">
    <a href="index.jsp" class="nav-brand">
        <div class="nav-logo">
            <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <circle cx="12" cy="12" r="10" fill="none" stroke="white" stroke-width="1.5"/>
                <path d="M12 2 C12 2 8 6 8 12 S12 22 12 22 S16 18 16 12 S12 2 12 2Z" fill="white" opacity="0.7"/>
                <path d="M2 12 h20" stroke="white" stroke-width="1.5"/>
            </svg>
        </div>
        <span class="brand-name">FOOTBALL<span>KITS</span></span>
    </a>
    <div class="nav-right">
        <a href="shop.jsp"     class="nav-link">Shop</a>
        <a href="kits.jsp"     class="nav-link">Kits</a>
        <a href="clubs.jsp"    class="nav-link">Clubs</a>
        <a href="account.jsp"  class="nav-link">Account</a>
    </div>
</nav>

<!-- ── Main ────────────────────────────────────────────────────────────── -->
<main class="page-wrapper">

    <!-- Breadcrumb -->
    <div class="breadcrumb">
        <a href="index.jsp">Home</a>
        <span class="sep">&#9654;</span>
        <a href="shop.jsp">Shop</a>
        <span class="sep">&#9654;</span>
        <span class="current">Cart</span>
    </div>

    <!-- Title Row -->
    <div class="page-title-row">
        <h1 class="page-title">YOUR <span>CART</span></h1>
        <div class="item-counter">
            <strong><%= cartItems.size() %></strong> item<%= cartItems.size() != 1 ? "s" : "" %> selected
        </div>
    </div>

    <% if (cartItems.isEmpty()) { %>

    <!-- ── Empty State ──────────────────────────────────────────────────── -->
    <div class="empty-cart">
        <div class="empty-cart-icon">
            <svg viewBox="0 0 24 24"><circle cx="9" cy="21" r="1"/><circle cx="20" cy="21" r="1"/><path d="M1 1h4l2.68 13.39a2 2 0 001.94 1.61h9.72a2 2 0 001.94-1.61L23 6H6"/></svg>
        </div>
        <h3>Your kit bag is empty</h3>
        <p>Browse our collection and pick your favourite jerseys.</p>
        <a href="shop.jsp" class="shop-btn">
            <svg width="16" height="16" fill="white" viewBox="0 0 24 24"><path d="M3 9l9-7 9 7v11a2 2 0 01-2 2H5a2 2 0 01-2-2z"/></svg>
            Browse Kits
        </a>
    </div>

    <% } else { %>

    <div class="cart-grid">

        <!-- ── Left: Items ─────────────────────────────────────────────── -->
        <div>
            <!-- Column headers -->
            <div class="col-header">
                <span>Item</span>
                <span class="align-center">Price</span>
                <span class="align-center">Qty</span>
                <span class="align-right">Total</span>
            </div>

            <% for (CartItem item : cartItems) { %>
            <div class="cart-item">

                <!-- Item info -->
                <div class="item-info">
                    <div class="jersey-visual">
                        <!-- SVG jersey silhouette, coloured by club (simplified) -->
                        <svg viewBox="0 0 48 54" xmlns="http://www.w3.org/2000/svg">
                            <path d="M14 0 L4 10 L10 14 L8 30 L40 30 L38 14 L44 10 L34 0 L28 6 Q24 9 20 6 Z"
                                  fill="#8b0d1f" stroke="white" stroke-width="1.2"/>
                            <rect x="8" y="30" width="32" height="22" rx="2" fill="#8b0d1f" stroke="white" stroke-width="1.2"/>
                            <line x1="24" y1="6" x2="24" y2="14" stroke="white" stroke-width="1.5" stroke-dasharray="2,2"/>
                        </svg>
                        <span class="number-badge"><%= item.number %></span>
                    </div>
                    <div class="item-details">
                        <div class="item-name"><%= item.name %></div>
                        <div class="item-club"><%= item.club %></div>
                        <div class="item-meta">
                            <span class="meta-tag">Size: <%= item.size %></span>
                            <span class="meta-tag">No. <%= item.number %></span>
                            <span class="meta-tag"><%= item.player %></span>
                        </div>
                        <form method="post" action="removeFromCart.jsp" style="display:inline;">
                            <input type="hidden" name="itemId" value="<%= item.id %>"/>
                            <button type="submit" class="remove-btn">
                                <svg width="11" height="11" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><polyline points="3 6 5 6 21 6"/><path d="M19 6l-1 14H6L5 6"/><path d="M10 11v6M14 11v6"/><path d="M9 6V4h6v2"/></svg>
                                Remove
                            </button>
                        </form>
                    </div>
                </div>

                <!-- Unit price -->
                <div class="item-unit-price">$<%= df.format(item.price) %></div>

                <!-- Quantity -->
                <div class="qty-wrap">
                    <form method="post" action="updateCart.jsp" class="qty-control">
                        <input type="hidden" name="itemId" value="<%= item.id %>"/>
                        <button type="submit" name="action" value="dec" class="qty-btn">&#8722;</button>
                        <span class="qty-display"><%= item.qty %></span>
                        <button type="submit" name="action" value="inc" class="qty-btn">&#43;</button>
                    </form>
                </div>

                <!-- Row total -->
                <div class="item-total">$<%= df.format(item.subtotal()) %></div>

            </div>
            <% } %>
        </div>

        <!-- ── Right: Order Summary ────────────────────────────────────── -->
        <aside>
            <div class="summary-card">
                <div class="summary-header">
                    <svg viewBox="0 0 24 24"><path d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"/></svg>
                    <span class="summary-header-title">Order Summary</span>
                </div>

                <div class="summary-body">

                    <!-- Line-item breakdown -->
                    <% for (CartItem item : cartItems) { %>
                    <div class="summary-row">
                        <span class="s-label">
                            <%= item.player %> #<%= item.number %>
                            <span class="items-tag">x<%= item.qty %></span>
                        </span>
                        <span class="s-val">$<%= df.format(item.subtotal()) %></span>
                    </div>
                    <% } %>

                    <!-- Subtotal -->
                    <div class="summary-row" style="margin-top:6px;">
                        <span class="s-label">Subtotal</span>
                        <span class="s-val">$<%= df.format(grandTotal) %></span>
                    </div>

                    <!-- Shipping -->
                    <div class="summary-row">
                        <span class="s-label">Shipping</span>
                        <% if (shipping == 0) { %>
                        <span class="s-val"><span class="free-tag">FREE</span></span>
                        <% } else { %>
                        <span class="s-val">$<%= df.format(shipping) %></span>
                        <% } %>
                    </div>

                    <!-- Grand Total -->
                    <hr class="summary-divider"/>
                    <div class="summary-total-row">
                        <span class="total-label">Total</span>
                        <span class="total-amount">
                            <span class="total-currency">$</span><%= df.format(orderTotal) %>
                        </span>
                    </div>

                    <!-- Free delivery note -->
                    <% if (shipping == 0) { %>
                    <div class="delivery-note">
                        <svg viewBox="0 0 24 24"><path d="M22 11.08V12a10 10 0 11-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
                        <span>You qualify for <strong>free standard delivery!</strong></span>
                    </div>
                    <% } else { %>
                    <div class="delivery-note" style="background:rgba(139,13,31,0.08);border-color:var(--red-border);color:var(--white-60);">
                        <svg viewBox="0 0 24 24" style="stroke:var(--white-60)"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
                        <span>Spend <strong>$<%= df.format(100 - grandTotal) %></strong> more for free delivery</span>
                    </div>
                    <% } %>

                    <!-- Checkout button -->
                    <form method="post" action="checkout.jsp">
                        <button type="submit" class="checkout-btn">
                            <svg viewBox="0 0 24 24"><rect x="1" y="4" width="22" height="16" rx="2" ry="2"/><line x1="1" y1="10" x2="23" y2="10"/></svg>
                            Proceed to Checkout
                        </button>
                    </form>

                    <a href="shop.jsp" class="continue-link">
                        &#8592; Continue Shopping
                    </a>

                    <div class="secure-note">
                        <svg viewBox="0 0 24 24"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"/><path d="M7 11V7a5 5 0 0110 0v4"/></svg>
                        256-bit SSL &mdash; Secure Checkout
                    </div>

                </div>
            </div>
        </aside>

    </div>
    <% } %>

</main>

<!-- ── Footer ───────────────────────────────────────────────────────────── -->
<footer class="footer">
    <span class="footer-brand">FOOTBALLKITS PRO</span>
    <span>&copy; 2025 All rights reserved &mdash; Official Licensed Merchandise</span>
</footer>

</body>
</html>
