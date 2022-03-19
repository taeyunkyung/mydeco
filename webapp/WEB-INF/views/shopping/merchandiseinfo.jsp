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
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mydiaryList.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mydiaryList_modal.css">


<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/html2canvas.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/bootstrap/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/jquery-ui-1.13.1/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/fabric.js"></script>
	 
	   
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
					<div class="width700">
						<div class="div-sub">
							<h3>Shopping</h3>
						</div>
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
								<div class="row infomargin div-sub">
									<div class="col-xs-5">
										<span class="infotext">공유</span>
									</div>
									<div class="col-xs-7" id="share">
										<a href="#"><img class="shareimg" src="${pageContext.request.contextPath}/assets/img/icon/instagram.jpg"></a> <a href="#"><img class="shareimg" src="${pageContext.request.contextPath}/assets/img/icon/facebook.jpg"></a> <a href="#"><img class="shareimg" src="${pageContext.request.contextPath}/assets/img/icon/twiter.png"></a> <a href="#"><img class="shareimg" src="${pageContext.request.contextPath}/assets/img/icon/youtube.png"></a>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12 text-right">
										<p class="infotext">${product.price}원</p>
									</div>
								</div>
								<div class="row text-center">
									<div class="col-xs-12">
										<a href="${pageContext.request.contextPath}/myshop/chatList" class="button marginauto r-button">채팅 거래하기</a>
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
								<h3>일기장</h3>
							</div>
							<div class="col-xs-12 height320 overf">
								
								
								
								
								
								
								<!--긁어온 일기 시작  -->
								
								<c:forEach items="${diarycontentList}" var="dcvo">
	                            <div class="clearfix mydiary-list-box2" data-diaryno="${dcvo.diaryNo}" data-title="${dcvo.title}" style=" border-bottom: 1px solid #686099;">
	                                <div class="mydiaryText-list2">
	                                    <div class="mydiaryText7 clearfix">
	                                    	<!-- <input type="hidden" name="diaryNo" value="${dcvo.diaryNo}">-->
	                                        <div class="mydiary-Date">Date:</div>
	                                        <div class="mydiary-Date" data-diaryDate="${dcvo.diaryDate}">${dcvo.diaryDate}</div>
	                                        
			                                <c:choose>
			                                	<c:when test="${dcvo.weather eq 'sunny'}">
			                                	 	<div><img id="se_weather_img" class="mydiary-weather2" src="${pageContext.request.contextPath}/assets/img/weather/sunny-day.png"></div>	
			                                	</c:when>
			                                	<c:when test="${dcvo.weather eq 'rainy'}">
			                                		<div><img id="se_weather_img" class="mydiary-weather2" src="${pageContext.request.contextPath}/assets/img/weather/rainy.png"></div>
			                                	</c:when>
			                                	<c:otherwise><div><img id="se_weather_img" class="mydiary-weather2" src="${pageContext.request.contextPath}/assets/img/weather/snowflake.png"></div></c:otherwise>
			                                </c:choose>
	                                    </div>
	
	                                    <div class="mydiaryText7 mydiary-content" data-title="${dcvo.title}">${dcvo.title}</div>
	                                    <div class="opensetting text-left" data-protect="${dcvo.protect}">
	                                        ${dcvo.protect}
	                                    </div>
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











								<div id="listArea"></div>

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
	<!--모달시작  -->
	
	     <!--목록 해당일기 클릭시 해당일기 읽기 모달창의 내용-->
	     <div id="diaryModal" class="modal fade">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" id="closebtn" class="close" data-dismiss="modal" aria-label="Close" style="font-size:30px;"><span aria-hidden="true">&times;</span></button>
		        <div class="clearfix">
			        <div style="float: right;">
	                   <img class="saveImgbtn" style="margin-right:11px; width: 19px; height: 19px; margin-top:3px; cursor:pointer;" src="${pageContext.request.contextPath}/assets/img/icon/save.png" onclick="downImg();">
	                </div>
			        <div style="float:left; margin-right:15px; margin-top:3px;">노래를넣는다면 여기가 노래재생되는곳</div>	
		        </div>
		       		        
		        <div class="clearfix" style="margin-top:28px;">
			        <div style="float:left; margin-left:41px;"><h4 class="modal-title" id="modalDiaryTitle" style="font-size:19px; font-weight:900"></h4></div>
			        <div class="readcontent clearfix" style="float:right; width:176px; margin-right:40px; margin-top:7px;" >
			        	<div style="float:left; font-family:'SCDream4'; width:84px;"id="modalDiaryDate"></div>
			        	<div style="float:left; font-family:'SCDream4'; width:50px; text-align:center;"id="modalDiaryWeather"></div>
			        	<div style="float:left; font-family:'SCDream4'; width:42px; text-align:center;"id="modalDiaryProtect"></div>
			        </div>
		        </div>
		      </div>
		      <div class="modal-body">
		      
		      <canvas class="readCanvas" id="paper"></canvas>
		      	
		      </div>
		      <div class="modal-footer">
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
     
     <!--부트스트랩취소버튼 <button type="button" class="btn btn-default" data-dismiss="modal">취소</button> -->
	
	
	
	
	
	
	
</body>

<script type="text/javascript">
	//시작시 바로 그려주기

	$(document).ready(function() {

		console.log("리스트요청");

		//리스트그리기
		fetchList();

	});

	function fetchList() {
		$
				.ajax({

					url : "${pageContext.request.contextPath }/shopping/fetch?no=${product.prodNo}",
					type : "post",

					dataType : "json",
					success : function(cmtList) {

						//입력화면 초기화
						console.log(cmtList);
						for (var i = 0; i < cmtList.length; i++) {
							render(cmtList[i], "down"); //방명록리스트 그리기
						}

					},
					error : function(XHR, status, error) {
						console.error(status + " : " + error);
					}
				});
	};

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

	/////////////////////////////////////////대댓글 달기////////////////////////

	$("#recmt").on("click", function() {

		var cmttext = $("#recmt").val();

		var prodNo = $
		{
			product.prodNo
		}
		;

		var ShoppingCmtVo = {
			cmtContent : cmttext,
			prodNo : prodNo
		};
		console.log(cmttext);
		console.log(prodNo);

		$.ajax({

			url : "${pageContext.request.contextPath }/shopping/cmtwrite",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(ShoppingCmtVo),

			dataType : "json",
			success : function(result) {
				/*성공시 처리해야될 코드 작성*/

			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});

	//////////////////////////////////////////이미지 순서바꾸기//////////////////

	$("#img1")
			.on(
					"click",
					function() {
						console.log("이미지클릭");
						$("#img0")
								.attr(
										"src",
										"${pageContext.request.contextPath}/upload/${product.prodImgList[0].prodImgSrc}");
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

	function render(ShoppingCmtVo, updown) {
		var str = '';
		str += '	<div class="row backgroundgray">';
		str += '		<div class="col-xs-10">';
		str += '			<span class="recomandfontstyle">' + ShoppingCmtVo.name
				+ '님</span>';
		str += '		</div>';
		str += '		<div class="col-xs-2">';
		str += '			<span class="text-right">' + ShoppingCmtVo.regDate
				+ '</span>';
		str += '		</div>';
		str += '	</div>';
		str += '	<div class="row backgroundgray">';
		str += '		<div class="col-xs-12">';
		str += '			<div class="height60">'; //data-no 부분에 항상 소문자만 쓰기 
		str += '				<span>' + ShoppingCmtVo.cmtContent + '</span>';
		str += '			</div>';
		str += '		</div>';
		str += '	</div>';

		if (updown == 'down') {
			$("#listArea").append(str);
		} else if (updown == 'up') {
			$("#listArea").prepend(str);
		} else {
			console.log("방향오류");
		}

	};

	/////////////////////////////채린씨가준 뻥션///////////
	function downImg() {
		html2canvas($("#paper")[0]).then(function(canvas) {
			var myImage = canvas.toDataURL();
			var savename = title;
			console.log(savename);
			downloadURI(myImage, savename);
		});
	}

	function downloadURI(uri, name) {
		var link = document.createElement("a")
		link.download = name;
		link.href = uri;
		document.body.appendChild(link);
		link.click();
	}
	
	
	
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
	diaryNo = $(this).data("diaryno")
	console.log(diaryNo);

	title = $(this).data("title")
	
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
		text.selectable = false;
		
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




//////////////////////////////////////////////////////////

	
	
	
	
	
	
	
	
</script>


<!--  코멘트 에이젝스 시작 -->

</html>