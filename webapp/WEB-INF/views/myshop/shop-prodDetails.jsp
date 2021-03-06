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
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/prodDetails.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/fabric.js"></script>

<style> 
#main-content {
    width: 678.9px;
}

h3, h4, p {
    font-family: 'SCDream4';
    font-weight: bolder;
    margin-left: 5px;
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
					<h4>????????????: ${productVo.prodName}</h4> 
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
						<img id="prod-diary" data-no="${productVo.prodDiaryList[0].diaryNo}" src="${productVo.prodDiaryList[0].stickerSrc}" data-toggle="modal" data-target=".diaryview">
						
						<div class="modal fade diaryview" tabindex="-1" role="dialog">
							<div class="modal-dialog modal-lg" style="width:710px; height: 570px;">
								<div class="modal-content">
									<div class="modal-header" style="height:50px">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">x</span>
										</button>
										<h4 class="modal-title" style="display:inline-block; float: left">????????? ????????????</h4>
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

						<div id="selectDiary">	
							<c:forEach begin="1" end="${fn:length(productVo.prodDiaryList)}" step="1" var="count">
								<img class="sel-img" id="d${count-1}" onclick="viewDiary(${productVo.prodDiaryList[count-1].diaryNo},${count-1})" 
									src="${productVo.prodDiaryList[count-1].stickerSrc}">
							</c:forEach>
						</div>
					</div>
					
					<div id="text">
						<div class="deco-area">
							<img src="${pageContext.request.contextPath}/assets/img/star-rounded-png.png" class="deco">
						</div>
						<label for="price">?????????</label> <input type="text" id="price"
							name="" value="${productVo.price}???">
						<div class="deco-area">
							<img src="${pageContext.request.contextPath}/assets/img/star-rounded-png.png" class="deco">
						</div>
						<label for="emotion">?????? ??????</label> <input type="text"
							id="emotion" name="" value="${productVo.emotion}">
						<div class="deco-area">
							<img src="${pageContext.request.contextPath}/assets/img/star-rounded-png.png" class="deco">
						</div>
						<label for="delivery">????????????</label> <input type="text"
						id="delivery" name="" value="${productVo.delivery}">
					</div>	
					
					<div id="story-content">
						<textarea id="story"placeholder="${productVo.prodInfo}"></textarea>
					</div>
					<div id="buy">
						<input type="button" class="button" id="pickBtn" data-no="${authUser.userNo}" value="?????????"> 
						<input type="button" id="submitBtn"  data-toggle="modal" data-target=".chatfirst" value="????????????">

						<div class="modal fade chatfirst" tabindex="-1" role="dialog">
							<div class="modal-dialog modal-sm">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">x</span>
										</button>
										<h4 class="modal-title">?????? ????????????</h4>
									</div>
									<div class="modal-body">
										<textarea id="chatContent" name="chatContent"></textarea>
										<div id="send-area">
											<input id="startChat" type="button" data-dismiss="modal" value="??????">
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
								<td style="width:200px"><input type="button" class="button" id="commentBtn" value="????????????"></td>
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
								<td style="text-align:center; font-weight:bolder">??????</td>
								<td style="font-weight:bolder">?????????</td>
								<td style="font-weight:bolder">?????????</td>
								<td></td>
							</tr>	
							<c:forEach items="${commentList}" var="commentVo">
								<tr>
									<td>
										<c:if test="${commentVo.depth != 0}">
											<c:forEach begin="1" end="${commentVo.depth}">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</c:forEach>
											???
										</c:if>
									${commentVo.cmtContent}
									</td>
									<td>${commentVo.id}</td>									
									<td>${commentVo.regDate}</td>
									<td><input type="button" value="??????" class="replySetBtn" data-str="${commentVo.cmtNo}_${commentVo.groupNo}_${commentVo.cmtSeq}_${commentVo.depth}"></td>
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
	$(function() {
		if ($("#delivery").val()=='meet') {
			$("#delivery").val('?????????')
		} else if ($("#delivery").val()=='post') {
			$("#delivery").val('??????')
		}
		
		if ($("#emotion").val()=='happy') {
			$("#emotion").val('??????')
		} else if ($("#emotion").val()=='sad') {
			$("#emotion").val('??????')
		} else if ($("#emotion").val()=='angry') {
			$("#emotion").val('??????')
		} else if ($("#emotion").val()=='annoyed') {
			$("#emotion").val('??????')
		} else if ($("#emotion").val()=='relieved') {
			$("#emotion").val('?????????')
		}
	})

	function viewImg(no) {
		console.log(no);
		var selImgSrc = $("#i"+no).attr("src");
		$("#prod-img").attr("src", selImgSrc);
		//document.getElementById("i"+no).style.border = "solid 1px red";		
	}
	
	$("#prod-diary").on("click", function() {	
		var no = $("#prod-diary").data("no");
		
		$.ajax({			
			url : "${pageContext.request.contextPath}/myshop/viewdiary",		
			type : "post",
			// contentType : "application/json",
			data : {diaryNo: no},

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
	
	function viewDiary(no, count) {
		console.log(no);
		var paperSrc = $("#d"+count).attr("src");
		$("#prod-diary").attr("src", paperSrc);
		$("#prod-diary").data("no", no);
	}
	
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
					$("#pickBtn").val("?????? ??????");
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
		str += '	<td><input type="button" value="??????" class="replySetBtn" data-str=""></td>';		
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
		replyBtn.setAttribute("value", "????????????");
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
		str += '	<td>'+ blank +'???\u00a0'+ vo.cmtContent +'</td>';
		str += '	<td>'+ vo.id +'</td>';
		str += '	<td>'+ vo.regDate +'</td>';
		str += '	<td><input type="button" value="??????" class="replySetBtn" data-str=""></td>';
		
		$("#rp"+cmtNo).hide();
		$("#add"+cmtNo).append(str);
		
	}
	
	$("#pickBtn").on("click", function() {
		console.log("?????????");		
		var authUser = $("#pickBtn").data("no");
		var prodNo = $("[name='prodNo']").val();
		console.log(authUser);
		
		if(!authUser) {
			alert("????????? ??? ??????????????? ???????????????.");
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
			alert("????????? ??? ??????????????? ???????????????.");
			return false;
		}
	});
	
	$("#startChat").on("click", function() {
		console.log("????????????");
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