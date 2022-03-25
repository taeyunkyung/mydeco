<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Mydeco</title>
        
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.min.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/main2.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/card.css">
        <!--제이쿼리-->
<!--         <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>-->
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script> 
		<script src="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/js/bootstrap.min.js"></script>
 
</head>
    <body>
        <div class="wrap">
            <div class="container">
                <div class="row">
                <!-- header -->
				<c:import url="/WEB-INF/views/include/header2.jsp"></c:import>
    			<!-- header끝 -->
                <!--contents-->
                <div class="row">
                    <div class="col-xs-12">
                        <div id="fTitle">
                            <h3>소통 카드</h3>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-6">
                        <div class="row">
                            <div class="col-xs-12 border-replyread1"><!--내가 작성한 카드-->
                                <div class="cardRead-subcard">
                                    <div class="imgdate">2022-02-03</div>
                                    <img src="${pageContext.request.contextPath}/assets/img/card/img7.jpg" alt="">
                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="col-xs-6">
                        <div class="row">
                            <div class="col-xs-12 border-replyread2">
                                <div class="cardRead-subcard">
                                    <div class="imgdate">2022-02-03</div>
                                    <img src="${pageContext.request.contextPath}/assets/img/card/img1.jpg" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="r-text">받은카드</div>
                <div class="r-bgtext"><button type="button" id="popup_open_btn">배경선택</button></div><!--모달창-->


                   <div id="modal_write" class="modal fade">
			   		<div class="modal-dialog modal-lg">
			      		<div class="modal-content">
			         		<div class="modal-header">
			             
			             	</div>
			         	
			         
			           		<div class="modal-body">
			        	
			           	<!-- 모달창 주요 컨텐츠 -->
			           
			           		</div>
			           
			           
				           <div class="modal-footer">
				              <button type="button" class="modal-button-read">수정하기</button>
				          	</div>
			          
			      		</div><!-- /.modal-content -->
			   		</div><!-- /.modal-dialog -->
				</div><!-- /.modal -->
				
				
				
            </div>
        </div>
    </div>
    



    </body>
    <script type="text/javascript">
    $("#popup_open_btn").on("click",function(){
    	   
    	   /*모달창 보이기*/
   	$("modal_write").modal('show');
    	   

    });
    </script>

</body>
</html>