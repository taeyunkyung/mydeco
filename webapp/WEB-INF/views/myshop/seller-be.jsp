<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Deco</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/shop-my.css">
</head>
<body>
	<div id="wrap">
		<div class="container">
			<div class="row">
				
				<!-- header -->
				<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
				
				<!-- aside -->
				<c:import url="/WEB-INF/views/include/aside-shop.jsp"></c:import>
				
				<!-- content -->
				<div class="col-xs-9" id="main-content">
					<div id="bs-list">
						<div class="head">
							<div class="title">아이디</div>
						</div>
						<ul>
							<li>
								<div class="li-div">
									블로그 생성일 <input id="startdate" type="text" name="" value="자동출력">
								</div>
							</li>
							<li>
								<div class="li-div">
									블로그 게시물 수 <input id="totalcnt" type="text" name="" value="자동출력">
								</div>
							</li>
							<li>
								<div class="li-div">
									가입가능 여부 확인하기 <input id="result" type="text" name=""
										value="결과출력"> <input type="button" class="button"
										id="r-button" value="확인">
								</div>
							</li>
							<li>
								<div id="submit">
									<input type="submit" id="submitBtn" value="판매자 등록하기">
								</div>
							</li>
						</ul>
					</div> <!-- bs-list -->
				</div> <!-- content -->
				
				<!-- footer -->
				<c:import url="/WEB-INF/views/include/footer.jsp"></c:import> 
			
			</div> <!-- row -->
		</div> <!-- container -->
	</div> <!-- wrap -->
</body>
</html>