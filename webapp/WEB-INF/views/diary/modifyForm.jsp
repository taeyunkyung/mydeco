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
                          
                          	<input type="hidden" name="userNo" value="${authUser.userNo}"><!-- 유저번호 -->
                          
                            <div class="mydiary-weather2" style="margin-left: 22px;">작성일 :</div>
                            <div class="mydiarywriteForm-inform">
                                <input type="text" id="datepicker" name="diaryDate" value="${dcVo.diaryDate}" style="width: 110px; height: 30px; padding: 15px;">
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
                                            <option value="${dcVo.weather}" selected>
                                        </select>
                                    </form>    
                                </div>
                            </div>
							 
                            <div class="clearfix" style="margin-right:20px;">
                                <div class="diary-private">
                                    <label><input id="diary-private" class="diaryset_private" type="radio" name="protect" value="비공개">비공개</label>
                                </div>
                                <div class="diary-all">
                                    <label><input id="diary-all" class="diaryset" type="radio" name="protect" value="공개">공개</label>                                                                     
                                </div>
                                <div class="mydiary-weather3">공개여부 :</div>
                            </div>                                   
                                    
                        </div>
                        
                        <!--제목/내용-->
                        <div>
                            <input type="text" value="${dcVo.title}" maxlength='35' name="title" id="title" style="width: 680px; margin-top: 25px;" class="mydiary-writeForm-title" placeholder="제목을 입력해 주세요">
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

                    <div class="mydiarywriteForm-right">
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
                                <input type="submit" name="textbox" data-stickerno="0" data-stickersrc="n" class="button writeform-deco-btn" value="텍스트">
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

                            
                            <div id="tab-3" class="tab-content">
                                <c:forEach items="${bgmList}" var="bgmVo">
									<div class="mydiary-writeForm-bgmList" data-bgmtitle="${bgmVo.bgmTitle}" data-bgmsrc="${bgmVo.bgmSrc}">
                                    	${bgmVo.bgmTitle}
                                	</div>								
								</c:forEach>
                            </div>
                           
                        </div>

                    </div>
                </div>
    
            </div>
        </div>    
    </div>
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
		
		//로딩되기전에 리스트 페이지에서 선택한 일기 그리기
		drawDiary();
		
	});
	
	/*bgm을변경하지 않았을때를 위한 전역변수*/
	var bgmSrc;
	
	//일기 그리기
	function drawDiary(){
		
		var diaryNo = ${param.modaldiaryNo};
		console.log(diaryNo);		
		
		var diarycontentvo = {diaryNo: diaryNo};
		
		$.ajax({
		    url : "${pageContext.request.contextPath}/diary/read",
		    type : "post",
		    contentType : "application/json",
		    data : JSON.stringify(diarycontentvo),//데이터 보내기
		    dataType : "json",
		    success : function(DiaryContent) {
		    	console.log("========DiaryContent========================");
		    	console.log(DiaryContent);
		    	console.log("========DiaryContent========================");
		    	
		    	/*번호가 ? 인 일기의 정보*/
		    	$("#title").val(DiaryContent.title);
		    	$("[name=diaryDate]").val(DiaryContent.diaryDate);
		    	$("#weatherselectbox").val(DiaryContent.weather);
		    	
		    	if(DiaryContent.protect == "비공개") {
		    		$("#diary-private").prop('checked', true);
		    		$("#diary-private").val(DiaryContent.protect);
		    	}else{
		    		$("#diary-all").prop('checked', true);
		    		$("#diary-all").val(DiaryContent.protect);
		    	}
		    	
		    	$("#audio").attr("src",DiaryContent.diaryBgmSrc);
		    	console.log($("#audio").attr("src"));
		    	
		    	/*0324추가*/
		    	bgmSrc = DiaryContent.diaryBgmSrc;
		    	
			    var DiaryItemList = DiaryContent.itemList;
			    console.log(DiaryItemList);
			    
			    for(var i=0; i<DiaryItemList.length; i++){
					itemRender(DiaryItemList[i])
					//console.log(DiaryItemList[i]);
				}
		    
		    },
		    error : function(XHR, status, error) {
		       console.error(status + " : " + error);
		    }
		 });
		
	}
	
	
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
			
			//220319 수정하기 눌렀을때 해당 글이 갖고있던 스티커 이미지의 번호/경로를 추가해주기
			text.stickerNo = diaryitemVo.stickerNo;
			text.stickerSrc = diaryitemVo.stickerSrc;

			//변경안되게
			text.selectable = true;
			
			//커서모양기본
			text.hoverCursor ="default";
			
			//캔버스에 추가
			canvas.add(text);
		
		}else if(diaryitemVo.stickerCateNo == 1) { // 배경--캔버스 새로 만들듯 배경도 사용된 스티커 경로만 갖고와서 다시 그려주기
			fabric.Image.fromURL(diaryitemVo.stickerSrc, function(backImg) {
				
				//220319 수정하기 눌렀을때 해당 글이 갖고있던 스티커 이미지의 번호/경로를 추가해주기
				paperNo = diaryitemVo.stickerNo;
				paperSrc = diaryitemVo.stickerSrc;
				
				backImg.stickerNo = paperNo;
				backImg.stickerSrc = paperSrc;

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
				oImg.selectable = true;
				
				//커서모양기본
				oImg.hoverCursor ="default";
				
				//220319 수정하기 눌렀을땐 이미 있던 이미지가 갖고있던 stickerNo를 추가해주기
				oImg.stickerNo = diaryitemVo.stickerNo;
				oImg.stickerSrc = diaryitemVo.stickerSrc;
				
				//캔버스에 추가
				canvas.add(oImg);
			});
		}
		
	}
	
	
	
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

			//객체에 스티커번호 추가
			oImg.stickerNo = stickerNo;
			oImg.stickerSrc = stickerSrc;
			canvas.add(oImg);
			console.log(oImg);
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
	//var bgmSrc;
	
	/*bgm을 클릭했을때*/
	$(".mydiary-writeForm-bgmList").on("click",function(){
		//꾸미기창에서bgm을 클릭하면 그 bgm의 bgmsrc를 얻어온후 그 경로를 audio태그의 src에 넣고싶음
		bgmSrc= $(this).data("bgmsrc");
		console.log(bgmSrc);
		
		$("#audio").attr("src",bgmSrc);
		
	})
	

	
	/*저장 버튼을 눌렀을때*/
	$("#saveBtn").on("click",function(){
		
		var diaryNo = ${param.modaldiaryNo};
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
		
		var diarycontentvo = {
				diaryNo: diaryNo,
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
			
			diaryItemVo.text = canvasObjList[i].text;
	
			diaryItemList.push(diaryItemVo);//배열에 추가
			console.log("==========================");			
			console.log(canvasObjList[i]); 
		}

		/*220319추가*/
		/*220316수정*/
		//페이퍼 추가

		if( (paperNo == null) || (paperNo == undefined) || (paperNo == "") ){
			
			diarycontentvo.itemList = diaryItemList//var diarycontentvo에 itemList추가
			//writeDiary(diarycontentvo);
		
		}else {
			var diaryItemVo = {};
			diaryItemVo.stickerNo = paperNo;
			diaryItemVo.stickerSrc = paperSrc;
			diaryItemList.push(diaryItemVo);//배열에 추가
			
			diarycontentvo.itemList = diaryItemList//var diarycontentvo에 itemList추가
			
			console.log("=페이퍼========================");
			console.log(paperNo);
			console.log(paperSrc);
			console.log("===========modifyitem===============");
			console.log(diarycontentvo);
			console.log("===========modifyitem===============");
			/* console.log(diarycontentvo);
			console.log(canvasObjList[0]);    */
		
			writeDiary(diarycontentvo);	
		};
		
		
	});
	


	//저장 함수
	function writeDiary(diarycontentvo){
	   
	   $.ajax({
	      url : "${pageContext.request.contextPath}/diary/modify",
	      type : "post",
	      contentType : "application/json",
	      data : JSON.stringify(diarycontentvo),
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