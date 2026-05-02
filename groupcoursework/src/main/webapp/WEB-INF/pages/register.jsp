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

  <!-- LEFT SIDE -->
  <div class="left-panel">
    <div class="overlay">
      <h1>⚽ Jersey Pasal</h1>
      <p>Create your account and explore premium jerseys</p>
    </div>
  </div>

  <!-- RIGHT SIDE -->
  <div class="right-panel">

    <form action="${pageContext.request.contextPath}/register" 
          method="post" 
          enctype="multipart/form-data" 
          class="form-box">

      <h2>Create Account</h2>

      <!-- PROFILE UPLOAD -->
      <div class="profile-upload">

        <div class="profile-preview">
          <img id="previewImg" src="" alt="Preview" style="display:none;">
          <i id="defaultIcon" class="fa-solid fa-user"></i>
        </div>

        <!-- Hidden Input -->
        <input type="file" id="profilePic" name="profilePic" accept="image/*" required hidden>

        <!-- Button -->
        <button type="button" class="upload-btn"
          onclick="document.getElementById('profilePic').click()">
          Upload Profile Picture
        </button>
      </div>

      <!-- FORM FIELDS -->
      <input type="text" name="fullname" placeholder="Full Name" required>
      <input type="email" name="email" placeholder="Email Address" required>
      <input type="tel" name="phone" placeholder="Phone Number" pattern="[0-9]{10}" required>

      <!-- DATE -->
      <div class="date-wrapper">
        <input type="text" id="dob" name="dob" class="date-input" placeholder="dd/mm/yyyy" required>
      </div>

      <input type="password" name="password" placeholder="Password" required>
      <input type="text" name="address" placeholder="Address" required>

      <!-- GENDER -->
      <div class="gender">
        <label><input type="radio" name="gender" value="Male" required> Male</label>
        <label><input type="radio" name="gender" value="Female"> Female</label>
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

      <div class="divider">OR</div>

      <!-- GOOGLE BUTTON -->
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
<script>
  const fileInput = document.getElementById("profilePic");
  const previewImg = document.getElementById("previewImg");
  const defaultIcon = document.getElementById("defaultIcon");

  fileInput.addEventListener("change", function () {
    const file = this.files[0];

    if (file) {
      const reader = new FileReader();

      reader.onload = function (e) {
        previewImg.src = e.target.result;
        previewImg.style.display = "block";
        defaultIcon.style.display = "none";
      };

      reader.readAsDataURL(file);
    }
  });
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
