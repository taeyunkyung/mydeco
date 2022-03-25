<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>MyDeco</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/modifyForm.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
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
				<div id="content" class="col-xs-12">
					
					<div class="row">
					
						<c:import url="/WEB-INF/views/include/aside-shop2.jsp"></c:import>

						<div class="col-xs-9" id="main-content">
							<h3 class="subtitle">회원 정보 수정</h3>

							<div id="main">
								<form action="${pageContext.request.contextPath}/my/modify">
									<table id="m-table">
										<tr>
											<td><label for="userId">아이디</label></td>
											<td><p id="userId">${userVo.id}</p></td>
											<td></td>
										</tr>

										<tr>
											<td><label id="userPw">현재 비밀번호</label></td>
											<td><p id="userPw">${userVo.password}</p></td>
											<td></td>
										</tr>
										<tr>
											<td><label id="newPw">새 비밀번호</label></td>
											<td><input id="newPw" type="password" name="password"
												value=""></td>
											<td></td>
										</tr>
										<tr>
											<td><label id="pwCheck">새 비밀번호 확인</label></td>
											<td><input id="pwCheck" type="password" name="pwcheck"
												value=""></td>
											<td></td>
										</tr>

										<tr>
											<td><label for="userName">이름</label></td>
											<td><p id="userName">${userVo.name}</p></td>
											<td></td>
										</tr>
										<tr>
											<td><label for="userSn">주민번호</label></td>
											<td><p id="pn1" data-no="${userVo.personalNo}"></p>-
												<p id="pn2">*******</p></td>
											<td></td>
										</tr>
										<tr>
											<td><label for="userHp">휴대폰</label></td>
											<td><input id="userHp" type="text" name="hp"
												value="${userVo.hp}" placeholder="숫자만 입력해주세요"></td>
											<td><input type="button" class="button" value="다른번호 인증"></td>
										</tr>

										<tr>
											<td><label for="gender">성별</label></td>
											<td id="gender" data-gender="${userVo.gender}"><p></p></td>
											<td></td>
										</tr>
										<tr>
											<td><label for="mbti">MBTI</label></td>
											<td><select id="mbti" data-mbti="${userVo.mbti}"
												name="mbti" value="${userVo.mbti}">
													<option value="ISTJ">ISTJ</option>
													<option value="ISTP">ISTP</option>
													<option value="ISFJ">ISFJ</option>
													<option value="ISFP">ISFP</option>
													<option value="INFJ">INFJ</option>
													<option value="INFP">INFP</option>
													<option value="INTJ">INTJ</option>
													<option value="INTP">INTP</option>
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
										<input id="leaveBtn" type="button" class="button" value="탈퇴하기">
										<input type="submit" id="submitBtn" value="수정하기">
									</div>
								</form>
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
	
	$(document).ready(function() {
		var personalNo = $("#pn1").data("no");
		var arr = personalNo.split('-');
		$("#pn1").text(arr[0]);
		
		var eng = $("#gender").data("gender");
		if(eng=='male') {
			$("#gender").text("남자");
		} else if(eng=='female') {
			$("#gender").text("여자");
		}
		
		var mbti = $("#mbti").data("mbti");
		$("#mbti").val(mbti).prop("selected", true);
	});
	
	$("#submitBtn").on("click", function() {
		var password = $("[name='password']").val();
		var pwcheck = $("[name='pwcheck']").val();
		if(password != pwcheck || !pwcheck) {
			alert("비밀번호를 다시 한 번 입력해주세요.");
			return false;
		} 
	})
	
	$("#leaveBtn").on("click", function() {
		window.location.href = "${pageContext.request.contextPath}/my/leave";
	});
</script>
</html>