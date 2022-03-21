<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Deco</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/shop-my.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/fabric.js"></script>

<style>
#d-table {width: 100%;}
svg {width: 40%; height: 40%;}
</style>
</head>
<body>
	<div id="wrap">
		<div class="container">
			<div class="row">
				
				<!-- header -->
				<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
				
				<!-- aside -->
				<c:import url="/WEB-INF/views/include/aside-shop.jsp"></c:import>
				
				<!-- content -->
				<div class="col-xs-9" id="main-content">
					<form action="${pageContext.request.contextPath}/myshop/add" method="post" enctype="multipart/form-data">
					<!-- <form name="dataForm" id="dataForm" onsubmit="return register()"> -->
						<table id="a-table">
							<colgroup>
								<col style="width: 80px">
								<col style="width: 600px">
							</colgroup>
							<tr>
								<td id="sub" colspan="2">
									<h3>새 상품 등록</h3>
								</td>
							</tr>

							<tr>
								<td><label for="prod-title">상품 이름</label></td>
								<td><input id="prod-title" type="text" name="prodName" value=""></td>
							</tr>
							<tr>
								<td><label for="prod-emo">감정</label></td>
								<td class="a-chk">
									<div class="form-radio-item">
										<input type="radio" name="emotion" id="happy" value="happy"> <label
											for="happy">기쁨</label> <span class="check"></span>
									</div>
									<div class="form-radio-item">
										<input type="radio" name="emotion" id="sad" value="sad"> <label
											for="sad">슬픔</label> <span class="check"></span>
									</div>
									<div class="form-radio-item">
										<input type="radio" name="emotion" id="angry" value="angry"> <label
											for="angry">화남</label> <span class="check"></span>
									</div>
									<div class="form-radio-item">
										<input type="radio" name="emotion" id="annoyed" value="annoyed"> <label
											for="annoyed">짜증</label> <span class="check"></span>
									</div>
									<div class="form-radio-item">
										<input type="radio" name="emotion" id="relieved" value="relieved"> <label
											for="relieved">홀가분</label> <span class="check"></span>
									</div>
								</td>
							</tr>
							<tr>
								<td><label for="prod-price">가격</label></td>
								<td><input id="prod-price" type="text" name="price"
									value=""> 원</td>
							</tr>
							<tr>
								<td><label for="prod-deliv">배송방법</label></td>
								<td class="a-chk">
									<div class="form-radio-item">
										<input type="radio" name="delivery" id="post" value="post"> <label
											for="post">택배</label> <span class="check"></span>
									</div>
									<div class="form-radio-item">
										<input type="radio" name="delivery" id="meet" value="meet"> <label
											for="meet">직거래</label> <span class="check"></span>
									</div>
								</td>
							</tr>
							<tr>
								<td><label for="img-td">이미지</label></td>
								<td id="img-td"><label for="prod-img">이미지 추가</label> 
								<input id="prod-img" type="file" name="prodImgFile" accept="image/*" multiple="multiple">								
									<div id="img-area">
									</div>
								</td>
							</tr>
							<tr>
								<td><label for="prod-story">상품설명</label></td>
								<td><textarea id="prod-story" name="prodInfo"></textarea></td>
							</tr>
							<tr>
								<td><label for="diary-td">일기</label></td>
								<td><table id="d-table">
										<colgroup>
											<col style="width: 100px">
											<col style="width: 350px">
											<col style="width: 244px">
											<col style="align: center">
										</colgroup>
										<tr>
											<td>번호</td>
											<td>제목</td>
											<td>날짜</td>
											<td></td>
										</tr>
										<c:forEach items="${diaryList}" var="diaryVo">
											<tr>
												<td>${diaryVo.diaryNo}</td>
												<td class="diaryView" data-no="${diaryVo.diaryNo}" data-toggle="modal" data-target=".diaryview">${diaryVo.title}</td>
												<td>${diaryVo.diaryDate}</td>
												<td><input style="width: 13px" type="checkbox"
													class="diarySelect" data-title="${diaryVo.title}"
													data-no="${diaryVo.diaryNo}"></td>
											</tr>
										</c:forEach>
									</table> 
									<div class="modal fade diaryview" tabindex="-1" role="dialog">
										<div class="modal-dialog modal-lg"
											style="width: 710px; height: 570px;">
											<div class="modal-content">
												<div class="modal-header" style="height:50px">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">x</span>
													</button>
													<h4 class="modal-title" style="display:inline-block; float: left">나의 일기장</h4>
													<div class="audiodiv"
														style="float: left; margin-right: 15px; margin-top: 3px;">
														<audio id="audio" src="" controls autoplay loop
															style="height: 20px; width: 300px; margin-left: 38px;"></audio>
													</div>
												</div>
												<div class="modal-body">
													<p class="diaryContents"></p>
													<canvas class="readCanvas" id="paper"></canvas>
												</div>
											</div>
										</div>
									</div> 
									<div id="diary-area"></div>
								</td> 
							</tr>
						</table>
						<div id="add">
							<input type="submit" id="submitBtn" value="등록하기">
						</div>
					</form>
				</div> <!-- content -->
				
				<!-- footer -->
				<c:import url="/WEB-INF/views/include/footer.jsp"></c:import> 
			
			</div> <!-- row -->
		</div> <!-- container -->
	</div> <!-- wrap -->
</body>

<script type="text/javascript">

$("#d-table").on("click", ".diaryView", function() {	
	var $this = $(this);
	var diaryNo = $this.data("no"); console.log(diaryNo);
	
	$.ajax({			
		url : "${pageContext.request.contextPath}/myshop/viewdiary",		
		type : "post",
		// contentType : "application/json",
		data : {diaryNo: diaryNo},

		dataType : "json",
		success : function(diaryContentVo){
			modalCanvasInit();
			console.log(diaryContentVo);
			$(".diaryContents").text(diaryContentVo.title+"\u00a0\u00a0 / \u00a0\u00a0"+diaryContentVo.diaryDate+"\u00a0\u00a0 / \u00a0\u00a0"+diaryContentVo.weather);
			$("#audio").attr("src", diaryContentVo.diaryBgmSrc);
			
			var itemList = diaryContentVo.itemList;
			
			for(var i=0; i<itemList.length; i++) {
				itemRender(itemList[i]);
				console.log(itemList[i]);
			}
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}	
	});
});

function modalCanvasInit(){
	canvas.clear();
	canvas.width = 680;
	canvas.height = 510;
	canvas.backgroundColor = '#dbd3c7';
}

function itemRender(diaryitemVo) {
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
	
	} else if(diaryitemVo.stickerCateNo == 1) { // 배경--캔버스 새로 만들듯 배경도 사용된 스티커 경로만 갖고와서 다시 그려주기
		fabric.Image.fromURL(diaryitemVo.stickerSrc, function(backImg) {

			canvas.setBackgroundImage(backImg, canvas.renderAll.bind(canvas),{
				scaleX: canvas.width / backImg.width,
				scaleY: canvas.height / backImg.height
			});
			
			console.log("=====================================");
			console.log(backImg);
		});
		
		
	} else {  //스티커- stickerCateNo == 2
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

var canvas = new fabric.Canvas("paper", {
	 width: 680,
	 height: 510,
	 backgroundColor: '#dbd3c7'
});

	// input multiple 초기화, 새로운 배열 만들기
	var submitFiles = []; 
	
	$(document).ready(function() {
		$("#prod-img").on("change", fileCheck)
	});
	
	function fileCheck(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
						
		filesArr.forEach(function (f) {
			submitFiles.push(f);
			
			var reader = new FileReader();			
			reader.onload = function(e) {	
								
				var img = document.createElement("img");
				img.setAttribute("src", e.target.result);
				img.setAttribute("class", "img-img");
				img.setAttribute("id", "imgId+"+ index);
				img.setAttribute("data-file", f.name);
				img.setAttribute("onclick", "delImg("+ index +")");
				document.querySelector("div#img-area").appendChild(img);
				
				
				//$("#img-area").append(html);
				index++;
			}
			reader.readAsDataURL(f);
		});
		console.log(submitFiles);
		//$("#prod-img").val(submitFiles);
	}
	
	var index = 0;
	
	function delImg(index) {
		console.log("index:"+index);
		submitFiles.splice(index, 1);
		
		$("#imgId"+index).remove();
		
		console.log(submitFiles);		
	}
	
	// 일기 추가
	var diary = [];
	var diaryTitle = [];
	$("#d-table").on("click", ".diarySelect", function() {
		var $this = $(this);
		var diaryNo = $this.data("no");
		diary.push(diaryNo);
		
		console.log(diary);
	});
		
	$("#submitBtn").on("click", function() {
		var input = document.createElement("input");
		input.setAttribute("type", "hidden");
		input.setAttribute("name", "diaryNo[]");
		input.setAttribute("value", diary);

		document.querySelector("div#diary-area").appendChild(input);
	});
</script>
</html>