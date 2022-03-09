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
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/user.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
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
							<td><input id="userId" type="text" name="id"
								value="${authUser.id}"></td>
						</tr>
						<tr>
							<td><label id="userPw">비밀번호</label></td>
							<td><input id="userPw" type="password" name="password"
								value="" placeholder="비밀번호를 입력해주세요"></td>
						</tr>
					</table>
					<div id="check">
						<input type="submit" id="submitBtn" value="확인">
					</div>
				</div>
				<!-- content -->
			</div> <!-- row -->
		</div> <!-- container -->
	</div> <!-- wrap -->
</body>

<script type="text/javascript">
	$("#submitBtn").on("click", function() {
		var password = $("[name='password']").val();
		console.log(password);
		
		$.ajax({			
			url : "${pageContext.request.contextPath}/my/pwchkResult",		
			//type : "post",
			//contentType : "application/json",
			//data : password,

			dataType : "json",
			success : function(targetPw){
				console.log(targetPw);
				console.log(password);
				if(targetPw == password) {
					window.location.replace('${pageContext.request.contextPath}/my/modifyForm');
				} else {
					alert("비밀번호를 확인해주세요");
					return false;
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}	
		});
		
	});
</script>

</html>