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
                <!-- header -->
				<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
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

        	</div>
        </div>
    </body>
</html>