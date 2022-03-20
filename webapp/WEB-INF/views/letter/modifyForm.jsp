<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/letter2.css">


<script src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/fabric.js"></script>
</head>
<body>
    <div id="wrap">
        <div class="container">
            <div class="row">

	            <!-- header -->
	            <c:import url="/WEB-INF/views/include/header.jsp"></c:import>                          

                <div class="letterwriteForm-write-region clearfix">
                    <div class="letterwriteForm-left">
                        <div class="letterwriteForm-da-we clearfix">
							
							<div class="letter-openday" style="margin-left: 22px;">공개일:</div>
							<select name="Dday" id="openday-select">
								<option value="none">-- 공개일 선택 --</option>
								<option value="month">한 달 뒤</option>
								<option value="halfYear">반년 뒤</option>
								<option value="year">1년 뒤</option>
							</select>
							
							<div id="openDay">
								
							</div>
							
							<div class="writeform-top-button"> 
								<a></a>
                            	<input type="submit" class="button writeform-save" id="btnSave" value="편지 보내기">
                            </div>
                           
                        </div>
                        
                        <!--내용-->
          
          
          
                        <div id="letter-content">
                            <canvas style="margin-left:12px; margin-top:14px;" id="paper"></canvas>                                                          
                        </div>
                        
                        
                        
                        
                        
                        <div>
                            <div class="writeform-button">
                                <a class="writeform-modify" id="btnKeep">임시 저장</a>
                                <a class="writeform-modify" href="${pageContext.request.contextPath}/letter">취소</a>
                            </div>

                         
                        </div>
                        
                    </div>                                                    

                    <div class="letterwriteForm-right">
                    	
                        <div class="clearfix">
                            <form method="post" enctype="multipart/form-data">
                                <div class="button writeform-btn-left writeform-deco-btn">
                                    <label for="chooseFile">
                                    	<div class="photowid">사진</div>
                                    </label>
                            
                                    <input type="file" id="chooseFile" name="chooseFile" accept="image/*" onchange="loadFile(this)">
                                </div>
                            </form>
                            <div class="writeform-btn-right">
                                <input type="submit" name="textbox" data-stickerno="0" data-stickersrc="n" class="button writeform-deco-btn" value="텍스트">
                            </div>
                        </div>

                        <!--스티커/bgm-->
                        <div class="menu-box">
 
                            <ul class="tabs">
								
									<li class="tab-link current" data-tab="tab-1">스티커</li>
										
                                	<li class="tab-link" data-tab="tab-2">편지지</li>
                                 
                                	<li class="tab-link" data-tab="tab-3">bgm</li>
                              
                            </ul>
                           
                            <div id="tab-1" class="tab-content current content-box">
                 
                             	
                             	<c:forEach items="${stickerMap.stickerList}" var="stickVo">
									<div>
										<img  class="sticker" data-stickerno="${stickVo.stickerNo}" data-stickersrc="${stickVo.stickerSrc}" src="${stickVo.stickerSrc}">
									</div>
								</c:forEach>
								
                            </div>

                            <div id="tab-2" class="tab-content content-box">
                               <div class="clearfix">
                                		<c:forEach items="${stickerMap.paperList}" var="paperVo">
	                                		<div class="">
		                                    	<img class="paper" data-paperno="${paperVo.stickerNo}" data-papersrc="${paperVo.stickerSrc}" src="${paperVo.stickerSrc}">
	                                		</div>
                                		</c:forEach>
                                	</div>
                            </div>

                            
                            <div id="tab-3" class="tab-content">
                                <div class="letter-writeForm-bgmList">
                                    INVU 태연 (TAEYEON)
                                </div>
                                <div class="letter-writeForm-bgmList">
                                    사랑은 늘 도망가 임영웅 
                                </div>
                                <div class="letter-writeForm-bgmList">
                                    INVU 태연 (TAEYEON)
                                </div>
                                <div class="letter-writeForm-bgmList">
                                    INVU 태연 (TAEYEON)
                                </div>
                                <div class="letter-writeForm-bgmList">
                                    ELEVEN IVE (아이브)ELEVEN
                                </div>
                                <div class="letter-writeForm-bgmList">
                                    INVU 태연 (TAEYEON)
                                </div>
                            </div>
                           
                        </div>

                    </div>
                </div>
    
  
            </div>
        </div>    
    </div>

    
</body>

<script type="text/javascript">



//로딩 되기 전 요청

//탭 메뉴
$(document).ready(function(){
   
	//탭메뉴 관련
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');
		
		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');
		
		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})
	
	
	//편지 불러오기
	showLetter();
	console.log("편지 가져오기");
	
  
 })
 
//캔버스 초기화 설정
var canvas = new fabric.Canvas("paper", {
	 width: 680,
	 height: 690,
	 backgroundColor: '#686099'
}); 


//편지 보기 함수
function showLetter(){

	//클릭한 편지의 편지 번호
	var letterNo = ${param.letterNo};
	
	/*키:값*/
	var lettervo = {letterNo : letterNo};
	console.log(lettervo);
	
	$.ajax({
	    url : "${pageContext.request.contextPath}/letter/read",
	    type : "post",
	    contentType : "application/json",
	    data : JSON.stringify(lettervo),//데이터 보내기
	    dataType : "json",
	    success : function(letterVo) {
		    
		    var letterItemList = letterVo.itemList;
		    
		    for(var i=0; i<letterItemList.length; i++){
				itemRender(letterItemList[i]);
			}
		    
	    },
	    error : function(XHR, status, error) {
	       console.error(status + " : " + error);
	    }
	 });


}

//아이템 그리기
function itemRender(letterItemVo){
	console.log(letterItemVo);
	console.log("===============================");
	if(letterItemVo.stickerCateNo == 0){ //텍스트 이면
		
		
		var text = new fabric.Textbox(letterItemVo.text);

		//기본 폰트 크기
		text.fontSize = 16;
		
		//좌표
		text.top = letterItemVo.top;
		text.left = letterItemVo.left;
		
		//스케일
		text.scaleX = letterItemVo.letterPointX;
		text.scaleY = letterItemVo.letterPointY;
		
		//각도
		text.angle = letterItemVo.angle;
		
		//이미 갖고 있던 스티커 이미지 번호, 경로 추가
		text.stickerNo = letterItemVo.stickerNo;
		text.stickerSrc = letterItemVo.stickerSrc;
		
		//변경
		text.selectable = true;
		
		//커서모양기본
		text.hoverCursor ="default";
		
		//캔버스에 추가
		canvas.add(text);
		
		console.log(text);
		console.log("===============================");
	
	}else if(letterItemVo.stickerCateNo == 1) { // 배경--캔버스 새로 만들듯 배경도 사용된 스티커 경로만 갖고와서 다시 그려주기
		fabric.Image.fromURL(letterItemVo.stickerSrc, function(backImg) {

			//기존 스티커 경로, 번호 추가
			paperNo = letterItemVo.stickerNo;
			paperSrc = letterItemVo.stickerSrc;
			
			backImg.stickerNo = paperNo;
			backImg.stickerSrc = paperSrc;
			
			canvas.setBackgroundImage(backImg, canvas.renderAll.bind(canvas),{
				letterPointX: canvas.width / backImg.width,
				letterPointY: canvas.height / backImg.height
			});
			
			console.log("=====================================");
			console.log(backImg);
		});
		
		
	}else {  //스티커- stickerCateNo == 2
		fabric.Image.fromURL(letterItemVo.stickerSrc, function(oImg) {
			//좌표
			oImg.top = letterItemVo.top;
			oImg.left = letterItemVo.left;
			
			//스케일
			oImg.scaleX = letterItemVo.letterPointX;
			oImg.scaleY = letterItemVo.letterPointY;
			
			//각도
			oImg.angle = letterItemVo.angle;
			
			//변경안되게
			oImg.selectable = true;
			
			//커서모양기본
			oImg.hoverCursor ="default";
			
			oImg.stickerNo = letterItemVo.stickerNo;
			oImg.stickerSrc = letterItemVo.stickerSrc;
			
			//캔버스에 추가
			canvas.add(oImg);
			
			console.log("이 밑은 그려진 스티커 목록입니다");
			console.log(oImg);
		});
	}
	
	
}//아이템 그리기


//텍스트 상자를 클릭했을때
$("[name=textbox]").on("click", function(){
	var stickerNo= $(this).data("stickerno");
	
	var text = new fabric.Textbox("텍스트를 입력하세요", {
		stickerNo: stickerNo,
		top: 20,
		left: 20,
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
$(".sticker").on("click", function(){
	var stickerNo= $(this).data("stickerno")
	var stickerSrc = $(this).data("stickersrc")
	
	console.log(stickerNo);
	console.log(stickerSrc);
	
	fabric.Image.fromURL(stickerSrc, function(oImg) {
		//이미지 크기를 1/4로 줄여서 보여줌
		oImg.scale(1/4)

		//객체에 스티커번호 추가
		oImg.stickerNo = stickerNo;
		oImg.stickerSrc = stickerSrc;
		canvas.add(oImg);
		console.log(oImg);
	});
})

//종이를 클릭했을때
var paperNo ;//전역변수
var paperSrc ;
$(".paper").on("click", function(){
	paperNo = $(this).data("paperno");
	paperSrc = $(this).data("papersrc");
	
	console.log(paperNo);
	console.log(paperSrc);
	
	fabric.Image.fromURL(paperSrc, function(backImg) {

		//객체에 종이번호 추가
		backImg.stickerNo = paperNo;
		backImg.stickerSrc = paperSrc;
		
		canvas.setBackgroundImage(backImg, canvas.renderAll.bind(canvas),{
			letterPointX: canvas.width / backImg.width,
			letterPointY: canvas.height / backImg.height
		});
		
		console.log("=====================================");
		console.log(backImg);
	});
	
});

//delete(삭제)
$("body").on("keyup",function(){
	if ( event.keyCode == 46 || event.which == 46 ) {
		
		//현재 선택된(활성화된)) 객체를 가져온다.
		var activeObject = canvas.getActiveObject()
		
		//객체를 삭제한다.
		canvas.remove(activeObject);
	}
});



//편지 보내기 버튼을 눌렀을 때
$("#btnSave").on("click", function(){
	console.log("저장클릭");
	
	//클릭한 편지의 편지 번호
	var letterNo = ${param.letterNo};
	var openDay = $("#openDay").text();
	var saveYN = "YES";
	
	console.log(openDay);
	console.log(letterNo);
	
	/*글쓰기폼 입력 경고창*/
	if(openDay == null || openDay == '' || openDay.trim() == ''){
		alert('공개일을 선택해주세요');
		return;
	}
	
	var letterVo = {
			letterNo: letterNo,
			openDay: openDay,
			saveYN: saveYN
	};
	
	//캔버스에 있는 전체 객체를 배열로 가져온다
	var canvasObjList = canvas.getObjects();
	

	//서버로 전송할 객체들 배열
	var letterItemList = [];
	
	
	for(var i=0; i<canvasObjList.length; i++){
		var letterItemVo = {};
		letterItemVo.top = canvasObjList[i].top;
		letterItemVo.left = canvasObjList[i].left;
		letterItemVo.letterPointX = canvasObjList[i].scaleX;
		letterItemVo.letterPointY = canvasObjList[i].scaleY;
		letterItemVo.angle = canvasObjList[i].angle;
		
		letterItemVo.stickerNo = canvasObjList[i].stickerNo;
		letterItemVo.stickerSrc = canvasObjList[i].stickerSrc;
		
		letterItemVo.text = canvasObjList[i].text;
		
		letterItemList.push(letterItemVo);
	}

	if((paperNo == null) || (paperNo == undefined) || (paperNo == "")){
		
		letterVo.itemList = letterItemList;
		writeLetter(letterVo);	
		
	}else {
		
		//페이퍼 추가
		var letterItemVo = {};
		letterItemVo.stickerNo = paperNo;
		letterItemVo.stickerSrc = paperSrc;
		letterItemList.push(letterItemVo);//배열에 추가
		
		letterVo.itemList = letterItemList;
		
		writeLetter(letterVo);	
	};
	
})

//임시 저장 버튼을 눌렀을 때
$("#btnKeep").on("click", function(){
	console.log("저장클릭");
	
	//클릭한 편지의 편지 번호
	var letterNo = ${param.letterNo};
	var element = document.getElementById("openDay");
	var openDay = element.innerText;
	var saveYN = "NO";
	
	console.log(letterNo);
	console.log(openDay);
	
	var letterVo = {
			letterNo: letterNo,
			openDay: openDay,
			saveYN: saveYN
	};
	
	//캔버스에 있는 전체 객체를 배열로 가져온다
	var canvasObjList = canvas.getObjects();
	

	//서버로 전송할 객체들 배열
	var letterItemList = [];
	
	
	for(var i=0; i<canvasObjList.length; i++){
		var letterItemVo = {};
		letterItemVo.top = canvasObjList[i].top;
		letterItemVo.left = canvasObjList[i].left;
		letterItemVo.letterPointX = canvasObjList[i].scaleX;
		letterItemVo.letterPointY = canvasObjList[i].scaleY;
		letterItemVo.angle = canvasObjList[i].angle;
		
		letterItemVo.stickerNo = canvasObjList[i].stickerNo;
		letterItemVo.stickerSrc = canvasObjList[i].stickerSrc;
		
		letterItemVo.text = canvasObjList[i].text;
		
		letterItemList.push(letterItemVo);
	}

	if((paperNo == null) || (paperNo == undefined) || (paperNo == "")){
		
		letterVo.itemList = letterItemList;
		writeLetter(letterVo);	
		
	}else {
		
		//페이퍼 추가
		var letterItemVo = {};
		letterItemVo.stickerNo = paperNo;
		letterItemVo.stickerSrc = paperSrc;
		letterItemList.push(letterItemVo);//배열에 추가
		
		letterVo.itemList = letterItemList;
		
		writeLetter(letterVo);	
	};
});




//저장 함수
function writeLetter(letterVo){

	console.log(letterVo);
   
   $.ajax({
      url : "${pageContext.request.contextPath}/letter/modify",
      type : "post",
      contentType : "application/json",
      data : JSON.stringify(letterVo),
      dataType : "json",
      success : function() {
         
 
    	location.href="${pageContext.request.contextPath}/letter";
    	
    	  
      },
      error : function(XHR, status, error) {
         console.error(status + " : " + error);
      }
   });
   
}







//공개일 선택했을때 : change --> 값이 바뀔 때마다 갱신
$("#openday-select").on("change", function(){
	console.log("날짜선택");
	
	//오늘 날짜 구하기
	var day = new Date();   
	var year = day.getFullYear(); // 년도
	var month = day.getMonth() + 1;  // 월 : 0부터 시작하기 때문에 +1
	var date = day.getDate();  // 날짜
	
	var today = year + "-" + month + "-" + date;
	console.log(today);
	
	var plusDay = $("select[name=Dday]").val();
	
	//var openDay = new Date(day);
	//openDay.setMonth(day.getMonth() + 1);
	
	if(plusDay === "month"){
		month = month + 1;
		var openDay = year + "-" + month + "-" + date;
		document.getElementById("openDay").innerHTML= openDay;
	}else if(plusDay === "halfYear"){
		month = month + 6;
		var openDay = year + "-" + month + "-" + date;
		document.getElementById("openDay").innerHTML= openDay;
	}else if(plusDay === "year"){
		year = year + 1;
		var openDay = year + "-" + month + "-" + date;
		document.getElementById("openDay").innerHTML= openDay;
	}else {
		//document.getElementById("openDay").innerHTML= "편지 공개일을 선택해주세요.";
	}
	
	console.log(openDay);
	//document.getElementById("openDay").innerHTML= openDay + " 에 편지가 도착할 예정입니다.";
	
});


</script>
</html>