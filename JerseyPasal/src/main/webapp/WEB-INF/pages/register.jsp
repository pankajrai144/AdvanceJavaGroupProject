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

    <form action="${pageContext.request.contextPath}/register" method="post" enctype="multipart/form-data" class="form-box">

      <h2>Create Account</h2>

      <%
        String error = (String) request.getAttribute("error");
        if (error != null && "POST".equalsIgnoreCase(request.getMethod())) {
      %>
        <div class="error-message">
          <%= error %>
        </div>
      <%
        }
      %>

      <div class="profile-upload">
        <div class="profile-preview-box">
          <img id="profilePreview" src="https://cdn-icons-png.flaticon.com/512/149/149071.png" alt="Profile Preview">
        </div>

        <input type="file" id="profilePic" name="profilePic" accept="image/*" onchange="previewProfileImage(event)">

        <label for="profilePic" class="upload-pic-btn">Upload Pic</label>
      </div>

      <input type="text" name="fullname" placeholder="Full Name">

      <input type="text" name="email" placeholder="Email Address">

      <input type="text" name="phone" placeholder="Phone Number">

      <input type="date" name="dob" id="dob" class="date-input" onclick="openDatePicker(this)" onfocus="openDatePicker(this)">

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

<script>
  function previewProfileImage(event) {
    const file = event.target.files[0];
    const preview = document.getElementById("profilePreview");

    if (file) {
      preview.src = URL.createObjectURL(file);
    }
  }

  function openDatePicker(input) {
    if (input.showPicker) {
      input.showPicker();
    }
  }

  const dobInput = document.getElementById("dob");
  const today = new Date();

  today.setDate(today.getDate() - 1);

  const maxDate = today.toISOString().split("T")[0];
  dobInput.setAttribute("max", maxDate);
</script>

</body>
</html>