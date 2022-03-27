<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>MyDeco</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/main.css">
<!-- 이부분에 이페이지에 필요한 css 추가 -->	    
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/letter.css">
    
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/fabric.js"></script>
<script src="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/js/bootstrap.min.js"></script>
	  



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
					
						<c:import url="/WEB-INF/views/include/ppaside.jsp"></c:import>
					
						<div class="col-xs-9" id="main-content">  <!-- aside가 없으면 col-xs-12 사용 -->    			
							<h3 class="subtitle">
								우체통
							</h3>
							
							<div id="main">
                   		 	<!-- ---여기에 자신의 코드 작성--------------------------------------------------------------------------------- -->
								
								<div class="letter_list">
									<div id="letter_tap">
									   <c:if test="${param.tab != 2}">
				                          	<input id="tab1" type="radio" name="tabs" checked="checked"> <!--디폴트 메뉴-->
				                            <label for="tab1">보낸 편지</label>
				                            
				                            <input id="tab2" type="radio" name="tabs" >
			                            	<label for="tab2">작성 중인 편지</label>
			                            </c:if>
			                            
			                            <c:if test="${param.tab == 2}">
				                        	<input id="tab1" type="radio" name="tabs" > <!--디폴트 메뉴-->
				                            <label for="tab1">보낸 편지</label>
				                            
				                            <input id="tab2" type="radio" name="tabs" checked="checked">
			                            	<label for="tab2">작성 중인 편지</label>
			                            </c:if>
			                                
			                            <c:if test="${authUser != null}">
			                            	<a class="btn-letter-write" href="${pageContext.request.contextPath}/letter/writeForm">편지 쓰기</a>
			                            </c:if>
			                            
			                            
			                            <section id="content1">
			                            	<div class="tap_content clearfix">
			
												<c:forEach items="${requestScope.saveMap.saveList}" var="letterVo">
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
											
			                                <c:if test="${authUser != null}">
				                                <div class="page">
													<ul>	
														<c:if test="${saveMap.prev == true}">
															<li><a href="${pageContext.request.contextPath}/letter?crtPage=${saveMap.startPageBtnNo - 1}">◀</a></li>
														</c:if>	
																			
														<c:forEach begin="${saveMap.startPageBtnNo}" end="${saveMap.endPageBtnNo}" step="1" var="page">
															<c:choose>
																<c:when test="${param.crtPage == page}">
																	<li class="active"><a href="${pageContext.request.contextPath}/letter?tab=1&crtPage1=${page}">${page}</a></li>
																</c:when>
																<c:otherwise>
																	<li><a href="${pageContext.request.contextPath}/letter?tab=1&crtPage1=${page}">${page}</a></li>
																</c:otherwise>
															</c:choose>
														</c:forEach>
														
														<c:if test="${saveMap.next == true}">									
															<li><a href="${pageContext.request.contextPath}/letter?crtPage1=${saveMap.endPageBtnNo + 1}">▶</a></li>
														</c:if>								
													</ul>
				                                </div>
			                                </c:if>
			                                
			                            </section>
			                            
			                            
			                            
			                            
			                                <section id="content2">
			                                    <div class="tap_content clearfix">
			
			
												<c:forEach items="${requestScope.keepMap.keepList}" var="letterVo">
													<c:if test="${letterVo.userNo == authUser.userNo}">
														<div class="envelope" >
															<div class="envelope-img">
																<img
																	src="${pageContext.request.contextPath}/assets/img/read.png">
															</div>
															
															<!-- 파라미터 값(letterNo) 수정폼으로 보내기 -->
															<a href="${pageContext.request.contextPath}/letter/modifyForm?letterNo=${letterVo.letterNo}">
																<div class="day modify">
																	<p class="saveDay">저장 날짜: ${letterVo.regDate}</p>
																	<p class="letter-ing">${letterVo.text}</p>
																</div>
															</a>
														</div>
													</c:if>
												</c:forEach>
			
			
											</div>
			                                    <!-- //tap_content -->
			                                    
			                                    
			                                     <c:if test="${authUser != null}">
					                                   	<div class="page">
															<ul>	
																<c:if test="${keepMap.prev == true}">
																	<li><a href="${pageContext.request.contextPath}/letter?crtPage2=${keepMap.startPageBtnNo - 1}">◀</a></li>
																</c:if>	
																					
																<c:forEach begin="${keepMap.startPageBtnNo}" end="${keepMap.endPageBtnNo}" step="1" var="page">
																	<c:choose>
																		<c:when test="${param.crtPage == page}">
																			<li class="active"><a href="${pageContext.request.contextPath}/letter?tab=2&crtPage2=${page}">${page}</a></li>
																		</c:when>
																		<c:otherwise>
																			<li><a href="${pageContext.request.contextPath}/letter?tab=2&crtPage2=${page}">${page}</a></li>
																		</c:otherwise>
																	</c:choose>
																</c:forEach>
																
																<c:if test="${keepMap.next == true}">									
																	<li><a href="${pageContext.request.contextPath}/letter?crtPage2=${keepMap.endPageBtnNo + 1}">▶</a></li>
																</c:if>								
															</ul>
					                                	</div>
			                                	</c:if>
			                                	
			                                </section>
			                        </div>
								</div>
			
	
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
	            <c:import url="/WEB-INF/views/include/footer.jsp"></c:import>   
			</div>
			<!-- //footer -->

			
		</div>
		<!-- //container -->
		
	</div>
	<!-- //wrap -->





<!---편지보기 모달창------------------------------------------------------>

<div id="ModalLetterView" class="modal fade">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
			
				<div id="modalTitle">
					
					<div class="audiodiv" style="float:right; margin-right:15px; margin-top:3px;">
		        		<audio id="audio" src="" controls autoplay loop style="height:20px; width:300px; margin-left:38px;"></audio>
		        	</div>	
		        	
		        	<h3 class="forMe">나에게 보내는 편지</h3>
				</div>
			 	
				
				<div class="days">
		    		<div class="modal-day-left">
		    			<p id="mr">보낸 날짜: </p> <p id="modal-regDate"> </p>
		    		</div>
		    		<div class="modal-day-right">
		    			<p id="modal-openDay"> </p> <p id="mo">  받은 날짜: </p> 
		    		</div>
	    		</div>
			</div>
			
		  	<div class="modal-body">
		  		<canvas class="letter-read" id="paper"></canvas>
		  	</div>
		  	
		  	
		  	<div class="modal-footer btn-center">
		    	
	    		<button class="btn-letter-close" type="button" data-dismiss="modal" id="removeCheck">삭제하기</button>
	    		<button class="btn-letter-close" type="button" data-dismiss="modal">닫기</button>
	    		
		 	</div>
		 	
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->





	
</body>


<script type="text/javascript">



//캔버스 초기화 설정
var canvas = new fabric.Canvas("paper", {
	 width: 680,
	 height: 690,
	 backgroundColor: '#CEC9EF'
});

var letterNo;

//모달창 호출(보기 페이지)
$(".popup_open_btn").on("click",function(){
	
	var openyn = $(this).data("openyn");
	console.log(openyn);
	
	letterNo = $(this).data("letterno");
	
	
	if(openyn == 'y'){ //열람가능한 편지
		
		//모달창으로 편지 보기
		showLetter(letterNo);
		//console.log('팝업 버튼 클릭' + letterNo);
		
	}else if(openyn == 'n'){ //열람 안되는 편지
		alert("아직 열람이 불가능한 편지입니다.");
	}else {
		console.log("입력오류");
	}

});


$("#removeCheck").on("click",function(){
	
	console.log("+++++");
	console.log(letterNo);
	
	 if (confirm("정말 삭제하시겠습니까?") == true){//확인

	     letterDelete(letterNo);
	     location.reload();

	 }else{ //취소
	     return false;
	 }
});



//편지 삭제 함수
function letterDelete(letterNo){
	
	//클릭한 편지의 편지 번호
	var letterNo = letterNo;
	
	$.ajax({
	    url : "${pageContext.request.contextPath}/letter/delete",
	    type : "post",
	    contentType : "application/json",
	    data : JSON.stringify(letterNo),//데이터 보내기
	    dataType : "json",
	    success : function() {
	    	
	    	console.log("삭제되었습니다.");
	    	
	    },
	    error : function(XHR, status, error) {
	       console.error(status + " : " + error);
	    }
	 });
	
}



//모달창 편지 보기 함수
function showLetter(letterNo){
	
	//캔버스 초기화(이전에 보였졌던 일기 지우기);
	modalCanvasInit();
	
	//클릭한 편지의 편지 번호
	var letterNo = letterNo;
	
	/*키:값*/
	var lettervo = {letterNo : letterNo};
	console.log(lettervo);
	
	$.ajax({
	    url : "${pageContext.request.contextPath}/letter/read",
	    type : "post",
	    contentType : "application/json",
	    data : JSON.stringify(lettervo),//데이터 보내기
	    dataType : "json",
	    success : function(letterVo) {
	    	
		    $("#modal-regDate").text(letterVo.regDate);
		    $("#modal-openDay").text(letterVo.openDay);
		    $("#audio").attr("src",letterVo.bgmSrc);
		    
		    var letterItemList = letterVo.itemList;
		    
		    for(var i=0; i<letterItemList.length; i++){
				itemRender(letterItemList[i]);
			}
	    
			/*모달창 보이기*/
			$("#ModalLetterView").modal('show');
		    
	    },
	    error : function(XHR, status, error) {
	       console.error(status + " : " + error);
	    }
	 });


}

/*모달창 초기화*/
function modalCanvasInit(){
	
	canvas.clear();
	canvas.width = 680;
	canvas.height = 690,
	canvas.backgroundColor = '#CEC9EF'

};	

/*모달창 닫힐때 bgm삭제*/
$('#ModalLetterView').on('hidden.bs.modal', function (e) {
	$("#audio").attr("src","");
}) 
 

//아이템 그리기
function itemRender(letterItemVo){
	console.log(letterItemVo);
	console.log("===============================");
	
	
	if(letterItemVo.stickerCateNo == 0){ //텍스트 이면
		var text = new fabric.Textbox(letterItemVo.text);

		//기본 폰트 크기
		text.fontSize = 16;
		
		//좌표
		text.top = letterItemVo.top;
		text.left = letterItemVo.left;
		
		//스케일
		text.scaleX = letterItemVo.letterPointX;
		text.scaleY = letterItemVo.letterPointY;
		
		//각도
		text.angle = letterItemVo.angle;

		//변경안되게
		text.selectable = false;
		
		//커서모양기본
		text.hoverCursor ="default";
		
		//캔버스에 추가
		canvas.add(text);
		
		console.log(text);
		console.log("===============================");
	
	}else if(letterItemVo.stickerCateNo == 3) { // 배경--캔버스 새로 만들듯 배경도 사용된 스티커 경로만 갖고와서 다시 그려주기
		fabric.Image.fromURL(letterItemVo.stickerSrc, function(backImg) {

			canvas.setBackgroundImage(backImg, canvas.renderAll.bind(canvas),{
				letterPointX: canvas.width / backImg.width,
				letterPointY: canvas.height / backImg.height
			});
			
			console.log("=====================================");
			console.log(backImg);
		});
		
		
	}else {  //스티커- stickerCateNo == 2
		console.log("*******");
		console.log(letterItemVo);
		fabric.Image.fromURL(letterItemVo.stickerSrc, function(oImg) {
			
			//좌표
			oImg.top = letterItemVo.top;
			oImg.left = letterItemVo.left;
			
			//스케일
			oImg.scaleX = letterItemVo.letterPointX;
			oImg.scaleY = letterItemVo.letterPointY;
			
			//각도
			oImg.angle = letterItemVo.angle;
			
			//변경안되게
			oImg.selectable = false;
			
			//커서모양기본
			oImg.hoverCursor ="default";

			
			//캔버스에 추가
			canvas.add(oImg);
		});
	}
	
	
}

</script>

</html>