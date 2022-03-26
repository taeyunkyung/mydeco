<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Mydeco</title>
        
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/main.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/card.css">
        <!--제이쿼리-->
<!--         <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>-->
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script> 
		<script src="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/js/bootstrap.min.js"></script>
 
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
				<div id="content" class="col-xs-12">
					
					<div class="row">
					
						<c:import url="/WEB-INF/views/include/mydiaryaside.jsp"></c:import>
					
						<div class="col-xs-9" id="main-content">  <!-- aside가 없으면 col-xs-12 사용 -->    			
							<div id="cTitle">
								<h3>소통 카드</h3>
							</div>
							
							<div id="main">
                   		 	<!-- ---여기에 자신의 코드 작성--------------------------------------------------------------------------------- -->
								
								
			                <div class="row">
			                    <div class="col-xs-6">
			                        <div class="row">
			                            <div class="col-xs-12 border-replyread1"><!--내가 작성한 카드-->
			                                <div id="leftCard" class="cardRead-subcard">
			                                    <div class="imgdate">2022-03-03</div>
			                                    <div class="cardContent">원본글...</div>
        										<img src="${pageContext.request.contextPath}/assets/img/card/img6.jpg">
					                        </div>
			                            </div>
			                        </div>
			                    </div>



			                    <div class="col-xs-6">
			                        <div class="row">
			                            <div class="col-xs-12 border-replyread2">
			                                <div class="replyWrite-subcard">
			                                    <img src="${pageContext.request.contextPath}/assets/img/card/img1.jpg" alt="">
			                                	<textarea id="r-text" name="cardContent" cols="30" rows="10"></textarea>
						                        <div id="text_rnt" style="position: relative;bottom: 280px;left: 130px;">(0 / 300)</div>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			                <div class="r-text"></div>
			                <div class="r-bgtext"><button type="button" id="popup_open_btn">배경선택</button></div><!--모달창-->
			                <div class="row btnmargin">
			                    <div class="col-xs-12 btncenter">
			                        <button type="submit" class="btn-writeComment">
										<a href="${pageContext.request.contextPath}/card/main">댓글카드 작성</a>
									</button><!--list페이지로 이동-->
			                    </div>
			                </div>


		                   <div id="modal_write" class="modal fade">
					   		<div class="modal-dialog modal-lg">
					      		<div class="modal-content">
					         		<div class="modal-header">
				             			<button type="button" id="closebtn" class="close" data-dismiss="modal" aria-label="Close" style="font-size:30px;"><span aria-hidden="true">&times;</span></button>
								        <div class="clearfix" style="margin-top:28px;">
									        <div style="float:left; margin-left:41px;"><h4 class="modal-title" id="modalDiaryTitle" style="font-size:19px; font-weight:900">배경선택</h4></div>
									        <div class="readcontent clearfix" style="float:right; width:110px;margin-right:40px; margin-top:7px;" >
									        	<div style="float:left; font-family:'SCDream4'; width:84px;"id="modalDiaryDate"></div>
									        	<div style="float:left; font-family:'SCDream4'; width:50px; text-align:center;"id="modalDiaryWeather"></div>
									        	<div style="float:left; font-family:'SCDream4'; width:42px; text-align:center;"id="modalDiaryProtect"></div>
									        </div>
								        </div>
				             		</div>
					         	
					         
					           		<div class="modal-body">
					        			<div class="replyWriteimg">
					        				<img src="${pageContext.request.contextPath}/assets/img/card/img1.jpg">
				        					<img src="${pageContext.request.contextPath}/assets/img/card/img2.jpg">
		        							<img src="${pageContext.request.contextPath}/assets/img/card/img3.jpg">
		        							<img src="${pageContext.request.contextPath}/assets/img/card/img4.jpg">
	        								<img src="${pageContext.request.contextPath}/assets/img/card/img5.jpg">
        									<img src="${pageContext.request.contextPath}/assets/img/card/img6.jpg">
        									<img src="${pageContext.request.contextPath}/assets/img/card/img7.jpg">
        									<img src="${pageContext.request.contextPath}/assets/img/card/img8.jpg">
					        			</div>
					           		<!-- 모달창 주요 컨텐츠 -->
					           		</div>
					           
						           	<div class="modal-footer">
							            <form id="modifyForm" action="${pageContext.request.contextPath}/diary/modifyForm" method="get" style="float:left; margin-left:170px; ">
								      		<button type="button" id="modalModifyBtn" class="btn-modalComment">수정하기</button>
								      		<input type="hidden" name="modaldiaryNo" value="">
								      	</form>
							      	</div>
					      		</div><!-- /.modal-content -->
					   		</div><!-- /.modal-dialog -->
						</div><!-- /.modal -->
						
						
						</div>
		            </div>
	            
            
        		</div>
        	</div>
        </div>
        <!--footer-->
		<div class="row">
            <c:import url="/WEB-INF/views/include/footer.jsp"></c:import>   
		</div>
		<!-- //footer -->
    </div>
   </div>
    
</body>
    <script type="text/javascript">
    
    //글자수 표시하기
    $(document).ready(function() {
        $('#r-text').on('keyup', function() {
            $('#text_rnt').html("("+$(this).val().length+" / 300)");
 
            if($(this).val().length > 300) {
                $(this).val($(this).val().substring(0, 300));
                $('#text_rnt').html("(300 / 300)");
            }
        });
    });
    
    
    /*하나의 일기 div 클릭했을 때 모달창 보이기*/
    $("#popup_open_btn").on("click",function(){
   	/*모달창 보이기*/
   	$("#modal_write").modal('show');

    });
    </script>

</body>
</html>