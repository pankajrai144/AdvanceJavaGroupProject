<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KitKing | Login</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
    <div class="auth-wrap">

        <!-- Logo -->
        <a href="#" class="auth-logo">Logo</a>

        <div class="auth-box">

            <h2 class="auth-title">Sign In</h2>
            <p class="auth-sub">Don't have an account? <a href="#">Register</a></p>

            <form action="/login" method="post">

                <!-- Email -->
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" placeholder="you@example.com" required>
                </div>

                <!-- Password -->
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required>
                </div>

                <!-- Remember Me & Forgot Password -->
                <div class="form-row">
                    <div class="form-check">
                        <input type="checkbox" id="remember" name="remember">
                        <label for="remember">Remember me</label>
                    </div>
                    <a href="#" class="forgot-link">Forgot password?</a>
                </div>

                <!-- Submit -->
                <button type="submit" class="btn-auth">Sign In</button>

            </form>

        </div>

    </div>

</body>
</html>
