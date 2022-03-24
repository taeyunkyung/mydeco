<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
			<div class="col-xs-12" id="header" class="clearfix">
				<h1>
					<a href="${pageContext.request.contextPath}/main">
						<img id="logo" src="${pageContext.request.contextPath}/assets/img/logo.png">
					</a>
				</h1>
				
				
				<ul id="category" class="clearfix">
				
					<li class="dropdown">
						<a href="">About</a>
						<div class="dropbtn">
							<ul class="dropdown-content">
								<li><a href="">이용 안내</a></li>
								<li><a href="">1대1 문의</a></li>
							</ul>
						</div>
					</li>
					
					<li class="dropdown">
						<a href="">Pen &#38; Paper</a>
						<div class="dropbtn">
							<ul class="dropdown-content">
                                <li><a href="${pageContext.request.contextPath}/diary/list">나의 일기</a></li>
                                <li><a href="${pageContext.request.contextPath}/card/main">소통카드</a></li>
                                <li><a href="${pageContext.request.contextPath}/letter">우체통</a></li>
							</ul>
						</div>
					</li>
					
					
					<li class="dropdown">
						<a href="">Shopping</a>
					</li>
					
					
					<li class="dropdown">
						<a href="">Mood</a>
						<div class="dropbtn">
							<ul class="dropdown-content">
								<li><a href="">마법의 소라고둥</a></li>
								<li><a href="">심리 테스트</a></li>
							</ul>
						</div>
					</li>
				
				</ul>
				<ul id="user" class="clearfix">
				
                  	<li><a href="${pageContext.request.contextPath}/loginForm">로그인</a></li>
                    <li><a href="${pageContext.request.contextPath}/my/signup">회원가입</a></li>
                </ul>
				
			</div>		
			  