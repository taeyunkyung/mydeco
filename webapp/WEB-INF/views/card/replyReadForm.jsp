<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Mydeco</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/card.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/> 
        <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

</head>
<body>
 			<div id="wrap">
            <!-- header -->
            <div id="header" class="clearfix">
                <h1>
                    <a href=""><img id="logo" src="${pageContext.request.contextPath}/assets/img/logo.png"></a>
                </h1>

                <ul id="category" class="clearfix">
                    <div class="dropdown">
                        <li class="dropbtn"><a href="">About</a></li>
                        <ul class="dropdown-content">
                            <li><a href="">이용 안내</a></li>
                            <li><a href="">1대1 문의</a></li>
                        </ul>
                    </div>
                    <div class="dropdown">
                        <li class="dropbtn"><a href="">Pen & Paper</a></li>
                        <ul class="dropdown-content">
                            <li><a href="">나의 일기</a></li>
                            <li><a href="">쪽지</a></li>
                            <li><a href="">우체통</a></li>
                        </ul>
                    </div>
                    <div class="dropdown">
                        <li class="dropbtn"><a href="">Shopping</a></li>
                    </div>
                    <div class="dropdown">
                        <li class="dropbtn"><a href="">Mood</a></li>
                        <ul class="dropdown-content">
                            <li><a href="">마법의 소라고둥</a></li>
                            <li><a href="">심리 테스트</a></li>
                        </ul>
                    </div>
                </ul>
                <ul id="user" class="clearfix">
                    <li><a href="">회원가입</a></li>
                    <li><a href="">로그인</a></li>
                </ul>
            </div>

        <!-- header끝 -->
        <!--content-->
        <div class="cwTitle">
                <h3>소통 카드</h3>
        </div>
        <div class="cardWrap"><!--height700-->
            <div class="cardRead-left">                 
                <div class="cardRead-subcard">
                    <span class="imgdate">2022-02-03</span>
                    <img src="${pageContext.request.contextPath}/assets/img/img (1).jpg" alt="">
                </div>
                <div class="ment">나님이 작성한 최근 댓글카드</div>
                    <div class="cardReadImg">
                        <div id="slick-container">
                            <img src="${pageContext.request.contextPath}/assets/img/img (3).jpg" alt="">
                            <img src="${pageContext.request.contextPath}/assets/img/img (4).jpg" alt="">
                            <img src="${pageContext.request.contextPath}/assets/img/img (5).jpg" alt="">
                            <img src="${pageContext.request.contextPath}/assets/img/img (6).jpg" alt="">
                            <img src="${pageContext.request.contextPath}/assets/img/img (7).jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>
            <div class="cardRead-right">
                <div class="cardRead-subcard">
                    <span class="imgdate">2022-02-03</span>
                    <img src="../assets/img/img (8).jpg" alt="">
                </div>
                <div class="ment">총 50개 댓글</div>
                    <div class="cardReadImg">
                        <div id="slick-container" class="slick-box">
                            <div class="slick-box" src="${pageContext.request.contextPath}/assets/img/slideLeft.png">
                            <img class="slick-box" src="${pageContext.request.contextPath}/assets/img/img (3).jpg" alt="">
                            <img class="slick-box" src="${pageContext.request.contextPath}/assets/img/img (4).jpg" alt="">
                            <img class="slick-box" src="${pageContext.request.contextPath}/assets/img/img (5).jpg" alt="">
                            <img class="slick-box" src="${pageContext.request.contextPath}/assets/img/img (6).jpg" alt="">
                            <img class="slick-box" src="${pageContext.request.contextPath}/assets/img/img (7).jpg" alt="">
                            <div class="slick-box" src="${pageContext.request.contextPath}/assets/img/slideRight.png">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="btn-ReadBottom">
            <button type="button" class="btn-ReadList"><a class="cardMainForm" href="cardMain.html">받은카드 리스트</a></button><!--list페이지로 이동-->
            <button type="submit" class="btn-ReadComment"><a class="cardReplyForm" href="cardReply.html">댓글카드 작성</a></button>
        </div>

        <script>
        
        </script>
    </body>
</html>