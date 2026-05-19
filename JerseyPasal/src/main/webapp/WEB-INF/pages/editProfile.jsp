<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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
  --primary-dark: #5f0715;
  --bg: #0f0f0f;
  --card: #1a1a1a;
  --text: #ffffff;
  --subtext: #b8b8b8;
  --border: #333;
  --input-bg: #111;
  --success: #1f8f4d;
  --error: #c0392b;
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: Arial, sans-serif;
  background: var(--bg);
  color: var(--text);
  min-height: 100vh;
  padding: 30px 15px;
}

.upload-card {
  background: var(--card);
  width: 100%;
  max-width: 520px;
  margin: 0 auto;
  padding: 32px;
  border-radius: 18px;
  border: 1px solid var(--border);
  box-shadow: 0 12px 35px rgba(0, 0, 0, 0.45);
}

.page-header {
  text-align: center;
  margin-bottom: 24px;
}

.page-header h2 {
  font-size: 30px;
  margin-bottom: 8px;
  color: var(--text);
}

.subtitle {
  color: var(--subtext);
  font-size: 15px;
}

.alert {
  padding: 12px 14px;
  border-radius: 10px;
  font-size: 14px;
  margin-bottom: 18px;
}

.alert-success {
  background: rgba(31, 143, 77, 0.15);
  border: 1px solid rgba(31, 143, 77, 0.5);
  color: #7dffae;
}

.alert-error {
  background: rgba(192, 57, 43, 0.15);
  border: 1px solid rgba(192, 57, 43, 0.5);
  color: #ff9b91;
}

.profile-section {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-bottom: 22px;
}

.profile-preview {
  width: 105px;
  height: 105px;
  border-radius: 50%;
  background: #111;
  border: 2px dashed #444;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
}

.profile-preview img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.profile-preview i {
  font-size: 32px;
  color: #888;
}

.file-box {
  width: 100%;
  margin-top: 16px;
  text-align: center;
}

.file-box input[type="file"] {
  display: none;
}

.upload-btn {
  display: inline-block;
  background: var(--primary);
  color: #fff;
  padding: 11px 22px;
  border-radius: 30px;
  font-size: 14px;
  font-weight: bold;
  cursor: pointer;
  transition: 0.3s ease;
}

.upload-btn:hover {
  background: var(--primary-dark);
}

.input-group {
  margin-bottom: 15px;
}

.input-group label {
  color: var(--subtext);
  font-size: 14px;
  display: block;
  margin-bottom: 7px;
}

.input-group input,
.input-group select,
.input-group textarea {
  width: 100%;
  padding: 13px 14px;
  border-radius: 12px;
  border: 1px solid var(--border);
  background: var(--input-bg);
  color: var(--text);
  outline: none;
  font-size: 15px;
}

.input-group textarea {
  resize: vertical;
  min-height: 85px;
}

.input-group input:focus,
.input-group select:focus,
.input-group textarea:focus {
  border-color: var(--primary);
  box-shadow: 0 0 0 2px rgba(139, 13, 31, 0.25);
}

.btn-submit {
  width: 100%;
  background: var(--primary);
  color: #fff;
  padding: 13px;
  border-radius: 30px;
  border: none;
  margin-top: 8px;
  cursor: pointer;
  font-size: 15px;
  font-weight: bold;
}

.btn-submit:hover {
  background: var(--primary-dark);
}

.back-link {
  color: var(--subtext) !important;
  text-decoration: none;
  font-size: 14px;
  display: block;
  text-align: center;
  margin-top: 20px;
}

.back-link:hover {
  color: #fff !important;
}

@media (max-width: 480px) {
  body {
    padding: 20px 12px;
  }

  .upload-card {
    padding: 24px 18px;
  }

  .page-header h2 {
    font-size: 25px;
  }

  .profile-preview {
    width: 90px;
    height: 90px;
  }
}
</style>
</head>

<body>

<div class="upload-card">

  <div class="page-header">
    <h2>Update Profile</h2>
    <p class="subtitle">Manage your Jersey Pasal account</p>
  </div>

  <c:if test="${not empty sessionScope.message}">
    <div class="alert alert-success">
      <i class="fa-solid fa-circle-check"></i> <c:out value="${sessionScope.message}" />
    </div>
    <c:remove var="message" scope="session" />
  </c:if>

  <c:if test="${not empty sessionScope.error}">
    <div class="alert alert-error">
      <i class="fa-solid fa-circle-exclamation"></i> <c:out value="${sessionScope.error}" />
    </div>
    <c:remove var="error" scope="session" />
  </c:if>

  <form action="${pageContext.request.contextPath}/editprofile" method="post" enctype="multipart/form-data">

    <div class="profile-section">
      <div class="profile-preview">
        <c:choose>
          <c:when test="${not empty sessionScope.loggedInUser.email}">
            <img src="${pageContext.request.contextPath}/getimage?email=${sessionScope.loggedInUser.email}" alt="Profile Picture">
          </c:when>
          <c:otherwise>
            <i class="fa-solid fa-user"></i>
          </c:otherwise>
        </c:choose>
      </div>

      <div class="file-box">
        <input type="file" id="profilePic" name="profilePic" accept="image/*">
        <label for="profilePic" class="upload-btn">
          <i class="fa-solid fa-camera"></i> Upload New Picture
        </label>
      </div>
    </div>

    <div class="input-group">
      <label>Full Name</label>
      <input type="text" name="fullname" value="<c:out value='${sessionScope.loggedInUser.fullname}' />">
    </div>

    <div class="input-group">
      <label>Registration Date</label>
      <input type="date" name="registrationDate" value="<c:out value='${sessionScope.loggedInUser.registrationDate}' />" readonly>
    </div>

    <div class="input-group">
      <label>Email</label>
      <input type="text" name="email" value="<c:out value='${sessionScope.loggedInUser.email}' />">
    </div>

    <div class="input-group">
      <label>Phone</label>
      <input type="text" name="phone" value="<c:out value='${sessionScope.loggedInUser.phone}' />">
    </div>

    <div class="input-group">
      <label>Address</label>
      <textarea name="address"><c:out value="${sessionScope.loggedInUser.address}" /></textarea>
    </div>

    <div class="input-group">
      <label>Gender</label>
      <select name="gender">
        <option value="">Select Gender</option>
        <option value="Male" <c:if test="${sessionScope.loggedInUser.gender == 'Male'}">selected</c:if>>Male</option>
        <option value="Female" <c:if test="${sessionScope.loggedInUser.gender == 'Female'}">selected</c:if>>Female</option>
      </select>
    </div>

    <button type="submit" class="btn-submit">
      <i class="fa-solid fa-floppy-disk"></i> Save Changes
    </button>

  </form>

  <a href="${pageContext.request.contextPath}/userdashboard" class="back-link">
    <i class="fa-solid fa-arrow-left-long"></i> Back to Dashboard
  </a>

</div>

</body>
</html>