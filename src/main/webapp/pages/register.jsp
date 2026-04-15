<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

<div class="auth-container">

  <!-- LEFT SIDE -->
  <div class="left-panel">
    <div class="overlay">
      <h1>⚽ PrimeJerseys</h1>
      <p>Create your account and explore premium jerseys</p>
    </div>
  </div>

  <!-- RIGHT SIDE -->
  <div class="right-panel">

    <form action="register" method="post" class="form-box">

      <h2>Create Account</h2>
      <!-- FULL NAME -->
      <input type="text" name="fullname" placeholder="Full Name" required>

      <!-- EMAIL -->
      <input type="email" name="email" placeholder="Email Address" required>

      <!-- PHONE -->
      <input type="tel" name="phone" placeholder="Phone Number" pattern="[0-9]{10}" required>

      <!-- DOB -->
      <input type="date" name="dob" required>

      <!-- PASSWORD -->
      <input type="password" name="password" placeholder="Password" required>

      <!-- ADDRESS -->
      <input type="text" name="address" placeholder="Address" required>

      <!-- GENDER -->
      <div class="gender">
        <label><input type="radio" name="gender" value="male" required> Male</label>
        <label><input type="radio" name="gender" value="female"> Female</label>
      </div>
      <!-- TERMS -->
      <div class="terms">
        <label>
          <input type="checkbox" required>
          I agree to <a href="#">Terms & Conditions</a>
        </label>
      </div>

      <!-- SUBMIT -->
      <button type="submit" class="btn">Create Account</button>

      <!-- DIVIDER -->
      <div class="divider">OR</div>
      <button type="button" class="google-btn">
  <img src="https://developers.google.com/identity/images/g-logo.png" class="google-icon">
  Continue with Google
</button>

      <!-- LOGIN -->
      <p class="login-text">
        Already have an account?
        <a href="login.jsp">Login here</a>
      </p>

    </form>

  </div>

</div>

</body>
</html>