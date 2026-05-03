<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirm Delete Account</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userdashboard.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

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