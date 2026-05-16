<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirm Delete Account</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userdashboard.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
body {
  margin: 0;
  min-height: 100vh;
  font-family: Arial, sans-serif;
  background: #111111;
  display: flex;
  justify-content: center;
  align-items: center;
  color: #ffffff;
}

.confirm-delete-box {
  width: 90%;
  max-width: 420px;
  background: #1b1b1b;
  border: 1px solid #3a151a;
  border-radius: 18px;
  padding: 35px 30px;
  text-align: center;
  box-shadow: 0 12px 35px rgba(139, 13, 31, 0.25);
}

.confirm-delete-box h2 {
  margin-bottom: 15px;
  color: #ffccd3;
  font-size: 28px;
}

.confirm-delete-box p {
  color: #d6d6d6;
  font-size: 15px;
  line-height: 1.6;
  margin-bottom: 25px;
}

.delete-account-btn {
  width: 100%;
  padding: 13px 18px;
  background: #8b0d1f;
  color: #ffffff;
  border: none;
  border-radius: 30px;
  font-size: 15px;
  cursor: pointer;
  transition: 0.3s ease;
}

.delete-account-btn:hover {
  background: #a5162b;
}

.confirm-delete-box a {
  display: inline-block;
  margin-top: 18px;
  color: #cfcfcf;
  text-decoration: none;
  font-size: 14px;
}

.confirm-delete-box a:hover {
  color: #ffffff;
  text-decoration: underline;
}
</style>

</head>
<body>

<div class="confirm-delete-box">
  <h2>Delete Account</h2>

  <p>
    Are you sure you want to delete your account?
    Your account will be deactivated and you will not be able to login again.
  </p>

  <form action="${pageContext.request.contextPath}/deleteaccount" method="post">
    <button type="submit" class="delete-account-btn">
      <i class="fa-solid fa-user-slash"></i> Yes, Delete My Account
    </button>
  </form>

  <a href="${pageContext.request.contextPath}/userdashboard">
    Cancel
  </a>
</div>

</body>
</html>