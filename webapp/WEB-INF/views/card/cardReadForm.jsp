<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
    <html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Mydeco</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.min.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/main.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/card.css">
    
    </head>

    <body>
        <div class="wrap">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <!-- header -->
                        <div id="header" class="clearfix">
                            <h1>
                                <a href=""><img id="logo" src="../assets/img/logo.png"></a>
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
                    </div>
                </div>
                    <!-- header끝 -->
                <!--contents-->
                <div class="row">
                    <div class="col-xs-12">
                        <div id="cTitle">
                            <h3>소통 카드</h3>
                        </div>
                    </div>
                </div>  
                <div class="row">
                    <div class="col-xs-6">
                        <div class="row">
                            <div class="col-xs-12 border-cardread"><!--내가 작성한 카드-->
                                <div class="cardRead-subcard">
                                    <div class="imgdate">2022-02-03</div>
                                    <img src="../assets/img/img (7).jpg" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="ment">나님이 작성한 최근 카드</div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="cardReadImg">
                                        <div><img src="../assets/img/slideLeft.png"></div>
                                        <div><img src="../assets/img/img (1).jpg" alt=""></div>
                                        <div><img src="../assets/img/img (2).jpg" alt=""></div>
                                        <div><img src="../assets/img/img (3).jpg" alt=""></div>
                                        <div><img src="../assets/img/img (4).jpg" alt=""></div>
                                        <div><img src="../assets/img/img (5).jpg" alt=""></div>
                                        <div><img src="../assets/img/slideRight.png"></div>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="col-xs-6">
                        <div class="row">
                            <div class="col-xs-12 border-cardread">
                                <div class="cardRead-subcard">
                                    <div class="imgdate">2022-02-03</div>
                                    <img src="../assets/img/img (1).jpg" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="ment">총 50개 댓글</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="cardReadImg">

                                    <div><img src="../assets/img/slideLeft.png"></div>
                                    <div><img src="../assets/img/img (3).jpg" alt=""></div>
                                    <div><img src="../assets/img/img (4).jpg" alt=""></div>
                                    <div><img src="../assets/img/img (5).jpg" alt=""></div>
                                    <div><img src="../assets/img/img (6).jpg" alt=""></div>
                                    <div><img src="../assets/img/img (7).jpg" alt=""></div>
                                    <div><img src="../assets/img/slideRight.png"></div>
                                    
                                </div>
                            </div>
                        </div>
                       
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <button type="reset" class="btn-ReadList"><a class="cardMainForm" href="${pageContext.request.contextPath}/card/main">작성카드 리스트</a><!--list페이지로 이동-->
                        </div>
                    </div>
                </div>

        <script>
        
        </script>
    </body>
</html>