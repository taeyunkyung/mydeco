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
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/prodDetails.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/js/bootstrap.min.js"></script>

<style>
#main-content {width: 678.9px;}
.img {overflow: hidden;}
.prod-img {width: 330px; height: 250px;}
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
					<h3>상품이름: ${productVo.prodName}</h3> 
					<input type="hidden" name="prodNo" value="${productVo.prodNo}"> <input type="hidden" name="sellerNo" value="${productVo.userNo}">
					<div class="img">
						<c:forEach items="${productVo.prodImgList}" var="list">
							<img class="prod-img" src="${pageContext.request.contextPath}/upload/${list.prodImgSrc}">
						</c:forEach>
					</div>
					<div class="selectimg"></div>
					<div id="text">
						<div class="deco-area">
							<img src="${pageContext.request.contextPath}/assets/img/star-rounded-png.png" class="deco">
						</div>
						<label for="price">가격</label> <input type="text" id="price"
							name="" value="${productVo.price}원">
						<div class="deco-area">
							<img src="${pageContext.request.contextPath}/assets/img/star-rounded-png.png" class="deco">
						</div>
						<label for="emotion">이런 감정일때</label> <input type="text"
							id="emotion" name="" value="${productVo.emotion}">
					</div>
					<div id="story-content">
						<textarea id="story"placeholder="${productVo.prodInfo}"></textarea>
					</div>
					<div id="buy">
						<input type="button" class="button" id="pickBtn" data-no="${authUser.userNo}" value="찜하기"> 
						<input type="button" id="submitBtn"  data-toggle="modal" data-target=".chatfirst" value="구매하기">

						<div class="modal fade chatfirst" tabindex="-1" role="dialog">
							<div class="modal-dialog modal-sm">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">x</span>
										</button>
										<h4 class="modal-title">채팅 시작하기</h4>
									</div>
									<div class="modal-body">
										<textarea id="chatContent" name="chatContent"></textarea>
										<button type="button" id="startChat" data-dismiss="modal">전송</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div> <!-- content -->
			</div> <!-- row -->
		</div> <!-- container -->
	</div> <!-- wrap -->
</body>

<script type="text/javascript">
	$("#pickBtn").on("click", function() {
		console.log("찜버튼");
		var authUser = $("#pickBtn").data("no");
		var prodNo = $("[name='prodNo']").val();
		console.log(authUser);
		
		if(!authUser) {
			alert("로그인 후 사용가능한 기능입니다.");
			return false;
		}
		
		var pickVo = {
			userNo: authUser,
			prodNo: prodNo
		}
		console.log(pickVo);
		$.ajax({			
			url : "${pageContext.request.contextPath}/myshop/addpick",		
			type : "post",
			// contentType : "application/json",
			data : pickVo,

			dataType : "json",
			success : function(result){
				if(result=='success') {
					window.location.href = "${pageContext.request.contextPath}/myshop/pickedProducts";
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}	
		}); 
	});
	
	$("#submitBtn").on("click", function() {
		var authUser = $("#pickBtn").data("no"); console.log(authUser);
		if(!authUser) {
			alert("로그인 후 사용가능한 기능입니다.");
			return false;
		}
	});
	
	$("#startChat").on("click", function() {
		console.log("구매버튼");
		var prodNo = $("[name='prodNo']").val();
		var sellerNo = $("[name='sellerNo']").val();
		var chatContent = $("[name='chatContent']").val();
		
		var userChatVo = {
			prodNo: prodNo,
			sellerNo: sellerNo,
			buyerNo: 0,
			chatContent: chatContent
		}
		console.log(userChatVo);
		$.ajax({			
			url : "${pageContext.request.contextPath}/myshop/startchat",		
			type : "post",
			// contentType : "application/json",
			data : userChatVo,

			dataType : "json",
			success : function(userChatVo){
				window.location.href = "${pageContext.request.contextPath}/myshop/chatList";
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}	
		}); 
	});
</script>
</html>