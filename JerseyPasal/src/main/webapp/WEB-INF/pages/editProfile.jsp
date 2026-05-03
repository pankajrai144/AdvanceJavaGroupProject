<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Profile | Jersey Pasal</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
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

h2 { 
  color: var(--text); 
}

.subtitle { 
  color: var(--subtext); 
  margin-bottom: 20px; 
  font-size: 13px; 
}

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
  display: inline-block;
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
  color: var(--subtext) !important;
  text-decoration: none;
  font-size: 13px;
  display: block;
  text-align: center;
  margin-top: 18px;
}

.back-link:visited {
  color: var(--subtext) !important;
}
</style>
</head>

<body>

<div class="upload-card">

  <h2>Update Profile</h2>
  <p class="subtitle">Manage your Jersey Pasal account</p>

  <form action="${pageContext.request.contextPath}/profile" method="post" enctype="multipart/form-data">

    <div class="profile-preview">
      <img id="previewImg">
      <i id="defaultIcon" class="fa-solid fa-user"></i>
    </div>

    <input type="file" id="profilePic" name="profilePic" accept="image/*" hidden>

    <label for="profilePic" class="upload-btn">
      Upload Profile Picture
    </label>

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

  <a href="${pageContext.request.contextPath}/userdashboard" class="back-link">
    <i class="fa-solid fa-arrow-left-long"></i> Back to Dashboard
  </a>

</div>

</body>
</html>