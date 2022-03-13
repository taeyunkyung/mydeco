<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
				
				<div class="col-xs-12" id="header">
                    <h1>
                        <a href="${pageContext.request.contextPath}/main"><img id="logo" src="${pageContext.request.contextPath}/assets/img/logo.png"></a>
                    </h1>
            
                    <ul id="category" class="clearfix">
                        <div class="dropdown">
                            <li class="dropbtn"><a href="">About</a></li>
                            <ul class="dropdown-content">
                                <li><a href="">이용 안내</a></li>
                                <li><a href="">1대1 문의</a></li>
                            </ul>
                        </div>
                        <div class="dropdown">
                            <li class="dropbtn"><a href="${pageContext.request.contextPath}/diary/list">Pen & Paper</a></li>
                            <ul class="dropdown-content">
                                <li><a href="${pageContext.request.contextPath}/diary/list">나의 일기</a></li>
                                <li><a href="${pageContext.request.contextPath}/card/cardMain">카드</a></li>
                                <li><a href="">우체통</a></li>
                            </ul>
                        </div>
                        <div class="dropdown">
                            <li class="dropbtn"><a href="${pageContext.request.contextPath}/shopping/main">Shopping</a></li>
                        </div>
                        <div class="dropdown">
                            <li class="dropbtn"><a href="">Mood</a></li>
                            <ul class="dropdown-content">
                                <li><a href="${pageContext.request.contextPath}/mood/daily">마법의 소라고둥</a></li>
                                <li><a href="">심리 테스트</a></li>
                            </ul>
                        </div>
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