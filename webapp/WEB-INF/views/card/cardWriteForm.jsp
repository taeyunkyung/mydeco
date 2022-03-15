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
                                 
                                        <img class="cardwriteimg" src="${pageContext.request.contextPath}/assets/img/card/img (1).jpg" alt="">
                                        
                                        <textarea id="c-text" name="cardContent" cols="30" rows="10"></textarea>
                                        <div id="text_cnt">(0 / 300)</div>
                                         
                                    </div>
                                </div>
                            </div>

                            
                 
                    </div>

                    <div class="col-xs-4">
                        <div class="border-cardwrite"><!--배경목록8개-->
                            <div class="cardwritebg">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <a href=""><img src="${bgList[0].cardImgSrc}" alt=""></a>
                                    </div>
                                    <div class="col-xs-6">
                                        <a href=""><img src="${bgList[1].cardImgSrc}" alt=""></a>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-6">
                                        <a href=""><img src="${bgList[2].cardImgSrc}" alt=""></a>
                                    </div>
                                    <div class="col-xs-6">
                                        <a href=""><img src="${bgList[3].cardImgSrc}" alt=""></a>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-6">
                                        <a href=""><img src="${bgList[4].cardImgSrc}" alt=""></a>
                                    </div>
                                    <div class="col-xs-6">
                                        <a href=""><img src="${bgList[5].cardImgSrc}" alt=""></a>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-6">
                                        <a href=""><img src="${bgList[6].cardImgSrc}" alt=""></a>
                                    </div>
                                    <div class="col-xs-6">
                                        <a href=""><img src="${bgList[7].cardImgSrc}" alt=""></a>
                                    </div>
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
                                 <label><input type="radio" name="gender" value="male">남성</label>
                                 <label><input type="radio" name="gender" value="female">여성</label>                                      
                             </div>
                         </div> 
                         <div class="row">
                             <div class="col-xs-12 cardwriteradio">
                                 <h4 class="r-gender">연령</h4>
                                 <label><input type="radio" name="age" value="teen">10대</label>
                                 <label><input type="radio" name="age" value="twn">20대</label>
                                 <label><input type="radio" name="age" value="trn">30대</label>
                                 <label><input type="radio" name="age" value="ftn" >40대 이상</label>
                             </div>
                         </div>
                        
                    </div>
                   
                    <!--보내기/취소-->
                    <div class="col-xs-4">
                        <input id="saveBtn" type="submit" class="btn-writeform-save" value="보내기">
                           
                    
                        <a class="cardMainForm" href="${pageContext.request.contextPath}/card/main">취소</a><!--list페이지로 이동-->
                    </div>
					

                </div>

                
            
            

                
</form>
            </div>
        	</div>
       </div>
   </div>
                
                

    </body>
    
    <script>
 
        $(document).ready(function() {
            $('#c-text').on('keyup', function() {
                $('#text_cnt').html("("+$(this).val().length+" / 300)");
     
                if($(this).val().length > 300) {
                    $(this).val($(this).val().substring(0, 300));
                    $('#text_cnt').html("(300 / 300)");
                }
            });
        });
            
    </script>
</html>