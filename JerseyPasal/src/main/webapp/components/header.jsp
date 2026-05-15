<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
<header class="h1">
    <div class="h2">

        <div class="h3">
            <a href="${pageContext.request.contextPath}/index" class="logo">
                <span class="text">JerseyPasal</span>
            </a>
        </div>

        <nav class="h4">

            <a href="#" class="h5">Home</a>
            <a href="${pageContext.request.contextPath}/nation" class="h5">Nations</a>
            <a href="${pageContext.request.contextPath}/clubs" class="h5">Clubs</a>
            <a href="#" class="h5">Best Sellers</a>
            <a href="${pageContext.request.contextPath}/retro" class="h5">Retro</a>

        </nav>

        <div class="h11">
            <c:if test="${empty sessionScope.loggedInUser}">
                <a href="${pageContext.request.contextPath}/login" class="h12">Sign In</a>
               	<a href="${pageContext.request.contextPath}/register" class="h13">Get Started</a>
    		 </c:if>
    		 <c:if test="${not empty sessionScope.loggedInUser}">
        		<a href="${pageContext.request.contextPath}/wishlist" class="h12">Wishlist</a>
        		<a href="${pageContext.request.contextPath}/cart" class="h13">Cart</a>
    		 </c:if>
          
        </div>

    </div>
</header>
