<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page Not Found | JerseyPasal</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/heaader.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
body {
    background: #111111;
    color: #ffffff;
    min-height: 100vh;
}

.error-page-section {
    min-height: 75vh;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 70px 24px;
}

.error-box {
    max-width: 620px;
    width: 100%;
    background: #1a1a1a;
    border: 1px solid #252525;
    border-radius: 10px;
    padding: 48px 36px;
    text-align: center;
}

.error-icon {
    width: 76px;
    height: 76px;
    margin: 0 auto 22px;
    border-radius: 50%;
    background: rgba(139, 13, 31, 0.18);
    color: #ffccd5;
    border: 1px solid rgba(139, 13, 31, 0.45);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 2rem;
}

.error-code {
    font-size: 4rem;
    font-weight: 900;
    color: #8b0d1f;
    line-height: 1;
    margin-bottom: 12px;
}

.error-box h1 {
    font-size: 1.8rem;
    font-weight: 900;
    text-transform: uppercase;
    letter-spacing: 1px;
    margin-bottom: 12px;
}

.error-box p {
    color: rgba(255, 255, 255, 0.58);
    font-size: 0.92rem;
    line-height: 1.7;
    margin-bottom: 26px;
}

.error-buttons {
    display: flex;
    justify-content: center;
    gap: 12px;
    flex-wrap: wrap;
}

.error-btn {
    min-width: 150px;
    padding: 13px 20px;
    border-radius: 5px;
    text-decoration: none;
    font-size: 0.75rem;
    font-weight: 900;
    text-transform: uppercase;
    letter-spacing: 1.2px;
    transition: 0.2s;
}

.home-btn {
    background: #8b0d1f;
    color: #ffffff;
}

.home-btn:hover {
    background: #6a0917;
}

.back-btn {
    border: 1px solid #333333;
    color: rgba(255, 255, 255, 0.7);
}

.back-btn:hover {
    border-color: #8b0d1f;
    color: #ffffff;
}

@media (max-width: 600px) {
    .error-box {
        padding: 36px 22px;
    }

    .error-code {
        font-size: 3rem;
    }

    .error-box h1 {
        font-size: 1.35rem;
    }

    .error-btn {
        width: 100%;
    }
}
</style>
</head>

<body>

<%@ include file="/components/header.jsp" %>

<section class="error-page-section">
    <div class="error-box">

        <div class="error-icon">
            <i class="fa-solid fa-triangle-exclamation"></i>
        </div>

        <div class="error-code">404</div>

        <h1>Page Not Found</h1>

        <p>
            The page you are looking for does not exist or may have been moved.
            Please check the URL or return to the homepage.
        </p>

        <div class="error-buttons">
            <a href="${pageContext.request.contextPath}/index" class="error-btn home-btn">Go Home</a>
            <a href="javascript:history.back()" class="error-btn back-btn">Go Back</a>
        </div>

    </div>
</section>

<%@ include file="/components/footer.jsp" %>

</body>
</html>
