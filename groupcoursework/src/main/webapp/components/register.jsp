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
      <h1>⚽Jersey Pasal</h1>
      <p>Create your account and explore premium jerseys</p>
    </div>
  </div>
  <div class="right-panel">

    <form action="register" method="post" class="form-box">

      <h2>Create Account</h2>
      <input type="text" name="fullname" placeholder="Full Name" required>
      <input type="email" name="email" placeholder="Email Address" required>
      <input type="tel" name="phone" placeholder="Phone Number" pattern="[0-9]{10}" required>
      <input type="date" name="dob" required>
      <input type="password" name="password" placeholder="Password" required>

      <input type="text" name="address" placeholder="Address" required>
      <div class="gender">
        <label><input type="radio" name="gender" value="male" required> Male</label>
        <label><input type="radio" name="gender" value="female"> Female</label>
      </div>
      <div class="terms">
        <label>
          <input type="checkbox" required>
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
        <a href="login.jsp">Login here</a>
      </p>
    </form>
  </div>
</div>
</body>
</html>