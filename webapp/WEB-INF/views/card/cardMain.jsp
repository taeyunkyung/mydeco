<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html lang="ko">
<!-- 한국어문서만 검색할때, 음성으로 할때 한국어 음성지원 -->
<head>
<meta charset="UTF-8">
<!-- 브라우저가 문서를 해석할때 필요한 정보 -->
<title>Mydeco</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/card.css">
	
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/js/bootstrap.js"></script>
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
								
									<div class="card_list">
										<div id="card_tap">
											<div class="btn-card-write">
												<c:if test="${!empty authUser}"><!-- 클릭시 로그인 후 사용가능한 서비스입니다 뜨면서 회원가입 페이지로 이동되게끔 -->
													<a href="${pageContext.request.contextPath}/card/cardWriteForm" id="notSign">카드
														쓰기</a>
												</c:if>
											</div>

											<input id="tab1" type="radio" name="tabs" checked>
											<!--디폴트 메뉴-->
											<label for="tab1">작성 카드</label> <input id="tab2" type="radio"
												name="tabs"> <label for="tab2">받은 카드</label>



											<!-------section1----->
											<section id="content1">
												<!-- <div class="tap_content"> -->

												
												<div class="flex-container">
												<!-- for문으로 돌리는구간 -->
												
												<c:forEach items="${mainMap.cardList}" var="cardVo">
													<div class="fitems">
														<img src="${cardVo.cardImgSrc}">
														<div class="imgdate">${cardVo.cardRegdate}</div>
														<a href="${pageContext.request.contextPath}/card/cardReadForm?cardNo=${cardVo.cardNo}">
														<div class="imgtext">${cardVo.cardContent}</div>
														</a>
														<div class="imgnum">답장 ${cardVo.count}개</div>
													</div>
												</c:forEach>	
													
												<!-- for문으로 돌리기끝 -->
											
												</div>
												<div class="row">
													<div class="col-xs-12">
														<div class="divPaging">
															<span>◀</span> 
															<span>1</span>
															<span>2</span>
															<span>3</span>
															<span>4</span> 
															<span>5</span>  
															<span>▶</span>
														</div>
													</div>
												</div>

											</section>
											<!------------------section1끝----------------------->
											<!------------------section2----------------------->
											<section id="content2">
												<!-- <div class="tap_content"> -->
												
												<div class="flex-container">
													<c:forEach items="${mainMap.replyCardList}" var="replyVo">
												 		<div class="fitems">
															<img src="${replyVo.cardImgSrc}">
															<div class="imgdate">${replyVo.replyRegdate}</div>
															<a href="${pageContext.request.contextPath}/card/replyReadForm?cardNo=${replyVo.cardNo}">
																<div class="imgtext">${replyVo.replyContent}</div>
															</a>
															<div class="imgnum">답장${replyVo.count}개</div>
															<div class="chk-subcard"><input type="checkbox" class="chk-del" name="del" /></div>
														</div>
													</c:forEach>
												</div>
												
												<div class="row">
													<div class="divPaging">
														<span>◀</span> 
														<span>1</span>
														<span>2</span>
														<span>3</span>
														<span>4</span> 
														<span>5</span>  
														<span>▶</span>
													</div>
													<button class="btn-card-del" type="reset">삭제</button>
												</div>

											</section>

											<!------------------section2끝----------------------->
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
	$("#notSign").on("click",function(){
	alert("로그인 후 이용 가능한 서비스입니다.");	
	
	setTimeout(function(){
		location.href="${pageContext.request.contextPath}/mydeco/loginForm";
	},1000);
	
	});
	
	</script>
</html>