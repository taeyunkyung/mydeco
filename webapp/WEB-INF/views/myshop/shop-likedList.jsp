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
				<c:import url="/WEB-INF/views/include/aside.jsp"></c:import>
				
				<!-- content -->
				<div class="col-xs-9" id="main-content">
					<div id="div-sub">
						<h3>찜한 상품</h3>
					</div>
					<div class="searchTop">
						<select id="keyword-cate" name="" value="">
							<option value="">선택</option>
							<option value="userId">아이디</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select> <input type="text" id="keyword" name="" value=""
							placeholder="검색어를 입력해주세요">
						<button id="searchBtn">
							<img id="btnImg" src="${pageContext.request.contextPath}/assets/img/magnifying-glass.png">
						</button>
						<input class="adddelBtn button" type="button" value="새상품등록">
						<input class="adddelBtn button" type="button" value="목록에서삭제">
					</div>
					<div id="product-area">
						<ol>
							<li><img class="prod-img">
								<div class="info">
									<p class="emo-tag" color="blue">홀가분</p>
									/
									<p>아이디</p>
									<h4>상품이름</h4>
									<p>가격</p>
									<p>배송방법</p>

									<div class="etc">
										<label for="diaryCnt">일기: </label>4개 <label for="cmtCnt">댓글:
										</label>23개 <label for="likedCnt">찜: </label>10개 <input class="delChk"
											type="checkbox">
									</div>
								</div></li>
							<li><img class="prod-img">
								<div class="info">
									<p class="emo-tag" color="blue">홀가분</p>
									/
									<p>아이디</p>
									<h4>상품이름</h4>
									<p>가격</p>
									<p>배송방법</p>

									<div class="etc">
										<label for="diaryCnt">일기: </label>4개 <label for="cmtCnt">댓글:
										</label>23개 <label for="likedCnt">찜: </label>10개 <input class="delChk"
											type="checkbox">
									</div>
								</div></li>
							<li><img class="prod-img">
								<div class="info">
									<p class="emo-tag" color="blue">홀가분</p>
									/
									<p>아이디</p>
									<h4>상품이름</h4>
									<p>가격</p>
									<p>배송방법</p>

									<div class="etc">
										<label for="diaryCnt">일기: </label>4개 <label for="cmtCnt">댓글:
										</label>23개 <label for="likedCnt">찜: </label>10개 <input class="delChk"
											type="checkbox">
									</div>
								</div></li>
							<li><img class="prod-img">
								<div class="info">
									<p class="emo-tag" color="blue">홀가분</p>
									/
									<p>아이디</p>
									<h4>상품이름</h4>
									<p>가격</p>
									<p>배송방법</p>

									<div class="etc">
										<label for="diaryCnt">일기: </label>4개 <label for="cmtCnt">댓글:
										</label>23개 <label for="likedCnt">찜: </label>10개 <input class="delChk"
											type="checkbox">
									</div>
								</div></li>
						</ol>
					</div>
				</div> <!-- content -->
			</div>	<!-- row -->
		</div> <!-- container -->
	</div> <!-- wrap -->
</body>
</html>