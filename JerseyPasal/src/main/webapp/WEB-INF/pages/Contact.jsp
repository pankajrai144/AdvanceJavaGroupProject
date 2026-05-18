<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us — JerseyPasal</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/heaader.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contact.css">
</head>
<body>

<jsp:include page="/components/header.jsp"/>

<section class="section2">
    <div class="wrap">

        <div class="head">
            <p>Get In Touch</p>
            <h2>Contact Us</h2>
        </div>

        <div class="contactform">
            <form action="${pageContext.request.contextPath}/contact" method="post">

                <div class="formrow">
                    <div class="formgroup">
                        <label class="formlabel" for="firstName">First Name</label>
                        <input class="forminput" type="text" id="firstName" name="firstName" placeholder="e.g. Rohit">
                    </div>
                    <div class="formgroup">
                        <label class="formlabel" for="lastName">Last Name</label>
                        <input class="forminput" type="text" id="lastName" name="lastName" placeholder="e.g. Sharma">
                    </div>
                </div>

                <div class="formgroup">
                    <label class="formlabel" for="email">Email Address</label>
                    <input class="forminput" type="text" id="email" name="email" placeholder="you@example.com">
                </div>

                <div class="formgroup">
                    <label class="formlabel" for="phone">Phone Number</label>
                    <input class="forminput" type="text" id="phone" name="phone" placeholder="+977 98XXXXXXXX">
                </div>

                <div class="formgroup">
                    <label class="formlabel" for="subject">Subject</label>
                    <select class="forminput" id="subject" name="subject">
                        <option value="" disabled selected>Select a topic</option>
                        <option value="order">Order Enquiry</option>
                        <option value="return">Return or Exchange</option>
                        <option value="product">Product Question</option>
                        <option value="wholesale">Wholesale or Bulk Order</option>
                        <option value="other">Other</option>
                    </select>
                </div>

                <div class="formgroup">
                    <label class="formlabel" for="message">Message</label>
                    <textarea class="forminput formtextarea" id="message" name="message" placeholder="Tell us how we can help you..."></textarea>
                </div>

                <button type="submit" class="btn btnfull">
                    Send Message<i class="fa-solid fa-paper-plane"></i>
                </button>

            </form>
        </div>

    </div>
</section>

<jsp:include page="/components/footer.jsp"/>

</body>
</html>
