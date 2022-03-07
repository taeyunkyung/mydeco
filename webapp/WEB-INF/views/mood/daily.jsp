<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>My Deco</title>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/mood.css">
</head>

<body>
    <div id="wrap">
        <div class="container">
            <div class="row">
                <div class="col-xs-12" id="header">
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
                        <li><a href="">로그인</a></li>
                        <li><a href="">회원가입</a></li>
                    </ul>
                </div>
    
    
                <div class="col-xs-3" id="aside">
                    <ul>
                        <li id="title">Mood</li>
                        <li><a href="">마법의 소라고둥</a></li>
                        <li><a href="">심리테스트</a></li>
                    </ul>
                </div>
                
    
                <div class="col-xs-9" id="main-content">
                    <section id="main">
                   		<audio autoplay controls loop>
                   			<source src="${pageContext.request.contextPath}/assets/audio/임영웅-사랑은 늘 도망가.mp3" type="audio/mp3">
                   		</audio>
                        <h2>오늘의 운세를 알려주는 마법의 소라고둥</h2>
                        <img id="daily-img" src="${pageContext.request.contextPath}/assets/img/whelk.png"> 
                        <p>
                         
                        </p>
                        
                        <input type="button" class="daily-btn" onclick="js:begin()" value="네">
                        <input type="button" id="N" style="position: relative;" class="daily-btn" onmouseover="js:run()" value="아니오">
                     
                    </section>
                
                    <section id="result">
                        <h2>오늘의 운세는...</h2>
                        <div id="resultDesc">
                            <span></span>
                        </div>
                        <div>
                            <img id="resultImg2" src="${pageContext.request.contextPath}/assets/img/best.png">
                        </div>
                        <button type="button" id="main-btn" onclick="">다시하기</button>
                        <button type="button" id="main-btn" onclick="">기록하기</button>
                    </section>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="${pageContext.request.contextPath}/assets/js/random.js"></script>
</html>