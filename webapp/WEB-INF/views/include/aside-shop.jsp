<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

					<div class="col-xs-3 " id="aside">
                        <ol>
                            <li class="title">Shop</li>
                            <li><a id="yellow" href="${pageContext.request.contextPath}/shopping/emotionMain?emotion=happy">기쁨</a></li>
                            <li><a id="blue" href="${pageContext.request.contextPath}/shopping/emotionMain?emotion=sad">슬픔</a></li>
                            <li><a id="orange" href="${pageContext.request.contextPath}/shopping/emotionMain?emotion=angry">화남</a></li>
                            <li><a id="green" href="${pageContext.request.contextPath}/shopping/emotionMain?emotion=annoyed">짜증</a></li>
                            <li><a id="pink" href="${pageContext.request.contextPath}/shopping/emotionMain?emotion=relieved">홀가분</a></li>
                        </ol>
                        <ol>
                            <li class="title">My</li>                            
                            <li><a href="${pageContext.request.contextPath}/my/modifyForm">회원정보수정</a></li>
                            <li><a href="${pageContext.request.contextPath}/myshop/chatList">1:1 채팅내역</a></li>
                            <li><a href="${pageContext.request.contextPath}/myshop/pickedProducts">찜한 상품</a></li>
                            <li><a class="color" href="${pageContext.request.contextPath}/myshop/myProducts">나의 상품</a></li>
                            <li><a class="color" href="${pageContext.request.contextPath}/myshop/beSeller">판매자등록</a></li>
                        </ol>
                    </div>