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
                            	<input type="submit" class="button writeform-save" id="btnSave" value="편지 보내기">
                            </div>
                           
                        </div>
                        
                        <!--내용-->
          
                        <div id="letter-content">
                            <canvas id="paper"></canvas>                                                          
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
                                <input type="submit" name="textbox" data-stickerno="9999999" class="button writeform-deco-btn" value="텍스트">
                            </div>
                        </div>

                        <!--스티커/bgm-->
                        <div class="menu-box">
 
                            <ul class="tabs">
								<div>
									<li class="tab-link current" data-tab="tab-1">스티커</li>
								</div>
								<div>
                                	<li class="tab-link" data-tab="tab-2">편지지</li>
                              	</div>
                              
                              	<div>
                                	<li class="tab-link" data-tab="tab-3">bgm</li>
                              	</div>
                            </ul>
                           
                            <div id="tab-1" class="tab-content current content-box">
                 
                             	
                             	<c:forEach items="${stickerList}" var="stickVo">
									<div>
										<img  class="sticker" data-stickerno="${stickVo.stickerNo}" data-stickerpath="${stickVo.stickerSrc}" src="${stickVo.stickerSrc}">
									</div>
								</c:forEach>
                            </div>

                            <div id="tab-2" class="tab-content content-box">
                                <div>
                                	 <img src="${pageContext.request.contextPath}/assets/img/letter1.jpg">
                                	 <img src="${pageContext.request.contextPath}/assets/img/letter2.jpg">
                                	 <img src="${pageContext.request.contextPath}/assets/img/letter3.jpg">
                                	 <img src="${pageContext.request.contextPath}/assets/img/letter4.jpg">
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

//탭 메뉴
$(document).ready(function(){
   
   $('ul.tabs li').click(function(){
     var tab_id = $(this).attr('data-tab');
  
     $('ul.tabs li').removeClass('current');
     $('.tab-content').removeClass('current');
  
     $(this).addClass('current');
     $("#"+tab_id).addClass('current');
   })
  
 })
 
//캔버스 초기화 설정
var canvas = new fabric.Canvas("paper", {
	 width: 695,
	 height: 700,
	 backgroundColor: '#686099'
}); 

//텍스트 상자를 클릭했을때
$("[name=textbox]").on("click", function(){
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
$(".sticker").on("click", function(){
	var stickerNo= $(this).data("stickerno")
	var stickerSrc = $(this).data("stickerpath")
	
	console.log(stickerNo);
	console.log(stickerSrc);
	
	fabric.Image.fromURL(stickerSrc, function(oImg) {
		//이미지 크기를 1/4로 줄여서 보여줌
		oImg.scale(1/4)

		//객체에 스티커번호 추가
		oImg.stickerNo = stickerNo;
		canvas.add(oImg);
		
		console.log(oImg);
	});
})



//delete(삭제)
$("body").on("keyup",function(){
	if ( event.keyCode == 46 || event.which == 46 ) {
		
		//현재 선택된(활성화된)) 객체를 가져온다.
		var activeObject = canvas.getActiveObject()
		
		//객체를 삭제한다.
		canvas.remove(activeObject);
	}
})


//편지 보내기 버튼을 눌렀을 때
$("#btnSave").on("click", function(){
	console.log("저장클릭");
	
	var element = document.getElementById("openDay");
	var openDay = element.innerText;
	var saveYN = "YES";
	
	console.log(openDay);
	
	/*글쓰기폼 입력 경고창*/
	if(openDay == null || openDay == '' || openDay.trim() == ''){
		alert('공개일을 선택해주세요');
		return;
	}
	
	var letterVo = {
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
		
		letterItemVo.text = canvasObjList[i].text;
		
		letterItemList.push(letterItemVo);
	}

	letterVo.itemList = letterItemList
	
	writeLetter(letterVo);
	
})

//임시 저장 버튼을 눌렀을 때
$("#btnKeep").on("click", function(){
	console.log("저장클릭");
	
	var element = document.getElementById("openDay");
	var openDay = element.innerText;
	var saveYN = "NO";
	
	/*글쓰기폼 입력 경고창*/
	if(openDay == null || openDay == '' || openDay.trim() == ''){
		alert('공개일을 선택해주세요');
		return;
	}
	
	var letterVo = {
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
		
		letterItemVo.text = canvasObjList[i].text;
		
		letterItemList.push(letterItemVo);
	}

	letterVo.itemList = letterItemList
	
	writeLetter(letterVo);
	
})

//저장 함수
function writeLetter(letterVo){
   console.log(letterVo);

   
   $.ajax({
      url : "${pageContext.request.contextPath}/letter/write",
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