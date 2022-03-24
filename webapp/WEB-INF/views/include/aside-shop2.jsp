<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

					<div class="col-xs-3" id="aside">                       
                        <ul>
                        	<c:choose>
                        		<c:when test="${empty authUser}">
                        			<li id="title" style="pointer-events:none;">My</li>                            
                            		<li><a href="${pageContext.request.contextPath}/loginForm">회원정보수정</a></li>
                   	         		<li><a href="${pageContext.request.contextPath}/loginForm">1:1 채팅내역</a></li>
                 	           		<li><a href="${pageContext.request.contextPath}/loginForm">찜한 상품</a></li>
                            		<li><a class="color" href="${pageContext.request.contextPath}/loginForm">나의 상품</a></li>
                            		<li><a class="color" href="${pageContext.request.contextPath}/loginForm">판매자등록</a></li>                        		
                        		</c:when>
                        		<c:otherwise>
                            		<li id="title" style="pointer-events:none;">My</li>                            
                            		<li><a href="${pageContext.request.contextPath}/my/modifyForm">회원정보수정</a></li>
                   	         		<li><a href="${pageContext.request.contextPath}/myshop/chatList">1:1 채팅내역</a></li>
                 	           		<li><a href="${pageContext.request.contextPath}/myshop/pickedProducts">찜한 상품</a></li>
                            		<li><a class="color" href="${pageContext.request.contextPath}/myshop/myProducts">나의 상품</a></li>
                            		<li><a class="color" href="">판매자등록</a></li>
                            	</c:otherwise>
                            </c:choose>
                        </ul>
                    </div>