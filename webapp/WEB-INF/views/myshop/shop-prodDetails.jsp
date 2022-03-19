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
#main-content {
    width: 678.9px;
}

h3, h4 {
    font-family: 'SCDream4';
    font-weight: bolder;
    margin-left: 15px;
}
 
.img {
    width: 330px; height: 400px; margin-right:1px;
    border: 1px solid #ebebeb; float: left;
    overflow: hidden;
}
#prod-img, #prod-diary {width: 330px; height: 330px;} .sel-img {width: 70px; height: 70px; margin: 1px;}
#selectImg, #selectDiary {width:100%; border: solid 1px #ebebeb; display: inline-flex; justify-content:center;}
 
#text {
    display: inline-flex; width: 100%; justify-content: center;
    margin: 6px 0px 6px 15px;
}
input[id="price"], input[id="emotion"], input[id="delivery"] {
    width: 100px; 
    margin: 2px 2px;
    border: none; } 

#buy {
    display: inline-flex;
    padding-left: 28%;
    margin-top: 20px;
} #buy #submitBtn {
    width: 140px;
    margin-left: 2px;
}

#commentBtn {
    width: 140px;
    height: 40px;
    display: block;
    font-weight: 400;
    font-size: 13px;
    padding: 10px;
    border: none;
    cursor: pointer; 
    background: #d7cfe8;
    color: #fff; }
    #commentBtn:hover{
        background-color: #ebebeb;} 
     
#cmt-table .replySetBtn {
    width: 60px;
    height: 20px;
    text-align: center;
    font-size: 6px;
    font-family: 'SCDream4';
    padding: 3px; margin-left: 2px;
    border: none;    
    cursor: pointer; 
    background: #d7cfe8;
    color: #fff; }
    #cmt-table .replySetBtn:hover{
        background-color: #ebebeb;} 
        

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
					<h4>상품이름: ${productVo.prodName} / 일기장 제목: </h4> 
					<input type="hidden" name="prodNo" value="${productVo.prodNo}"> <input type="hidden" name="sellerNo" value="${productVo.userNo}">
					<div class="img">
						<img id="prod-img" src="${pageContext.request.contextPath}/upload/${productVo.prodImgList[0].prodImgSrc}">
					
						<!--<c:forEach items="${productVo.prodImgList}" var="list">
							<img class="prod-img"
								src="${pageContext.request.contextPath}/upload/${list.prodImgSrc}">
						</c:forEach>
						-->
							
						<div id="selectImg">
							<c:forEach items="${productVo.prodImgList}" var="list">
								<img class="sel-img" id="i${list.prodImgNo}" onclick="viewImg(${list.prodImgNo})"
									src="${pageContext.request.contextPath}/upload/${list.prodImgSrc}">
							</c:forEach>
						</div>
					</div>
					
					<div class="img">
						<img id="prod-diary" src="${pageContext.request.contextPath}/upload/test.png" data-toggle="modal" data-target=".diaryview">
						
						<div class="modal fade diaryview" tabindex="-1" role="dialog">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">x</span>
										</button>
										<h4 class="modal-title">일기장 구경하기</h4>
									</div>
									<div class="modal-body">
										<img id="modal-diary">
									</div>
								</div>
							</div>
						</div>
					
						<div id="selectDiary">
							<img class="sel-img" id="d1" onclick="viewDiary(1)"
									src="${pageContext.request.contextPath}/upload/test.png">
					
						
						<!-- <c:forEach items="${productVo.prodImgList}" var="list">
								<img class="sel-img" onclick="viewDiary()"
									src="${pageContext.request.contextPath}/upload/${list.prodImgSrc}">
							</c:forEach> -->
						</div>
					</div>
					
					<div id="text">
						<div class="deco-area">
							<img src="${pageContext.request.contextPath}/assets/img/star-rounded-png.png" class="deco">
						</div>
						<label for="price">가격은</label> <input type="text" id="price"
							name="" value="${productVo.price}원">
						<div class="deco-area">
							<img src="${pageContext.request.contextPath}/assets/img/star-rounded-png.png" class="deco">
						</div>
						<label for="emotion">이런 감정</label> <input type="text"
							id="emotion" name="" value="${productVo.emotion}">
						<div class="deco-area">
							<img src="${pageContext.request.contextPath}/assets/img/star-rounded-png.png" class="deco">
						</div>
						<label for="delivery">전달방법</label> <input type="text"
						id="delivery" name="" value="${productVo.delivery}">
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
										<div id="send-area">
											<input id="startChat" type="button" data-dismiss="modal" value="전송">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
						
					<div id="share-area"></div>
					<div id="comment-area" style="margin-top: 25px">
						<table style="width: 663.9px; border: 1px solid #ebebeb;">
							<tr>
								<td></td>
								<td><input type="text" name="cmtContent" value=""></td>
								<td style="width:200px"><input type="button" class="button" id="commentBtn" value="댓글추가"></td>
							</tr>
						</table>
						
						<table id="cmt-table" class="table table-striped" style="width: 663.9px; font-family:'SCDream4';">
							<colgroup>
								<col style="width: 45%; height: 25px;">
								<col style="width: 20%; height: 25px;">
								<col style="width: 20%; height: 25px;">
								<col style="width: 15%; height: 25px;">
							</colgroup>
							<tr>							
								<td style="text-align:center; font-weight:bolder">내용</td>
								<td style="font-weight:bolder">작성자</td>
								<td style="font-weight:bolder">작성일</td>
								<td></td>
							</tr>	
							<c:forEach items="${commentList}" var="commentVo">
								<tr>
									<td>
										<c:if test="${commentVo.depth != 0}">
											<c:forEach begin="1" end="${commentVo.depth}">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</c:forEach>
											ㄴ
										</c:if>
									${commentVo.cmtContent}
									</td>
									<td>${commentVo.id}</td>									
									<td>${commentVo.regDate}</td>
									<td><input type="button" value="답글" class="replySetBtn" data-str="${commentVo.cmtNo}_${commentVo.groupNo}_${commentVo.cmtSeq}_${commentVo.depth}"></td>
								</tr>
								<tr id="add${commentVo.cmtNo}">
									<td colspan="5" class="addreply" id="rp${commentVo.cmtNo}"></td>
								</tr>
							</c:forEach>						
						</table>
					</div>
				</div> <!-- content -->
			</div> <!-- row -->
		</div> <!-- container -->
	</div> <!-- wrap -->
</body>

<script type="text/javascript">
	function viewImg(no) {
		console.log(no);
		var selImgSrc = $("#i"+no).attr("src");
		$("#prod-img").attr("src", selImgSrc);
	}
	
	function viewDiary(no) {
		var diarySrc = $("#d"+no).attr("src");
		$("#prod-diary").attr("src", diarySrc);
		$("#modal-diary").attr("src", diarySrc);
	}

	$(document).ready(function() {
		$(".addreply").hide();
		
		var authUser = $("#pickBtn").data("no");
		var prodNo = $("[name='prodNo']").val();
		
		var pickVo = {
				userNo: authUser,
				prodNo: prodNo
			}
	
		$.ajax({			
			url : "${pageContext.request.contextPath}/myshop/checkpick",		
			type : "post",
			// contentType : "application/json",
			data : pickVo,

			dataType : "json",
			success : function(result){
				if(result=='exists') {
					$("#pickBtn").attr("disabled", true);
					$("#pickBtn").val("찜한 상품");
					document.getElementById("pickBtn").style.background = "red";
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}	
		});
	});
	
	$("#commentBtn").on("click", function() {
		var prodNo = $("[name='prodNo']").val();
		var authUser = $("#pickBtn").data("no");
		var cmtContent = $("[name='cmtContent']").val();
		
		var commentVo = {
			prodNo: prodNo,
			userNo: authUser,
			cmtContent: cmtContent
		}
		console.log(commentVo);
		$.ajax({			
			url : "${pageContext.request.contextPath}/myshop/commentfirst",		
			type : "post",
			// contentType : "application/json",
			data : commentVo,

			dataType : "json",
			success : function(vo){
				console.log(vo)
				rendercmt(vo);
				$("[name='cmtContent']").val("");
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}	
		});
	});
	
	function rendercmt(vo) {		
		var str = '';
		str += '<tr>';
		str += '	<td>'+ vo.cmtContent +'</td>';
		str += '	<td>'+ vo.id +'</td>';
		str += '	<td>'+ vo.regDate +'</td>';
		str += '	<td><input type="button" value="답글" class="replySetBtn" data-str=""></td>';		
		str += '</tr>';
		
		$("#cmt-table").append(str);
	}
	
	$("#cmt-table").on("click", ".replySetBtn", function() {
		console.log("set");
		var $this = $(this);
		var cmtNo = parseInt($this.data("str").split("_")[0]);
		
		var input = document.createElement("input");
		input.setAttribute("type", "text");
		input.setAttribute("name", "replyContent");
		var replyBtn = document.createElement("input");
		replyBtn.setAttribute("type", "button");
		replyBtn.setAttribute("class", "replyBtn");
		replyBtn.setAttribute("value", "답글달기");
		replyBtn.setAttribute("data-no", cmtNo);		
		
		document.querySelector("#rp"+cmtNo).appendChild(input);
		document.querySelector("#rp"+cmtNo).appendChild(replyBtn);
		$("#rp"+cmtNo).show();
		
		$(".replyBtn").on("click", function() {
			var prodNo = $("[name='prodNo']").val();
			var authUser = $("#pickBtn").data("no");
			var cmtContent = $("[name='replyContent']").val();
			
			var arr = $($this.data("str").split("_"));
			
			var replyVo = {
					prodNo: prodNo,
					userNo: authUser,
					cmtContent: cmtContent,
					groupNo: parseInt(arr[1]),
					cmtSeq: parseInt(arr[2]),
					depth: parseInt(arr[3])
				}
			console.log(replyVo);
			$.ajax({			
				url : "${pageContext.request.contextPath}/myshop/reply",		
				type : "post",
				// contentType : "application/json",
				data : replyVo,

				dataType : "json",
				success : function(vo){
					var cmtNo = arr[0];
					console.log(cmtNo)
					renderReply(vo, cmtNo);
					$("[name='replyContent']").val("");
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}	
			});
		});		
	});
	
	function renderReply(vo, cmtNo) {
		console.log(cmtNo);
		var blank = '';
		
		for(var i=0; i<vo.depth; i++) {
			blank += '\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0';
			console.log(blank+",");
		}		
		
		var str = '';
		str += '	<td>'+ blank +'ㄴ\u00a0'+ vo.cmtContent +'</td>';
		str += '	<td>'+ vo.id +'</td>';
		str += '	<td>'+ vo.regDate +'</td>';
		str += '	<td><input type="button" value="답글" class="replySetBtn" data-str=""></td>';
		
		$("#rp"+cmtNo).hide();
		$("#add"+cmtNo).append(str);
		
	}
	
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