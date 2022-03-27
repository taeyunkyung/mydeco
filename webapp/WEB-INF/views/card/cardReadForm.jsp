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
					                                    <div class="cardContent">${CardList[0].cardContent}</div>
					                                    <img src="${CardList[0].cardImgSrc}" alt="">
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
					                                <div class="cardRead-subcard2">
					                                    <div class="imgdate">2022-02-03</div>
					                                    <div class="cardContent">댓글달린내용</div>
					                                    <img src="${pageContext.request.contextPath}/assets/img/card/img1.jpg" alt="">
					                                </div>
					                            </div>
					                        </div>
					                        <div class="row">
					                            <div class="col-xs-12">
					                                <div class="ment2">총 50개 댓글</div>
					                            </div>
					                        </div>
					                        <div class="row">
					                            <div class="col-xs-12">
					                                <div class="cardReadImg2">
					
					                                    <div><img src="${pageContext.request.contextPath}/assets/img/card/slideLeft.png"></div>
					                                    <div><img src="${pageContext.request.contextPath}/assets/img/card/img3.jpg" alt=""></div>
					                                    <div><img src="${pageContext.request.contextPath}/assets/img/card/img4.jpg" alt=""></div>
					                                    <div><img src="${pageContext.request.contextPath}/assets/img/card/img5.jpg" alt=""></div>
					                                    <div><img src="${pageContext.request.contextPath}/assets/img/card/img6.jpg" alt=""></div>
					                                    <div><img src="${pageContext.request.contextPath}/assets/img/card/img7.jpg" alt=""></div>
					                                    <div><img src="${pageContext.request.contextPath}/assets/img/card/slideRight.png"></div>
					                                    
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
//화면이 그려지기 직전
$(document).ready(function(){ 
	// 실행할 기능을 정의해주세요. 

	getCardList();
	
});

//카드 리스트 요청

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

//리스트 그리기(1개씩)
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
	
	$("#leftCard .imgdate").html(cardInfoList[index].cardRegdate);
	$("#leftCard .cardContent").html(cardInfoList[index].cardContent);
	$("#leftCard img").attr("src", cardInfoList[index].cardImgSrc);
	
	//댓글 카드 리스트 요청
	var cardNo = cardInfoList[index].cardNo
	getReplyCardCommentList(cardNo);
});




function getReplyCardCommentList(cardNo){
	$.ajax({
		url : "${pageContext.request.contextPath}/card/getReplyCardCommentList",
		type : "post",
		/* contentType : "application/json", */
		data : {cardNo: cardNo}, 
		async: false, 
		dataType : "json",
		success : function(replyCardList) {
			console.log("======================================");
			
			console.log(replyCardList);
			console.log("======================================");
			
			//replyCardInfoList = replyCardList;
			
			/* 
			$("#leftCard .imgdate").html(cardInfoList[0].cardRegdate);
			$("#leftCard .cardContent").html(cardInfoList[0].cardContent);
			$("#leftCard img").attr("src", cardInfoList[0].cardImgSrc);
			
			for(var i=0; i<cardList.length; i++){
				cardRender(cardList[i], "down", i);	
			} */
			
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
}

</script>
</html>