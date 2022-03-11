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
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/modifyForm.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
</head>

<body>
	<div id="wrap">
		<div id="container">
			<div id="row">
			
				<!-- header -->
				<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
				
				<!-- aside -->
				<c:import url="/WEB-INF/views/include/aside-shop.jsp"></c:import>
				
				<!-- content -->
				<div class="col-xs-9" id="main-content">

					<table id="m-table">
						<tr>
							<td id="sub" colspan="3">
								<h3>회원정보수정</h3>
							</td>
						</tr>

						<tr>
							<td><label for="userId">아이디</label></td>
							<td><p id="userId">${authUser.id}</p></td>
							<td></td>
						</tr>

						<tr>
							<td><label id="userPw">현재 비밀번호</label></td>
							<td><input id="userPw" type="password" name="old" value=""></td>
							<td></td>
						</tr>
						<tr>
							<td><label id="newPw">새 비밀번호</label></td>
							<td><input id="newPw" type="password" name="password" value=""></td>
							<td></td>
						</tr>
						<tr>
							<td><label id="pwCheck">새 비밀번호 확인</label></td>
							<td><input id="pwCheck" type="password" name="pwcheck" value=""></td>
							<td></td>
						</tr>

						<tr>
							<td><label for="userName">이름</label></td>
							<td><p id="userName">${userVo.name}</p></td>
							<td></td>
						</tr>
						<tr>
							<td><label for="userSn">주민번호</label></td>
							<td><input id="pn1" type="text" name="userSn"
								value="">-<input id="pn2" type="password" name="userSn"
								value=""></td>
							<td></td>
						</tr>
						<tr>
							<td><label for="userHp">휴대폰</label></td>
							<td><input id="userHp" type="text" name="hp" value=""
								placeholder="숫자만 입력해주세요"></td>
							<td><input type="button" class="button" value="다른번호 인증"></td>
						</tr>

						<tr>
							<td><label for="gender">성별</label></td>
							<td id="gender"><p>${userVo.gender}</p></td>
							<td></td>
						</tr>
						<tr>
							<td><label for="mbti">MBTI</label></td>
							<td><select id="mbti" name="">
									<option value="ISTJ">ISTJ</option>
									<option value="ISTP">ISTP</option>
									<option value="ISFJ">ISFJ</option>
									<option value="ISFP">ISFP</option>
									<option value="INFJ">INFJ</option>
									<option value="INFP">INFP</option>
									<option value="INTJ">INTJ</option>
									<option value="INTP" selected="selected">INTP</option>
									<option value="ESTP">ESTP</option>
									<option value="ESTJ">ESTJ</option>
									<option value="ESFP">ESFP</option>
									<option value="ESFJ">ESFJ</option>
									<option value="ENFP">ENFP</option>
									<option value="ENFJ">ENFJ</option>
									<option value="ENTP">ENTP</option>
									<option value="ENTJ">ENTJ</option>
							</select></td>
							<td></td>
						</tr>
					</table>
					<div id="modify">
						<input type="button" class="button" value="탈퇴하기"> <input
							type="submit" id="submitBtn" value="수정하기">
					</div>
           		</div> <!-- content -->				
			</div> <!-- row -->
		</div> <!-- container -->
	</div> <!-- wrap -->
</body>

<script type="text/javascript"></script>

</html>