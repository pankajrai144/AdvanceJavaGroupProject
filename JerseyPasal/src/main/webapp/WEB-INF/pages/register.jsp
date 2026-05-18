<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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
      <h1>Jersey Pasal</h1>
      <p>Create your account and explore premium jerseys</p>
    </div>
  </div>

  <div class="right-panel">

    <form action="${pageContext.request.contextPath}/register" method="post" enctype="multipart/form-data" class="form-box">

      <h2>Create Account</h2>

      <c:if test="${not empty error}">
        <div class="register-error-message">${error}</div>
      </c:if>

      <div class="profile-upload">
        <div class="profile-preview-box">
          <img id="profilePreview" src="https://cdn-icons-png.flaticon.com/512/149/149071.png" alt="Profile Preview">
        </div>

        <input type="file" id="profilePic" name="profilePic" accept="image/*">

        <label for="profilePic" class="upload-pic-btn">Upload Pic</label>
      </div>

      <input type="text" name="fullname" placeholder="Full Name" value="${fullname}">

      <input type="text" name="email" placeholder="Email Address" value="${email}">

      <input type="text" name="phone" placeholder="Phone Number" value="${phone}">

      <input type="date" name="registrationDate" id="registrationDate" class="date-input" value="${registrationDate}">

      <input type="password" name="password" placeholder="Password">

      <input type="text" name="address" placeholder="Address" value="${address}">

      <div class="gender">
        <label>
          <input type="radio" name="gender" value="Male" ${maleChecked}> Male
        </label>

        <label>
          <input type="radio" name="gender" value="Female" ${femaleChecked}> Female
        </label>
      </div>

      <div class="terms">
        <label>
          <input type="checkbox" name="terms" value="agree" ${termsChecked}>
          I agree to <a href="#">Terms & Conditions</a>
        </label>
      </div>

      <button type="submit" class="btn">Create Account</button>

      <p class="login-text">
        Already have an account?
        <a href="${pageContext.request.contextPath}/login">Login here</a>
      </p>

    </form>
  </div>
</div>

</body>
</html>