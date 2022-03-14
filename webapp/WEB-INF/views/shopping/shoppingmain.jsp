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
        <script src="../assets/js/jquery-1.12.4.js"></script>
        <script src="../assets/bootstrap/js/bootstrap.js"></script>


    </head>
    <body>
        <div id="wrap">
            <div class="container-fluid text-center">  
               <!-- header -->
               
               			<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
               
               <!--/header-->
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
                            <!-- --쇼핑-------------------- -->
                            <!-- 여기가 옵션 검색창 -->
        
                            <div class="row div-sub">
                                <div class="col-xs-12" id="search2">
                                    <select id="keyword-cate" name="">
                                        <option value="title" selected="selected">제목</option>
                                        <option value="price">가격</option>
                                        <option value="feel">감정</option>
                                        <option value="userId">작성자</option>
                                    </select>
                                
                                    <input type="text" id="keyword" name="" value="" placeholder="검색어를 입력해주세요">
                                    <button id="searchBtn">
                                       <img id="btnImg" src="../assets/img/plusglass.png">
                                    </button>
                                </div>
                            </div>
                            <!-- /옵션 검색창 -->
                           
                           <!-- 포문으로 돌림 -->
                           <c:forEach items="${merchandiseList}" var="vo">
	                            <div class="row div-sub">
	                                <div class="col-xs-2 imgbox">
	                                    <div class="padding0">
	                                        <a href="${pageContext.request.contextPath}/shopping/merchandise?no=${vo.prodNo}"><img class="prodImg" src="${pageContext.request.contextPath}/upload/${vo.prodImgSrc}"></a>
	                                    </div>
	                                </div>
	                                <div class="col-xs-9">
	                                    <!-- 여기 3줄나눔 -->
	                                    <div class="row">
	                                        <div class="col-xs-12"><button type="button">${vo.emotion}</button><input type="hidden" name="no" value="${vo.prodNo}"></div>
	                                    </div>
	                                    <div class="row">
	                                        <div class="col-xs-12 fontstyle">
		                                        <h4>
		                                        	<a href="${pageContext.request.contextPath}/shopping/merchandise?no=${vo.prodNo}">
		                                        		${vo.prodName}
		                                        	</a>
		                                        </h4>
	                                        </div>
	                                    </div>
	                                    <div class="row">
	                                        <div class="col-xs-12"><span class="marginRight10">${vo.price}원</span><span class="margin5">${vo.delivery}</span></div>
	                                    </div>
	                                    <div class="row">
	                                        <div class="col-xs-12">
	                                            <a href="#"><span class="">일기</span><span class="marginRight10">2</span></a>
	                                            <a href="#"><span class="margin5"> 댓글</span><span class="marginRight10">12</span></a>
	                                            <a href="#"><span class="margin5">찜</span><span class="marginRight10">54개</span></a>
	                                        </div>
	                                    </div>
	                                    <!-- /여기 3줄나눔 -->
	                                </div>
	                                
	                                <div class="col-xs-1">
	                                    <button type="button" class="btn btn-default btn-sm">
	                                        <span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
	                                      </button>
	                                </div>
	
	                            </div>
                            </c:forEach>
                            <!-- /포문으로돌림 -->



                	</div>
                </div>
				<!-- 푸터부분 -->
                <div class="row">
                    <div class="col-xs-12">
                    	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
                    </div>
                </div>
            </div>
        </div>
        
        </div>
    </body>
</html>