<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Successful</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/heaader.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
body {
    background: var(--black);
    color: var(--white);
    min-height: 100vh;
}

.success-section {
    padding: 80px 24px;
}

.success-box {
    max-width: 620px;
    margin: 0 auto;
    background: #161616;
    border: 1px solid #222;
    border-radius: 8px;
    padding: 42px;
    text-align: center;
}

.success-icon {
    width: 72px;
    height: 72px;
    margin: 0 auto 22px;
    border-radius: 50%;
    background: rgba(46, 204, 113, 0.12);
    color: #2ecc71;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 2rem;
}

.error-icon {
    width: 72px;
    height: 72px;
    margin: 0 auto 22px;
    border-radius: 50%;
    background: rgba(231, 76, 60, 0.12);
    color: #e74c3c;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 2rem;
}

.success-box h1 {
    font-size: 2rem;
    text-transform: uppercase;
    margin-bottom: 12px;
}

.success-box p {
    color: var(--mid);
    font-size: 0.9rem;
    line-height: 1.7;
    margin-bottom: 22px;
}

.success-details {
    background: #111;
    border: 1px solid #222;
    border-radius: 6px;
    padding: 18px;
    margin-bottom: 26px;
    text-align: left;
}

.success-row {
    display: flex;
    justify-content: space-between;
    gap: 20px;
    padding: 10px 0;
    border-bottom: 1px solid #1f1f1f;
    font-size: 0.85rem;
}

.success-row:last-child {
    border-bottom: none;
}

.success-row span:first-child {
    color: var(--mid);
}

.success-row span:last-child {
    color: var(--white);
    font-weight: 800;
}

.success-buttons {
    display: flex;
    gap: 12px;
}

.success-buttons a {
    flex: 1;
    padding: 13px 20px;
    border-radius: 4px;
    text-decoration: none;
    font-size: 0.78rem;
    font-weight: 900;
    text-transform: uppercase;
    letter-spacing: 1px;
}

.home-btn {
    background: var(--red);
    color: var(--white);
}

.home-btn:hover {
    background: var(--red-dark);
}

.dashboard-btn {
    border: 1px solid #333;
    color: var(--mid);
}

.dashboard-btn:hover {
    color: var(--white);
    border-color: var(--red);
}

@media (max-width: 600px) {
    .success-box {
        padding: 30px 20px;
    }

    .success-buttons {
        flex-direction: column;
    }

    .success-row {
        flex-direction: column;
        gap: 5px;
    }
}
</style>
</head>

<body>

<jsp:include page="/components/header.jsp"/>

<section class="success-section">
    <div class="success-box">

        <c:choose>
            <c:when test="${not empty error}">
                <div class="error-icon">
                    <i class="fa-solid fa-triangle-exclamation"></i>
                </div>

                <h1>Something Went Wrong</h1>

                <p>${error}</p>

                <div class="success-buttons">
                    <a href="${pageContext.request.contextPath}/product" class="home-btn">Continue Shopping</a>
                    <a href="${pageContext.request.contextPath}/userdashboard" class="dashboard-btn">Dashboard</a>
                </div>
            </c:when>

            <c:otherwise>
                <div class="success-icon">
                    <i class="fa-solid fa-check"></i>
                </div>

                <h1>Order Placed</h1>

                <p>
                    Your order has been created successfully. You can view your order details from your dashboard later.
                </p>

                <div class="success-details">
                    <div class="success-row">
                        <span>Order ID</span>
                        <span>#${order.orderId}</span>
                    </div>

                    <div class="success-row">
                        <span>Payment ID</span>
                        <span>#${payment.paymentId}</span>
                    </div>

                    <div class="success-row">
                        <span>Payment Method</span>
                        <span>${payment.paymentMethod}</span>
                    </div>

                    <div class="success-row">
                        <span>Payment Status</span>
                        <span>${payment.paymentStatus}</span>
                    </div>

                    <div class="success-row">
                        <span>Total Amount</span>
                        <span>£${payment.amount}</span>
                    </div>
                </div>

                <div class="success-buttons">
                    <a href="${pageContext.request.contextPath}/product" class="home-btn">Continue Shopping</a>
                    <a href="${pageContext.request.contextPath}/userdashboard" class="dashboard-btn">Dashboard</a>
                </div>
            </c:otherwise>
        </c:choose>

    </div>
</section>

</body>
</html>
