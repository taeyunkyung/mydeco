<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
.d-table {width: 100%;}
svg {width: 40%; height: 40%;}
#img-area::-webkit-scrollbar-track {    
    background-color: #fff;
} #img-area::-webkit-scrollbar {height: 3px;
} #img-area::-webkit-scrollbar-thumb {
    background-color: #fff;
    border: 1px solid #686099;
    border-radius: 10px;
} #img-area {
    width: 560px; height: 160px; overflow-x: scroll; 
    display: inline-flex;
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
									<h3>?????? ???????????? ??????</h3>
								</td>
							</tr>

							<tr>
								<td><label for="prod-title">?????? ??????</label></td>
								<td><input id="prod-title" type="text" name="prodName" value="${productVo.prodName}"></td>
							</tr>
							<tr>
								<td><label for="prod-emo">??????</label></td>
								<td class="a-chk" id="prod-emo" data-emotion="${productVo.emotion}">
									<div class="form-radio-item">
										<input type="radio" name="emotion" id="happy" value="happy"> <label
											for="happy">??????</label> <span class="check"></span>
									</div>
									<div class="form-radio-item">
										<input type="radio" name="emotion" id="sad" value="sad"> <label
											for="sad">??????</label> <span class="check"></span>
									</div>
									<div class="form-radio-item">
										<input type="radio" name="emotion" id="angry" value="angry"> <label
											for="angry">??????</label> <span class="check"></span>
									</div>
									<div class="form-radio-item">
										<input type="radio" name="emotion" id="annoyed" value="annoyed"> <label
											for="annoyed">??????</label> <span class="check"></span>
									</div>
									<div class="form-radio-item">
										<input type="radio" name="emotion" id="relieved" value="relieved"> <label
											for="relieved">?????????</label> <span class="check"></span>
									</div>
								</td>
							</tr>
							<tr>
								<td><label for="prod-price">??????</label></td>
								<td><input id="prod-price" type="text" name="price"
									value="${productVo.price}"> ???</td>
							</tr>
							<tr>
								<td><label for="prod-deliv">????????????</label></td>
								<td class="a-chk" id="prod-deliv" data-delivery="${productVo.delivery}">
									<div class="form-radio-item">
										<input type="radio" name="delivery" id="post" value="post"> <label
											for="post">??????</label> <span class="check"></span>
									</div>
									<div class="form-radio-item">
										<input type="radio" name="delivery" id="meet" value="meet"> <label
											for="meet">?????????</label> <span class="check"></span>
									</div>
								</td>
							</tr>
							<tr>
								<td><label for="img-td">?????????</label></td>
								<td id="img-td"><label for="prod-img">????????? ??????</label> 
								<input id="prod-img" type="file" name="prodImgFile" accept="image/*" multiple="multiple">								
									<div id="img-area">
										<c:forEach items="${productVo.prodImgList}" var="list">
											<img class="prod-img"
												src="${pageContext.request.contextPath}/upload/${list.prodImgSrc}">
										</c:forEach>
									</div>
								</td>
							</tr>
							<tr>
								<td><label for="prod-story">????????????</label></td>
								<td><textarea id="prod-story" name="prodInfo">${productVo.prodInfo}</textarea></td>
							</tr>
							<tr>
								
								<td><label for="diary-td">??????</label></td>
								<td style="height: 270px;">
									
									<table class="d-table table table-striped" style="border-bottom: 1px solid #ebebeb">
										<colgroup>
											<col style="align: center; width: 100px; height: 39px">
											<col style="width: 350px; height: 39px">
											<col style="width: 244px; height: 39px">
											<col style="align: center; height: 39px">
										</colgroup>
										<thead>
											<tr>
												<td>??????</td>
												<td>??????</td>
												<td>??????</td>
												<td></td>
											</tr>
										</thead>
										<c:forEach begin="1" end="${pageBtn}" step="1" var="count">
											<tbody class="tb" id="tbody${count}"></tbody>
										</c:forEach>
									</table>
									
									<div id="diary-pg" data-page="${pageBtn}" style="width: 100%; display: inline-flex; justify-content: right;">
										<c:forEach begin="1" end="${pageBtn}" step="1" var="count">
											<p class="bullet" id="p${count}" data-pg="${count}" style="cursor: pointer;">${count}</p>
										</c:forEach>
									</div> 
									
									<div class="modal fade diaryview" tabindex="-1" role="dialog">
										<div class="modal-dialog modal-lg"
											style="width: 710px; height: 570px;">
											<div class="modal-content">
												<div class="modal-header" style="height:50px">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">x</span>
													</button>
													<h4 class="modal-title" style="display:inline-block; float: left">?????? ?????????</h4>
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
									<div id="diary-area" data-added="${fn:length(productVo.prodDiaryList)}">
										<c:forEach items="${productVo.prodDiaryList}" var="prodDiaryVo">${prodDiaryVo.diaryNo},</c:forEach>
									</div>
								</td> 
							</tr>
						</table>
						<div id="add">
							<input type="hidden" name="prodNo" value="${productVo.prodNo}">
							<input type="submit" id="submitBtn" value="????????????">
						</div>
					</form>
				</div> <!-- content --></div> <!-- row -->
		</div> <!-- container -->
	</div> <!-- wrap -->	
	<!-- footer -->
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import> 
</body>

<script type="text/javascript">
$(document).ready(function() {
	var page = $("#diary-pg").data("page");
	
	for(var x=1; x<=page; x++) {
		const count = x;
	$.ajax({			
		url : "${pageContext.request.contextPath}/myshop/diarypg",		
		type : "post",
		// contentType : "application/json",
		data : {crtPage: x},

		dataType : "json",
		success : function(diarymap){
			var diaryList = diarymap.diaryList;						
			for(var i=0; i<6; i++) {
				renderTable(diaryList[i], count);
			}
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}			
	});
	
	}
	
	$(".tb").hide();
	$("#tbody1").show();
	
});

function renderTable(diaryVo, count) {
	var str = '';
	if(!diaryVo) {
		str += '<tr>';
		str += '<td>\u00a0\u00a0</td>';
		str += '<td>\u00a0\u00a0</td>';
		str += '<td>\u00a0\u00a0</td>';
		str += '<td>\u00a0\u00a0</td>';
		str += '</tr>';
	} else {	
		str += '<tr>'
		str += '<td>'+ diaryVo.rn +'</td>';
		str += '<td class="diaryView" data-no="'+ diaryVo.diaryNo +'" data-toggle="modal" data-target=".diaryview" style="cursor: pointer;">'+ diaryVo.title +'</td>';
		str += '<td>'+ diaryVo.diaryDate +'</td>';
		str += '<td><input style="width: 13px" type="checkbox" class="diarySelect" id="ds'+ diaryVo.diaryNo +'" value="'+ diaryVo.diaryNo +'" data-no="'+ diaryVo.diaryNo +'"></td>';
		str += '</tr>';
	}
	$("#tbody"+count).append(str);
}

$("#diary-pg").on("click", ".bullet", function() {
	var $this = $(this);
	var crtPage = $this.data("pg");
	console.log(crtPage);
	
	$(".tb").hide();
	$("#tbody"+crtPage).show();	
});

var prodDiary = [];
$(document).ready(function() {
	var emotion = $("#prod-emo").data("emotion");
	var delivery = $("#prod-deliv").data("delivery");
	
	$("#"+emotion).attr("checked", "checked");
	$("#"+delivery).attr("checked", "checked");	
	
	var added = document.getElementById("diary-area").innerText;
	
	for(var i=0; i<$("#diary-area").data("added"); i++) {
		prodDiary = added.split(",");
		console.log(prodDiary[i]);		
		
		diary.push(parseInt(prodDiary[i]));
		console.log(diary);		
	}
	console.log($(".diarySelect").val());
});

$(".d-table").on("click", ".diaryView", function() {	
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
	if(diaryitemVo.stickerCateNo == 0){ //????????? ??????
		var text = new fabric.Textbox(diaryitemVo.text);

		//?????? ?????? ??????
		text.fontSize = 18;
		
		//??????
		text.fontFamily = 'SCDream4';
		
		//??????
		text.top = diaryitemVo.top;
		text.left = diaryitemVo.left;
		
		//?????????
		text.scaleX = diaryitemVo.scaleX;
		text.scaleY = diaryitemVo.scaleY;
		
		//??????
		text.angle = diaryitemVo.angle;

		//???????????????
		text.selectable = false;
		
		//??????????????????
		text.hoverCursor ="default";
		
		//???????????? ??????
		canvas.add(text);
	
	} else if(diaryitemVo.stickerCateNo == 1) { // ??????--????????? ?????? ????????? ????????? ????????? ????????? ????????? ???????????? ?????? ????????????
		fabric.Image.fromURL(diaryitemVo.stickerSrc, function(backImg) {

			canvas.setBackgroundImage(backImg, canvas.renderAll.bind(canvas),{
				scaleX: canvas.width / backImg.width,
				scaleY: canvas.height / backImg.height
			});
			
			console.log("=====================================");
			console.log(backImg);
		});
		
		
	} else {  //?????????- stickerCateNo == 2
		fabric.Image.fromURL(diaryitemVo.stickerSrc, function(oImg) {
			//??????
			oImg.top = diaryitemVo.top;
			oImg.left = diaryitemVo.left;
			
			//?????????
			oImg.scaleX = diaryitemVo.scaleX;
			oImg.scaleY = diaryitemVo.scaleY;
			
			//??????
			oImg.angle = diaryitemVo.angle;
			
			//???????????????
			oImg.selectable = false;
			
			//??????????????????
			oImg.hoverCursor ="default";
			
			//???????????? ??????
			canvas.add(oImg);
		});
	}
}

var canvas = new fabric.Canvas("paper", {
	 width: 680,
	 height: 510,
	 backgroundColor: '#dbd3c7'
});

	// input multiple ?????????, ????????? ?????? ?????????
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
	
	// ?????? ??????
	var diary = [];
	$(".d-table").on("click", ".diarySelect", function() {
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