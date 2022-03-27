<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
    <html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Mydeco</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/main.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/card.css">
    	    	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
    	<script src="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/js/bootstrap.js"></script>
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
					                            <div class="col-xs-12 border-cardread1"><!--내가 작성한 카드-->
					                                <div id="leftCard" class="cardRead-subcard">
					                                    <div class="imgdate">${CardList[0].cardRegdate}</div>
					                                    <div class="cardContent">${CardList[0].cardContentFull}</div>
					                                    <img src="${CardList[0].cardImgSrc}" alt="">
					                                </div>
					                            </div>
					                        </div>
					                        <div class="row">
					                            <div class="col-xs-12">
					                                <div class="ment"><span>${authUser.name}</span>이 작성한 최근 카드</div>
					                            </div>
					                            <div class="row">
					                                <div class="col-xs-12">
					                                    <div class="cardReadImg">
					                                        <div><img src="${pageContext.request.contextPath}/assets/img/card/slideLeft.png"></div>
					                                        
				                                        	<div id="leftItemBox">
					                                        	<!-- 원본 카드 썸네일 리스트 -->
					                                        		
				                                        	</div>
					                                        <div><img src="${pageContext.request.contextPath}/assets/img/card/slideRight.png"></div>
					                                        
					                                    </div>
					                                </div>
					                            </div>
					                        </div>
					                    </div>
					
					
					
					                    <div class="col-xs-6">
					                        <div class="row">
					                            <div class="col-xs-12 border-cardread2">
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
					                    <div class="col-xs-12 btncenter">
					                        <a href="${pageContext.request.contextPath}/card/main" class="btn-ReadList" >리스트로 돌아가기</a><!--list페이지로 이동-->
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

	getCardList();
	getReplyCardCommentList(cardInfoList[0].cardNo);
	$("#replyTotalCnt").html(replyCardInfoList.length);
	
});

//왼쪽 카드 리스트 요청
function getCardList(){
	$.ajax({
		url : "${pageContext.request.contextPath}/card/getCardList",
		type : "post",
		/* contentType : "application/json", */
		/* data : JSON.stringify(productVo), */
		async: false,
		dataType : "json",
		success : function(cardList) {
			
			cardInfoList = cardList;
			console.log("=============================================");
			
			
			$("#leftCard .imgdate").html(cardInfoList[0].cardRegdate);
			$("#leftCard .cardContent").html(cardInfoList[0].cardContentFull);
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
	console.log("-----------");
	console.log(cardInfoList[index]);
	
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
			console.log(replyCardList);
			$("#rightItemBox  div").remove();
			if(replyCardList > 0){
				$("#rightCard .imgdate").html(replyCardInfoList[0].replyRegdate);
				$("#rightCard .replyCardContent").html(replyCardInfoList[0].replyContentFull);
				$("#rightCard img").attr("src", replyCardInfoList[0].recardImgSrc);
				$("#replyTotalCnt").html(replyCardInfoList.length);
			}else {
				$("#rightCard .imgdate").html("");
				$("#rightCard .replyCardContent").html("");
				$("#rightCard img").attr("src", "${pageContext.request.contextPath}/assets/img/card/img0.jpg");
				$("#replyTotalCnt").html(replyCardInfoList.length);
			}
		

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
	console.log();
	var index = $(this).data("rno");
	console.log("===============================");
	console.log(replyCardInfoList[index]);
	console.log("===============================");
	//상단에 정보 출력
	$("#rightCard .imgdate").html(replyCardInfoList[index].replyRegdate);
	$("#rightCard .replyCardContent").html(replyCardInfoList[index].replyContentFull);
	$("#rightCard img").attr("src", replyCardInfoList[index].recardImgSrc);
	
});





</script>
</html>