<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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

            <c:if test="${not empty error}">
                <p class="contact-error">
                    <c:out value="${error}" />
                </p>
            </c:if>

            <c:if test="${not empty success}">
                <p class="contact-success">
                    <c:out value="${success}" />
                </p>
            </c:if>

            <form action="${pageContext.request.contextPath}/contact" method="post">

                <div class="formgroup">
                    <label class="formlabel" for="subject">Subject</label>
                    <select class="forminput" id="subject" name="subject">
                        <option value="" disabled <c:if test="${empty subject}">selected</c:if>>Select a topic</option>
                        <option value="order" <c:if test="${subject == 'order'}">selected</c:if>>Order Enquiry</option>
                        <option value="return" <c:if test="${subject == 'return'}">selected</c:if>>Return or Exchange</option>
                        <option value="product" <c:if test="${subject == 'product'}">selected</c:if>>Product Question</option>
                        <option value="wholesale" <c:if test="${subject == 'wholesale'}">selected</c:if>>Wholesale or Bulk Order</option>
                        <option value="other" <c:if test="${subject == 'other'}">selected</c:if>>Other</option>
                    </select>
                </div>

                <div class="formgroup">
                    <label class="formlabel" for="message">Message</label>
                    <textarea class="forminput formtextarea" id="message" name="message" placeholder="Tell us how we can help you..."><c:out value="${message}" /></textarea>
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