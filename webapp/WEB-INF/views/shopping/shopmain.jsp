<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>MyDeco</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/shopping.css">
<script src="../assets/js/jquery-1.12.4.js"></script>
<script src="../assets/bootstrap/js/bootstrap.js"></script>
<!-- 이부분에 이페이지에 필요한 css 추가 -->	    
	    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



</head>

<body>

	<div id="wrap">
		
		<div class="container">
		
			<!-- header -->
			<div class="row">
	            <c:import url="/WEB-INF/views/include/header.jsp"></c:import>    
			</div>
			<!-- //header -->
			
			<div class="row">
				
				<!-- content -->
				<div id="content" class="col-xs-12">
					
					<div class="row">
					
						<c:import url="/WEB-INF/views/include/aside-shop.jsp"></c:import>
					
						<div class="col-xs-9" id="main-content">  <!-- aside가 없으면 col-xs-12 사용 -->    			
							<div class="row div-sub">
								<div class="col-xs-12">
									<h3 class="subtitle">
										나의 일기 목록
									</h3>								
								</div>
							</div>
							
							<div id="main">
                   		 	<!-- ---여기에 자신의 코드 작성--------------------------------------------------------------------------------- -->
			
			
				   <!-- --쇼핑-------------------- -->
                            <!-- 여기가 옵션 검색창 -->
        
                            <div class="row div-sub">
                                <div class="col-xs-12" id="search2">
	                                <form action="${pageContext.request.contextPath}/shopping/search" >
	                                    <select id="keyword-cate" name="search">
	                                        <option value="prodName" selected="selected">제목</option>
	                                        <option value="price">가격</option>
	                                        <option value="emotion">감정</option>
	                                        <option value="userNo">작성자</option>
	                                    </select>
	                                
	                                    <input type="text" id="keyword" name="searchText" value="" placeholder="검색어를 입력해주세요">
	                                    <button id="searchBtn" type="submit">
	                                       <img id="btnImg" src="${pageContext.request.contextPath}/assets/img/magnifying-glass.png">
	                                    </button>
                                	 </form>
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
	                                        <div class="col-xs-12">
	                                        	<c:if test="${vo.emotion == 'happy'}">
	                                        		<button type="button" class="yellow">${vo.emotion}</button>
	                                        	</c:if>
	                                        	<c:if test="${vo.emotion == 'sad'}">
	                                        		<button type="button" class="blue">${vo.emotion}</button>
	                                        	</c:if>
	                                        	<c:if test="${vo.emotion == 'angry'}">
	                                        		<button type="button" class="orange">${vo.emotion}</button>
	                                        	</c:if>
	                                        	<c:if test="${vo.emotion == 'annoyed'}">
	                                        		<button type="button" class="green">${vo.emotion}</button>
	                                        	</c:if>
	                                        	<c:if test="${vo.emotion == 'relieved'}">
	                                        		<button type="button" class="pink">${vo.emotion}</button>
	                                        	</c:if>
	                            
	                                        	<input type="hidden" name="no" value="${vo.prodNo}">
	                                        </div>
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
	                                            <a href="#"><span class="">일기 :</span><span class="marginRight10">${vo.diaryCnt}개</span></a>
	                                            <a href="#"><span class="margin5">댓글 :</span><span class="marginRight10">${vo.cmtCnt}개</span></a>
	                                            <a href="#"><span class="margin5">찜 :</span><span id="pp${vo.prodNo}">${vo.pickCnt}</span><span>개</span></a>
	                                        </div>
	                                    </div>
	                                    <!-- /여기 3줄나눔 -->
	                                </div>
	                                
	                                <div class="col-xs-1">
	                                    <button type="button" class="btn btn-default btn-sm pickButton" data-prodno="${vo.prodNo}" >
	                                        <span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
	                                    </button>
	                                </div>
	
	                            </div>
                            </c:forEach>
                            <!-- /포문으로돌림 -->
                            
                            
                            
                            <!-- 페이징 -->
						<ul class="pagination pagination-sm">
							<c:if test="${map.prev == true}">
								<li><a href="${pageContext.request.contextPath}/shopping/myProduct?crtPage=${map.startPageBtnNo-1}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
							</c:if>
							
							<c:forEach begin="${map.startPageBtnNo}" end="${map.endPageBtnNo}" step="1" var="page">
								<c:choose>
									<c:when test="${param.crtPage == page}">
										<li class="active"><a href="${pageContext.request.contextPath}/shopping/myProduct?crtPage=${page}">${page}</a></li>
									</c:when>
									<c:otherwise>									
										<li><a href="${pageContext.request.contextPath}/shopping/myProduct?crtPage=${page}">${page}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<c:if test="${map.next == true}">
								<li><a href="${pageContext.request.contextPath}/shopping/myProduct?crtPage=${map.endPageBtnNo+1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
							</c:if>
                        </ul>
						<!-- /페이징 -->
                            
			
		
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
	
                   		 	<!-- ---여기에 자신의 코드 작성--------------------------------------------------------------------------------- -->
					
							</div>	
						
						</div>
						<!-- //main-content -->
						
						
					
					</div>
					<!-- //row -->
					
				</div>
				<!-- //content -->
			
			</div>
			<!-- //row -->
			
			
			
			<!--footer-->
			<div class="row">
	            <c:import url="/WEB-INF/views/include/footer2.jsp"></c:import>   
			</div>
			<!-- //footer -->

			
		</div>
		<!-- //container -->
		
	</div>
	<!-- //wrap -->
	
</body>
<script type="text/javascript">
  $(".pickButton").on("click",function(){
    	 
		var prodNo =  $(this).data("prodno");
		console.log(prodNo);    	 

     	$.ajax({
     		url : "${pageContext.request.contextPath }/shopping/addpick",		
     		type : "post",
     		contentType : "application/json",
     		data : JSON.stringify({prodNo : prodNo}),

     		dataType : "json",
     		success : function(pickResult){
     			console.log(pickResult);
     			if(pickResult == 'addPick'){
     				//찜 카운트 올리기
     				var pickCnt = $("#pp"+prodNo).text();
     				var newPickCnt = parseInt(pickCnt)+1;
     			 	$("#pp"+prodNo).text(newPickCnt); 
     			}else if(pickResult == 'delPick'){
     				////카운트 줄이기
     				var pickCnt = $("#pp"+prodNo).text();
     				var newPickCnt = parseInt(pickCnt)-1;
     			 	$("#pp"+prodNo).text(newPickCnt); 
     			}
     			
     			
     		},
     		error : function(XHR, status, error) {
     			console.error(status + " : " + error);
     		}
     	});
     });
 </script>


</html>