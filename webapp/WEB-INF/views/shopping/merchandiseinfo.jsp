<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>shoppingMain</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/shopping.css">
    </head>
    <body>
        <div id="wrap">
            <div class="container-fluid text-center">  
                    
                    			<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
                <!-- 메인 -->
                <div class="row">
                    <!-- 어사이드부분 -->
                    <div class="col-xs-3" id="aside"> 
                        <div>
                            <ul>
                                <li id="title">Shopping</li>
                                <li><a href="">전체</a></li>
                                <li><a href="">기쁨</a></li>
                                <li><a href="">슬픔</a></li>
                                <li><a href="">화남</a></li>
                                <li><a href="">홀가분</a></li>
                                <li><a href="">짜증</a></li>
                                <li><a href="">얼탱이없음</a></li>
                            </ul>
                        </div>
                        <div>
                            <ul>
                                <li id="title">나의 쇼핑관리</li>
                                <li><a href="">내상품관리</a></li>
                                <li><a href="">찜하기</a></li>
                                <li><a href="">1:1채팅</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- /어사이드부분 -->
                    <!-- 메인컨텐츠 -->
                    <div class="col-xs-9">
                        <div class="">
                            <div class="div-sub">
                                <h3>Shopping</h3>
                            </div>
                            <!--/ --쇼핑-------------------- -->
                        <div class="row">
                            <div class="col-xs-11">
                                <h3 class="text-left">${product.prodName}</h3>
                            </div>
                            <div class="col-xs-1">
                                <a href="">♥</a>
                            </div>
                        </div>

                        <!-- 메인 컨텐츠 -->
                        <!-- 왼쪽 사진부분 -->
                        <div class="row">
                            <div class="col-xs-7">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class=" mainImgbox imgcenter">
                                            <img class="mainImgbox" src="C:/javaStudy/upload/${product.prodImgList[0].prodImgSrc}">
                                           
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="imgcenter">
                                            <img class="prodImg2" src="../assets/img/대동경운기.jpg">
                                            <img class="prodImg2" src="../assets/img/대동경운기.jpg">
                                            <img class="prodImg2" src="../assets/img/대동경운기.jpg">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- /왼쪽 사진부분 -->

                            <!-- 오른쪽 상품정보 -->
                            <div class="col-xs-5 bs-list height320">
                                <div class="row infomargin">
                                    <div class="col-xs-5"><span class="infotext">감정</span></div>
                                    <div class="col-xs-7"> ${product.emotion} </div>
                                </div>
                                <div class="row infomargin">
                                    <div class="col-xs-5"><span class="infotext">판매자</span></div>
                                    <div class="col-xs-7">정우성님</div>
                                </div>
                                <div class="row infomargin">
                                    <div class="col-xs-5"><span class="infotext">배송방법</span></div>
                                    <div class="col-xs-7">${product.delivery}</div>
                                </div>
                                <div class="row infomargin div-sub">
                                    <div class="col-xs-5"><span class="infotext">공유</span></div>
                                    <div class="col-xs-7">이미지</div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 text-right"><p class="infotext"> ${product.price} 원</p></div>
                                </div>
                                <div class="row text-center">
                                    <div class="col-xs-12"><a href="#" class="button marginauto" id="r-button">채팅 거래하기</a></div>
                                </div>
                            </div>
                        </div>
                        <!-- 오른쪽 상품정보 -->
                        <!-- /메인컨텐츠 -->
                       
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="div-sub">
                                    <h4 class="text-left fontstyle">상품설명</h4>
                                </div>
                                <div class="merchaninfobox">
                                    <p class="text-left">
                                        ${product.prodInfo}
                                    </p>
                                </div>


                            </div>
                        </div>
                        <!-- 일기장 -->

                        <div class="row">
                            <div class="div-sub">
                                <h3>일기장</h3>
                            </div>
                            <div class="col-xs-12 height320">

                            </div>
                        </div>

                        <!-- /일기장 -->

                        <div class="row">
                            <div class="div-sub fontstyle">
                                댓글
                            </div>
                            <div class="col-xs-10 padding0">
                                <textarea></textarea>
                            </div>
                            <div class="col-xs-2 padding0"><button class="button button2 marginauto" id="r-button">댓글 달기</button></div>
                        </div>
                        <!-- 댓글 -->
                        <div class="row text-left">
                            <div class="col-xs-12">
                                <!-- ajax로 출력할부분 -->
                                <div class="row">
                                    <div class="col-xs-10">
                                        <span class="recomandfontstyle">명수박님</span>
                                    </div>
                                    <div class="col-xs-2">
                                        <span class="text-right">2022-02-22</span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="height60">
                                            <span>오랜 친구를 보내시는군요 섭섭하시겠어요</span>
                                        </div>    
                                    </div>
                                </div>

                                <!--/ajax로 출력할부분  -->

                                 <!-- ajax로 출력할부분 -->
                                 <div class="row backgroundgray">
                                    <div class="col-xs-10">
                                        <span class="recomandfontstyle">명수박님</span>
                                    </div>
                                    <div class="col-xs-2">
                                        <span class="text-right">2022-02-22</span>
                                    </div>
                                </div>
                                <div class="row backgroundgray">
                                    <div class="col-xs-12">
                                        <div class="height60">
                                            <span>오랜 친구를 보내시는군요 섭섭하시겠어요</span>
                                        </div>    
                                    </div>
                                </div>

                                <!--/ajax로 출력할부분  -->
                            </div>
                        </div>
		                </div>
		                
		                
		                
		            </div>
		        </div>
		        <!-- 메인끝 -->   
		        <div class="row">
		            <div class="col-xs-12">
		            	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
		         	</div>
		        </div>
        	</div>	        
    	</div>
    </body>
</html>