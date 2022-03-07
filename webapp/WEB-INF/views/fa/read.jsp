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
							
						</div>
							
					
                    </div> <!-- content -->
				
				</div><!-- //wrap -->
				
								
			</div> <!-- row -->
		</div> <!-- container -->
	</div> <!-- wrap -->
</body>


<script type="text/javascript">

//캔버스 초기화 설정
var canvas = new fabric.Canvas('paper', {
	 width: 788,
	 height: 900,
	 backgroundColor: 'rgb(100,100,200)'
});


//돔이 준비되면 데이터 가져와서 그리기
$(document).ready(function(){ 
	
	getItemList();
	
});

//아이템 가져오기
function getItemList(){
	
	//데이터 전송 --> 그리기 작업
	$.ajax({
		url : "${pageContext.request.contextPath }/faGetItemList",		
		type : "post",
		
		//contentType : "application/json",
		//data : JSON.stringify(paperItemList),
		
		dataType : "json",
		success : function(itemList){
			console.log(itemList);
			for(var i=0; i<itemList.length; i++){
				itemRender(itemList[i])
				console.log(itemList[i]);
			}
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
	
}


//아이템 그리기
function itemRender(itemVo){
	
	if(itemVo.stickerNo == 9999999){ //텍스트 이면
		var text = new fabric.Textbox(itemVo.text);
	
		//좌표
		text.top = itemVo.top;
		text.left = itemVo.left;
		
		//스케일
		text.scaleX = itemVo.scaleX;
		text.scaleY = itemVo.scaleY;
		
		//각도
		text.angle = itemVo.angle;
		
		//변경안되게
		text.selectable = false;
		
		//커서모양기본
		text.hoverCursor ="default";
		
		//캔버스에 추가
		canvas.add(text);
	
	}else { //스티커일때
		fabric.Image.fromURL(itemVo.stickerPath, function(oImg) {
			//좌표
			oImg.top = itemVo.top;
			oImg.left = itemVo.left;
			
			//스케일
			oImg.scaleX = itemVo.scaleX;
			oImg.scaleY = itemVo.scaleY;
			
			//각도
			oImg.angle = itemVo.angle;
			
			//변경안되게
			oImg.selectable = false;
			
			//커서모양기본
			oImg.hoverCursor ="default";
			
			//캔버스에 추가
			canvas.add(oImg);
		});
	}
	
	
}



</script>
</html>