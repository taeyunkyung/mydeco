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
<!--제이쿼리-->
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
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
                <div class="cardWrite-left">
                    <div class="cardSendbox">                    
                        <div class="cardWrite-subcard">
                            <img src="${pageContext.request.contextPath}/assets/img/img (1).jpg" alt="">
                            <span class="imgdate">2022-02-03</span>
                            <span class="imgtext">
                                <textarea id="c-text" name="c-text" cols="30" rows="10"></textarea>
                                <div id="text_cnt">(0 / 300)</div>
                            </span>
                        </div>
                        <div class="cardSet">
                            <div class="card-age">연령</div>
                                <div class="card-set1">
                                    <label><input class="cardset" type="checkbox" name="age" value="teen">10대</label>
                                    <label><input class="cardset" type="checkbox" name="age" value="twn">20대</label>                                                                     
                                    <label><input class="cardset" type="checkbox" name="age" value="trn">30대</label>                                                                     
                                    <label><input class="cardset" type="checkbox" name="age" value="frn">40대 이상</label>                                                                     
                                </div>
                            <div class="card-gender">성별</div>
                                <div class="card-set2">
                                    <label><input class="cardset" type="checkbox" name="gender" value="female">여성</label>
                                    <label><input class="cardset" type="checkbox" name="gender" value="male">남성</label>                                                                     
                                </div>
                        </div>
                    </div>                     
                </div>
                <!--사진넣기-->
                <div class="cardWrite-right">
                    <div class="cardWriteImg"><a href=""><img src="${pageContext.request.contextPath}/assets/img/img (1).jpg" alt=""></a></div>
                    <div class="cardWriteImg"><a href=""><img src="${pageContext.request.contextPath}/assets/img/img (2).jpg" alt=""></a></div>
                    <div class="cardWriteImg"><a href=""><img src="${pageContext.request.contextPath}/assets/img/img (3).jpg" alt=""></a></div>
                    <div class="cardWriteImg"><a href=""><img src="${pageContext.request.contextPath}/assets/img/img (4).jpg" alt=""></a></div>
                    <div class="cardWriteImg"><a href=""><img src="${pageContext.request.contextPath}/assets/img/img (5).jpg" alt=""></a></div>
                    <div class="cardWriteImg"><a href=""><img src="${pageContext.request.contextPath}/assets/img/img (6).jpg" alt=""></a></div>
                </div>
                <div class="cardWritePage">
                    <p class="page-no">◀  1  2  3  4  5  ▶</p>
                </div>
                
                <!--content끝-->
                <div class="clearfix">
                    <div class="cardWrite-bottom">
                        <input id="saveBtn" type="submit" class="btn-writeform-save" value="보내기">
                        <button type="reset" class="btn-writeform-reset"><a class="cardMainForm" href="cardMain.html">취소</a></button><!--list페이지로 이동-->
                    </div>
                </div>
            </div>
        
 
    <script>
 
    $(document).ready(function() {
        $('#c-text').on('keyup', function() {
            $('#text_cnt').html("("+$(this).val().length+" / 300)");
 
            if($(this).val().length > 300) {
                $(this).val($(this).val().substring(0, 300));
                $('#text_cnt').html("(300 / 300)");
            }
        });
    });
        
    </script>
    </body>
</html>