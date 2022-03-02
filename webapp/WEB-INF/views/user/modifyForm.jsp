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
<link rel="stylesheet" href="./assets/css/modifyForm.css">
</head>

<body>
	<div id="wrap">
		<div id="container">
			<div id="row">
			
				<!-- header -->
				<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
				
				<!-- aside -->
				<c:import url="/WEB-INF/views/include/aside.jsp"></c:import>
				
				<!-- content -->
				<div class="col-xs-9" id="main-content">
                        <form action="" method="">
                            <table id="m-table">
                                <tr>
                                    <td id="sub" colspan="3">
                                        <h3>회원정보수정</h3>
                                    </td>
                                </tr>
        
                                <tr>
                                    <td><label for="userId">아이디</label></td>
                                    <td><input id="userId" type="text" name="" value="수정불가"></td>
                                    <td></td>
                                </tr>
        
                                <tr>
                                    <td><label id="userPw">현재 비밀번호</label></td>
                                    <td><input id="userPw" type="password" name="" value=""></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><label id="pwCheck">새 비밀번호</label></td>
                                    <td><input id="pwCheck" type="password" name="" value=""></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><label id="pwCheck">새 비밀번호 확인</label></td>
                                    <td><input id="pwCheck" type="password" name="" value=""></td>
                                    <td></td>
                                </tr>
        
                                <tr>
                                    <td><label for="userName">이름</label></td>
                                    <td><input id="userName" type="text" name="" value="수정불가"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><label for="userSn">주민번호</label></td>
                                    <td><input id="userSn" type="text" name="userSn" value="수정불가">-<input type="password"
                                            name="userSn" value="수정불가">
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><label for="userHp">휴대폰</label></td>
                                    <td><input id="userHp" type="text" name="" value="" placeholder="숫자만 입력해주세요"></td>
                                    <td><input type="button" class="button" value="다른번호 인증"></td>
                                </tr>
        
                                <tr class="form-radio">
                                    <td><label for="gender" class="radio-label">성별</label></td>
                                    <td class="clearfix">
                                        <div class="form-radio-item">
                                            <input type="radio" name="gender" id="female" checked="checked">
                                            <label for="female">여자</label>
                                            <span class="check"></span>
                                        </div>
                                        <div class="form-radio-item">
                                            <input type="radio" name="gender" id="male">
                                            <label for="male">남자</label>
                                            <span class="check"></span>
                                        </div>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><label for="mbti">MBTI</label></td>
                                    <td>
                                        <select id="mbti" name="" value="">
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
                                        </select>
                                    </td>
                                    <td></td>
                                </tr>
                            </table>
                            <div id="modify">
                                <input type="button" class="button" value="탈퇴하기">
                                <input type="submit" id="submitBtn" value="수정하기">
                            </div>
                        </form>
                    </div> <!-- content -->				
			</div> <!-- row -->
		</div> <!-- container -->
	</div> <!-- wrap -->
</body>
</html>