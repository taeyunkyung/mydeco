<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>MyDeco</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/shop-my.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/js/bootstrap.min.js"></script>
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
					
						<c:import url="/WEB-INF/views/include/aside-shop2.jsp"></c:import>

						<div class="col-xs-9" id="main-content">
							<h3 class="subtitle">1:1 채팅 목록</h3>

							<div id="main">
								<div class="searchTop">
									<div id="option">
										<input type="button" class="opt-btn" id="buyOpt" value="구매">
										<input type="button" class="opt-btn" id="sellOpt" value="판매">
										<p id="chatroom-id"></p>
									</div>
								</div>
								<div id="c-list">
									<div class="chat-list" id="myBuy">
										<ol>
											<c:forEach items="${map.myBuyList}" var="UserChatVo">
												<li>
													<p>상품이름: ${UserChatVo.prodName}</p>
													<div class="btn-area">
														<input type="button"
															data-no="sellerNo_${UserChatVo.sellerNo}_${UserChatVo.id}_${UserChatVo.prodNo}"
															class="details-btn" value="상세보기">
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
														<input type="button"
															data-no="buyerNo_${UserChatVo.buyerNo}_${UserChatVo.id}_${UserChatVo.prodNo}"
															class="details-btn" value="상세보기">
														<p>구매자: ${UserChatVo.id}</p>
													</div>
												</li>
											</c:forEach>
										</ol>
									</div>

									<div id="chat-box">
										<ol id="chatview" style="padding-left: 5px">
										</ol>
										<div id="type">
											<textarea id="typearea" data-rl="" name="chatContent"
												value=""></textarea>
											<input type="hidden" name="prodNo" value=""> <input
												type="hidden" name="buyerNo" value=""> <input
												type="hidden" name="sellerNo" value="">
										</div>
										<div id="send-area">
											<input id="sendChat" type="submit" class="send-btn"
												value="전송"> <input type="button" class="send-btn"
												value="나가기">
										</div>
									</div>
								</div>

							</div>
							<!-- //main-content -->
						</div>
						<!-- //row -->	
					</div>				
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
	$(document).ready(function () {
		$("#mySell").hide();
		$("#typearea").data("rl", "r");
	});	
	$("#sellOpt").on("click", function() {
		$("#myBuy").hide();
		$("#mySell").show();
		$("#typearea").data("rl", "l");		
	});
	$("#buyOpt").on("click", function() {
		$("#mySell").hide();
		$("#myBuy").show();
		$("#typearea").data("rl", "r");
	});
	
	$(".chat-list").on("click", ".details-btn", function() {
		$("#chatview").empty();
		var $this = $(this);
		var str = $this.data("no");
		console.log(str);
		
		var arr = str.split('_');
		$("#chatroom-id").text(arr[2]);
		$("input[name='prodNo']").val(parseInt(arr[3]));
		
		if(arr[0]=='buyerNo') {
			var buyerNo = arr[1];
			var prodNo = arr[3];
			$("input[name='buyerNo']").val(parseInt(buyerNo));
			$("input[name='sellerNo']").val(0);
			
			var userChatVo = {
				buyerNo: buyerNo, prodNo: prodNo
			}
		} else if(arr[0]=='sellerNo') {
			var sellerNo = arr[1];
			var prodNo = arr[3];
			$("input[name='buyerNo']").val(0);
			$("input[name='sellerNo']").val(parseInt(sellerNo));
			
			var userChatVo = {
				sellerNo: sellerNo, prodNo: prodNo
			}
		}		
		console.log(userChatVo);
		console.log($("input[name='buyerNo']").val());
		console.log($("input[name='sellerNo']").val());

		$.ajax({			
			url : "${pageContext.request.contextPath}/myshop/chatList/chatDetails",		
			type : "post",
			// contentType : "application/json",
			data : userChatVo,

			dataType : "json",
			success : function(userChatList){
				console.log(userChatList)			
				
				for(var i=0; i<userChatList.length; i++) {
					if(userChatList[i].align == 'right') {
						renderRight(userChatList[i])
					} else if(userChatList[i].align == 'left') {
						renderLeft(userChatList[i])
					}
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}				
		});		
	});
	
	function renderLeft(userChatVo) {		
		var str = '';
		str += '	<li class="l-align"><p>'+ userChatVo.chatContent +'</p></li>';
		str += '	<li class="l-align"><p>'+ userChatVo.regDate +'</p></li>';	
		
		$("#chatview").append(str);
	}
	
	function renderRight(userChatVo) {		
		var str = '';
		str += '	<li class="r-align"><p>'+ userChatVo.chatContent +'</p></li>';
		str += '	<li class="r-align"><p>'+ userChatVo.regDate +'</p></li>';
		
		$("#chatview").append(str);
	}	
	
	$("#sendChat").on("click", function() {
		var prodNo = $("input[name='prodNo']").val();
		var sellerNo = $("input[name='sellerNo']").val();
		var buyerNo = $("input[name='buyerNo']").val();
		var chatContent = $("[name='chatContent']").val();
		
		var userChatVo = {
			prodNo: prodNo,
			sellerNo: sellerNo,
			buyerNo: buyerNo,
			chatContent: chatContent
		}
		console.log(userChatVo);
		$.ajax({			
			url : "${pageContext.request.contextPath}/myshop/chat",		
			type : "post",
			// contentType : "application/json",
			data : userChatVo,

			dataType : "json",
			success : function(userChatVo){
				console.log(userChatVo);
				var add = '';
				var rl = $("#typearea").data("rl");
				
				if(rl=='r') {
					add += '	<li class="r-align"><p>'+ userChatVo.chatContent +'</p></li>';
					add += '	<li class="r-align"><p>'+ userChatVo.regDate +'</p></li>';	
				} else if(rl=='l') {
					add += '	<li class="l-align"><p>'+ userChatVo.chatContent +'</p></li>';
					add += '	<li class="l-align"><p>'+ userChatVo.regDate +'</p></li>';	
				}
								
				$("#chatview").append(add);
				$("[name='chatContent']").val("");
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}	
		}); 
	});		
</script>
</html>