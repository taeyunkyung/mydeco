<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Deco</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/modifyForm.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/fabric.js"></script>
<style>
	#main-box {padding: 0px 0px 0px 30px;}
	
	h3 {
		border-bottom: 1px solid #000000;
		padding: 0px 0px 20px 0px;
	}
	
	#paper-box {
		border: 1px solid #000000;
		padding: 10px 10px 10px 10px;
	}
	
	
	#stickerBoard {
		border: 1px solid #000000;
		padding: 20px 0px 20px 12px;
	}
	
	.sticker {
		border: 1px solid #000000;
		width: 110px;
		height: 110px;
		margin: 0px 5px 10px 5px;
		cursor: pointer;
	}
	
	#sticker-text {
		border: 1px solid #000000;
		width: 110px;
		height: 60px;
		margin: 0px 5px 10px 5px;
		cursor: pointer;
	}
	
	
</style>

</head>

<body>
	<div id="wrap">
		<div id="container">
			<div id="row">
			
				<!-- header -->
				<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
				
				
				<div id="main-box" class="col-xs-12">
					<!-- content -->
					<div class="col-xs-12" id="main-content">
					
						<h3>꾸미기 작성페이지 테스트</h3>
						
						<div>
							<div class="col-xs-9" id="paper-box">
								<canvas id="paper"></canvas>
							</div>
							
							<div class="col-xs-3" id="stickerBoard">
							
								<div  id="sticker-text" data-stickerno="9999999" >텍스트 상자</div>
							
								<c:forEach items="${stickerList}" var="stickVo">
									<img  class="sticker" data-stickerno="${stickVo.stickerNo}" data-stickerpath="${stickVo.stickerPath}" src="${stickVo.stickerPath}">
								</c:forEach>
							</div>
						</div>
						
						<div class="row">
							<div class="col-xs-9">
								<button type="button" class="btn btn-default center-block" id="btnSave">저장하기</button>
							</div>
							
						</div>							
																	
                    </div> <!-- content -->
				
				</div><!-- //wrap -->
				
								
			</div> <!-- row -->
		</div> <!-- container -->
	</div> <!-- wrap -->
</body>


<script type="text/javascript">

//캔버스 초기화 설정
var canvas = new fabric.Canvas("paper", {
	 width: 788,
	 height: 900,
	 backgroundColor: 'rgb(100,100,200)'
});





//텍스트 상자를 클릭했을때
$("#sticker-text").on("dblclick", function(){
	var stickerNo= $(this).data("stickerno")
	
	var text = new fabric.Textbox("텍스트를 입력하세요", {
		stickerNo: stickerNo,
		top: 30,
		left: 30,
		width: 300,
		height: 300,
		fontSize: 16
	});
	
	canvas.add(text);
	
	canvas.setActiveObject(text);
	text.selectAll();
	text.enterEditing();
	text.hiddenTextarea.focus();
})



//스티커를 클릭했을때
$(".sticker").on("dblclick", function(){
	var stickerNo= $(this).data("stickerno")
	var stickerPath = $(this).data("stickerpath")
	
	console.log(stickerNo);
	console.log(stickerPath);
	
	fabric.Image.fromURL(stickerPath, function(oImg) {
		//이미지 크기를 1/4로 줄여서 보여줌
		oImg.scale(1/4)

		//객체에 스티커번호 추가
		oImg.stickerNo = stickerNo;
		canvas.add(oImg);
		
		console.log(oImg);
	});
})



//del키를 눌렀을때
$("body").on("keyup",function(){
	if ( event.keyCode == 46 || event.which == 46 ) {
		
		//현재 선택된(활성화된)) 객체를 가져온다.
		var activeObject = canvas.getActiveObject()
		
		//객체를 삭제한다.
		canvas.remove(activeObject);
	}
})




//저장버튼을 눌렀을때
$("#btnSave").on("click", function(){
	console.log("저장클릭");
	
	//캔버스에 있는 전체 객체를 배열로 가져온다
	var canvasObjList = canvas.getObjects();

	//서버로 전송할 객체들 배열
	var paperItemList = [];
	
	
	for(var i=0; i<canvasObjList.length; i++){
		var paperVo = {};
		paperVo.top = canvasObjList[i].top;
		paperVo.left = canvasObjList[i].left;
		paperVo.scaleX = canvasObjList[i].scaleX;
		paperVo.scaleY = canvasObjList[i].scaleY;
		paperVo.angle = canvasObjList[i].angle;
		
		paperVo.stickerNo = canvasObjList[i].stickerNo;
		
		paperVo.text = canvasObjList[i].text;
		
		paperItemList.push(paperVo);
	}

	writeDiary(paperItemList);
	
})

//저장 함수
function writeDiary(paperItemList){
	console.log(paperItemList);
}

</script>
</html>