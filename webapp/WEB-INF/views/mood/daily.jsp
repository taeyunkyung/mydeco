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
            
            <!-- header -->
            <c:import url="/WEB-INF/views/include/header.jsp"></c:import>    
    
    
                <div class="col-xs-3" id="aside">
                    <ul>
                        <li id="title">Mood</li>
                        <li><a href="">마법의 소라고둥</a></li>
                        <li><a href="">심리테스트</a></li>
                    </ul>
                </div>
                
    
                <div class="col-xs-9" id="main-content">
                    <section id="main">
                   		<%-- <audio autoplay controls loop>
                   			<source src="${pageContext.request.contextPath}/assets/audio/임영웅-사랑은 늘 도망가.mp3" type="audio/mp3">
                   		</audio> --%>
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