<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

					<div class="col-xs-3 " id="aside">
                        <ul>
                            <li class="title" style="pointer-events:none;">Shop</li>
                            <li><a class="happy" href="${pageContext.request.contextPath}/shopping/emotionMain?emotion=happy">기쁨</a></li>
                            <li><a class="sad" href="${pageContext.request.contextPath}/shopping/emotionMain?emotion=sad">슬픔</a></li>
                            <li><a class="angry" href="${pageContext.request.contextPath}/shopping/emotionMain?emotion=angry">화남</a></li>
                            <li><a class="annoyed" href="${pageContext.request.contextPath}/shopping/emotionMain?emotion=annoyed">짜증</a></li>
                            <li><a class="relieved" href="${pageContext.request.contextPath}/shopping/emotionMain?emotion=relieved">홀가분</a></li>
                        </ul>
                        <ul>
                        	<c:choose>
                        		<c:when test="${empty authUser}">
                        			<li><a class="color" href="${pageContext.request.contextPath}/loginForm">상품등록</a></li>                       		
                        		</c:when>
                        		<c:otherwise>
                            		<li><a class="color" href="${pageContext.request.contextPath}/myshop/addProduct">상품등록</a></li>
                            	</c:otherwise>
                            </c:choose>
                        </ul>                        
                    </div>