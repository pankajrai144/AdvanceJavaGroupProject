<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Profile | Jersey Pasal</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
:root {
  --main-red: #8b0d1f;
  --dark-red: #5f0715;
  --page-bg: #0f0f0f;
  --box-bg: #1a1a1a;
  --text-white: #ffffff;
  --text-light: #b8b8b8;
  --border-line: #333333;
  --inside-bg: #111111;
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: Arial, sans-serif;
  background: var(--page-bg);
  color: var(--text-white);
  min-height: 100vh;
  padding: 30px 15px;
}

.profile-box {
  width: 100%;
  max-width: 850px;
  margin: 0 auto;
  background: var(--box-bg);
  border: 1px solid var(--border-line);
  border-radius: 18px;
  box-shadow: 0 12px 35px rgba(0, 0, 0, 0.45);
  overflow: hidden;
}

.profile-top {
  background: linear-gradient(135deg, #1a1a1a, #28070d);
  padding: 34px;
  display: flex;
  align-items: center;
  gap: 24px;
  border-bottom: 1px solid var(--border-line);
}

.profile-image-box {
  width: 115px;
  height: 115px;
  border-radius: 50%;
  border: 3px solid var(--main-red);
  background: var(--inside-bg);
  overflow: hidden;
  flex-shrink: 0;
  display: flex;
  align-items: center;
  justify-content: center;
}

.profile-image-box img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.profile-image-box i {
  font-size: 42px;
  color: var(--text-light);
}

.profile-name-box h2 {
  font-size: 30px;
  color: var(--text-white);
  margin-bottom: 8px;
}

.profile-name-box p {
  color: var(--text-light);
  font-size: 15px;
  margin-bottom: 12px;
}

.profile-status {
  display: inline-block;
  background: rgba(139, 13, 31, 0.25);
  color: #ffccd5;
  border: 1px solid rgba(139, 13, 31, 0.55);
  padding: 7px 14px;
  border-radius: 30px;
  font-size: 12px;
  font-weight: bold;
  text-transform: uppercase;
  letter-spacing: 1px;
}

.profile-content {
  padding: 30px 34px 34px;
}

.profile-heading {
  font-size: 15px;
  color: var(--text-light);
  text-transform: uppercase;
  letter-spacing: 1.5px;
  margin-bottom: 18px;
}

.profile-info-list {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 14px;
}

.profile-info-card {
  background: var(--inside-bg);
  border: 1px solid var(--border-line);
  border-radius: 12px;
  padding: 17px;
}

.profile-info-card span {
  display: block;
  color: var(--text-light);
  font-size: 13px;
  margin-bottom: 8px;
}

.profile-info-card p {
  color: var(--text-white);
  font-size: 15px;
  line-height: 1.5;
  word-break: break-word;
}

.profile-button-row {
  margin-top: 28px;
  display: flex;
  gap: 12px;
}

.edit-profile-button,
.back-dashboard-button {
  flex: 1;
  min-height: 48px;
  border-radius: 30px;
  text-decoration: none;
  font-size: 14px;
  font-weight: bold;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 9px;
  transition: 0.25s ease;
}

.edit-profile-button {
  background: var(--main-red);
  color: #ffffff;
}

.edit-profile-button:hover {
  background: var(--dark-red);
}

.back-dashboard-button {
  background: transparent;
  color: var(--text-light);
  border: 1px solid var(--border-line);
}

.back-dashboard-button:hover {
  color: var(--text-white);
  border-color: var(--main-red);
  background: #161616;
}

@media (max-width: 700px) {
  .profile-top {
    flex-direction: column;
    text-align: center;
  }

  .profile-info-list {
    grid-template-columns: 1fr;
  }

  .profile-button-row {
    flex-direction: column;
  }
}

@media (max-width: 480px) {
  body {
    padding: 20px 12px;
  }

  .profile-top {
    padding: 26px 18px;
  }

  .profile-content {
    padding: 24px 18px;
  }

  .profile-name-box h2 {
    font-size: 24px;
  }

  .profile-image-box {
    width: 95px;
    height: 95px;
  }
}
</style>
</head>

<body>

<div class="profile-box">

  <div class="profile-top">
    <div class="profile-image-box">
      <img src="${pageContext.request.contextPath}/getimage?email=${sessionScope.loggedInUser.email}" alt="Profile Picture">
    </div>

    <div class="profile-name-box">
      <h2>${sessionScope.loggedInUser.fullname}</h2>
      <p>${sessionScope.loggedInUser.email}</p>
      <span class="profile-status">${sessionScope.loggedInUser.role}</span>
    </div>
  </div>

  <div class="profile-content">
    <h3 class="profile-heading">Account Details</h3>

    <div class="profile-info-list">

      <div class="profile-info-card">
        <span>Full Name</span>
        <p>${sessionScope.loggedInUser.fullname}</p>
      </div>

      <div class="profile-info-card">
        <span>Email Address</span>
        <p>${sessionScope.loggedInUser.email}</p>
      </div>

      <div class="profile-info-card">
        <span>Phone Number</span>
        <p>${sessionScope.loggedInUser.phone}</p>
      </div>

      <div class="profile-info-card">
        <span>Gender</span>
        <p>${sessionScope.loggedInUser.gender}</p>
      </div>

      <div class="profile-info-card">
        <span>Registration Date</span>
        <p>${sessionScope.loggedInUser.registrationDate}</p>
      </div>

      <div class="profile-info-card">
        <span>Account Status</span>
        <p>${sessionScope.loggedInUser.approvalStatus}</p>
      </div>

      <div class="profile-info-card">
        <span>Address</span>
        <p>${sessionScope.loggedInUser.address}</p>
      </div>

      <div class="profile-info-card">
        <span>User Role</span>
        <p>${sessionScope.loggedInUser.role}</p>
      </div>

    </div>

    <div class="profile-button-row">
      <a href="${pageContext.request.contextPath}/editprofile" class="edit-profile-button">
        <i class="fa-solid fa-pen-to-square"></i> Edit Profile
      </a>

      <a href="${pageContext.request.contextPath}/userdashboard" class="back-dashboard-button">
        <i class="fa-solid fa-arrow-left-long"></i> Back to Dashboard
      </a>
    </div>
  </div>

</div>

</body>
</html>
