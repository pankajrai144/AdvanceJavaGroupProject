<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Retro Kits — JerseyPasal</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/heaader.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/retro.css">
</head>
<body>

<%@ include file="/components/header.jsp" %>

<div class="retrobanner">
    <div class="bannerinner">
        <p class="bannertop">Est. 1998 — Dynasties</p>
        <h1 class="retrotitle">The Retro Dynasties</h1>
        <p class="bannersub">Legends, Eras & the Clubs That Defined Football</p>
    </div>
</div>

<div class="newsrow">
    <div class="newswrap">

        <div class="newsleft">
            <div class="newsimgbox">
                <img src="${pageContext.request.contextPath}/images/united3.jpg" alt="Beckham">
            </div>
            <div class="newscaption">
                <span>Manchester United FC</span>
                <span>Old Trafford, 1999</span>
            </div>
        </div>

        <div class="newsright">
            <p class="newstag">Manchester United FC</p>
            <h2 class="newshead">The Treble Winners</h2>
            <div class="newsrule"></div>
            <p class="newsquote">" The greatest comeback in football history. "</p>
            <p class="newsbody">Founded in 1878 as Newton Heath, Manchester United grew into one of the most decorated clubs in the world under Sir Alex Ferguson. The 1998–99 season stands as their finest hour — winning the Premier League, FA Cup, and UEFA Champions League in a single campaign. The late goals at Camp Nou by Sheringham and Solskjær cemented their place in football immortality.</p>
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
            <p class="newsbody">Key figures of the era: Peter Schmeichel, Roy Keane, David Beckham, Andy Cole, and Ole Gunnar Solskjær. Ferguson's United played with an intensity and belief that made them near-impossible to beat — even in the final seconds.</p>
        </div>

    </div>
</div>

<div class="newsdivider">----------------------------------</div>

<div class="newsrow">
    <div class="newswrap">

        <div class="newsright">
            <p class="newstag">AC Milan</p>
            <h2 class="newshead">The Rossoneri Dynasty</h2>
            <div class="newsrule"></div>
            <p class="newsquote">" Milan. The most beautiful shirt in the world. "</p>
            <p class="newsbody">AC Milan's dominance in the late 1980s and early 2000s represents one of the greatest dynasties in European football. Under Arrigo Sacchi and later Carlo Ancelotti, Milan built squads of unmatched tactical discipline and individual brilliance. Their 2002–03 Champions League triumph, decided on penalties against Juventus, marked the peak of a golden generation.</p>
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
            <p class="newsbody">Paolo Maldini, Alessandro Nesta, Clarence Seedorf, Kaká, and Andriy Shevchenko were the pillars of this era. Maldini alone spent 25 years at the club, becoming the symbol of loyalty and excellence in modern football.</p>
        </div>

        <div class="newsleft">
            <div class="newsimgbox">
                <img src="${pageContext.request.contextPath}/images/acmilan1.jpg" alt="AC Milan">
            </div>
            <div class="newscaption">
                <span>AC Milan Collection</span>
                <span>Old Trafford, 2003</span>
            </div>
        </div>

    </div>
</div>

<div class="newsdivider">----------------------------------</div>

<%@ include file="/components/footer.jsp" %>

</body>
</html>
