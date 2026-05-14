<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="h1">

    <div class="h2">
        <div class="h3">

            <a href="${pageContext.request.contextPath}/index" class="logo">
                <span class="text">JerseyPasal</span>
            </a>

        </div>
        <nav class="h4">

            <a href="${pageContext.request.contextPath}/home" class="h5">
                Home
            </a>

            <a href="${pageContext.request.contextPath}/nation" class="h5">
                Nations
            </a>

            <a href="${pageContext.request.contextPath}/clubs" class="h5">
                Clubs
            </a>

            <a href="${pageContext.request.contextPath}/bestsellers" class="h5">
                Best Sellers
            </a>

            <a href="${pageContext.request.contextPath}/retro" class="h5">
                Retro
            </a>

        </nav>
        <div class="h11">

            <c:choose>
                <c:when test="${not empty user}">

                    <a href="${pageContext.request.contextPath}/dashboard"
                       class="profile-btn">

                        <i class="fa-solid fa-user"></i>

                    </a>

                </c:when>
                <c:otherwise>

                    <a href="${pageContext.request.contextPath}/login"
                       class="h12">

                        Sign In

                    </a>

                    <a href="${pageContext.request.contextPath}/register"
                       class="h13">

                        Get Started

                    </a>

                </c:otherwise>

            </c:choose>

        </div>

    </div>

</header>
