<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<title>Login</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

</head>

<body>

<div class="auth-wrapper">

  <div class="auth-left">
    <div class="overlay">
      <h1>Welcome to Jersey Pasal</h1>
      <p>Register to begin an amazing journey!</p>
    </div>
  </div>

  <div class="auth-right">
    <form class="auth-box" action="${pageContext.request.contextPath}/login" method="post">
      <h2>Sign in to your account</h2>

      <p class="top-text">
        Don't have an account?
        <a href="${pageContext.request.contextPath}/register">Create a new account now</a>
      </p>

      <c:if test="${not empty error}">
        <p style="color:red; text-align:center;">${error}</p>
      </c:if>

      <div class="input-group">
        <input type="email" name="email" placeholder="Email Address" value="${rememberedEmail}">
      </div>

      <div class="input-group password-group">
        <input type="password" name="password" placeholder="Enter Password" id="password">
      </div>

      <div class="remember-box">
        <label>
          <input type="checkbox" name="remember" value="yes" <c:if test="${rememberChecked == 'checked'}">checked</c:if>>
          Remember my email
        </label>
      </div>

      <div class="extra-links">
        <a href="#">Forgot your password?</a>
      </div>

      <button type="submit" class="login-btn">Sign In</button>

      <div class="divider">OR</div>

      <button type="button" class="google-btn">
        <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/google/google-original.svg" alt="Google">
        Sign in with Google
      </button>
    </form>
  </div>
</div>

</body>
</html>