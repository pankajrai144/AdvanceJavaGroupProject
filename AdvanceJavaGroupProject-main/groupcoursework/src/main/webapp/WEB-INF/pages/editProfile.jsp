<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Profile | Jersey Pasal</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

<style>
:root {
  --primary: #8b0d1f;
  --bg: #0f0f0f;
  --card: #1a1a1a;
  --text: #ffffff;
  --subtext: #aaa;
  --border: #333;
}

body {
  font-family: sans-serif;
  background: var(--bg);
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  margin: 0;
}

.upload-card {
  background: var(--card);
  padding: 2rem;
  border-radius: 16px;
  width: 100%;
  max-width: 420px;
  text-align: center;
  border: 1px solid var(--border);
}

h2 { color: var(--text); }
.subtitle { color: var(--subtext); margin-bottom: 20px; font-size: 13px; }

.profile-preview {
  width: 100px;
  height: 100px;
  margin: 0 auto 15px;
  border-radius: 50%;
  background: #111;
  border: 2px dashed #444;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
  position: relative;
  cursor: pointer;
}

.profile-preview img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: none;
}

.profile-preview i {
  font-size: 30px;
  color: #888;
}

.upload-btn {
  margin-bottom: 20px;
  padding: 10px 20px;
  border-radius: 30px;
  border: none;
  background: var(--primary);
  color: #fff;
  cursor: pointer;
}

.input-group {
  text-align: left;
  margin-bottom: 12px;
}

.input-group label {
  font-size: 13px;
  color: var(--subtext);
  display: block;
  margin-bottom: 5px;
}

.input-group input {
  width: 100%;
  padding: 11px;
  border-radius: 10px;
  border: 1px solid var(--border);
  background: #111;
  color: #fff;
  outline: none;
}

.input-group input:focus {
  border-color: var(--primary);
}

.btn-submit {
  background: var(--primary);
  color: white;
  padding: 12px;
  border-radius: 30px;
  border: none;
  width: 100%;
  margin-top: 10px;
  cursor: pointer;
}

.back-link {
  display: block;
  margin-top: 15px;
  color: #aaa;
  text-decoration: none;
  font-size: 13px;
}
</style>
</head>

<body>

<div class="upload-card">

  <h2>Update Profile</h2>
  <p class="subtitle">Manage your Jersey Pasal account</p>

  <form action="${pageContext.request.contextPath}/profile" method="post" enctype="multipart/form-data">
    <div class="profile-preview" onclick="document.getElementById('profilePic').click()">
      <img id="previewImg">
      <i id="defaultIcon" class="fa-solid fa-user"></i>
    </div>

    <input type="file" id="profilePic" name="profilePic" accept="image/*" hidden>

    <button type="button" class="upload-btn"
      onclick="document.getElementById('profilePic').click()">
      Upload Photo
    </button>
    <div class="input-group">
      <label>First Name</label>
      <input type="text" name="firstName" value="${user.firstName}">
    </div>

    <div class="input-group">
      <label>Last Name</label>
      <input type="text" name="lastName" value="${user.lastName}">
    </div>

    <div class="input-group">
      <label>Date of Birth</label>
      <input type="text" id="dob" name="dob" placeholder="dd/mm/yyyy">
    </div>

    <div class="input-group">
      <label>Email</label>
      <input type="text" name="email" value="${user.email}">
    </div>

    <div class="input-group">
      <label>Phone</label>
      <input type="text" name="phone" value="${user.number}">
    </div>

    <button type="submit" class="btn-submit">Save Changes</button>

  </form>

  <a href="dashboard.jsp" class="back-link">← Back to Dashboard</a>

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
  dateFormat: "d/m/Y"
});
</script>

</body>
</html>