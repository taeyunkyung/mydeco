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
    
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/bootstrap/js/bootstrap.js"></script>
    </head>
    <body>
        <div id="wrap">
            <div class="container-fluid text-center">  
                    
                    			<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
                <!-- 메인 -->
                <div class="row">
                    <!-- 어사이드부분 -->                   
                       <c:import url="/WEB-INF/views/include/aside-shop.jsp"></c:import>
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
                                           <img class="mainImgbox" id="img0" src="${pageContext.request.contextPath}/upload/${product.prodImgList[0].prodImgSrc}">
                                           
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="imgcenter">
                                            <img class="prodImg2" id="img1" src="${pageContext.request.contextPath}/upload/${product.prodImgList[0].prodImgSrc}">
                                            <img class="prodImg2" id="img2" src="${pageContext.request.contextPath}/upload/${product.prodImgList[1].prodImgSrc}">
                                            <img class="prodImg2" id="img3" src="${pageContext.request.contextPath}/upload/${product.prodImgList[2].prodImgSrc}">
                                            <img class="prodImg2" id="img4" src="${pageContext.request.contextPath}/upload/${product.prodImgList[3].prodImgSrc}">
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
                                    <div class="col-xs-7">${product.userName}</div>
                                </div>
                                <div class="row infomargin">
                                    <div class="col-xs-5"><span class="infotext">배송방법</span></div>
                                    <div class="col-xs-7">${product.delivery}</div>
                                </div>
                                <div class="row infomargin div-sub">
                                    <div class="col-xs-5"><span class="infotext">공유</span></div>
                                    <div class="col-xs-7" id="share">
                                    	 <a href="#"><img class="shareimg" src="${pageContext.request.contextPath}/assets/img/icon/instagram.jpg"></a>
                                    	 <a href="#"><img class="shareimg" src="${pageContext.request.contextPath}/assets/img/icon/facebook.jpg"></a>
                                    	 <a href="#"><img class="shareimg" src="${pageContext.request.contextPath}/assets/img/icon/twiter.png"></a>
                                    	 <a href="#"><img class="shareimg" src="${pageContext.request.contextPath}/assets/img/icon/youtube.png"></a>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 text-right"><p class="infotext"> ${product.price} 원</p></div>
                                </div>
                                <div class="row text-center">
                                    <div class="col-xs-12"><a href="${pageContext.request.contextPath}/myshop/chatList" class="button marginauto r-button">채팅 거래하기</a></div>
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
                                <textarea id="cmttext"></textarea>
                            </div>
                            <div class="col-xs-2 padding0"><button class="button button2 marginauto r-button" id="cmtsend">댓글 달기</button></div>
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
                                    <div class="col-xs-11">
                                        <div class="height60">
                                            <span>오랜 친구를 보내시는군요 섭섭하시겠어요</span>
                                        </div>    
                                    </div>
                                    <div class="col-xs-1">
                                    	<button id="recmt">댓글</button>
                                    </div>
                                </div>

                                <!--/ajax로 출력할부분  -->

                                 <!-- ajax로 출력할부분 -->
                                 <c:forEach items="${cmtList}" var="vo">    
											<div class="row backgroundgray">
		
			                                    <div class="col-xs-10">
			                                        <span class="recomandfontstyle">${vo.name }님</span>
			                                    </div>
			                                    <div class="col-xs-2">
			                                        <span class="text-right">${vo.regDate}</span>
			                                    </div>
		                              		</div>	                            	
		                                	<div class="row backgroundgray">	                             
		                                  	  	<div class="col-xs-12">
			                                        <div class="height60">
			                                            <span>${vo.cmtContent}</span>
			                                        </div>    
		                                   		</div>	                              
			                                </div>
                                </c:forEach>

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
    
    <script type="text/javascript">
    
    $("#cmtsend").on("click",function(){

    	var cmttext = $("#cmttext").val();
    	
    	var prodNo = ${product.prodNo};
    	
    	var ShoppingCmtVo = {cmtContent: cmttext,
    						 prodNo: prodNo};
    	console.log(cmttext);
    	console.log(prodNo);
    	
    	$.ajax({
    		
    		url : "${pageContext.request.contextPath }/shopping/cmtwrite",		
    		type : "post",
    		contentType : "application/json",
    		data : JSON.stringify(ShoppingCmtVo),

    		dataType : "json",
    		success : function(vo){
    			
    			//입력화면 초기화
				$("#cmttext").val("");
    			
    		//q
    			
    			
    			
    			
    		},
    		error : function(XHR, status, error) {
    			console.error(status + " : " + error);
    		}
    	});
    });

    /////////////////////////////////////////대댓글 달기////////////////////////
    
    $("#recmt").on("click",function(){

    	var cmttext = $("#recmt").val();
    	
    	var prodNo = ${product.prodNo};
    	
    	var ShoppingCmtVo = {cmtContent: cmttext,
    						 prodNo: prodNo};
    	console.log(cmttext);
    	console.log(prodNo);
    	
    	$.ajax({
    		
    		url : "${pageContext.request.contextPath }/shopping/cmtwrite",		
    		type : "post",
    		contentType : "application/json",
    		data : JSON.stringify(ShoppingCmtVo),

    		dataType : "json",
    		success : function(result){
    			
    			//입력화면 초기화
				$("#cmttext").val("");
    			
    			
    			
    			
    			
    			
    		},
    		error : function(XHR, status, error) {
    			console.error(status + " : " + error);
    		}
    	});
    });

    
    
    //////////////////////////////////////////이미지 순서바꾸기//////////////////
    
    $("#img1").on("click",function(){
		console.log("이미지클릭");
		$("#img0").attr("src", "${pageContext.request.contextPath}/upload/${product.prodImgList[0].prodImgSrc}");
		$("#img1").attr("src", "${pageContext.request.contextPath}/upload/${product.prodImgList[0].prodImgSrc}");
		$("#img2").attr("src", "${pageContext.request.contextPath}/upload/${product.prodImgList[1].prodImgSrc}");
		$("#img3").attr("src", "${pageContext.request.contextPath}/upload/${product.prodImgList[2].prodImgSrc}");
		$("#img4").attr("src", "${pageContext.request.contextPath}/upload/${product.prodImgList[3].prodImgSrc}");
		
	});
    
    $("#img2").on("click",function(){
		console.log("이미지클릭");
		$("#img0").attr("src", "${pageContext.request.contextPath}/upload/${product.prodImgList[1].prodImgSrc}");
		$("#img1").attr("src", "${pageContext.request.contextPath}/upload/${product.prodImgList[0].prodImgSrc}");
		$("#img2").attr("src", "${pageContext.request.contextPath}/upload/${product.prodImgList[1].prodImgSrc}");
		$("#img3").attr("src", "${pageContext.request.contextPath}/upload/${product.prodImgList[2].prodImgSrc}");
		$("#img4").attr("src", "${pageContext.request.contextPath}/upload/${product.prodImgList[3].prodImgSrc}");
		
	});
    
    $("#img3").on("click",function(){
		console.log("이미지클릭");
		$("#img0").attr("src", "${pageContext.request.contextPath}/upload/${product.prodImgList[2].prodImgSrc}");
		$("#img1").attr("src", "${pageContext.request.contextPath}/upload/${product.prodImgList[0].prodImgSrc}");
		$("#img2").attr("src", "${pageContext.request.contextPath}/upload/${product.prodImgList[1].prodImgSrc}");
		$("#img3").attr("src", "${pageContext.request.contextPath}/upload/${product.prodImgList[2].prodImgSrc}");
		$("#img4").attr("src", "${pageContext.request.contextPath}/upload/${product.prodImgList[3].prodImgSrc}");
		
	});
    
    $("#img4").on("click",function(){
		console.log("이미지클릭");
		$("#img0").attr("src", "${pageContext.request.contextPath}/upload/${product.prodImgList[3].prodImgSrc}");
		$("#img1").attr("src", "${pageContext.request.contextPath}/upload/${product.prodImgList[0].prodImgSrc}");
		$("#img2").attr("src", "${pageContext.request.contextPath}/upload/${product.prodImgList[1].prodImgSrc}");
		$("#img3").attr("src", "${pageContext.request.contextPath}/upload/${product.prodImgList[2].prodImgSrc}");
		$("#img4").attr("src", "${pageContext.request.contextPath}/upload/${product.prodImgList[3].prodImgSrc}");
		
	});
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    </script>
    
    
    <!--  코멘트 에이젝스 시작 -->
  
</html>