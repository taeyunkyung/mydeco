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
    
                    <!-- <div class="mydiarydiv">
                        <div>d</div>
                    </div> -->
                    
                    <div class="ct-list col-xs-9">

                        <!--달력-->
                        <div class="cal_nav5">
                          <div id="datepicker"></div>
                        </div>


                        <!--검색창/수정/삭제/정렬-->
                        <div class="li_nav clearfix">
                            <div class="searchfor5">
                                <!--
                                <input type="text" class="search">
                                <img class="glass" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">-->

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
                                        <option value="recently">최신순</option>
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
	                            <div class="clearfix mydiary-list-box2" data-diaryno="${dcvo.diaryNo}" style=" border-bottom: 1px solid #686099;">
	                                <div class="mydiaryText-list2">
	                                    <div class="mydiaryText7 clearfix">
	                                    	<!-- <input type="hidden" name="diaryNo" value="${dcvo.diaryNo}">-->
	                                        <div class="mydiary-Date">Date:</div>
	                                        <div class="mydiary-Date">${dcvo.diaryDate}</div>
	                                        
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
	
	                                    <div class="mydiaryText7 mydiary-content">${dcvo.title}</div>
	                                    <div class="opensetting">
	                                        ${dcvo.protect}
	                                    </div>
	                                </div>
	                               
	                                <div class="mydiaryImg-box7 mydiary-box7-support">
	                                    <img class="mydiaryImg-innerbox7" src="./assets/img/writediary/writediary.png">
	                                </div>
	                            </div>
                            </c:forEach>
                            
                            
                             <!--목록/사진 하나분량의 박스-일기 하나의  div-->
                             <!--  
                            <div class="clearfix mydiary-list-box2">
                                
                                <!--왼쪽 날짜 일기 비공개-->
                                <!--  
                                <div class="mydiaryText-list2">
                                    <div class="mydiaryText7 clearfix">
                                        <div class="mydiary-Date">Date:</div>
                                        <div class="mydiary-Date">2022-03.24</div>
                                        <div><img id="se_weather_img" class="mydiary-weather2" src="${pageContext.request.contextPath}/assets/img/weather/sunny-day.png"></div>
                                    </div>

                                    <div class="mydiaryText7 mydiary-content">일기제목보이기보이는글자수미정</div>
                                    
                                    <div class="opensetting">
                                        비공개
                                    </div>
                                </div>

                                <!--오른쪽 사진-->
                                <!--  
                                <div class="mydiaryImg-box7 mydiary-box7-support">
                                    <img class="mydiaryImg-innerbox7" src="./assets/img/writediary/writediary.png">
                                </div>
                            </div>-->
                            
                            
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

     <!--목록 해당일기 클릭시 해당일기 읽기 모달창의 내용-->
     <c:forEach items="${diarycontentList}" var="diarycontent">
	     	<div class="modal-read2"> 
		        <div class="modal_body" style="display: flex;align-items: center;justify-content: center;">                  
		            <div class="modal_content_read" title="클릭하면 창이 닫힙니다.">   
		                <!--상단-->
		                <div class="clearfix" style="padding-top: 10px; margin-bottom: 30px; ">
		                    <div class="read-bgm-play">
		                        || 자동재생되는중 노래제목 
		                    </div>
		                    <div class="read-save-icon">
		                        <img class="read-save-btn" src="${pageContext.request.contextPath}/assets/img/icon/save.png" onclick="downImg();">
		                    </div>
		                    <div>
		                        <button class="mydiary-read-close-btn"><img class="read-close-btn" src="${pageContext.request.contextPath}/assets/img/icon/close.png"></button>
		                    </div>
		                </div>     
		                   
		                <div>
		                    <h2 class="mydiary-read-title">${diarycontent.title}</h2>
		                </div>
		                
		                <canvas class="readCanvas" id="paper"></canvas>
		                
		                <!--  
		                <div class="mydiary-read-box">
		                    <div id="modalData" class="mydiary-read-box-content" style="text-align: left;">
		                        <!-- <br><br> -->
		                        <!--  
		                        일기쓰고 저장된내용나올곳
		                        textarea에 적은 내용-스티커붙였으면 스티커도 나오고 <br>
		                        bgm넣었으면 이 창이 떴을때 자동으로 bgm재생도 가능하게끔
		                        <br><br><br><br><br>
		                        글 길어지면어떻게될런지
		                        <br><br><br><br><br>
		                        textarea 사이즈 가로 680px 
		                        <br><br><br><br><br>
		                        글의 세로길이가 너무 길면 모달창에서 한번에 보여주기 어려울듯 
		                        <br>
		                        한번에 보여줄거 아니라면 스크롤 달면 됨
		                        <br><br><br><br><br>
		                        ??
		                        <br><br><br><br><br><br><br><br><br><br>
		                        안보이는 스크롤바
		                        <br><br><br><br><br><br><br><br><br><br>
		                        ??
		                    </div>
		                </div>-->
		                
		                
		                <div class="mydiary-read-btnset">
		                    <button class="modal-button-read">수정하기</button>
		                    <button class="modal-button-read">삭제하기</button>
		                </div> 
		            </div>
		            
		        </div> 
	    	</div> 
     </c:forEach>
    
</body>


<script type="text/javascript">
function downImg(){
    html2canvas($("#modalData")[0]).then(function(canvas){
        var myImage = canvas.toDataURL();
        downloadURI(myImage, "test.png") 
    });
}

function downloadURI(uri, name){
    var link = document.createElement("a")
    link.download = name;
    link.href = uri;
    document.body.appendChild(link);
    link.click();
}

/*클릭한 일기의 정보*/
 function diaryContent(){
	 
	var diaryNo = $(this).data("diaryno")
	
	$.ajax({
	    url : "${pageContext.request.contextPath}/diary/write",
	    type : "post",
	    contentType : "application/json",
	    data : JSON.stringify(diarycontentvo),//바꿔줬음
	    dataType : "json",
	    success : function(result) {
	    	if(result == 1){
	    		location.href="${pageContext.request.contextPath}/diary/list";
	    	}else {
	    		alert('Fail to saving');
	    	}
	    	  
	    },
	    error : function(XHR, status, error) {
	       console.error(status + " : " + error);
	    }
	 });	
	

	//캔버스 초기화 설정
	var canvas = new fabric.Canvas("paper", {
		 width: 680,
		 height: 510,
		 //backgroundColor: 'rgb(100,150,134)'
		 backgroundColor: '#dbd3c7'
	});

	
	
} 
 
 


/*모달창*/
$(function(){ 

    $(".mydiary-list-box2").click(function(){
    	var diaryNo = $(this).data("diaryno")
    	
        $(".modal-read2").fadeIn();
    });

    $(".mydiary-read-close-btn").click(function(){
         $(".modal-read2").fadeOut();
    });

});


//////////////////////////////////////////////////////////
//달력 관련 ///도움
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
	onSelect:function(selected, evnt) {
		console.log(selected);
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
	/*원래 있던 코드
	var writedDay = getWriteDay();*/
	var writedDay = dayList;
		
		//["2022-02-01", "2022-02-02", "2022-02-03", "2022-02-07", "2022-02-28", "2022-03-01", "2022-03-03", "2022-04-25"];
	
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

/*renderWriteDate함수 자체가 console너무 여러번 태워서 ajax사용안했음*/
/* function getWriteDay() {
	var writedeDayList = [];
	//서버에 요청해서 일기쓴날 리스트
	 $.ajax({
	      url : "${pageContext.request.contextPath}/diary/datelist",
	      type : "post",
	      //contentType : "application/json",
	      //data : JSON.stringify(diarycontentvo),//바꿔줬음
	      dataType : "json",
	      success : function(result) {
	    	  
	    	 for(var i=0; i<result.length; i++){
	    		 
	    		 writedeDayList.push(result[i].diaryDate);
	    	 }
    		 return writedeDayList;
	      },
	      error : function(XHR, status, error) {
	         console.error(status + " : " + error);
	      }
	   });
	
} */
</script>
</html>