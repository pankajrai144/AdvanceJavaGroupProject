<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>

<body>
<div class="auth-container">
  <div class="left-panel">
    <div class="overlay">
      <h1>⚽ Jersey Pasal</h1>
      <p>Create your account and explore premium jerseys</p>
    </div>
  </div>

  <div class="right-panel">

    <form action="${pageContext.request.contextPath}/register" method="post" class="form-box">

      <h2>Create Account</h2>

      <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
      %>
        <div class="error-message">
          <%= error %>
        </div>
      <%
        }
      %>

      <input type="text" name="fullname" placeholder="Full Name">

      <input type="text" name="email" placeholder="Email Address">

      <input type="text" name="phone" placeholder="Phone Number">

      <input type="text" name="dob" placeholder="Date of Birth">

      <input type="password" name="password" placeholder="Password">

      <input type="text" name="address" placeholder="Address">

      <div class="gender">
        <label><input type="radio" name="gender" value="Male"> Male</label>
        <label><input type="radio" name="gender" value="Female"> Female</label>
      </div>

      <div class="terms">
        <label>
          <input type="checkbox" name="terms" value="agree">
          I agree to <a href="#">Terms & Conditions</a>
        </label>
      </div>

      <button type="submit" class="btn">Create Account</button>

      <div class="divider">OR</div>

      <button type="button" class="google-btn">
        <img src="https://developers.google.com/identity/images/g-logo.png" class="google-icon">
        Continue with Google
      </button>

      <p class="login-text">
        Already have an account?
        <a href="${pageContext.request.contextPath}/login">Login here</a>
      </p>

    </form>
  </div>
</div>
</body>
</html>