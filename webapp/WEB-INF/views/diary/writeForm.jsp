<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/jquery-ui-1.13.1/jquery-ui.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mydiaryList.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mydiarywrite-this.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/jquery-ui-1.13.1/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/fabric.js"></script>

</head>

<body>
	 <div id="wrap">
        <div class="container">
            <div class="row">

                <!-- header -->
				<c:import url="/WEB-INF/views/include/header.jsp"></c:import>				              

                <div class="mydiarywriteForm-write-region clearfix">
                    <div class="mydiarywriteForm-left">
                        <div class="mydiarywriteForm-da-we clearfix">
                          
                            <div class="mydiary-weather2" style="margin-left: 22px;">작성일 :</div>
                            <div class="mydiarywriteForm-inform">
                                <!-- <div class="mydiarywriteForm-inform">2022-03-24</div> -->
                                <input type="text" id="datepicker" name="diaryDate" value="2022-03-24" style="width: 110px; height: 30px; padding: 15px;">
                            </div>                          
 
                            <!--날씨/선택박스-->
                            <div class="clearfix mydiary-we_sel">
                                <!-- <div><img class="mydiary-weather-img" src="./assets/img/weather/sunny-day.png"></div> -->
                                <div class="mydiary-weather2">날씨 :</div>
                                
                                <!--선택박스-->
                                <div class="selectbox-weather">
                                    <form>
                                        <select name="weather" class="selectbox-we">
                                            <option value="none">ㅡㅡ 선택 ㅡㅡ</option>
                                            <option value="sunny">맑음</option>
                                            <option value="rainy">비</option>
                                            <option value="snow">눈</option>
                                        </select>
                                    </form>    
                                </div>
                            </div>
							 
                            <div class="clearfix" style="margin-right:20px;">
                                <div class="diary-private">
                                    <label><input class="diaryset_private" type="radio" name="protect" value="diary-private">비공개</label>
                                </div>
                                <div class="diary-all">
                                    <label><input class="diaryset" type="radio" name="protect" value="diary-all">공개</label>                                                                     
                                </div>
                                <div class="mydiary-weather3">공개여부 :</div>
                            </div>                                   
                                    
                        </div>
                        
                        <!--제목/내용-->
                        <div>
                            <input type="text" style="width: 680px; margin-top: 25px;" class="mydiary-writeForm-title" name="title" id="title" placeholder="제목을 입력해 주세요" value="">
                        </div>
                        <div>
                            <canvas style="margin-left:12px;" id="paper"></canvas>                                                               
                        </div>
                        <div>
                            <div class="writeform-button">
                                <a class="writeform-modify" href="${pageContext.request.contextPath}/diary/list">목록</a><!--list페이지로 이동-->
                                <input id="saveBtn" type="button" class="button writeform-save" value="저장하기"><!-- submit->button 바꿈. ajax사용하기 -->
                            </div>

                        </div>
                        
                    </div>                                                    

                    <div class="mydiarywriteForm-right">
                        <!--이미지/지도-->
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
                                <input type="submit" class="button writeform-deco-btn" value="텍스트">
                            </div>
                        </div>


                        <!--스티커/bgm-->
                        <div class="sticker-bgm-plus-menu-box">
 
                            <ul class="tabs">
                              <li class="tab-link current" data-tab="tab-1">스티커</li>
                              
                                <li class="tab-link" data-tab="tab-2">종이</li>
                              
                                <li class="tab-link" data-tab="tab-3">bgm</li>
                             
                            </ul>
                           
                            <div id="tab-1" class="tab-content current sticker-bgm-box2">
                            
                            	<c:forEach items="${stickerList}" var="stList">
                            		<div style="float:left; margin-left:12px;">
	                                    <img class="writeform-sticker-size" name="sticker" data-stickerno="${stList.stickerNo}" data-stickersrc="${stList.stickerSrc}" src="${stList.stickerSrc}">
                                	</div>
                            	</c:forEach>
                               
                            </div>

                            <div id="tab-2" class="tab-content sticker-bgm-box3">
                                <!--div안에 꽉차게 보이게 만들기 원본 이미지사이즈 줄이기x-->
                                <!--용지가로2개-->
                                <div class="clearfix">
                                    <div class="mydiaryImg-box8">
                                        <img src="./assets/img/diarypaper/monoon1.JPG">                                        
                                    </div>
                                    <div class="mydiaryImg-box8">
                                        <img src="./assets/img/diarypaper/monoon1.JPG">                                        
                                    </div>
                                </div>

                                <div class="clearfix">
                                    <div class="mydiaryImg-box8">
                                        <img src="./assets/img/diarypaper/monoon1.JPG">                                        
                                    </div>
                                    <div class="mydiaryImg-box8">
                                        <img src="./assets/img/diarypaper/monoon1.JPG">                                        
                                    </div>
                                </div>

                                <div>
                                    <img class="writeform-sticker-size" src="./assets/img/mainbook.png">
                                    <img class="writeform-sticker-size" src="./assets/img/sticker/rabbit.png">                             
                                </div>

                                <div>
                                    <img class="writeform-sticker-size" src="./assets/img/sticker/cat.png">
                                    <img class="writeform-sticker-size" src="./assets/img/KakaoTalk_20220228_225353529.png">                             
                                </div>

                                <div>
                                    <img class="writeform-sticker-size" src="./assets/img/sticker/cat.png">
                                    <img class="writeform-sticker-size" src="./assets/img/sticker/rabbit.png">                             
                                </div>

                                <div>
                                    <img class="writeform-sticker-size" src="./assets/img/sticker/cat.png">
                                    <img class="writeform-sticker-size" src="./assets/img/sticker/rabbit.png">                             
                                </div>
                            </div>

                            
                            <div id="tab-3" class="tab-content">
                                <div class="mydiary-writeForm-bgmList" data-val="INVU 태연 (TAEYEON)">
                                    INVU 태연 (TAEYEON)
                                </div>
                                <div class="mydiary-writeForm-bgmList">
                                    사랑은 늘 도망가 임영웅 신사와글잘림 <!--아가씨 OST Part.2-->
                                </div>
                                <div class="mydiary-writeForm-bgmList">
                                    INVU 태연 (TAEYEON)
                                </div>
                                <div class="mydiary-writeForm-bgmList">
                                    INVU 태연 (TAEYEON)
                                </div>
                                <div class="mydiary-writeForm-bgmList">
                                    ELEVEN IVE (아이브)ELEVEN
                                </div>
                                <div class="mydiary-writeForm-bgmList">
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

	//캔버스 초기화 설정
	var canvas = new fabric.Canvas("paper", {
		 width: 680,
		 height: 490,
		 backgroundColor: 'rgb(100,150,134)'
	});
	
	
	$(document).ready(function() {
	
		//탭메뉴관련
		$('ul.tabs li').on("click", function(){
			var tab_id = $(this).attr('data-tab');
			
			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');
			
			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
		 });
		
		//달력
		$("#datepicker").datepicker();
	});
	 
	
	
	
	$("#datepicker").datepicker({
	        showOn:"button"
	        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif"
	        ,buttonImageOnly: true
	        ,changeMonth:true
	        ,changeYear:true
	        ,dateFormat:"yy-mm-dd"
	        ,dayNames : ['월요일','화요일','수요일','목요일','금요일','토요일','일요일']
	        ,dayNamesMin : ['월','화','수','목','금','토','일']
	        ,monthNamesShort:  [ "1월", "2월", "3월", "4월", "5월", "6월","7월", "8월", "9월", "10월", "11월", "12월" ]
	    
	});
	
	$('img.ui-datepicker-trigger').css({'cursor':'pointer', 'margin-left':'10px'}); 


	//로딩된 후 요청
	
	//스티커를 클릭했을때
	$("[name=sticker]").on("click", function(){
		var stickerNo = $(this).data("stickerno")
		var stickerSrc = $(this).data("stickersrc")
		
		console.log(stickerNo);
		console.log(stickerSrc);
		
		fabric.Image.fromURL(stickerSrc, function(oImg) {

			//객체에 스티커번호 추가
			oImg.stickerNo = stickerNo;
			canvas.add(oImg);
			console.log(oImg);
		});
		
	});



	$(window).load(function(){
		
		/*저장 버튼을 눌렀을때*/
		$("#saveBtn").on("click",function(){
			
			var diaryDate = $("[name=diaryDate]").val();
			var weather = $("[name=weather]").val();
			var protect = $("[name=protect]").val();
			var title = $("[name=title]").val();
			
			var diaryvo2 = {
					diaryDate: diaryDate,
					weather: weather,
					protect: protect,
					title: title
			};
			console.log(diaryvo2);
			/*
			 $.ajax({
			      url : "${pageContext.request.contextPath }/diary/write",
			      type : "post",
			      contentType : "application/json",
			      data : JSON.stringify(diaryvo2),
			      dataType : "json",
			      success : function() {
			         //이부분 처리 한거 없음 
			         //컨트롤러에 데디터 잘 전달 되는지만 확인
			      },
			      error : function(XHR, status, error) {
			         console.error(status + " : " + error);
			      }
			   });
			*/
			
			
			
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
				
				paperItemList.push(paperVo);//배열에 추가
			}

			writeDiary(paperItemList);
			
			
		});
		
	});

	//저장 함수
	function writeDiary(paperItemList){
	   
	   console.log(paperItemList);   
	   $.ajax({
	      url : "${pageContext.request.contextPath }/diary/write",
	      type : "post",
	      contentType : "application/json",
	      data : JSON.stringify(paperItemList),
	      dataType : "json",
	      success : function() {
	         //이부분 처리 한거 없음 
	         //컨트롤러에 데디터 잘 전달 되는지만 확인
	      },
	      error : function(XHR, status, error) {
	         console.error(status + " : " + error);
	      }
	   });
	}


</script>

</html>