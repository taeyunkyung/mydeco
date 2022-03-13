<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html lang="ko"> <!-- 한국어문서만 검색할때, 음성으로 할때 한국어 음성지원 -->
    <head>
        <meta charset="UTF-8"> <!-- 브라우저가 문서를 해석할때 필요한 정보 -->
        <title>message</title>
        <link rel="stylesheet" href="../assets/css/bootstrap.css">  
        <link rel="stylesheet" href="../assets/css/main.css">
        <link rel="stylesheet" href="../assets/css/card.css">
        <!--제이쿼리-->
        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
 
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
                <div class="cardwrite">
                    <div class="row">
                        <div class="col-xs-8">
                            <div class="border-cardwrite">

                                <div class="row">
                                    <div class="col-xs-12"><!--float:left띄워서 사진-->
                                        <div class="height600">
                                            <div class="cardwrite-imgdate">2022-02-03</div>
                                            <img class="cardwriteimg" src="../assets/img/img (1).jpg" alt="">
                                            <textarea id="c-text" name="c-text" cols="30" rows="10"></textarea>
                                            <div id="text_cnt">(0 / 300)</div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xs-12 clearfix">
                                        <form method="get" action="form-action.html">
                                            
                                            <div style="float:left">
                                                <legend>성별</legend>
                                                <label><input type="radio" name="gender" value="male">남성 </label>
                                                <label><input type="radio" name="gender" value="female">여성</label>
                                                <legend>연령</legend>
                                            </div>
                                            

                                            <div style="float:right">
                                                <label><input style="width:30px;" type="radio" name="age" value="teen">10대</label>
                                                <label><input type="radio" name="age" value="twn">20대</label>
                                                <label><input type="radio" name="age" value="trn">30대</label>
                                                <label><input type="radio" name="age" value="ftn" >40대 이상</label>
                                            </div>
                                            
                                            
                                        </form>
                                    </div>
                                </div> 
                            </div>
                        </div>

                        <div class="col-xs-4">
                            <div class="border-cardwrite"><!--배경목록8개-->
                                <div class="cardwritebg">
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <a href=""><img src="../assets/img/img (1).jpg" alt=""></a>
                                        </div>
                                        <div class="col-xs-6">
                                            <a href=""><img src="../assets/img/img (2).jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <a href=""><img src="../assets/img/img (3).jpg" alt=""></a>
                                        </div>
                                        <div class="col-xs-6">
                                            <a href=""><img src="../assets/img/img (4).jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <a href=""><img src="../assets/img/img (5).jpg" alt=""></a>
                                        </div>
                                        <div class="col-xs-6">
                                            <a href=""><img src="../assets/img/img (6).jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <a href=""><img src="../assets/img/img (7).jpg" alt=""></a>
                                        </div>
                                        <div class="col-xs-6">
                                            <a href=""><img src="../assets/img/img (8).jpg" alt=""></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                            
                    </div>
                </div>
                
            
            

                <!--보내기/취소-->
                <div class="row">
                    <div class="col-xs-8">
                        <input id="saveBtn" type="submit" class="btn-writeform-save" value="보내기">
                    </div>
                    <div class="col-xs-4">
                        <button type="reset" class="btn-writeform-reset"><a class="cardMainForm" href="cardMain.html">취소</a></button><!--list페이지로 이동-->
                    </div>
                </div>


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