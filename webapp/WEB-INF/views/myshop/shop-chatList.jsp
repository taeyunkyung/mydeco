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
					<div id="div-sub">
						<h3>1:1 채팅 목록</h3>
					</div>
					<div class="searchTop">						
						<div id="option">
									<input type="button" class="opt-btn" id="buyOpt" value="구매"> <input
										type="button" class="opt-btn" id="sellOpt" value="판매">
						</div>
					</div>
					<div id="c-list">
						<div class="chat-list" id="myBuy">
							<ol>
								<c:forEach items="${map.myBuyList}" var="UserChatVo">
									<li>
										<p>상품이름: ${UserChatVo.prodName}</p>
										<div class="btn-area">
											<input type="button" data-no="buy_${UserChatVo.prodNo}" class="details-btn" value="상세보기">
											<p>판매자: ${UserChatVo.id}</p>
										</div>
									</li>
								</c:forEach>
							</ol>
						</div>
						<div class="chat-list" id="mySell">
							<ol>
								<c:forEach items="${map.mySellList}" var="UserChatVo">
									<li>
										<p>상품이름: ${UserChatVo.prodName}</p>
										<div class="btn-area">
											<input type="button" data-no="sell_${UserChatVo.prodNo}" class="details-btn" value="상세보기">
											<p>구매자: ${UserChatVo.id}</p>
										</div>
									</li>
								</c:forEach>
							</ol>
						</div>
						
						<div id="chat-box">
							<ol class="chat" id="buyDetails">
								<c:forEach items="${map.myBuyDetails}" var="UserChatVo">
									<li class="l-align" data-no="${UserChatVo.prodNo}">
									
										<c:if test=""></c:if>
										<p>아이디</p> <br>
										<p class="l-answ">${UserChatVo.chatContent}</p>
									</li>
								</c:forEach>


								<li class="r-align">
										<p>나의 답변</p>
								</li>
								
							</ol>
							<ol class="chat" id="sellDetails">
								<c:forEach items="${map.myBuyDetails}" var="UserChatVo">
									<li class="l-align" data-no="${UserChatVo.prodNo}">
									
										<c:if test=""></c:if>
										<p>아이디</p> <br>
										<p class="l-answ">${UserChatVo.chatContent}</p>
									</li>
								</c:forEach>


								<li class="r-align">
										<p>나의 답변</p>
									</li>
								
							</ol>

							<form>
								<div id="type">
									<textarea id="typearea"></textarea>
								</div>
								<div id="send-area">
									<input type="button" class="send-btn" value="전송"> <input
										type="button" class="send-btn" value="삭제">
								</div>
							</form>
						</div>
					</div>
				</div> <!-- content -->
			</div> <!-- row -->
		</div> <!-- container -->
	</div> <!-- wrap -->
</body>

<script type="text/javascript">
	$(document).ready(function () {
		$("#mySell").hide();
		$("#chat").hide();
	});	
	$("#sellOpt").on("click", function() {
		$("#myBuy").hide();
		$("#mySell").show();
	});
	$("#buyOpt").on("click", function() {
		$("#mySell").hide();
		$("#myBuy").show();
	});
	
	$(".chat-list").on("click", ".details-btn", function() {
		var $this = $(this);
		var prodNo = $this.data("no");
		console.log(prodNo);

		/*$.ajax({			
			url : "${pageContext.request.contextPath}/myshop/myProducts/remove",		
			type : "post",
			// contentType : "application/json",
			data : {delprodNo: delprodNo},

			dataType : "json",
			success : function(result){
				console.log(result);	
				
				if(result === 'success') {					
					$("#l"+ delprodNo).remove();
					$('.delModal').modal('hide');
					window.location.href = "${pageContext.request.contextPath}/myshop/myProducts?crtPage=1"
				} 								
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}				
		});	*/	
	})
</script>

</html>