<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<header class="h1">
    <div class="h2">

        <a href="${pageContext.request.contextPath}/index" class="logo">JerseyPasal</a>

        <nav class="h4">
            <a href="${pageContext.request.contextPath}/home" class="h5">Home</a>
            <a href="${pageContext.request.contextPath}/nation" class="h5">Nations</a>
            <a href="${pageContext.request.contextPath}/clubs" class="h5">Clubs</a>
            <a href="${pageContext.request.contextPath}/retro" class="h5">Retro</a>
            <a href="${pageContext.request.contextPath}/aboutus" class="h5">About Us</a>
        </nav>

        <div class="h11">

            <form action="${pageContext.request.contextPath}/search" method="get" class="hsearch">
                <input type="text" name="keyword" class="hsearchinput" placeholder="Search jerseys..." autocomplete="off" />
                <button type="submit" class="hsearchbtn">Search</button>
            </form>

            <c:if test="${empty sessionScope.loggedInUser}">
                <a href="${pageContext.request.contextPath}/login" class="h12">Sign In</a>
                <a href="${pageContext.request.contextPath}/register" class="h13">Get Started</a>
            </c:if>

            <c:if test="${not empty sessionScope.loggedInUser and sessionScope.loggedInUser.role ne 'admin'}">
                <a href="${pageContext.request.contextPath}/wishlist" class="h12">Wishlist</a>
                <a href="${pageContext.request.contextPath}/cart" class="h13">Cart</a>
                <div class="havatar">
                    <div class="havatarcircle" tabindex="0">
                        <img src="${pageContext.request.contextPath}/getimage?email=${sessionScope.loggedInUser.email}"
                             class="havatarimg" />
                    </div>
                    <div class="hdropdown">
                        <a href="${pageContext.request.contextPath}/userdashboard" class="hdropitem">Dashboard</a>
                        <a href="${pageContext.request.contextPath}/logout" class="hdropitem hdroplogout">Logout</a>
                    </div>
                </div>
            </c:if>

            <c:if test="${not empty sessionScope.loggedInUser and sessionScope.loggedInUser.role eq 'admin'}">
                <div class="havatar">
                    <div class="havatarcircle hadmincircle" tabindex="0">
                        <img src="${pageContext.request.contextPath}/getimage?email=${sessionScope.loggedInUser.email}"
                             class="havatarimg" />
                    </div>
                    <div class="hdropdown">
                        <a href="${pageContext.request.contextPath}/admindashboard" class="hdropitem">Admin Dashboard</a>
                        <a href="${pageContext.request.contextPath}/logout" class="hdropitem hdroplogout">Logout</a>
                    </div>
                </div>
            </c:if>

        </div>
    </div>
</header>
