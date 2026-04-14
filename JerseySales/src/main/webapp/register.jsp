<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KitKing | Register</title>
    <link rel="stylesheet" href="css/register.css">
</head>
<body>

    <div class="auth-wrap">
        <a href="#" class="auth-logo">Logo</a>

        <div class="auth-box">

            <h2 class="auth-title">Create Account</h2>
            <p class="auth-sub">Already have an account? <a href="#">Sign in</a></p>

            <form action="/register" method="post">

                <!-- Full Name -->
                <div class="form-group">
                    <label for="fullname">Full Name</label>
                    <input type="text" id="fullname" name="fullname" placeholder="John Doe" required>
                </div>

                <!-- Email -->
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" placeholder="you@example.com" required>
                </div>

                <!-- Phone -->
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="tel" id="phone" name="phone" placeholder="+977 98XXXXXXXX">
                </div>

                <!-- Password -->
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Min. 8 characters" required>
                </div>

                <!-- Confirm Password -->
                <div class="form-group">
                    <label for="confirm">Confirm Password</label>
                    <input type="password" id="confirm" name="confirm" placeholder="Re-enter password" required>
                </div>

                <!-- Terms -->
                <div class="form-check">
                    <input type="checkbox" id="terms" name="terms" required>
                    <label for="terms">I agree to the <a href="#">Terms & Conditions</a></label>
                </div>

                <!-- Submit -->
                <button type="submit" class="btn-auth">Create Account</button>

            </form>

        </div>

    </div>

</body>
</html>
