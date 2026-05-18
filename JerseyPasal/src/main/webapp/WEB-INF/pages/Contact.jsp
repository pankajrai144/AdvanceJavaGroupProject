<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%
String error = (String) request.getAttribute("error");
String success = (String) request.getAttribute("success");

String subject = request.getAttribute("subject") != null ? (String) request.getAttribute("subject") : "";
String message = request.getAttribute("message") != null ? (String) request.getAttribute("message") : "";
%>

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

            <% if (error != null) { %>
                <p class="contact-error"><%= error %></p>
            <% } %>

            <% if (success != null) { %>
                <p class="contact-success"><%= success %></p>
            <% } %>

            <form action="${pageContext.request.contextPath}/contact" method="post">

                <div class="formgroup">
                    <label class="formlabel" for="subject">Subject</label>
                    <select class="forminput" id="subject" name="subject">
                        <option value="" disabled <%= subject.equals("") ? "selected" : "" %>>Select a topic</option>
                        <option value="order" <%= subject.equals("order") ? "selected" : "" %>>Order Enquiry</option>
                        <option value="return" <%= subject.equals("return") ? "selected" : "" %>>Return or Exchange</option>
                        <option value="product" <%= subject.equals("product") ? "selected" : "" %>>Product Question</option>
                        <option value="wholesale" <%= subject.equals("wholesale") ? "selected" : "" %>>Wholesale or Bulk Order</option>
                        <option value="other" <%= subject.equals("other") ? "selected" : "" %>>Other</option>
                    </select>
                </div>

                <div class="formgroup">
                    <label class="formlabel" for="message">Message</label>
                    <textarea class="forminput formtextarea" id="message" name="message" placeholder="Tell us how we can help you..."><%= message %></textarea>
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