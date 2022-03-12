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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/card.css">
</head>

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

							<div class="card_list">
								<div id="card_tap">

									<div class="btn-card-write">
										<c:if test="${!empty authUser}">  
										<a href="${pageContext.request.contextPath}/card/write">카드 쓰기</a>
										</c:if>
									</div>
									<input id="tab1" type="radio" name="tabs" checked>
									<!--디폴트 메뉴-->
									<label for="tab1">작성 카드</label> <input id="tab2" type="radio"
										name="tabs"> <label for="tab2">받은 카드</label>

									<!-------section1----->
									<section id="content1">
										<div class="tap_content">



											<div class="row">
												<div class="col-xs-12">
													<div class="height500">
														<div class="row">
															<div class="col-xs-4">

																<div class="subcard">
																	<img
																		src="${pageContext.request.contextPath}/assets/img/card/img (1).jpg"
																		alt="">
																	<div class="imgdate">2022-03-03</div>
																	<div class="imgtext">
																		여러분<br>저 오늘 생일인데<br>축하해주세요♡
																	</div>
																	<div class="imgnum">답장10개</div>
																</div>

															</div>
															<div class="col-xs-4">
																<div class="subcard">
																	<img src="${pageContext.request.contextPath}/assets/img/card/img (2).jpg" alt="">
																	<div class="imgdate">2022-01-14</div>
																	<div class="imgtext">살쪄서 바지가 안맞아요 수선맛집 찾아요 관악구 위주!!</div>
																	<div class="imgnum">답장10개</div>
																</div>
															</div>
															<div class="col-xs-4">
																<div class="subcard">
																	<img src="${pageContext.request.contextPath}/assets/img/card/img (3).jpg" alt="">
																	<div class="imgdate">2022-01-01</div>
																	<div class="imgtext">취업이 하고싶어요ㅠㅠ제 고민 좀 들어주실분</div>
																	<div class="imgnum">답장10개</div>
																</div>
															</div>
														</div>


														<div class="row">
															<div class="col-xs-4">

																<div class="subcard">
																	<img
																		src="${pageContext.request.contextPath}/assets/img/card/img (4).jpg"
																		alt="">
																	<div class="imgdate">2021-12-01</div>
																	<div class="imgtext">
																		오늘밤 달이 차다<br>넌 내 생각을 할까?
																	</div>
																	<div class="imgnum">답장10개</div>
																</div>

															</div>

															<div class="col-xs-4">

																<div class="subcard">
																	<img
																		src="${pageContext.request.contextPath}/assets/img/card/img (5).jpg"
																		alt="">
																	<div class="imgdate">2021-12-25</div>
																	<div class="imgtext">짝사랑 그만하고 싶어요...하지만 포기가 되지
																		않네요</div>
																	<div class="imgnum">답장10개</div>
																</div>

															</div>

															<div class="col-xs-4">

																<div class="subcard">
																	<img
																		src="${pageContext.request.contextPath}/assets/img/card/img (6).jpg"
																		alt="">
																	<div class="imgdate">2021-12-24</div>
																	<div class="imgtext">내일 크리스마스인데 다들 솔크 맞죠??</div>
																	<div class="imgnum">답장10개</div>
																</div>

															</div>


														</div><!-- 여기까지 row -->

													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-xs-12">
													<div class="divPaging">
														<span>◀</span> <span>num</span> <span>▶</span>
													</div>
												</div>
											</div>
										</div>
										
									</section>
									<!------------------section1끝----------------------->
									<!------------------section2----------------------->
									<section id="content2">
										<div class="tap_content">

											<div class="row">
												<div class="col-xs-12">
													<div class="height500">
														<div class="row">
															<div class="col-xs-4">
																<div class="subcard">
																	<img
																		src="${pageContext.request.contextPath}/assets/img/img (7).jpg"
																		alt="">
																	<div class="imgdate">2022-03-07</div>
																	<div class="imgtext">심심한데 끝말잇기 하고 놀자</div>
																	<div class="imgnum">답장11개</div>
																</div>
																<div class="chk-subcard">
																	<input type="checkbox" class="chk-del" name="del" />
																</div>
															</div>
															<div class="col-xs-4">
																<div class="subcard">
																	<img
																		src="${pageContext.request.contextPath}/assets/img/img (8).jpg"
																		alt="">
																	<div class="imgdate">2022-03-01</div>
																	<div class="imgtext">오빠 여자친구를 봤는데 너무 예뻐요!!어떻게 우리
																		오빠랑..</div>
																	<div class="imgnum">답장3개</div>
																</div>
																<div class="chk-subcard">
																	<input type="checkbox" class="chk-del" name="del" />
																</div>
															</div>
															<div class="col-xs-4">
																<div class="subcard">
																	<img
																		src="${pageContext.request.contextPath}/assets/img/img (8).jpg"
																		alt="">
																	<div class="imgdate">2022-03-01</div>
																	<div class="imgtext">오빠 여자친구를 봤는데 너무 예뻐요!!어떻게 우리
																		오빠랑..</div>
																	<div class="imgnum">답장3개</div>
																</div>
																<div class="chk-subcard">
																	<input type="checkbox" class="chk-del" name="del" />
																</div>
															</div>
														</div><!-- 여기까지 row -->



														<div class="row">
															<div class="col-xs-4">
																<div class="subcard">
																	<img
																		src="${pageContext.request.contextPath}/assets/img/img (7).jpg"
																		alt="">
																	<div class="imgdate">2022-03-07</div>
																	<div class="imgtext">심심한데 끝말잇기 하고 놀자</div>
																	<div class="imgnum">답장11개</div>
																</div>
																<div class="chk-subcard">
																	<input type="checkbox" class="chk-del" name="del" />
																</div>
															</div>
															<div class="col-xs-4">
																<div class="subcard">
																	<img
																		src="${pageContext.request.contextPath}/assets/img/img (8).jpg"
																		alt="">
																	<div class="imgdate">2022-03-01</div>
																	<div class="imgtext">오빠 여자친구를 봤는데 너무 예뻐요!!어떻게 우리
																		오빠랑..</div>
																	<div class="imgnum">답장3개</div>
																</div>
																<div class="chk-subcard">
																	<input type="checkbox" class="chk-del" name="del" />
																</div>
															</div>
															<div class="col-xs-4">
																<div class="subcard">
																	<img
																		src="${pageContext.request.contextPath}/assets/img/img (8).jpg"
																		alt="">
																	<div class="imgdate">2022-03-01</div>
																	<div class="imgtext">오빠 여자친구를 봤는데 너무 예뻐요!!어떻게 우리
																		오빠랑..</div>
																	<div class="imgnum">답장3개</div>
																</div>
																<div class="chk-subcard">
																	<input type="checkbox" class="chk-del" name="del" />
																</div>
															</div>
														</div><!-- 여기까지 row -->
														


													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-xs-9">
													<div class="divPaging">
														<span>◀</span> <span>num</span> <span>▶</span>
													</div>
												</div>
												<div class="col-xs-3">
													<button class="btn-card-del" type="reset">삭제</button>
												</div>
											</div>
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
		</div>
	</div>
</body>
</html>