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
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mydiaryList.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mydiaryList_modal.css">
<!-- 이부분에 이페이지에 필요한 css 추가 -->	    
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/jquery-ui-1.13.1/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/fabric.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/html2canvas.js"></script>	   

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script> 

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
							<div class="row ">
								
									<h3 class="subtitle">물품 상세페이지</h3>
								
							</div>
							<div id="main">
                   		 	<!-- ---여기에 자신의 코드 작성--------------------------------------------------------------------------------- -->
			
						<!--/ --쇼핑-------------------- -->
						<div class="row">
							<div class="col-xs-12">
								<h3 class="text-left">${product.prodName}</h3>
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
											<img class="prodImg2" id="img1" src="${pageContext.request.contextPath}/upload/${product.prodImgList[0].prodImgSrc}"> <img class="prodImg2" id="img2" src="${pageContext.request.contextPath}/upload/${product.prodImgList[1].prodImgSrc}"> <img class="prodImg2" id="img3" src="${pageContext.request.contextPath}/upload/${product.prodImgList[2].prodImgSrc}"> <img class="prodImg2" id="img4" src="${pageContext.request.contextPath}/upload/${product.prodImgList[3].prodImgSrc}">
										</div>
									</div>
								</div>
							</div>

							<!-- /왼쪽 사진부분 -->

							<!-- 오른쪽 상품정보 -->
							<div class="col-xs-5 bs-list height320">
								<div class="row infomargin">
									<div class="col-xs-5">
										<span class="infotext">감정</span>
									</div>
									<div class="col-xs-7">${product.emotion}</div>
								</div>
								<div class="row infomargin">
									<div class="col-xs-5">
										<span class="infotext">판매자</span>
									</div>
									<div class="col-xs-7">${product.userName}</div>
								</div>
								<div class="row infomargin">
									<div class="col-xs-5">
										<span class="infotext">배송방법</span>
									</div>
									<div class="col-xs-7">${product.delivery}</div>
								</div>
								<div class="row infomargin div-sub3">
									<div class="col-xs-5">
										<span class="infotext">공유</span>
									</div>
									<div class="col-xs-7" id="share">
										<a id="btnTwitter" class="link-icon twitter" href="javascript:shareTwitter();">
											<img class="shareimg" src="${pageContext.request.contextPath}/assets/img/icon/share/icon-twitter.png">
										</a>
										<a id="btnFacebook" class="link-icon facebook" href="javascript:shareFacebook();">
											<img class="shareimg" src="${pageContext.request.contextPath}/assets/img/icon/share/icon-facebook.png">
										</a>    
										<a id="btnKakao" class="link-icon kakao" href="javascript:shareKakao();">
											<img class="shareimg" src="${pageContext.request.contextPath}/assets/img/icon/share/icon-kakao.png">
										</a>  
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12 text-right">
										<p class="infotext2">${product.price}원</p>
									</div>
								</div>
								<div class="row text-center">
									<div class="col-xs-12">
										<div class="height100">
											<a href="${pageContext.request.contextPath}/myshop/chatList?$" class="button marginauto r-button" id="chattrade">채팅 거래하기</a>
										</div>
									</div>
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
									<p class="text-left">${product.prodInfo}</p>
								</div>


							</div>
						</div>
						<!-- 일기장 -->

						<div class="row">
							<div class="div-sub">
								<h3 id="h3z">일기장</h3>
							</div>
							<div class="col-xs-12 height320 overf">






								<!--긁어온 일기 시작  -->

								<c:forEach items="${diarycontentList}" var="dcvo">
									<div class="clearfix mydiary-list-box2" data-diaryno="${dcvo.diaryNo}" data-title="${dcvo.title}" style="border-bottom: 1px solid #686099;">
										<div class="mydiaryText-list2">
											<div class="mydiaryText7 clearfix">
												<!-- <input type="hidden" name="diaryNo" value="${dcvo.diaryNo}">-->
												<div class="mydiary-Date">Date:</div>
												<div class="mydiary-Date" data-diaryDate="${dcvo.diaryDate}">${dcvo.diaryDate}</div>

												<c:choose>
													<c:when test="${dcvo.weather eq 'sunny'}">
														<div>
															<img id="se_weather_img" class="mydiary-weather2" src="${pageContext.request.contextPath}/assets/img/weather/sunny-day.png">
														</div>
													</c:when>
													<c:when test="${dcvo.weather eq 'rainy'}">
														<div>
															<img id="se_weather_img" class="mydiary-weather2" src="${pageContext.request.contextPath}/assets/img/weather/rainy.png">
														</div>
													</c:when>
													<c:otherwise>
														<div>
															<img id="se_weather_img" class="mydiary-weather2" src="${pageContext.request.contextPath}/assets/img/weather/snowflake.png">
														</div>
													</c:otherwise>
												</c:choose>
											</div>

											<div class="mydiaryText7 mydiary-content" data-title="${dcvo.title}">${dcvo.title}</div>
											<div class="opensetting text-left" data-protect="${dcvo.protect}">${dcvo.protect}</div>
										</div>


										<div class="mydiaryImg-box7 mydiary-box7-support">
											<img class="mydiaryImg-innerbox7" src="./assets/img/writediary/writediary.png">
										</div>
									</div>
								</c:forEach>









								<!-- 긁어온 일기 끝 -->
























							</div>
						</div>

						<!-- /일기장 -->


						<!-- 댓글작성  -->
						<div class="row">
							<div class="div-sub fontstyle">댓글</div>
							<div class="col-xs-10 padding0">
								<textarea id="cmttext"></textarea>
							</div>
							<div class="col-xs-2 padding0">
								<button class="button button2 marginauto r-button" id="cmtsend" value="${product.prodNo}">댓글 달기</button>
							</div>
						</div>
						<!-- 댓글 -->
						<div class="row text-left">
							<div class="col-xs-12">
								<!-- ajax로 출력할부분 -->
								<!-- <div class="row purpleback">
									<div class="col-xs-10">
										<span class="recomandfontstyle">명수박님</span>
									</div>
									<div class="col-xs-2">
										<span class="text-right">2022-02-22</span>
									</div>
								</div>
								<div class="row purpleback">
									<div class="col-xs-11">
										<div class="height60">
											<span>오랜 친구를 보내시는군요 섭섭하시겠어요</span>
										</div>
									</div>
									<div class="col-xs-1 padding0">
										<button id="recmt">댓글</button>
									</div>
								</div>
 -->
								<!--/ajax로 출력할부분  -->

								<!-- ajax로 출력할부분 -->
								<%-- 								<c:forEach items="${cmtList}" var="vo">
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
								</c:forEach> --%>











								<div id="listArea">
								
								
								</div>

								<!--/ajax로 출력할부분  -->



				</div>
			</div>
			<!-- 메인끝 -->			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
	
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
	
	
	
	
	<!--목록 해당일기 클릭시 해당일기 읽기 모달창의 내용-->
	<div id="diaryModal" class="modal fade">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" id="closebtn" class="close" data-dismiss="modal" aria-label="Close" style="font-size: 30px;">
						<span aria-hidden="true">&times;</span>
					</button>
					<div class="clearfix">
						<div style="float: right;">
							<img class="saveImgbtn" style="margin-right: 11px; width: 19px; height: 19px; margin-top: 3px; cursor: pointer;" src="${pageContext.request.contextPath}/assets/img/icon/save.png" onclick="downImg();">
						</div>
						<div class="audiodiv" style="float: left; margin-right: 15px; margin-top: 3px;">
							<audio id="audio" src="" controls autoplay loop style="height: 20px; width: 300px; margin-left: 38px;"></audio>
						</div>
					</div>

					<div class="clearfix" style="margin-top: 28px;">
						<div style="float: left; margin-left: 41px;">
							<h4 class="modal-title" id="modalDiaryTitle" style="font-size: 19px; font-weight: 900"></h4>
						</div>
						<div class="readcontent clearfix" style="float: right; width: 176px; margin-right: 40px; margin-top: 7px;">
							<div style="float: left; font-family: 'SCDream4'; width: 84px;" id="modalDiaryDate"></div>
							<div style="float: left; font-family: 'SCDream4'; width: 50px; text-align: center;" id="modalDiaryWeather"></div>
							<div style="float: left; font-family: 'SCDream4'; width: 42px; text-align: center;" id="modalDiaryProtect"></div>
						</div>
					</div>
				</div>
				<div class="modal-body">

					<canvas class="readCanvas" id="paper"></canvas>

				</div>
				<div class="modal-footer"></div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->	
	
</body>

<script type="text/javascript">
//시작시 바로 그려주기(댓글리스트 그리기)///////////////////////////////////////////////////////////////////////////////////////////
$(document).ready(function() {

	console.log("리스트요청");

	//리스트그리기
	fetchList();

});

function fetchList() {
	$.ajax({

				url : "${pageContext.request.contextPath }/shopping/fetch?no=${product.prodNo}",
				type : "post",

				dataType : "json",
				success : function(cmtList) {
					$("#listArea .row").remove();
					//입력화면 초기화
					console.log(cmtList);
					
					for (var i = 0; i < cmtList.length; i++) {
						
						if(cmtList[i].depth == 0){
							render(cmtList[i], "down"); //방명록리스트 그리기
							
						}else if(cmtList[i].depth == 1){
							render2(cmtList[i], "down"); //방명록리스트 그리기	
						}else{
							console.log("오류났습니다");
						}
						
					}

				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
};


/////////////////////////댓글 그리기///////////////	
function render(ShoppingCmtVo, updown) {
	var str = '';
	str += '	<div class="row purpleback">';
	str += '		<div class="col-xs-10">';
	str += '			<span class="recomandfontstyle">' + ShoppingCmtVo.name+ '님</span>';
	str += '		</div>';
	str += '		<div class="col-xs-2">';
	str += '			<span class="text-right">' + ShoppingCmtVo.regDate+ '</span>';
	str += '		</div>';
	str += '	</div>';
	str += '	<div class="row purpleback underborder">';
	str += '		<div class="col-xs-11">';
	str += '			<div class="height30">'; //data-no 부분에 항상 소문자만 쓰기 
	str += '				<span>' + ShoppingCmtVo.cmtContent + '</span>';
	str += '			</div>';
	str += '		</div>';
	str += ' 		<div class="col-xs-1 padding0">';
	str += ' 			<button class="replebutton reReple" data-depth="'+ ShoppingCmtVo.depth +'" data-cmtseq="'+ ShoppingCmtVo.cmtSeq + '" data-cmtno="'+ ShoppingCmtVo.cmtNo +'">댓글</button>';
	str += '		</div>';
	str += '	</div>';
	str += '	<div></div>';
	
	if (updown == 'down') {
		$("#listArea").append(str);
	} else if (updown == 'up') {
		$("#listArea").prepend(str);
	} else {
		console.log("방향오류");
	}

};
//////////////////////대댓글 그리기///////////////////
function render2(ShoppingCmtVo, updown) {
	
	
	var str = '';
	str += '	<div class="row backgroundgray">';
	str += '        <div class="col-xs-1"></div>';
	str += '		<div class="col-xs-9">';
	str += '			<span class="recomandfontstyle">' + ShoppingCmtVo.name+ '님</span>';
	str += '		</div>';
	str += '		<div class="col-xs-2">';
	str += '			<span class="text-right">' + ShoppingCmtVo.regDate+ '</span>';
	str += '		</div>';
	str += '	</div>';
	str += '	<div class="row backgroundgray underborder">';
	str += '		<div class="col-xs-1"></div>';
	str += '		<div class="col-xs-10">';
	str += '			<div class="height30">'; //data-no 부분에 항상 소문자만 쓰기 
	str += '				<span>' + ShoppingCmtVo.cmtContent + '</span>';
	str += '			</div>';
	str += '		</div>';
	str += ' 		<div class="col-xs-1 padding0">';
	str += ' 			<input type="hidden" class="reReple" data-depth="'+ ShoppingCmtVo.depth +'" data-cmtseq="'+ ShoppingCmtVo.cmtSeq + '" data-cmtno="'+ ShoppingCmtVo.cmtNo +'">';
	str += '		</div>';
	str += '	</div>';
	str += '	<div></div>';
	
	



	if (updown == 'down') {
		$("#listArea").append(str);
	} else if (updown == 'up') {
		$("#listArea").prepend(str);
	} else {
		console.log("방향오류");
	}

};

//////////////////댓글달기////////////////////////
$("#cmtsend").on("click", function() {
	var cmttext = $("#cmttext").val();
	var prodno = $("#cmtsend").val();
	var ShoppingCmtVo = {
		cmtContent : cmttext,
		prodNo : prodno
	};
	console.log(cmttext);
	console.log(prodno);
	$.ajax({
		url : "${pageContext.request.contextPath }/shopping/cmtwrite",
		type : "post",
		contentType : "application/json",
		data : JSON.stringify(ShoppingCmtVo),
		success : function() {
			//입력화면 초기화
			$("#listArea").empty();
			fetchList();
			document.getElementById("cmttext").value = '';
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
});





/////////////////////////대댓글 작성 창 열기/////////////////////////////////

$("#listArea").on("click", ".reReple", function() {
	//다들 대댓글 입력창 삭제
	$(".backgroundgray2").remove(); 
	
	
	
	
	var cmtNo = $(this).data("cmtno");
	var cmtSeq = $(this).data("cmtseq");
	var depth= $(this).data("depth");
	console.log(cmtNo);
	console.log(cmtSeq);
	console.log(depth);
	
	
	var str ="";
	str += '<div class="row backgroundgray2">';
	str += '	<div class="col-xs-10 padding0 rereCmt">';
	str += '		<textarea placeholder="댓글을 입력해주세요" class="txt-rereCmt"></textarea>';
	str += '	</div>';
	str += '	<div class="col-xs-2 padding0"><button class="button button2 marginauto replesub r-button" data-depth="'+ depth + '" data-cmtseq="'+ cmtSeq +'" data-cmtno="'+cmtNo+'" >답글 달기</button></div>';
	str += '</div>';


	
	$(this).parents(".purpleback.underborder").next().children().first().remove();
	$(this).parents(".purpleback.underborder").next().append(str);
	//$("#listArea").off("click",".reReple");
});



/////////////////////////대댓글 작성 창 작성/////////////////////////////////

$("#listArea").on("click", ".replesub", function() {
	console.log("대댓글 저장 버튼 클릭");
	
	
	//prodNo
	var prodNo ="${product.prodNo}"
	
	//cmtNo
	var cmtNo = $(this).data("cmtno");
	
	//cmtSeq
	var cmtSeq = $(this).data("cmtseq");
	
	//cmtContent
	var cmtContent =  $(this).parents().find(".rereCmt").children(".txt-rereCmt").val();
	
	//depth
	var depth = $(this).data("depth");
	
	//console.log(depth);
	
	var ShoppingCmtVo ={
			prodNo: prodNo,
			cmtNo: cmtNo,
			cmtContent: cmtContent,
			cmtSeq: cmtSeq,
			depth: depth
	};

	console.log(ShoppingCmtVo);

	$.ajax({

		url : "${pageContext.request.contextPath }/shopping/recmtwrite",
		type : "post",
		contentType : "application/json",
		data : JSON.stringify(ShoppingCmtVo),

		dataType : "json",
		success : function(result) {
			/*성공시 처리해야될 코드 작성*/
			
			console.log("확인용");
			console.log(result)
			
			fetchList();
			
			

		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
});








////이미지 순서바꾸기////////////////////////////////////////////////////////////////////
$("#img1").on("click", function() {
	console.log("이미지클릭");
	$("#img0").attr("src", "${pageContext.request.contextPath}/upload/${product.prodImgList[0].prodImgSrc}");
	$("#img1")
							.attr(
									"src",
									"${pageContext.request.contextPath}/upload/${product.prodImgList[0].prodImgSrc}");
					$("#img2")
							.attr(
									"src",
									"${pageContext.request.contextPath}/upload/${product.prodImgList[1].prodImgSrc}");
					$("#img3")
							.attr(
									"src",
									"${pageContext.request.contextPath}/upload/${product.prodImgList[2].prodImgSrc}");
					$("#img4")
							.attr(
									"src",
									"${pageContext.request.contextPath}/upload/${product.prodImgList[3].prodImgSrc}");

				});



$("#img2")
		.on(
				"click",
				function() {
					console.log("이미지클릭");
					$("#img0")
							.attr(
									"src",
									"${pageContext.request.contextPath}/upload/${product.prodImgList[1].prodImgSrc}");
					$("#img1")
							.attr(
									"src",
									"${pageContext.request.contextPath}/upload/${product.prodImgList[0].prodImgSrc}");
					$("#img2")
							.attr(
									"src",
									"${pageContext.request.contextPath}/upload/${product.prodImgList[1].prodImgSrc}");
					$("#img3")
							.attr(
									"src",
									"${pageContext.request.contextPath}/upload/${product.prodImgList[2].prodImgSrc}");
					$("#img4")
							.attr(
									"src",
									"${pageContext.request.contextPath}/upload/${product.prodImgList[3].prodImgSrc}");

				});



$("#img3")
		.on(
				"click",
				function() {
					console.log("이미지클릭");
					$("#img0")
							.attr(
									"src",
									"${pageContext.request.contextPath}/upload/${product.prodImgList[2].prodImgSrc}");
					$("#img1")
							.attr(
									"src",
									"${pageContext.request.contextPath}/upload/${product.prodImgList[0].prodImgSrc}");
					$("#img2")
							.attr(
									"src",
									"${pageContext.request.contextPath}/upload/${product.prodImgList[1].prodImgSrc}");
					$("#img3")
							.attr(
									"src",
									"${pageContext.request.contextPath}/upload/${product.prodImgList[2].prodImgSrc}");
					$("#img4")
							.attr(
									"src",
									"${pageContext.request.contextPath}/upload/${product.prodImgList[3].prodImgSrc}");

				});




$("#img4")
		.on(
				"click",
				function() {
					console.log("이미지클릭");
					$("#img0")
							.attr(
									"src",
									"${pageContext.request.contextPath}/upload/${product.prodImgList[3].prodImgSrc}");
					$("#img1")
							.attr(
									"src",
									"${pageContext.request.contextPath}/upload/${product.prodImgList[0].prodImgSrc}");
					$("#img2")
							.attr(
									"src",
									"${pageContext.request.contextPath}/upload/${product.prodImgList[1].prodImgSrc}");
					$("#img3")
							.attr(
									"src",
									"${pageContext.request.contextPath}/upload/${product.prodImgList[2].prodImgSrc}");
					$("#img4")
							.attr(
									"src",
									"${pageContext.request.contextPath}/upload/${product.prodImgList[3].prodImgSrc}");

				});


//////////////////채린씨 일기관련/////////////////////////////////////////////////////////

	/////////////////////////////채린씨가준 뻥션///////////
	function downImg() {
		html2canvas($("#paper")[0]).then(function(canvas) {
			var myImage = canvas.toDataURL();
			var savename = title;
			console.log(savename);
			downloadURI(myImage, savename);
		});
	};

	function downloadURI(uri, name) {
		var link = document.createElement("a")
		link.download = name;
		link.href = uri;
		document.body.appendChild(link);
		link.click();
	};
	

	//////////////////모달 채린님꺼 긁어온거///////////////////////
	
	//캔버스 초기화 설정
	var canvas = new fabric.Canvas("paper", {
		 width: 680,
		 height: 510,
		 //backgroundColor: 'rgb(100,150,134)'
		 backgroundColor: '#dbd3c7'
	});
	console.log(canvas);
	
	//제목으로 이미지 저장하기 위해 선언
	var title;
	
	//수정하기 일기번호 보내기 위해 선언
	var diaryNo;
	
	/*하나의 일기 div 클릭했을 때 모달창 보이기*/
	$(".mydiary-list-box2").on("click",function(){
	
	//캔버스 초기화(이전에 보여졌던 일기 지우기--일기겹치는 현상 없애기);
	modalCanvasInit();
	
	/*클릭한 일기의 일기번호*/
	diaryNo = $(this).data("diaryno");
	console.log(diaryNo);

	title = $(this).data("title");
	
	/*키:값*/
	var diarycontentvo = {diaryNo: diaryNo};
	console.log(diarycontentvo);
	
	$.ajax({
	    url : "${pageContext.request.contextPath}/diary/read",
	    type : "post",
	    contentType : "application/json",
	    data : JSON.stringify(diarycontentvo),//데이터 보내기
	    dataType : "json",
	    success : function(DiaryContent) {
	    	
		    console.log(DiaryContent);
		    console.log(DiaryContent.itemList); //DiaryContentVo의 필드값 이름으로 값 빼내기 가능
		    
		    //제목쓰기
		    $("#modalDiaryTitle").text(DiaryContent.title);
		    $("#modalDiaryDate").text(DiaryContent.diaryDate);
		    $("#modalDiaryWeather").text(DiaryContent.weather);
		    $("#modalDiaryProtect").text(DiaryContent.protect);
		    $("#audio").attr("src",DiaryContent.diaryBgmSrc);
		    
		    var DiaryItemList = DiaryContent.itemList;
		    
		    for(var i=0; i<DiaryItemList.length; i++){
				itemRender(DiaryItemList[i])
				console.log(DiaryItemList[i]);
			}
	    
	    },
	    error : function(XHR, status, error) {
	       console.error(status + " : " + error);
	    }
	 });
	
	
	/*모달창 보이기*/
	$("#diaryModal").modal('show');
	
	});



	/*일기보기 모달창 초기화*/
	function modalCanvasInit(){
		var objects = canvas.getObjects();
		console.log(objects);
		for(var i=0; i<objects.length; i++){
			canvas.remove(objects[i]);
		}canvas.renderAll();
	}	
	
	
	

	/*220316추가*/
	//아이템 그리기
	function itemRender(diaryitemVo){
	
	if(diaryitemVo.stickerCateNo == 0){ //텍스트 이면
		var text = new fabric.Textbox(diaryitemVo.text);

		//기본 폰트 크기
		text.fontSize = 18;
		
		//폰트
		text.fontFamily = 'SCDream4';
		
		//좌표
		text.top = diaryitemVo.top;
		text.left = diaryitemVo.left;
		
		//스케일
		text.scaleX = diaryitemVo.scaleX;
		text.scaleY = diaryitemVo.scaleY;
		
		//각도
		text.angle = diaryitemVo.angle;

		//변경안되게
		text.selectable = "false";
		
		//커서모양기본
		text.hoverCursor ="default";
		
		//캔버스에 추가
		canvas.add(text);
	
	}else if(diaryitemVo.stickerCateNo == 1) { // 배경--캔버스 새로 만들듯 배경도 사용된 스티커 경로만 갖고와서 다시 그려주기
		fabric.Image.fromURL(diaryitemVo.stickerSrc, function(backImg) {

			canvas.setBackgroundImage(backImg, canvas.renderAll.bind(canvas),{
				scaleX: canvas.width / backImg.width,
				scaleY: canvas.height / backImg.height
			});
			
			console.log("=====================================");
			console.log(backImg);
		});
		
		
	}else {  //스티커- stickerCateNo == 2
		fabric.Image.fromURL(diaryitemVo.stickerSrc, function(oImg) {
			//좌표
			oImg.top = diaryitemVo.top;
			oImg.left = diaryitemVo.left;
			
			//스케일
			oImg.scaleX = diaryitemVo.scaleX;
			oImg.scaleY = diaryitemVo.scaleY;
			
			//각도
			oImg.angle = diaryitemVo.angle;
			
			//변경안되게
			oImg.selectable = false;
			
			//커서모양기본
			oImg.hoverCursor ="default";
			
			//캔버스에 추가
			canvas.add(oImg);
		});
	}
	
	}

	/*수정하기 버튼을 클릭했을 때*/
 
	$("#modalModifyBtn").on("click",function(){
		$("[name='modaldiaryNo']").val(diaryNo);
		console.log(diaryNo);
		
		$("#modifyForm").submit();
	});



////////////////////////////공유하기 기능////////////////////////////

function shareTwitter() {
    var sendText = "Mydeco의 링크"; // 전달할 텍스트
    var sendUrl = "http://localhost:8088/mydeco/shopping/merchandise?no=${product.prodNo}"; // 전달할 URL
    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
}


function shareFacebook() {
    var sendUrl = "devpad.tistory.com/localhost:8088/mydeco/shopping/merchandise?no=${product.prodNo}"; // 전달할 URL
    window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
}


function shareKakao() {
    
    // 사용할 앱의 JavaScript 키 설정
    Kakao.init('카카오에서 발급받은 API키');
   
    // 카카오링크 버튼 생성
    Kakao.Link.createDefaultButton({
      container: '#btnKakao', // 카카오공유버튼ID
      objectType: 'feed',
      content: {
        title: "개발새발", // 보여질 제목
        description: "개발새발 블로그입니다", // 보여질 설명
        imageUrl: "devpad.tistory.com/", // 콘텐츠 URL
        link: {
           mobileWebUrl: "devpad.tistory.com/",
           webUrl: "devpad.tistory.com/"
        }
      }
    });
  }

	
</script>



</html>