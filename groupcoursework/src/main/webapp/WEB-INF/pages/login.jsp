<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<title>Login</title>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">

<!-- FONT AWESOME -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<script>
function togglePassword() {
    var password = document.getElementById("password");

    if (password.type === "password") {
        password.type = "text";
    } else {
        password.type = "password";
    }
}
</script>

</head>

<body>

<div class="auth-wrapper">

  <!-- LEFT -->
  <div class="auth-left">
    <div class="overlay">
      <h1>Welcome to Jersey Pasal</h1>
      <p>Register to begin an amazing journey!</p>
    </div>
  </div>

  <div class="auth-right">
    <form class="auth-box" action="login" method="post">
      <h2>Sign in to your account</h2>

      <p class="top-text">
        Don't have an account?
        <a href="register">Create a new account now</a>
      </p>

      <% 
        String error = (String) request.getAttribute("error");
        if (error != null) {
      %>
        <p style="color:red; text-align:center;"><%= error %></p>
      <% 
        }
      %>

      <div class="input-group">
        <input type="email" name="email" placeholder="Email Address" required>
      </div>

      <div class="input-group password-group">
        <input type="password" name="password" placeholder="Enter Password" id="password" required>
        <span onclick="togglePassword()">SHOW</span>
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