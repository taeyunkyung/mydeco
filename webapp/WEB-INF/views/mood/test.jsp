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
                        <h2>속마음을 알아보는 심리 테스트</h2>
                        <img id="main-img" src="${pageContext.request.contextPath}/assets/img/mainbook_before_login.png"> 
                        <p>
                            당신은 어떤 유형일까요? 이번 기회에 알아봐요.
                        </p>
                        <button type="button" id="main-btn" onclick="js:begin()">시작하기</button>
                    </section>
                
                    <section id="qna">
                        <div class="status">
                            <div class="statusBar">
                        </div>
                          </div>
                        <div class="qBox">
                            
                        </div>
                        <div class="answerBox">
        
                        </div>
                    </section>
                
                    <section id="result">
                        <h2>당신의 결과는?</h2>
                        <div class="resultname">

                        </div>
                        <div id="resultImg">

                        </div>
                        <div class="resultDesc">

                        </div>
                        <button type="button" id="main-btn" onclick="">공유하기</button>
                    </section>
                    <script src="${pageContext.request.contextPath}/assets/js/data.js" charset="UTF-8"></script>
                    <script src="${pageContext.request.contextPath}/assets/js/start.js" charset="UTF-8"></script>
                </div>
            </div>
        </div>
    </div>
</body>

</html>