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
	href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/card.css">
<body>
	<div class="wrap">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<!-- header -->
					<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
					<!-- header끝 -->
					<!--aside&contents-->
					<div class="row">
						<c:import url="/WEB-INF/views/include/mydiaryaside.jsp"></c:import>
						<!--aside 끝-->

						<!--contents 시작-->
						<div class="col-xs-9">
							<div id="cTitle">
								<h3>소통 카드</h3>
							</div>

							<div class="row">
								<div class="col-xs-12">


									<div class="card_list">
										<div id="card_tap">
											<div class="btn-card-write">
												<c:if test="${!empty authUser}">
													<a href="${pageContext.request.contextPath}/card/cardWriteForm">카드
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
												
													<div class="fitems">
														<img src="${pageContext.request.contextPath}/assets/img/card/img1.jpg">
														<div class="imgdate">${vo.sysdate}</div>
														<div class="imgtext">${vo.content}</div>
														<div class="imgnum">답장10개</div>
													</div>
													
												</div>
												<div class="row">
													<div class="col-xs-12">
														<div class="divPaging">
															<span>◀</span> <span>num</span> <span>▶</span>
														</div>
													</div>
												</div>

											</section>
											<!------------------section1끝----------------------->
											<!------------------section2----------------------->
											<section id="content2">
												<!-- <div class="tap_content"> -->

												<div class="flex-container">
												
												<c:forEach items="${bgList}" var="vo">
													<div class="fitems">
														<img src="${pageContext.request.contextPath}/assets/img/card/img1.jpg">
														<div class="imgdate">${vo.sysdate}</div>
														<div class="imgtext">${vo.content}</div>
														<div class="imgnum">${vo.cardImgNo}</div>
														<div class="chk-subcard">
															<input type="checkbox" class="chk-del" name="del" />
														</div>
													</div>
												</c:forEach>
												
												</div>

												<div class="row">
													<div class="divPaging">
														<span>◀</span> <span>num</span> <span>▶</span>
													</div>
													<button class="btn-card-del" type="reset">삭제</button>
												</div>

											</section>

											<!------------------section2끝----------------------->
										</div>
									</div>
								</div>
							</div>
							<!--aside&content끝-->
						</div>
					</div>
</body>
</html>