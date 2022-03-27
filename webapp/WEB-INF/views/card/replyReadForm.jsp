<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
    <html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Mydeco</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/slick.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/main.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/card.css">
    
    
    	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
    	<script src="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/js/bootstrap.js"></script>
    	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/slick.min.js"></script>
    
    
    	<style>
			#leftCardSlider {
				width: 380px;
				/* background-color: gray; */
			}
			
			.slick-list {
				width: 272px;
				margin: 0px 0px 0px 0px;
				float: left;
			}
		</style>
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
					
						<c:import url="/WEB-INF/views/include/mydiaryaside.jsp"></c:import>
					
						<div class="col-xs-9" id="main-content">  <!-- aside가 없으면 col-xs-12 사용 -->    			
							<div id="cTitle">
								<h3>소통 카드</h3>
							</div>
							
							<div id="main">
                   		 	<!-- ---여기에 자신의 코드 작성--------------------------------------------------------------------------------- -->
								
									<div class="row">
					                    <div class="col-xs-6">
					                        <div class="row">
					                            <div class="col-xs-12 border-replyread1"><!--내가 작성한 카드-->
					                                <div id="leftCard" class="replyRead-subcard" ">
					                                    <div class="imgdate" style="position: relative;top: 80px;left: 40px;font-size: 20px;color: black;width: 200px;    height: 30px;">${replyCardList[0].cardRegdate}</div>
					                                    <div class="cardContent">${replyCardList[0].cardContent}</div>
					                                   	<img src="${replyCardList[0].cardImgSrc}">
					                                </div>
					                            </div>
					                        </div>
					                        <div class="row">
					                            <div class="col-xs-12">
					                                 <div class="ment"><span>${authUser.name}</span>이 받은 최근 카드</div>
					                            </div>
					                            <div class="row">
					                                <div class="col-xs-12">
					                                   
					                                    <div id="leftItemBox"class="replyReadImg">
					                                    	<!-- 원본 카드 썸네일 리스트 -->
					                                    </div>
					                                </div>
					                            </div>
					                        </div>
					                    </div>
					
					
					
					                    <div class="col-xs-6">
					                        <div class="row">
					                            <div class="col-xs-12 border-replyread2">
					                                <div id="rightCard" class="replyRead-subcard2">
					                                
					                                    <div class="imgdate"></div>
					                                    <div class="cardContent replyCardContent"></div>
					                                    <img src="" alt="">
					                                    
					                                </div>
					                            </div>
					                        </div>
					                        <div class="row">
					                            <div class="col-xs-12">
					                                <div class="ment2">총 <span id="replyTotalCnt"></span>개 댓글</div>
					                            </div>
					                        </div>
 					                        
					                        <div class="row">
					                            <div class="col-xs-12">
					                                <div id="rightItemBox" class="replyReadImg">
					                                    <!-- 답글 카드 썸네일 리스트 -->
					                                </div>
					                            </div>
					                        </div>
					                        
					                    </div>
					                </div>
					                <div class="row btnmargin">
					                    <div class="col-xs-11 btncenter">
					                        <a href="${pageContext.request.contextPath}/card/main" class="btn-ReadList" >리스트로 돌아가기</a><!--list페이지로 이동-->
					                        </div>
					                    </div>
					                    <div class="col-xs-1">
											<div class="button-right">
												<div id="tbnReplyWriteForm" type="button" class="btn-ReadComment">
													<a href="${pageContext.request.contextPath}/card/replyWriteForm?cardNo=${param.cardNo}">댓글카드 작성</a>
												</div>
											</div>
										</div>
					                </div>
									
	
                   		 	<!-- ---여기에 자신의 코드 작성--------------------------------------------------------------------------------- -->
					
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
	
</body>


<script type="text/javascript">

var cardInfoList;
var replyCardInfoList

//화면이 그려지기 직전
$(document).ready(function(){ 
	// 실행할 기능을 정의해주세요. 

	getReplyCardList();
	getReplyCardCommentList(cardInfoList[0].cardNo);
	$("#replyTotalCnt").html(replyCardInfoList.length);

	
});


//왼쪽 카드 리스트 요청
function getReplyCardList(){
	$.ajax({
		url : "${pageContext.request.contextPath}/card/getReplyCardList",
		type : "post",
		/* contentType : "application/json", */
		/* data : JSON.stringify(productVo), */
		async: false, 
		dataType : "json",
		success : function(cardList) {
			cardInfoList = cardList;
			
			
			$("#leftCard .imgdate").html(cardInfoList[0].cardRegdate);
			$("#leftCard .cardContent").html(cardInfoList[0].cardContent);
			$("#leftCard img").attr("src", cardInfoList[0].cardImgSrc);
			
			for(var i=0; i<cardList.length; i++){
				cardRender(cardList[i], "down", i);	
			}
			
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
}


//왼쪽 카드 리스트 그리기(1개씩)
function cardRender(cardVo, direction, index){
	console.log(cardVo);
	var str ='';
	str +='<div><img class="leftItem pointer" data-lno="'+index+'" src="'+cardVo.cardImgSrc+'"></div>';
	
	
	if(direction == "up"){
		$("#leftItemBox").prepend(str);
	}else if(direction == "down"){
		$("#leftItemBox").append(str);
	}else{
		console.log("direction 오류");
	}
}


//왼쪽 아이템을 클릭할때
$("#leftItemBox").on("click", ".leftItem", function(){
	
	var index = $(this).data("lno");
	console.log(cardInfoList[index]);
	
	//상단에 정보 출력
	$("#leftCard .imgdate").html(cardInfoList[index].cardRegdate);
	$("#leftCard .cardContent").html(cardInfoList[index].cardContent);
	$("#leftCard img").attr("src", cardInfoList[index].cardImgSrc);
	
	
	//댓글 카드 리스트 요청
	var cardNo = cardInfoList[index].cardNo
	getReplyCardCommentList(cardNo);
});


/////////////////////////////////////////////////////////////////////
//오른쪽 카드 리스트 요청
function getReplyCardCommentList(cardNo){
	$.ajax({
		url : "${pageContext.request.contextPath}/card/getReplyCardCommentList",
		type : "post",
		/* contentType : "application/json", */
		data : {cardNo: cardNo}, 
		async: false, 
		dataType : "json",
		success : function(replyCardList) {
			
			replyCardInfoList = replyCardList;
			console.log(replyCardInfoList);
			
			$("#rightCard .imgdate").html(replyCardInfoList[0].replyRegdate);
			$("#rightCard .replyCardContent").html(replyCardInfoList[0].replyContentFull);
			$("#rightCard img").attr("src", replyCardInfoList[0].recardImgSrc);
			$("[name='replyCardNo']").val(replyCardInfoList[0].replycardno);
			
			$("#rightItemBox > div").remove();
			for(var i=0; i<replyCardInfoList.length; i++){
				replyCardRender(replyCardInfoList[i], "down", i);	
			} 
			
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
}


//오른쪽(답글) 카드 리스트 그리기(1개씩)
function replyCardRender(cardVo, direction, index){
	console.log(cardVo);
	var str ='';
	str +='<div><img class="rightItem pointer" data-rno="'+index+'" src="'+cardVo.recardImgSrc+'"></div>';
	
	
	if(direction == "up"){
		$("#rightItemBox").prepend(str);
	}else if(direction == "down"){
		$("#rightItemBox").append(str);
	}else{
		console.log("direction 오류");
	}
}





//오른쪽 아이템을 클릭할때
$("#rightItemBox").on("click", ".rightItem", function(){
	
	var index = $(this).data("rno");
	console.log(replyCardInfoList[index]);
	
	//상단에 정보 출력
	$("#rightCard .imgdate").html(replyCardInfoList[index].replyRegdate);
	$("#rightCard .replyCardContent").html(replyCardInfoList[index].replyContentFull);
	$("#rightCard img").attr("src", replyCardInfoList[index].recardImgSrc);
	
	$("[name='replyCardNo']").val(replyCardInfoList[index].replycardno);
	
});






</script>

</html>