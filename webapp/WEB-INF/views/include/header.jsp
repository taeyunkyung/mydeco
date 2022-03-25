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
						<a href="">&#160; &#160; &#160; &#160; &#160; About</a>
						<div class="dropbtn">
							<ul class="dropdown-content">
								<li><a href="">이용 안내</a></li>
								<li><a href="">1대1 문의</a></li>
							</ul>
						</div>
					</li>
					
					<li class="dropdown">
						<a href="">&#160; &#160; &#160; Pen &#38; Paper</a>
						<div class="dropbtn">
							<ul class="dropdown-content">
                                <li><a href="${pageContext.request.contextPath}/diary/list">나의 일기</a></li>
                                <li><a href="${pageContext.request.contextPath}/card/main">소통카드</a></li>
                                <li><a href="${pageContext.request.contextPath}/letter">우체통</a></li>
							</ul>
						</div>
					</li>
					
					
					<li class="dropdown">
						<a href="${pageContext.request.contextPath}/shopping/main">&#160; &#160; Shopping</a>
					</li>
					
					
					<li class="dropdown">
						<a href="">&#160; &#160; &#160; &#160; &#160; Mood</a>
						<div class="dropbtn">
							<ul class="dropdown-content">
								<li><a href="${pageContext.request.contextPath}/mood/daily">마법의 소라고둥</a></li>
								<li><a href="${pageContext.request.contextPath}/mood/test">심리 테스트</a></li>
							</ul>
						</div>
					</li>
				
				</ul>
				 	<c:choose>
                    	<c:when test="${empty authUser}">
                    		<ul id="user" class="clearfix">
		                        <li><a href="${pageContext.request.contextPath}/loginForm">로그인</a></li>
		                        <li><a href="${pageContext.request.contextPath}/my/signup">회원가입</a></li>
		                    </ul>
                    	</c:when>
                    	<c:otherwise>
                    		 <ul id="user" class="clearfix">
		                        <li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
		                        <li><a href="${pageContext.request.contextPath}/my/signup">내정보</a></li>
		                    </ul>
                    	</c:otherwise>
                    </c:choose>
				
			</div>		
			  