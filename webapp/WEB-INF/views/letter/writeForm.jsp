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

							<div class="letter-openday" style="margin-left: 22px;">공개일
								:</div>
							<select name="Dday" id="openday-select">
								<option value="">-- 공개일 선택 --</option>
								<option value="month">한 달 뒤</option>
								<option value="half-year">반년 뒤</option>
								<option value="year">1년 뒤</option>
							</select>

							<div class="writeform-top-button"> 
                            	<input type="submit" class="button writeform-save" value="편지 보내기">
                            </div>
                           
                        </div>
                        
                        <!--내용-->
          
                        <div id="letter-content">
                            <canvas id="paper"></canvas>                                                          
                        </div>
                        
                        <div>
                            <div class="writeform-button">
                                <a class="writeform-modify">임시 저장</a>
                                <a class="writeform-modify">취소</a>
                            </div>

                         
                        </div>
                        
                    </div>                                                    

                    <div class="letterwriteForm-right">

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
                             	<div id="sticker-text" data-stickerno="9999999" >텍스트 상자</div>
                             	
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
	 height: 690,
	 backgroundColor: '#686099'
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


</script>
</html>