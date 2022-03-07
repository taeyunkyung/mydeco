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
<link rel="stylesheet" href="./assets/css/user.css">
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
						<table id="l-table">
							<tr>
								<td colspan="2" id="n-sub">
									<h3>탈퇴하기</h3>
								</td>
							</tr>
							<tr>
								<td><label for="notice">회원탈퇴안내</label></td>
								<td>
									<p>개인정보가 삭제됩니다 어쩌구 저쩌구</p>
								</td>
							</tr>
							<tr>
								<td><label id="userPw">비밀번호 확인</label></td>
								<td><input id="userPw" type="password" name="" value=""
									placeholder="비밀번호를 입력해주세요"></td>
							</tr>
							<tr>
								<td><label for="write">무엇이 불편하였나요?</label></td>
								<td><textarea id="write" placeholder="불편했던 사항을 자유롭게 입력해주세요"></textarea></td>
							</tr>
						</table>
						<div id="modify">
							<input type="button" class="button" value="취소"> <input
								type="submit" id="submitBtn" value="탈퇴">
						</div>
					</form>
				</div> <!-- content -->
			</div> <!-- row -->
		</div> <!-- container -->
	</div> <!-- wrap -->
</body>
</html>