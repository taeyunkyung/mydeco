<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
    <html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Mydeco</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.min.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/main.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/card.css">
    
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
					                            <div class="col-xs-12 border-cardread1"><!--내가 작성한 카드-->
					                                <div class="cardRead-subcard">
					                                    <div class="imgdate">2022-02-03</div>
					                                    <div class="cardContent"></div>
					                                    <img src="${pageContext.request.contextPath}/assets/img/card/img7.jpg" alt="">
					                                </div>
					                            </div>
					                        </div>
					                        <div class="row">
					                            <div class="col-xs-12">
					                                <div class="ment">나님이 작성한 최근 카드</div>
					                            </div>
					                            <div class="row">
					                                <div class="col-xs-12">
					                                    <div class="cardReadImg">
					                                        <div><img src="${pageContext.request.contextPath}/assets/img/card/slideLeft.png"></div>
					                                        <div><img src="${pageContext.request.contextPath}/assets/img/card/img1.jpg" alt=""></div>
					                                        <div><img src="${pageContext.request.contextPath}/assets/img/card/img2.jpg" alt=""></div>
					                                        <div><img src="${pageContext.request.contextPath}/assets/img/card/img3.jpg" alt=""></div>
					                                        <div><img src="${pageContext.request.contextPath}/assets/img/card/img4.jpg" alt=""></div>
					                                        <div><img src="${pageContext.request.contextPath}/assets/img/card/img5.jpg" alt=""></div>
					                                        <div><img src="${pageContext.request.contextPath}/assets/img/card/slideRight.png"></div>
					                                        
					                                    </div>
					                                </div>
					                            </div>
					                        </div>
					                    </div>
					
					
					
					                    <div class="col-xs-6">
					                        <div class="row">
					                            <div class="col-xs-12 border-cardread2">
					                                <div class="cardRead-subcard">
					                                    <div class="imgdate">2022-02-03</div>
					                                    <img src="${pageContext.request.contextPath}/assets/img/card/img1.jpg" alt="">
					                                </div>
					                            </div>
					                        </div>
					                        <div class="row">
					                            <div class="col-xs-12">
					                                <div class="ment2">총 50개 댓글</div>
					                            </div>
					                        </div>
					                        <div class="row">
					                            <div class="col-xs-12">
					                                <div class="cardReadImg2">
					
					                                    <div><img src="${pageContext.request.contextPath}/assets/img/card/slideLeft.png"></div>
					                                    <div><img src="${pageContext.request.contextPath}/assets/img/card/img3.jpg" alt=""></div>
					                                    <div><img src="${pageContext.request.contextPath}/assets/img/card/img4.jpg" alt=""></div>
					                                    <div><img src="${pageContext.request.contextPath}/assets/img/card/img5.jpg" alt=""></div>
					                                    <div><img src="${pageContext.request.contextPath}/assets/img/card/img6.jpg" alt=""></div>
					                                    <div><img src="${pageContext.request.contextPath}/assets/img/card/img7.jpg" alt=""></div>
					                                    <div><img src="${pageContext.request.contextPath}/assets/img/card/slideRight.png"></div>
					                                    
					                                </div>
					                            </div>
					                        </div>
					                    </div>
					                </div>
					                <div class="row btnmargin">
					                    <div class="col-xs-12 btncenter">
					                        <a href="${pageContext.request.contextPath}/card/main" class="btn-ReadList" >리스트로 돌아가기</a><!--list페이지로 이동-->
					                        </div>
					                    </div>
					                </div>
								
	
                   		 	<!-- ---여기에 자신의 코드 작성--------------------------------------------------------------------------------- -->
					
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
</html>