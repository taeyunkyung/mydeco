<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MydiaryList</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/jquery-ui-1.13.1/jquery-ui.css">	
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mydiaryList.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mydiaryList_modal.css">

	
	
	    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
	    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/jquery-ui-1.13.1/jquery-ui.js"></script>
	 	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/fabric.js"></script>
	 
	    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/html2canvas.js"></script>
	    <script src="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/js/bootstrap.min.js"></script>
	   
	   <!-- css에 넣으면 안먹음 -->
	   <style>
	   	.ui-datepicker{
	   		width: 700px !important;
	   		height: 300px !important;
	   	 }
	
		.writedDay {
			background-color: #7030A0;
		}
	   
	   </style>
	   
</head>
<body>
	 <div id="wrap" style="margin-left:17px;">
        <div class="container">
            <div class="row">

                <!-- header -->
				<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
    
               	<!-- aside -->
				<c:import url="/WEB-INF/views/include/mydiaryaside.jsp"></c:import>
                
    
                <!--컨텐츠 영역-->
                <div class="col-xs-9" id="main-content" style="margin-left:-15px; margin-top:15px;">
                    <div id="div-sub">
                        <h3 class="subtitle">
                        나의 일기 목록
                        </h3>
                    </div>
                    
                        
                    <div class="ct-list col-xs-9">

                        <!--달력-->
                        <div class="cal_nav5">
                          <div id="datepicker"></div>
                        </div>


                        <!--검색창/수정/삭제/정렬-->
                        <div class="li_nav clearfix">
                            <div class="searchfor5">

                                <input type="text" class="search_new" name="" value="" placeholder="검색어를 입력해주세요">
                                <button class="btn-search">
                                    <img id="btnImg" class="glass_new" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
                                </button>
                            </div>

                            <!--선택박스-->
                            <div class="selectbox sel-diary">
                                <form>
                                    <select name="option" class="selectbox-small" style="text-align:center;">
                                        <option value="none">ㅡㅡ 선택 ㅡㅡ</option>
                                        <option value="recently" selected>최신순</option>
                                        <option value="old">오래된순</option>
                                    </select>
                                </form>    
                            </div>
						
							<c:if test="${!empty authUser}">  
								<a class="button btn-diarylist" href="${pageContext.request.contextPath}/diary/writeForm">일기 쓰기</a>
							</c:if>
                        
                        </div>

                        <!--중간선-->
                        <div class="sectionLine"></div>

                        <!--일기리스트-->
                        <div class="mydiarydiv4">                       

                            <!--목록/사진 하나분량의 박스-일기 하나의  div-->
                            <c:forEach items="${diarycontentList}" var="dcvo">
	                            <div class="clearfix mydiary-list-box2" data-diaryno="${dcvo.diaryNo}" data-title="${dcvo.title}" style=" border-bottom: 1px solid #686099;">
	                                <div class="mydiaryText-list2">
	                                    <div class="mydiaryText7 clearfix">
	                                        <div class="mydiary-Date">Date:</div>
	                                        <div class="mydiary-Date" data-diarydate="${dcvo.diaryDate}">${dcvo.diaryDate}</div>
	                                        
			                                <c:choose>
			                                	<c:when test="${dcvo.weather eq 'sunny'}">
			                                	 	<div><img id="se_weather_img" class="mydiary-weather2" src="${pageContext.request.contextPath}/assets/img/weather/sunny-day.png"></div>	
			                                	</c:when>
			                                	<c:when test="${dcvo.weather eq 'rainy'}">
			                                		<div><img id="se_weather_img" class="mydiary-weather2" src="${pageContext.request.contextPath}/assets/img/weather/rainy.png"></div>
			                                	</c:when>
			                                	<c:otherwise><div><img id="se_weather_img" class="mydiary-weather2" src="${pageContext.request.contextPath}/assets/img/weather/snowflake.png"></div></c:otherwise>
			                                </c:choose>
	                                    </div>
	
	                                    <div class="mydiaryText7 mydiary-content" data-title="${dcvo.title}">${dcvo.title}</div>
	                                    <div class="opensetting" data-protect="${dcvo.protect}">
	                                        ${dcvo.protect}
	                                    </div>
	                                </div>
	                            </div>
                            </c:forEach>
                            
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

     <!--목록 해당일기 클릭시 해당일기 읽기 모달창의 내용-->
	     <div id="diaryModal" class="modal fade">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" id="closebtn" class="close" data-dismiss="modal" aria-label="Close" style="font-size:30px;"><span aria-hidden="true">&times;</span></button>
		        <div class="clearfix">
			        <div style="float: right;">
	                   <img class="saveImgbtn" style="margin-right:11px; width: 19px; height: 19px; margin-top:3px; cursor:pointer;" src="${pageContext.request.contextPath}/assets/img/icon/save.png" onclick="downImg();">
	                </div>
			        <div class="audiodiv" style="float:left; margin-right:15px; margin-top:3px;">
			        	<audio id="audio" src="" controls autoplay loop style="height:20px; width:300px; margin-left:38px;"></audio>
			        </div>	
		        </div>
		       
		        
		        <div class="clearfix" style="margin-top:28px;">
			        <div style="float:left; margin-left:41px;"><h4 class="modal-title" id="modalDiaryTitle" style="font-size:19px; font-weight:900"></h4></div>
			        <div class="readcontent clearfix" style="float:right; width:176px; margin-right:40px; margin-top:7px;" >
			        	<div style="float:left; font-family:'SCDream4'; width:84px;"id="modalDiaryDate"></div>
			        	<div style="float:left; font-family:'SCDream4'; width:50px; text-align:center;"id="modalDiaryWeather"></div>
			        	<div style="float:left; font-family:'SCDream4'; width:42px; text-align:center;"id="modalDiaryProtect"></div>
			        </div>
		        </div>
		      </div>
		      <div class="modal-body">
		      
		      <canvas class="readCanvas" id="paper"></canvas>
		      	
		      </div>
		      <div class="modal-footer">
		      	<form id="modifyForm" action="${pageContext.request.contextPath}/diary/modifyForm" method="get" style="float:left; margin-left:240px; ">
		      		<button type="button" id="modalModifyBtn" class="modal-button-read">수정하기</button>
		      		<input type="hidden" name="modaldiaryNo" value="">
		      	</form>
		      
		      	<button type="button" id="modalBtnDel" class="modal-button-read" style="margin-left:-220px;">삭제하기</button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
     
     <!--부트스트랩취소버튼 <button type="button" class="btn btn-default" data-dismiss="modal">취소</button> -->
	<!-- footer -->
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

</body>


<script type="text/javascript">

//캔버스 초기화 설정
var canvas = new fabric.Canvas("paper", {
	 width: 680,
	 height: 510,
	 //backgroundColor: 'rgb(100,150,134)'
	 backgroundColor: '#dbd3c7'
});
console.log(canvas);

//제목으로 이미지 저장하기 위해 선언
var title;

//수정하기 일기번호 보내기 위해 선언
var diaryNo;

/*하나의 일기 div 클릭했을 때 모달창 보이기*/
$(".mydiary-list-box2").on("click",function(){
	
	//캔버스 초기화(이전에 보여졌던 일기 지우기--일기겹치는 현상 없애기);
	modalCanvasInit();
	
	//$(".audiodiv").html('<audio id="audio" src="" controls autoplay style="height:20px; width:300px; margin-left:38px;"></audio>');
	
	/*클릭한 일기의 일기번호*/
	diaryNo = $(this).data("diaryno");
	console.log(diaryNo);

	title = $(this).data("title");
	
	/*키:값*/
	var diarycontentvo = {diaryNo: diaryNo};
	console.log(diarycontentvo);
	
	$.ajax({
	    url : "${pageContext.request.contextPath}/diary/read",
	    type : "post",
	    contentType : "application/json",
	    data : JSON.stringify(diarycontentvo),//데이터 보내기
	    dataType : "json",
	    success : function(DiaryContent) {
	    	
		    console.log(DiaryContent);
		    console.log(DiaryContent.itemList); //DiaryContentVo의 필드값 이름으로 값 빼내기 가능
		    
		    //제목쓰기
		    $("#modalDiaryTitle").text(DiaryContent.title);
		    $("#modalDiaryDate").text(DiaryContent.diaryDate);
		    $("#modalDiaryWeather").text(DiaryContent.weather);
		    $("#modalDiaryProtect").text(DiaryContent.protect);
		    $("#audio").attr("src",DiaryContent.diaryBgmSrc);
		    
		    var DiaryItemList = DiaryContent.itemList;
		    
		    for(var i=0; i<DiaryItemList.length; i++){
				itemRender(DiaryItemList[i])
				console.log(DiaryItemList[i]);
			}
	    
	    },
	    error : function(XHR, status, error) {
	       console.error(status + " : " + error);
	    }
	 });
	
	
	/*모달창 보이기*/
	$("#diaryModal").modal('show');
	
});



/*일기보기 모달창 초기화*/
function modalCanvasInit(){
	
	canvas.clear();
	canvas.width = 680;
	canvas.height = 510;
	canvas.backgroundColor = '#dbd3c7';
	//$("audio").remove();
}	


/*220316추가*/
//아이템 그리기
function itemRender(diaryitemVo){
	
	if(diaryitemVo.stickerCateNo == 0){ //텍스트 이면
		var text = new fabric.Textbox(diaryitemVo.text);

		//기본 폰트 크기
		text.fontSize = 18;
		
		//폰트
		text.fontFamily = 'SCDream4';
		
		//좌표
		text.top = diaryitemVo.top;
		text.left = diaryitemVo.left;
		
		//스케일
		text.scaleX = diaryitemVo.scaleX;
		text.scaleY = diaryitemVo.scaleY;
		
		//각도
		text.angle = diaryitemVo.angle;

		//변경안되게
		text.selectable = false;
		
		//커서모양기본
		text.hoverCursor ="default";
		
		//캔버스에 추가
		canvas.add(text);
	
	}else if(diaryitemVo.stickerCateNo == 1) { // 배경--캔버스 새로 만들듯 배경도 사용된 스티커 경로만 갖고와서 다시 그려주기
		fabric.Image.fromURL(diaryitemVo.stickerSrc, function(backImg) {

			canvas.setBackgroundImage(backImg, canvas.renderAll.bind(canvas),{
				scaleX: canvas.width / backImg.width,
				scaleY: canvas.height / backImg.height
			});
			
			console.log("=====================================");
			console.log(backImg);
		});
		
		
	}else {  //스티커- stickerCateNo == 2
		fabric.Image.fromURL(diaryitemVo.stickerSrc, function(oImg) {
			//좌표
			oImg.top = diaryitemVo.top;
			oImg.left = diaryitemVo.left;
			
			//스케일
			oImg.scaleX = diaryitemVo.scaleX;
			oImg.scaleY = diaryitemVo.scaleY;
			
			//각도
			oImg.angle = diaryitemVo.angle;
			
			//변경안되게
			oImg.selectable = false;
			
			//커서모양기본
			oImg.hoverCursor ="default";
			
			//캔버스에 추가
			canvas.add(oImg);
		});
	}
	
}


/*수정하기 버튼을 클릭했을 때*/

$("#modalModifyBtn").on("click",function(){
	$("[name='modaldiaryNo']").val(diaryNo);
	console.log(diaryNo);
	
	$("#modifyForm").submit();
});



/*삭제하기 버튼을 클릭했을 때*/

$("#modalBtnDel").on("click",function(){
	
	console.log(diaryNo);
	/*상품페이지에 등록한 일기일경우엔 이런 경고창이 떠야함-->diaryprodNo값이 존재하면..*/
	/*해당일기를 추가한 상품의 개수, 상품번호 ProdDiaryVo에 담아오기*/
		$.ajax({
		    url : "${pageContext.request.contextPath}/diary/getProdNo",
		    type : "post",
		    /* contentType : "application/json", */
		    data : {diaryNo: diaryNo},//데이터 보내기-파라미터로받기
		    dataType : "json",
		    success : function(prodDiaryVo) {
		    	console.log(prodDiaryVo);
		    	console.log("=======prodDIaryVo수정=====")
		    	
		    	var count = prodDiaryVo.count;
		    	console.log(count);
		    	
		    	if(count > 0){
		    		
		    		if(confirm(count+'개의 상품에 등록된 일기입니다. 상품페이지에 등록된 일기 정보가 함께 삭제됩니다. 일기를 삭제하시겠습니까?')==true){
		    			console.log("확인클릭");
		    			
		    			var diaryContentVo = {diaryNo: diaryNo};
		    			console.log(diaryContentVo);
		    			
		    			$.ajax({
		    			    url : "${pageContext.request.contextPath}/diary/deleteForm",
		    			    type : "post",
		    			    contentType : "application/json",
		    			    data : JSON.stringify(diaryContentVo),//데이터 보내기
		    			    dataType : "json",
		    			    success : function(result) {
		    					
		    			    	if(result == 2){
		    			    		location.href="${pageContext.request.contextPath}/diary/list"
		    			    	}else{
		    			    		alert('일기 삭제에 실패했습니다.');
		    			    	}
		    				    
		    			    },
		    			    error : function(XHR, status, error) {
		    			       console.error(status + " : " + error);
		    			    }
		    			 });
		    			
		    		}else{
		    			console.log("취소클릭");
		    			return;
		    		}
		    		
		    		
		    	}else{ //count <= 0이면
		    		
		    		if(confirm('일기를 삭제하시겠습니까?')==true){
		    			console.log("확인클릭");
		    			
		    			var diaryContentVo = {diaryNo: diaryNo};
		    			console.log(diaryContentVo);
		    			
		    			$.ajax({
		    			    url : "${pageContext.request.contextPath}/diary/deleteForm",
		    			    type : "post",
		    			    contentType : "application/json",
		    			    data : JSON.stringify(diaryContentVo),//데이터 보내기
		    			    dataType : "json",
		    			    success : function(result) {
		    					
		    			    	if(result == 2){
		    			    		location.href="${pageContext.request.contextPath}/diary/list"
		    			    	}else{
		    			    		alert('일기 삭제에 실패했습니다.');
		    			    	}
		    				    
		    			    },
		    			    error : function(XHR, status, error) {
		    			       console.error(status + " : " + error);
		    			    }
		    			 });
		    			
		    		}else{
		    			console.log("취소클릭");
		    			return;
		    		}
		    		
		    	}
			    
		    },
		    error : function(XHR, status, error) {
		       console.error(status + " : " + error);
		    }
		 });
	
	
			
		/* $.ajax({
		    url : "${pageContext.request.contextPath}/diary/getProdNo",
		    type : "post",
		    /* contentType : "application/json", */
		    /*
		    data : {diaryNo: diaryNo},//데이터 보내기-파라미터로받기
		    dataType : "json",
		    success : function(prodDiaryList) {
		    	console.log(prodDiaryList);
		    	console.log("=======prodDIaryVo수정=====")
		    	
		    	var count = prodDiaryList.count;
		    	console.log(count);
		    	
		    	var sum = 0;
		    	for(var i=0; i<prodDiaryList.length; i++){
		    		console.log(count[i] = prodDiaryList[i].count);
		    		
		    		count[i] = prodDiaryList[i].count;
		    		count = count[i];
		    		sum = sum + count;
		    	}
		    	
		    	if(sum > 0){
		    		
		    		if(confirm(sum+'개의 상품에 등록된 일기입니다. 상품페이지에 등록된 일기 정보가 함께 삭제됩니다. 일기를 삭제하시겠습니까?')==true){
		    			console.log("확인클릭");
		    			
		    			var diaryContentVo = {diaryNo: diaryNo};
		    			console.log(diaryContentVo);
		    			
		    			$.ajax({
		    			    url : "${pageContext.request.contextPath}/diary/deleteForm",
		    			    type : "post",
		    			    contentType : "application/json",
		    			    data : JSON.stringify(diaryContentVo),//데이터 보내기
		    			    dataType : "json",
		    			    success : function(result) {
		    					
		    			    	if(result == 2){
		    			    		location.href="${pageContext.request.contextPath}/diary/list"
		    			    	}else{
		    			    		alert('일기 삭제에 실패했습니다.');
		    			    	}
		    				    
		    			    },
		    			    error : function(XHR, status, error) {
		    			       console.error(status + " : " + error);
		    			    }
		    			 });
		    			
		    		}else{
		    			console.log("취소클릭");
		    			return;
		    		}
		    		
		    		
		    	}else{ //sum <= 0이면
		    		
		    		if(confirm('일기를 삭제하시겠습니까?')==true){
		    			console.log("확인클릭");
		    			
		    			var diaryContentVo = {diaryNo: diaryNo};
		    			console.log(diaryContentVo);
		    			
		    			$.ajax({
		    			    url : "${pageContext.request.contextPath}/diary/deleteForm",
		    			    type : "post",
		    			    contentType : "application/json",
		    			    data : JSON.stringify(diaryContentVo),//데이터 보내기
		    			    dataType : "json",
		    			    success : function(result) {
		    					
		    			    	if(result == 2){
		    			    		location.href="${pageContext.request.contextPath}/diary/list"
		    			    	}else{
		    			    		alert('일기 삭제에 실패했습니다.');
		    			    	}
		    				    
		    			    },
		    			    error : function(XHR, status, error) {
		    			       console.error(status + " : " + error);
		    			    }
		    			 });
		    			
		    		}else{
		    			console.log("취소클릭");
		    			return;
		    		}
		    		
		    	}
			    
		    },
		    error : function(XHR, status, error) {
		       console.error(status + " : " + error);
		    }
		 }); */
		
	
	
	
});



//////////////////////////////////////////////////////////
//달력 관련 ///
$( "#datepicker" ).datepicker({
	
	currentText: "오늘", 
	prevText: '이전 달', 
	nextText: '다음 달', 
	monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
	dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	weekHeader: "주", 
	yearSuffix: '년',
    showMonthAfterYear: true,
    numberOfMonths: 2,
    /* showCurrentAtPos: 2, */
    dateFormat: "yy-mm-dd",
   	beforeShowDay: function(date){ //일기쓴날만 달력 활성화
   		return renderWriteDay(date);
   	},
	onSelect:function(selectdate, evnt) {
		console.log(selectdate);
		console.log("====datepicker");
		//var diaryDate = {diaryDate: selectdate}
		//console.log(diaryDate);
		
		
		window.location.href = '${pageContext.request.contextPath }/diary/list?diaryDate='+selectdate;
		
		
	}
});

function renderWriteDay(date) {
	// 새롭게 매핑할 변수 생성
	var dayList = [];
	// JSTL 문법 forEach 로 controller 에서 넘겨준 dayList 값 포문 돌리기.
	<c:forEach items="${dayList}" var="writedayList">
		// dayList 에 하나씩 담아줌.
		dayList.push("${writedayList.diaryDate}");
	</c:forEach>
	
	//일기쓴날
	var writedDay = dayList;
		
	//월 구하기
	var thismonth = date.getMonth()+1;
 	if(thismonth<10){
  		thismonth = "0"+thismonth;
 	}

	//일 구하기
	var thisday = date.getDate();
	if(thisday<10){
  		thisday = "0"+thisday;
 	}

	//yyyy-mm-dd 문자열 조합
 	ymd = date.getFullYear() + "-" + thismonth + "-" + thisday;

    if ($.inArray(ymd, writedDay) >= 0) {
        return [true,"writedDay",""];
    } else {
        return [false,"",""];
    }
}



/*저장아이콘 클릭시 이미지로 저장(제목으로 저장하기 해결)*/
function downImg(){
    html2canvas($("#paper")[0]).then(function(canvas){
        var myImage = canvas.toDataURL();
        var savename = title;
    	console.log(savename);
        downloadURI(myImage, savename); 
    });
}

function downloadURI(uri, name){
    var link = document.createElement("a")
    link.download = name;
    link.href = uri;
    document.body.appendChild(link);
    link.click();
}



</script>
</html>