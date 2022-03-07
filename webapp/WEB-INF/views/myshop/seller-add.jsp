<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Deco</title>

<link rel="stylesheet"
	href="./assets/bootstrap/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="./assets/css/main.css">
<link rel="stylesheet" href="./assets/css/shop-my.css">
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
					<form action="" method="">
						<table id="a-table">
							<tr>
								<td id="sub" colspan="2">
									<h3>새 상품 등록</h3>
								</td>
							</tr>

							<tr>
								<td><label for="prod-title">상품 이름</label></td>
								<td><input id="prod-title" type="text" name="" value=""></td>
							</tr>
							<tr>
								<td><label for="prod-emo">감정</label></td>
								<td class="a-chk">
									<div class="form-radio-item">
										<input type="radio" name="emotion" id="happy"> <label
											for="happy">기쁨</label> <span class="check"></span>
									</div>
									<div class="form-radio-item">
										<input type="radio" name="emotion" id="sad"> <label
											for="sad">슬픔</label> <span class="check"></span>
									</div>
									<div class="form-radio-item">
										<input type="radio" name="emotion" id="angry"> <label
											for="angry">화남</label> <span class="check"></span>
									</div>
									<div class="form-radio-item">
										<input type="radio" name="emotion" id="annoyed"> <label
											for="annoyed">짜증</label> <span class="check"></span>
									</div>
									<div class="form-radio-item">
										<input type="radio" name="emotion" id="relieved"> <label
											for="relieved">홀가분</label> <span class="check"></span>
									</div>
								</td>
							</tr>
							<tr>
								<td><label for="prod-price">가격</label></td>
								<td><input id="prod-price" type="text" name="price"
									value=""> 원</td>
							</tr>
							<tr>
								<td><label for="prod-deliv">배송방법</label></td>
								<td class="a-chk">
									<div class="form-radio-item">
										<input type="radio" name="delivery" id="post"> <label
											for="post">택배</label> <span class="check"></span>
									</div>
									<div class="form-radio-item">
										<input type="radio" name="delivery" id="meet"> <label
											for="meet">직거래</label> <span class="check"></span>
									</div>
								</td>
							</tr>
							<tr>
								<td><label for="img-td">이미지</label></td>
								<td id="img-td"><label for="prod-img">이미지 추가</label> <input
									id="prod-img" type="file">
									<div id="img-area">
										<ul>
											<li class="img-img"></li>
											<li class="img-img"></li>
											<li class="img-img"></li>
											<li class="img-img"></li>
										</ul>
									</div>
									<button id="next">▶</button></td>
							</tr>
							<tr>
								<td><label for="prod-story">상품설명</label></td>
								<td><textarea id="prod-story"></textarea></td>
							</tr>
							<tr>
								<td><label for="diary-td">일기</label></td>
								<td id="diary-td"><label for="prod-diary">일기 추가</label> <input
									id="prod-diary" type="file"></td>
							</tr>
						</table>
					</form>
				</div> <!-- content -->
			</div> <!-- row -->
		</div> <!-- container -->
	</div> <!-- wrap -->
</body>
</html>