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
				<div id= "content" class="col-xs-12">
					
					<div class="row">

				
						<c:import url="/WEB-INF/views/include/moodaside.jsp"></c:import>
						
						
						<div class="col-xs-9" id="main-content">   <!-- aside가 없으면 col-xs-12 사용 -->    
		
							 <h3 class="subtitle">
		                     	마법의 소라고둥
		                     </h3>
							
							 <div id="main">
                    		 	<!-- ---여기에 자신의 코드 작성--------------------------------------------------------------------------------- -->
									
									<div id="mood-content">
										
										<section id="firstSection">
					
					                        <h2>오늘의 운세를 알려주는 마법의 소라고둥</h2>
					                        <img id="daily-img" src="${pageContext.request.contextPath}/assets/img/whelk.png"> 
					                        <p>
					                         
					                        </p>
					                        
					                        <input type="button" class="daily-btn" onclick="js:begin()" value="네">
					                        <input type="button" id="N" style="position: relative;" class="daily-btn" onmouseover="js:run()" value="아니오">
					                     
					                    </section>
					                
					                    <section id="result">
					                        <h2>오늘의 운세는...</h2>
					                        <div id="resultDesc">
					                            <span></span>
					                        </div>
					                        <div>
					                            <img id="resultImg2" src="${pageContext.request.contextPath}/assets/img/best.png">
					                        </div>
					                        <button type="button" id="magic-btn" onclick="window.location.reload()">다시하기</button>
					                        <!-- <button type="button" id="magic-btn" onclick="">기록하기</button> -->
					                    </section>
									
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
	<script src="${pageContext.request.contextPath}/assets/js/random.js"></script>
</body>




</html>