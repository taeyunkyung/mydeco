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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/letter.css">
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/fabric.js"></script>
    <script src="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/js/bootstrap.min.js"></script>
</head>

<body>
    <div id="wrap">
        <div class="container">
            <div class="row">
                
                <!-- header -->
	            <c:import url="/WEB-INF/views/include/header.jsp"></c:import>         
    
    
               	<!-- aside -->
				<c:import url="/WEB-INF/views/include/mydiaryaside.jsp"></c:import>
                
    
                <div class="col-xs-9" id="main-content">
                
                	 <div class="letter_list">
                	 
                     	<div id="cTitle">
                      		<h3>우체통</h3>
                   		</div>
                   		
                     	<div id="letter_tap">
                        	<input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
                            <label for="tab1">보낸 편지</label>
                            
                            <input id="tab2" type="radio" name="tabs">
                            <label for="tab2">작성 중인 편지</label>
                                
                                
                            <c:if test="${authUser != null}">
                            	<a class="btn-letter-write" href="${pageContext.request.contextPath}/letter/writeForm">편지 쓰기</a>
                            </c:if>
                            
                            
                            <section id="content1">
                            	<div class="tap_content">

									<c:forEach items="${requestScope.letterSaveList}" var="letterVo">
										<c:if test="${letterVo.userNo == authUser.userNo}">
											<c:choose>
												<c:when test="${letterVo.readYN eq 'NO'}">
													<div class="envelope">
														<div class="envelope-img">
															<img src="${pageContext.request.contextPath}/assets/img/envelope.png">
														</div>
														
														
														<!-- 열지않은 편지 -->
														<c:choose>
															<c:when test="${letterVo.dDay < 0}"> <!-- 오픈일 지난거 -->
																<div class="day popup_open_btn" data-openyn="y" data-letterno="${letterVo.letterNo}">
																	<h3 class="Dday">OPEN</h3>
																	<p class="sendDay">보낸 날짜: ${letterVo.regDate}</p>
																	<p class="openDay">공개 날짜: ${letterVo.openDay}</p>
																</div>
															</c:when>
															<c:when test="${letterVo.dDay == 0}"> <!-- 오늘 오픈편지 -->
																<div class="day popup_open_btn" data-openyn="y" data-letterno="${letterVo.letterNo}">
																	<h3 class="Dday">D-DAY</h3>
																	<p class="sendDay">보낸 날짜: ${letterVo.regDate}</p>
																	<p class="openDay">공개 날짜: ${letterVo.openDay}</p>
																</div>
															</c:when>
															<c:otherwise> <!-- 오픈일 남은 편지 -->
																<div class="day popup_open_btn" data-openyn="n" data-letterno="${letterVo.letterNo}">
																	<h3 class="Dday">D-${letterVo.dDay}</h3>
																	<p class="sendDay">보낸 날짜: ${letterVo.regDate}</p>
																	<p class="openDay">공개 날짜: ${letterVo.openDay}</p>
																</div>
																</c:otherwise>
														</c:choose>
				
													</div>
												</c:when>
												<c:otherwise>
													<div class="envelope">
														<div class="envelope-img">
															<img src="${pageContext.request.contextPath}/assets/img/read.png">
														</div>
														<div class="day popup_open_btn" data-openyn="y" data-letterno="${letterVo.letterNo}">
															<p class="RsendDay">보낸 날짜: ${letterVo.regDate}</p>
															<p class="read">${letterVo.text}</p>
															<p class="RopenDay">공개 날짜: ${letterVo.openDay}</p>
															
														</div>
													</div>
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:forEach>

								</div>
                                
                                <div class="page">
                                	<p class="page-no">◀  1  2  3  4  5  6  7  8  9  10  ▶</p>
                                </div>
                            </section>
                            
                                <section id="content2">
                                    <div class="tap_content">


									<c:forEach items="${requestScope.letterKeepList}" var="letterVo">
										<c:if test="${letterVo.userNo == authUser.userNo}">
											<div class="envelope" >
												<div class="envelope-img">
													<img
														src="${pageContext.request.contextPath}/assets/img/read.png">
												</div>
												<div class="day">
													<p class="saveDay">저장 날짜: ${letterVo.regDate}</p>
													<p class="letter-ing">${letterVo.text}</p>
												</div>
											</div>
										</c:if>
									</c:forEach>


								</div>
                                    <!-- //tap_content -->
                                    
                                   	<div class="page">
                                		<p class="page-no">◀  1  2  3  4  5  6  7  8  9  10  ▶</p>
                                	</div>
                                </section>
                        </div>
                 
                	</div>
                
            </div>
        </div>
    </div>
    <!--footer영역-->
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>  
</div>
    
    
<!---편지보기 모달창------------------------------------------------------>

<div id="ModalLetterView" class="modal fade">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
			 	<h3>나에게 보내는 편지</h3>
				
				<div class="days">
		    		<div class="modal-day-left">
		    			보낸 날짜: 2022.02.14
		    		</div>
		    		<div class="modal-day-right">
		    			받은 날짜: 2022.03.14
		    		</div>
	    		</div>
			</div>
			
		  	<div class="modal-body">
		  
		  		<canvas class="letter-read" id="paper"></canvas>
		  	
		  	</div>
		  	
		  	
		  	<div class="modal-footer btn-center">
		    	
	    		<button class="btn-letter-close" type="button" data-dismiss="modal">닫기</button>
	    		
		 	</div>
		 	
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<!------------------------------------------------------------------->

    
	
</body>


<script type="text/javascript">

//캔버스 초기화 설정
var canvas = new fabric.Canvas("paper", {
	 width: 680,
	 height: 690,
	 backgroundColor: '#686099'
});


$(".popup_open_btn").on("click",function(){
	
	var openyn = $(this).data("openyn");
	
	var letterNo = $(this).data("letterno");
	
	if(openyn == 'y'){
		
		//모달창으로 편지 보기
		showLetter(letterNo);
		
	}else if(openyn == 'n'){
		alert("공개일이 되지 않았습니다.");
	}else {
		console.log("입력오류");
	}
	
	

});


//모달창 편지 보기 함수
function showLetter(letterNo){
	
	console.log(letterNo);
	
	
	/*모달창 보이기*/
	$("#ModalLetterView").modal('show');
}


</script>
</html>