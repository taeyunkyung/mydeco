<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>MyDeco</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/mood.css">
<!-- 이부분에 이페이지에 필요한 css 추가 -->	    
	    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



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
					
						<c:import url="/WEB-INF/views/include/moodaside.jsp"></c:import>
					
						<div class="col-xs-9" id="main-content">  <!-- aside가 없으면 col-xs-12 사용 -->    			
							<h3 class="subtitle">
								심리 테스트
							</h3>
							
							<div id="main">
                   		 	<!-- ---여기에 자신의 코드 작성--------------------------------------------------------------------------------- -->
			
								<div id="mood-content">
									<section id="firstSection">
				                        <h2>속마음을 알아보는 심리 테스트</h2>
				                        <img id="magic-img" src="${pageContext.request.contextPath}/assets/img/mainbook_before_login.png"> 
				                        <p>
				                            당신은 어떤 유형일까요? 이번 기회에 알아봐요.
				                        </p>
				                        <button type="button" id="magic-btn" onclick="js:begin()">시작하기</button>
				                    </section>
				                
				                    <section id="qna">
				                        <div class="status">
				                            <div class="statusBar">
				                        </div>
				                          </div>
				                        <div class="qBox">
				                            
				                        </div>
				                        <div class="answerBox">
				        
				                        </div>
				                    </section>
				                
				                    <section id="result">
				                        <h2>당신의 결과는?</h2>
				                        <div class="resultname">
				
				                        </div>
				                        <div id="resultImg">
				
				                        </div>
				                        <div class="resultDesc">
				
				                        </div>
				                        <button type="button" id="magic-btn" onclick="">공유하기</button>
				                    </section>
				                    <script src="${pageContext.request.contextPath}/assets/js/data.js" charset="UTF-8"></script>
				                    <script src="${pageContext.request.contextPath}/assets/js/start.js" charset="UTF-8"></script>
			
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




</html>