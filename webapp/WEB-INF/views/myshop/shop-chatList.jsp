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
					<div id="div-sub">
						<h3>1:1 채팅 목록</h3>
					</div>
					<div id="c-list">
						<div id="chat-list">
							<ol>
								<li>
									<p>상품이름: 20대를 함께한...</p>
									<div class="btn-area">
										<input type="button" class="details-btn" value="상세보기">
										<p>판매자 아이디</p>
									</div>
								</li>
								<li>
									<p>상품이름: 20대를 함께한...</p>
									<div class="btn-area">
										<input type="button" class="details-btn" value="상세보기">
										<p>판매자 아이디</p>
									</div>
								</li>
							</ol>
						</div>
						<div id="chat-box">
							<ol id="chat">
                                    <li class="l-align">
                                        <p>아이디</p><br>
                                        <p class="l-answ">상대 답변</p>
                                    </li>
                                    <li class="r-align">                                        
                                        <p>나의 답변</p>
                                    </li>
                                    <li class="l-align">
                                        <p>아이디</p><br>
                                        <p class="l-answ">상대 답변상대 답변상대 답변</p>
                                    </li>
                                    <li class="r-align">                                        
                                        <p>나의 답변나의 답변나의 답변나의 답변나의 답변</p>
                                    </li>
                                     <li class="l-align">
                                        <p>아이디</p><br>
                                        <p class="l-answ">상대 답변상대 답변상대 답변</p>
                                    </li>
                                    <li class="r-align">                                        
                                        <p>나의 답변나의 답변나의 답변나의 답변</p>
                                    </li>
                                </ol>

							<form>
								<div id="type">
									<textarea id="typearea"></textarea>
								</div>
								<div id="send-area">
									<input type="button" class="send-btn" value="전송"> <input
										type="button" class="send-btn" value="삭제">
								</div>
							</form>
						</div>
					</div>
				</div> <!-- content -->
			</div> <!-- row -->
		</div> <!-- container -->
	</div> <!-- wrap -->
</body>
</html>