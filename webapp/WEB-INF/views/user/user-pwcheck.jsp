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
				<div class="col-xs-9 " id="main-content">
					<form action="" method="">
						<table id="c-table">
							<tr>
								<td colspan="2">
									<h3 id="bt">비밀번호 재확인</h3>
								</td>
							</tr>
							<tr>
								<td id="sub" colspan="2">* 정보보호를 위해 비밀번호를 한 번 더 입력해주세요</td>
							</tr>

							<tr>
								<td><label for="userId">아이디</label></td>
								<td><input id="userId" type="text" name="" value="자동채움"></td>
							</tr>
							<tr>
								<td><label id="userPw">비밀번호</label></td>
								<td><input id="userPw" type="password" name="" value=""
									placeholder="비밀번호를 입력해주세요"></td>
							</tr>
						</table>
						<div id="check">
							<input type="submit" id="submitBtn" value="확인">
						</div>
					</form>
				</div> <!-- content -->
			</div> <!-- row -->
		</div> <!-- container -->
	</div> <!-- wrap -->
</body>
</html>