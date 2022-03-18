<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>

<html lang="ko"> <!-- 한국어문서만 검색할때, 음성으로 할때 한국어 음성지원 -->
    <head>
        <meta charset="UTF-8"> <!-- 브라우저가 문서를 해석할때 필요한 정보 -->
        <title>message</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.min.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/main.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/card.css">
        <!--제이쿼리-->
        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
 
    </head>

    <body>
        <div class="wrap">
            <div class="container">
                <div class="row">
	                <!-- header -->
					<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	    			<!-- header끝 -->
	                <!--contents-->
	                <div class="row">
	                    <div class="col-xs-12">
	                        <div id="fTitle">
	                            <h3>소통 카드</h3>
	                        </div>
	                    </div>
	                </div>
	                <form action="${pageContext.request.contextPath}/card/cardwrite" method="get">
		                <div class="row">
		                    <div class="col-xs-8">
		                        
		                            <div class="row">
		                            
		                                <div class="col-xs-12">
		                                    <div class="height600">
		                                 
		                                        <img id="big" class="cardwriteimg" src="${bgList[0].cardImgSrc}" alt="">
		                                        <input type="text" name="cardImgNo" value="${bgList[0].cardImgSrc}">
		                                        <textarea id="c-text" name="cardContent" cols="30" rows="10" onkeydown="limit(this.form)"></textarea>
		                                        <div id="text_cnt">(0 / 300)</div>
		                                         
		                                    </div>
		                                </div>
		                            </div>
		                    </div>
		
		                    <div class="col-xs-4">
		                        <div class="border-cardwrite">
		                            <div class="cardwritebg">
		                                <div class="row">
		                                	<c:forEach items="${bgList}" var="vo">
			                                	<div class="col-xs-6">
			                                        <img class="small" src="${vo.cardImgSrc}" data-cardimgno="${vo.cardImgNo}" >
			                                    </div>
		                                	</c:forEach>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
	                        
	                	</div>
					
		                <div class="row">
		                    <div class="col-xs-8">
		                         <div class="row">
		                             <div class="col-xs-12 cardwriteradio">       
		                                 <h4 class="r-age">성별</h4>
		                                 <label><input type="radio" name="cardGender" value="male">남성</label>
		                                 <label><input type="radio" name="cardGender" value="female">여성</label>                                      
		                             </div>
		                         </div> 
		                         <div class="row">
		                             <div class="col-xs-12 cardwriteradio">
		                                 <h4 class="r-gender">연령</h4>
		                                 <label><input type="radio" name="cardAge" value="teen">10대</label>
		                                 <label><input type="radio" name="cardAge" value="twn">20대</label>
		                                 <label><input type="radio" name="cardAge" value="trn">30대</label>
		                                 <label><input type="radio" name="cardAge" value="ftn" >40대 이상</label>
		                             </div>
		                         </div>
		                    </div>
		                   
		                    <!--보내기/취소-->
		                    <div class="col-xs-4">
		                    	
		                        <button id="saveBtn" type="submit" class="btn-writeform-save">보내기</button>
		                        <a href="${pageContext.request.contextPath}/card/main" class="btnwhite">취소</a><!--list페이지로 이동-->
		                    </div>
		                </div>
				</form>
				
            </div>
       </div>
   </div>
                
                

    </body>
    
    <script type="text/javascript">
		
        $(document).ready(function() {
            $('#c-text').on('keyup', function() {
                $('#text_cnt').html("("+$(this).val().length+" / 300)");
     
                if($(this).val().length > 300) {
                    $(this).val($(this).val().substring(0, 300));
                    $('#text_cnt').html("(300 / 300)");
                }
            });
        });
        
		
		//이미지 클릭시 썸네일 바뀜
		/* var bigPic = document.querySelector("#big");
		var smallPics = document.querySelectorAll(".small");
		
		for(var i=0; i < smallPics.length;i++){
			smallPics[i].addEventListener("click",changepic);
		}
		
		function changepic(){//사진바꾸는 함수
			var smallPicAttribute = this.getAttribute("src");
			bigPic.setAttribute("src",smallPicAttribute);
		}
		   */	
        
		//이미지 클릭시 썸네일 바뀜
		
		
		//오른쪽 카드 클릭할때 --> 배경이미지 변경,, 카드번호 변경 
		$(".small").on("click", function(){
			
			//배경이미지 변경
			var cardImgSrc = $(this).attr("src");
			$("#big").attr("src", cardImgSrc);
			
			
			//배경이미지 경로 저장
			$('[name="cardImgNo"]').val(cardImgSrc);
		});
		
		
		
		
    </script>
</html>