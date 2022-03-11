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

<style>
.diarySelect {width: 13px}
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
						<table id="a-table">
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
								<td id="diary-td"><label for="prod-diary">일기 추가</label> 
								<input id="prod-diary" type="button" data-toggle="modal" data-target=".diaryList" value="일기 불러오기">
								
									<div class="modal fade diaryList" tabindex="-1"
										role="dialog" aria-labelledby="myLargeModalLabel"
										aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">x</span>
													</button>
													<h4 class="modal-title">일기장 불러오기</h4>
												</div>
												<div class="modal-body">
													<table id="d-table">
														<tr>
															<td>번호</td>
															<td>제목</td>
															<td>날짜</td>
															<td>선택</td>
														</tr>
														<c:forEach items="${diaryList}" var="diaryVo">
															<tr>
																<td>${diaryVo.diaryNo}</td>
																<td>${diaryVo.title}</td>
																<td>${diaryVo.diaryDate}</td>
																<td><input type="checkbox" class="diarySelect" data-no="${diaryVo.diaryNo}"></td>
															</tr>
														</c:forEach>														
													</table>
													<button type="button" id="diarySelBtn" data-dismiss="modal">선택</button>
												</div>
											</div>
										</div>
									</div>
									<div id="diary-area">
									</div>
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
	/*var html = 
		'<a href="javascript:void(0)" onclick="delImg('+ index +')" id="imgId+'+ index +'"><img src="'+ e.target.result +'" data-file="'+ f.name +'" class="img-img" title=""></a>';
	*/
	function delImg(index) {
		console.log("index:"+index);
		submitFiles.splice(index, 1);
		
		$("#imgId" +index).remove();
		
		console.log(submitFiles);		
	}
	
	/* 선택한 이미지 미리보기
	var inputMultipleImage = document.getElementById("prod-img");
	inputMultipleImage.addEventListener("change", e => {
		readMultipleImage(e.target)
	});
	
	function readMultipleImage(input) {
		var imgarea = document.getElementById("img-area");
		
		if(input.files) {
			var fileArr = Array.from(input.files);
			console.log(fileArr);
						
			fileArr.forEach((file, index)=> {
				var reader = new FileReader();
				
				reader.onload = e => {
					var img = document.createElement("img");
					img.setAttribute("src", e.target.result);
					img.setAttribute("class", "img-img");
					document.querySelector("div#img-area").appendChild(img);					
				}				
				console.log(file.name);
				reader.readAsDataURL(file);
			});					
		}
	}*/
	
	// 일기 추가
	var diary = [];
	$("#d-table").on("click", ".diarySelect", function() {
		var $this = $(this);
		var diaryNo = $this.data("no");
		diary.push(diaryNo);
		console.log(diaryNo);
	});
		
	$("#diarySelBtn").on("click", function() {
		console.log(diary);
		
		var input = document.createElement("input");
		input.setAttribute("name", "diaryNo[]");
		input.setAttribute("value", diary);
		document.querySelector("div#diary-area").appendChild(input);			
	});
	
</script>
</html>