<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
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
      <div class="profile-upload">

        <div class="profile-preview">
          <img id="previewImg" src="" alt="Preview" style="display:none;">
          <i id="defaultIcon" class="fa-solid fa-user"></i>
        </div>
        <input type="file" id="profilePic" name="profilePic" accept="image/*" required hidden>
        <button type="button" class="upload-btn"
          onclick="document.getElementById('profilePic').click()">
          Upload Profile Picture
        </button>
      </div>

      <input type="text" name="fullname" placeholder="Full Name">

      <input type="text" name="email" placeholder="Email Address">

      <input type="text" name="phone" placeholder="Phone Number">

      <div class="date-wrapper">
        <input type="text" id="dob" name="dob" class="date-input" placeholder="dd/mm/yyyy" required>
      </div>

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
        <img src="https://www.svgrepo.com/show/475656/google-color.svg" class="google-icon">
        Continue with Google
      </button>

      <p class="login-text">
        Already have an account?
        <a href="${pageContext.request.contextPath}/login">Login here</a>
      </p>

    </form>
  </div>
</div>

</script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<script>
  flatpickr("#dob", {
    dateFormat: "d/m/Y",
    maxDate: "today",
    yearSelectorType: "dropdown"
  });
</script>
</body>
</html>