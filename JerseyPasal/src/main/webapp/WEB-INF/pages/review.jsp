<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Write a Review — JerseyPasal</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/heaader.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/review.css">
</head>
<body>

<%@ include file="/components/header.jsp" %>

<section class="section2">
    <div class="wrap">
        <div class="head">
            <p>Share Your Experience</p>
            <h2>Write a Review</h2>
        </div>

        <div class="reviewbox">
            <form action="#" method="post">

                <div class="field">
                    <label class="label">Your Rating</label>
                    <div class="stars">
                        <input type="radio" name="rating" id="star5" value="5" required>
                        <label for="star5"><i class="fa-solid fa-star"></i></label>

                        <input type="radio" name="rating" id="star4" value="4">
                        <label for="star4"><i class="fa-solid fa-star"></i></label>

                        <input type="radio" name="rating" id="star3" value="3">
                        <label for="star3"><i class="fa-solid fa-star"></i></label>

                        <input type="radio" name="rating" id="star2" value="2">
                        <label for="star2"><i class="fa-solid fa-star"></i></label>

                        <input type="radio" name="rating" id="star1" value="1">
                        <label for="star1"><i class="fa-solid fa-star"></i></label>
                    </div>
                </div>

                <div class="line2"></div>

                <div class="field">
                    <label class="label" for="reviewername">Your Name</label>
                    <input class="input" type="text" id="reviewername" name="name" placeholder="e.g. Alex Ferguson" required>
                </div>

                <div class="field">
                    <label class="label" for="jersey">Jersey Purchased</label>
                    <input class="input" type="text" id="jersey" name="jersey" placeholder="e.g. Man Utd Home 1999/00">
                </div>

                <div class="field">
                    <label class="label" for="reviewtext">Your Review</label>
                    <textarea class="input textarea" id="reviewtext" name="review" placeholder="Tell us about the quality, fit, and your experience..." required></textarea>
                </div>

                <div class="field">
                    <label class="label">Would you recommend this?</label>
                    <div class="radiogroup">
                        <label class="radiolabel">
                            <input type="radio" name="recommend" value="yes" required> Yes, absolutely
                        </label>
                        <label class="radiolabel">
                            <input type="radio" name="recommend" value="no"> Not really
                        </label>
                    </div>
                </div>

                <button class="btn" type="submit">Submit Review</button>

            </form>
        </div>

    </div>
</section>

<%@ include file="/components/footer.jsp" %>

</body>
</html>
