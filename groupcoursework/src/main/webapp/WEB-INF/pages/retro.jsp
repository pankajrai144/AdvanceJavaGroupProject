<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Retro Kits — JerseyPasal</title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="../css/retro.css">
</head>
<body>

<%@ include file="/components/header.jsp" %>
<div class="retrobanner">
    <div class="bannerinner">
        <p class="bannertop">Est. 1998 — Collector Series</p>
        <h1 class="retrotitle">The Retro Kit<br>Collection</h1>
        <p class="bannersub">Authentic jerseys from football's greatest chapters</p>
    </div>
</div>

<!-- Manchester United -->
<div class="newsrow">
    <div class="newswrap">

        <div class="newsleft">
            <div class="newsimgbox">
                <img src="../images/united3.jpg" alt="Beckham">
            </div>
            <div class="newscaption">
                <span>Manchester United Collection</span>
                <span>Old Trafford, 1999</span>
            </div>
        </div>

        <div class="newsright">
            <p class="newstag">Manchester United FC</p>
            <h2 class="newshead">The Treble Winners</h2>
            <div class="newsrule"></div>
            <p class="newsquote">" The greatest comeback in football history. "</p>
            <p class="newsbody">It was the night that defined a generation. Barcelona, 26th May 1999. Two goals down in stoppage time, United completed the most dramatic comeback the sport has ever seen. Beckham, Scholes, Keane — this is the shirt they wore.</p>
            <div class="newsstats">
                <div class="newsstat">
                    <span class="newsval">1878</span>
                    <span class="newslabel">Founded</span>
                </div>
                <div class="newsstat">
                    <span class="newsval">20x</span>
                    <span class="newslabel">League Titles</span>
                </div>
                <div class="newsstat">
                    <span class="newsval">3x</span>
                    <span class="newslabel">UCL Titles</span>
                </div>
            </div>
            <div class="newsrule"></div>
            <a href="#" class="newsbtn">Shop Man Utd Retro</a>
        </div>

    </div>
</div>

<div class="newsdivider">----------------------------------</div>

<!-- AC Milan -->
<div class="newsrow">
    <div class="newswrap">

        <div class="newsright">
            <p class="newstag">AC Milan</p>
            <h2 class="newshead">The Rossoneri Dynasty</h2>
            <div class="newsrule"></div>
            <p class="newsquote">" Milan. The most beautiful shirt in the world. "</p>
            <p class="newsbody">Old Trafford, 28th May 2003. The all-Italian final that showcased Milan at the peak of their powers. Maldini, Nesta, Shevchenko — a side built for the ages. Own the exact shirt worn on that unforgettable night.</p>
            <div class="newsstats">
                <div class="newsstat">
                    <span class="newsval">1899</span>
                    <span class="newslabel">Founded</span>
                </div>
                <div class="newsstat">
                    <span class="newsval">19x</span>
                    <span class="newslabel">League Titles</span>
                </div>
                <div class="newsstat">
                    <span class="newsval">7x</span>
                    <span class="newslabel">UCL Titles</span>
                </div>
            </div>
            <div class="newsrule"></div>
            <a href="#" class="newsbtn">Shop AC Milan Retro</a>
        </div>

        <div class="newsleft">
            <div class="newsimgbox">
                <img src="../images/acmilan1.jpg" alt="AC Milan">
            </div>
            <div class="newscaption">
                <span>AC Milan Collection</span>
                <span>Old Trafford, 2003</span>
            </div>
        </div>

    </div>
</div>

<%@ include file="/components/footer.jsp" %>

</body>
</html>
