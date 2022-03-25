<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>MyDeco</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/signup.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/js/bootstrap.min.js"></script>
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
					
						<div class="col-xs-12" id="main-content">
							<h3 class="subtitle">
								회원가입								
							</h3>

							<div id="main">
								<table id="s-table" style="width:100%">
									<colgroup>
										<col style="width: 20%; padding-left: 30px;">
										<col style="width: 60%">
										<col style="width: 20%">
									</colgroup>
									<tr>
										<td><label for="userId">아이디</label></td>
										<td><input id="userId" type="text" name="id" value=""
											placeholder="영문 또는 영문 혹은 숫자를 조합"></td>
										<td><input type="button" class="button" id="btnIdCheck"
											data-no="0" value="중복확인"></td>
									</tr>

									<tr>
										<td><label id="userPw">비밀번호</label></td>
										<td><input id="userPw" type="password" name="password"
											value="" placeholder="비밀번호를 입력해주세요"></td>
										<td></td>
									</tr>
									<tr>
										<td><label id="pwCheck">비밀번호 확인</label></td>
										<td><input id="pwCheck" type="password" name="pwcheck"
											value="" placeholder="비밀번호를 다시 한 번 입력해주세요"></td>
										<td></td>
									</tr>

									<tr>
										<td><label for="userName">이름</label></td>
										<td><input id="userName" type="text" name="name" value=""
											placeholder="이름을 입력해주세요"></td>
										<td></td>
									</tr>
									<tr>
										<td><label for="userSn">주민번호</label></td>
										<td><input id="userSn" type="text" name="pn1" value="">-<input
											type="password" name="pn2" value=""></td>
										<td></td>
									</tr>
									<tr>
										<td><label for="userHp">휴대폰</label></td>
										<td><input id="userHp" type="text" name="hp" value=""
											placeholder="숫자만 입력해주세요"></td>
										<td><input type="button" class="button" id="hpchkBtn"
											value="인증번호 받기"></td>
									</tr>

									<tr class="form-radio">
										<td><label for="gender" class="radio-label">성별</label></td>
										<td class="clearfix">
											<div class="form-radio-item">
												<input type="radio" name="gender" id="female" value="female">
												<label for="female">여자</label> <span class="check"></span>
											</div>
											<div class="form-radio-item">
												<input type="radio" name="gender" id="male" value="male">
												<label for="male">남자</label> <span class="check"></span>
											</div>
										</td>
										<td></td>
									</tr>
									<tr>
										<td><label for="mbti">MBTI</label></td>
										<td><select id="mbti" name="mbti" value="">
												<option value="">MBTI를 선택해주세요</option>
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
								<div id="submit">
									<input type="submit" id="submitBtn" value="가입하기">
								</div>
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
	$(document).ready(function (){
		console.log("시작");
	});
	
	$("#btnIdCheck").on("click", function() {
		$("#btnIdCheck").data("no", 1); console.log($("#btnIdCheck").data("no"));
		var keyword = $("#userId").val();
		
		$.ajax({			
			url : "${pageContext.request.contextPath}/my/idCheck",		
			type : "post",
			//contentType : "application/json",
			data : {keyword: keyword},

			dataType : "json",
			success : function(result){
				if(result == true) {
					alert("사용가능한 아이디입니다.")
				} else {
					alert("다른 아이디로 가입해주세요.");
				}														
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}				
		});
	});
	
	$("#submitBtn").on("click", function() {
		console.log("가입버튼");
		var id = $("[name='id']").val();
		var password = $("[name='password']").val();		
		var name = $("[name='name']").val();
		var personalNo = $("[name='pn1']").val() +"-"+ $("[name='pn2']").val();
		var hp = $("[name='hp']").val();
		var gender = $("[name='gender']").val();
		var mbti = $("[name='mbti']").val();
		
		var pwcheck = $("[name='pwcheck']").val();
		
		if(!id || !password || !name || !personalNo || !hp || !gender) {
			alert("필수입력사항을 모두 입력해주세요.");
			return false;
		} else if(password != pwcheck || !pwcheck) {
			alert("비밀번호를 다시 한 번 입력해주세요.");
			return false;
		} else if($("#btnIdCheck").data("no")==0) {
			alert("아이디 중복확인을 완료해주세요.");
			return false;
		}
		
		var userVo = {
			id: id,
			password: password,
			name: name,
			personalNo: personalNo,
			hp: hp,
			gender: gender,
			mbti: mbti
		}
		console.log(userVo);
		$.ajax({			
			url : "${pageContext.request.contextPath}/my/sign",		
			type : "get",
			//contentType : "application/json",
			data : userVo,

			dataType : "json",
			success : function(result){
				if(result == 'success') {
					alert("가입을 축하드립니다.");
					window.location.replace('${pageContext.request.contextPath}/main');
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}	
		}); 
	});
	
	// 임시 로그인 기능
	$("#loginBtn").on("click", function() {
		var id = $("[name='id']").val();
		var password = $("[name='password']").val();
		
		var userVo = {
			id: id,
			password: password
		}
		$.ajax({			
			url : "${pageContext.request.contextPath}/my/login",		
			type : "post",
			// contentType : "application/json",
			data : userVo,

			dataType : "json",
			success : function(result){
				if(result == 'fail') {
					alert("아이디 또는 비밀번호를 확인해주세요.");
					return false;
				} else {
					window.location.replace('${pageContext.request.contextPath}/my/pwcheck');
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}	
		});
	});
	
</script>
</html>