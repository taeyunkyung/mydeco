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
		
			<!-- header -->
			<div class="row">
	            <c:import url="/WEB-INF/views/include/header.jsp"></c:import>    
			</div>
			<!-- //header -->
			
			<div class="row">
				
				<!-- content -->
				<div class="col-xs-12" id= "content">
					
					<div class="row" >

						
						<div class="col-xs-12" id="main-content">   <!-- aside가 없는경우 -->    
		
							
							<div id="main">
                   		 	<!-- ---여기에 자신의 코드 작성--------------------------------------------------------------------------------- -->

				                <div class="mydiarywriteForm-write-region clearfix">
				                    <div class="mydiarywriteForm-left">
				                        <div class="mydiarywriteForm-da-we clearfix">
				                          
				                          	<input type="hidden" name="userNo" value="${authUser.userNo}"><!-- 유저번호 -->
				                          
				                            <div class="mydiary-weather2" style="margin-left: 22px;">작성일 :</div>
				                            <div class="mydiarywriteForm-inform">
				                                <!-- <div class="mydiarywriteForm-inform">2022-03-24</div> -->
				                                <input type="text" id="datepicker" name="diaryDate" style="width: 110px; height: 30px; padding: 15px;">
				                            </div>                          
				 
				                            <!--날씨/선택박스-->
				                            <div class="clearfix mydiary-we_sel">
				                                <div class="mydiary-weather2">날씨 :</div>
				                                
				                                <!--선택박스-->
				                                <div class="selectbox-weather">
				                                    <form>
				                                        <select id="weatherselectbox" name="weather" class="selectbox-we">
				                                            <option value="">ㅡㅡ 선택 ㅡㅡ</option>
				                                            <option value="sunny">맑음</option>
				                                            <option value="rainy">비</option>
				                                            <option value="snow">눈</option>
				                                        </select>
				                                    </form>    
				                                </div>
				                            </div>
											 
				                            <div class="clearfix" style="margin-right:20px;">
				                                <div class="diary-private">
				                                    <label><input class="diaryset_private" type="radio" name="protect" value="비공개">비공개</label>
				                                </div>
				                                <div class="diary-all">
				                                    <label><input class="diaryset" type="radio" name="protect" value="공개">공개</label>                                                                     
				                                </div>
				                                <div class="mydiary-weather3">공개여부 :</div>
				                            </div>                                   
				                                    
				                        </div>
				                        
				                        <!--제목/내용-->
				                        <div>
				                            <input type="text" maxlength='35' style="width: 680px; margin-top: 25px;" class="mydiary-writeForm-title" name="title" id="title" placeholder="제목을 입력해 주세요" value="">
				                        </div>
				                        <div>
				                            <canvas style="margin-left:12px;" id="paper"></canvas>                                                               
				                        </div>
				                        <div class="clearfix">
				                        	<div id="audioDiv" style="float:left; margin-top:10px;">
				                        		<audio id="audio" src="" controls autoplay style="height:20px; width:300px; margin-left:11px;"></audio>
				                        	</div>
				                        
				                            <div class="writeform-button">
				                                <a class="writeform-modify" href="${pageContext.request.contextPath}/diary/list">목록</a><!--list페이지로 이동-->
				                                <input id="saveBtn" type="button" class="button writeform-save" value="저장하기"><!-- submit->button 바꿈. ajax사용하기 -->
				                            </div>
				
				                        </div>
				                        
				                    </div>                                                    
				
				                    <div class="mydiarywriteForm-right2">
				                        <!--이미지/지도-->
				                        <div class="clearfix">
				                            <form method="post" enctype="multipart/form-data">
				                                <div class="button writeform-btn-left writeform-deco-btn">
				                                    <label for="chooseFile">
				                                    	<div id="btnPhoto" class="photowid">사진</div>
				                                    </label>
				                            
				                                    <input type="file" id="chooseFile" name="chooseFile" accept="image/*" onchange="loadFile(this)"> 
				                                </div>
				                            </form>
				                            <div class="writeform-btn-right">
				                                <input type="submit" name="textbox" data-stickerno="999" data-stickersrc="n" class="button writeform-deco-btn" value="텍스트">
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
				                            
				                            	<c:forEach items="${stickerMap.stickerList}" var="stickerVo">
				                            		<div style="float:left; margin-left:12px;">
				                           				<img class="writeform-sticker-size sticker" data-stickerno="${stickerVo.stickerNo}" data-stickersrc="${stickerVo.stickerSrc}" src="${stickerVo.stickerSrc}">
				                                	</div>
				                            	</c:forEach>
				                               
				                            </div>
				
				                            <div id="tab-2" class="tab-content sticker-bgm-box3">
				                                <!--div안에 꽉차게 보이게 만들기 원본 이미지사이즈 줄이기x-->
				                                <!--용지가로2개-->
				                                
				                                	<div class="clearfix">
				                                		<c:forEach items="${stickerMap.paperList}" var="paperVo">
					                                		<div class="mydiaryImg-box8">
						                                    	<img class="paper" data-paperno="${paperVo.stickerNo}" data-papersrc="${paperVo.stickerSrc}" src="${paperVo.stickerSrc}">
					                                		</div>
				                                		</c:forEach>
				                                	</div>
				                            </div>
				
				                            
				                            <div id="tab-3" class="tab-content sticker-bgm-box4">
												<c:forEach items="${bgmList}" var="bgmVo">
													<div class="mydiary-writeForm-bgmList" data-bgmtitle="${bgmVo.bgmTitle}" data-bgmsrc="${bgmVo.bgmSrc}">
				                                    	${bgmVo.bgmTitle}
				                                	</div>								
												</c:forEach>
				                            </div>
				                           
				                        </div>
				
				                    </div>
				                </div>
					
                   		 	<!-- ---여기에 자신의 코드 작성--------------------------------------------------------------------------------- -->
					
							</div>	
							
		
						</div>
						<!-- //main-content -->
						
					</div>
					<!-- //row -->
					
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

	//캔버스 초기화 설정
	var canvas = new fabric.Canvas("paper", {
		 width: 680,
		 height: 510,
		 //backgroundColor: 'rgb(100,150,134)'
		 backgroundColor: '#dbd3c7'
		 
		 
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

	
	/*220316 수정*/
	//종이를 클릭했을때--배경은 canvas.getObject안먹어서 이렇게만들었음
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
				scaleX: canvas.width / backImg.width,
				scaleY: canvas.height / backImg.height
			});
			
			console.log("=====================================");
			console.log(backImg);
		});
		
	});
	
	
	
	//스티커를 클릭했을때
	$(".sticker").on("click", function(){
		var stickerNo = $(this).data("stickerno")
		var stickerSrc = $(this).data("stickersrc")
		
		console.log(stickerNo);
		console.log(stickerSrc);
		
		fabric.Image.fromURL(stickerSrc, function(oImg) {
			oImg.set({'cornerColor': '#686099'});

			oImg.scale(1/4)
			
			//객체에 스티커번호 추가
			oImg.stickerNo = stickerNo;
			oImg.stickerSrc = stickerSrc;
			canvas.add(oImg);
			console.log(oImg);
			
			/*
			const zIndex = oImg.zIndex();
			//var zIndex = oImg.zIndex();
			console.log(zIndex);
			console.log("==========");
			
			oImg.zIndex(1);
			
			console.log("=====zindex 1로추가=====");
			console.log(oImg);
			console.log("=====zindex 추가=====");*/
			
		});
		
	});

	

	//텍스트박스를 클릭했을때
	$("[name=textbox]").on("click", function(){
		var stickerNo= $(this).data("stickerno")
		var stickerSrc= $(this).data("stickersrc")
		
		var text = new fabric.Textbox("텍스트를 입력하세요", {
			stickerNo: stickerNo,
			stickerSrc: stickerSrc,
			top: 30,
			left: 30,
			width: 300,
			height: 300,
			fontSize: 18,
			fontFamily: 'SCDream4',
			cornerColor: '#686099'
		});
		
		canvas.add(text);
		canvas.setActiveObject(text);
		/*zindex처럼 쓰려고 맨앞으로 가져오기*/
		//canvas.bringToFront(text); 
		
		//canvas.bringForward(text);
		
		var zindex = canvas.getObjects().indexOf(text);
		console.log(zindex);
		console.log("====zindex3번째실험=====");
		
		text.selectAll();
		text.enterEditing();
		text.hiddenTextarea.focus();
	})
	
	//del키를 눌렀을때
	$("body").on("keyup",function(){
		if ( event.keyCode == 46 || event.which == 46 ) {
			
			//현재 선택된(활성화된)) 객체를 가져온다.
			var activeObject = canvas.getActiveObject()
			//console.log(activeObject);
			
			//객체를 삭제한다.
			canvas.remove(activeObject);
		}
	})
	
	//bgm 전역변수
	var bgmSrc;
	
	/*bgm을 클릭했을때*/
	$(".mydiary-writeForm-bgmList").on("click",function(){
		bgmSrc= $(this).data("bgmsrc");
		console.log(bgmSrc);
		
		$("#audio").attr("src",bgmSrc);
		
		console.log("====")
		console.log($("#audio").attr("src"));
		console.log("====")
	})

	
	/*저장 버튼을 눌렀을때*/
	$("#saveBtn").on("click",function(){
		
		var userNo = $("[name=userNo]").val();
		var diaryDate = $("[name=diaryDate]").val();
		var weather = $("#weatherselectbox option:selected").val();
		var protect = $(":input:radio[name=protect]:checked").val();
		var title = $("[name=title]").val();
		
		
		/*글쓰기폼 입력경고창*/
		if(diaryDate == null || diaryDate == '' || diaryDate.trim() == ''){
			alert('날짜를 선택해주세요');
			return;
		}
		if(weather == ''){
			alert('날씨를 선택해주세요');
			return;
		}
		if(protect == null){
			alert('공개여부를 선택해주세요');
			return;
		}
		if(title == null || title == '' || title.trim() == ''){
			alert('제목을 입력해주세요');
			return;
		}
		if(bgmSrc == null || bgmSrc == '' || bgmSrc.trim() == ''){
			alert('bgm을 선택해주세요');
			return;
		}
		
		
		var diarycontentvo = {
				userNo: userNo,
				diaryDate: diaryDate,
				weather: weather,
				protect: protect,
				title: title,
				diaryBgmSrc: bgmSrc
		};
		
		//캔버스에 있는 전체 객체를 배열로 가져온다
		var canvasObjList = canvas.getObjects();

		//서버로 전송할 객체들 배열
		var diaryItemList = [];
		
		for(var i=0; i<canvasObjList.length; i++){
			var diaryItemVo = {};
			diaryItemVo.top = canvasObjList[i].top;
			diaryItemVo.left = canvasObjList[i].left;
			diaryItemVo.scaleX = canvasObjList[i].scaleX;
			diaryItemVo.scaleY = canvasObjList[i].scaleY;
			diaryItemVo.angle = canvasObjList[i].angle;
	
			diaryItemVo.stickerNo = canvasObjList[i].stickerNo;
			diaryItemVo.stickerSrc = canvasObjList[i].stickerSrc;
			
			/*저장할때 한번더 추가 제발 ㅠ*/
			//canvas.bringToFront(canvasObjList[i].text); 
			
			//canvas.bringForward(canvasObjList[i].text);
	
			//원래있던코드 diaryItemVo.text = canvasObjList[i].text;
			
			diaryItemVo.text = canvasObjList[i].text;
			
			//canvas.bringToFront(diaryItemVo.text);
			//canvas.setObjects(999).indexOf(diaryItemVo.text);
			
			diaryItemList.push(diaryItemVo);//배열에 추가
			console.log("==========================");			
			console.log(canvasObjList[i]); 
			
			var zindex = canvas.getObjects().indexOf(diaryItemVo);
			console.log("====3번째기반으로한4번째실험=====")
			console.log(zindex);
			console.log("====3번째기반으로한4번째실험=====")
		}

		/*220316수정*/
		//페이퍼 추가

		if( (paperNo == null) || (paperNo == undefined) || (paperNo == "") ){
			
			diarycontentvo.itemList = diaryItemList//var diarycontentvo에 itemList추가
			writeDiary(diarycontentvo);
		
		}else {
			var diaryItemVo = {};
			diaryItemVo.stickerNo = paperNo;
			diaryItemVo.stickerSrc = paperSrc;
			diaryItemList.push(diaryItemVo);//배열에 추가
			
			diarycontentvo.itemList = diaryItemList//var diarycontentvo에 itemList추가
			
			console.log("=페이퍼========================");
			console.log(paperNo);
			console.log(paperSrc);
			/* console.log(diarycontentvo);
			console.log(canvasObjList[0]);    */
		
			writeDiary(diarycontentvo);	
		};
		
		
		
	});
	


	//저장 함수
	function writeDiary(diarycontentvo){
	   
		
	   $.ajax({
	      url : "${pageContext.request.contextPath}/diary/write",
	      type : "post",
	      contentType : "application/json",
	      data : JSON.stringify(diarycontentvo),//바꿔줬음
	      dataType : "json",
	      success : function(result) {
	    	  if(result == 1){//스트링
	    		  location.href="${pageContext.request.contextPath}/diary/list";
	    	  }else {
	    		  alert('Fail to saving');
	    	  }
	    	  
	      },
	      error : function(XHR, status, error) {
	         console.error(status + " : " + error);
	      }
	   });
	}

	
	
	
	///////////////////////////////////////////////////
	$("#btnPhoto").on("click", function(){
		console.log("btnPhoto");
		
		var tmpUrl ="https://www.google.com//images/branding/googlelogo/2x/googlelogo_color_272x92dp.png/"
		
		fabric.Image.fromURL(tmpUrl, function(oImg) {

			//객체에 스티커번호 추가
			canvas.add(oImg);
			console.log(oImg);
		});
	});

</script>

</html>