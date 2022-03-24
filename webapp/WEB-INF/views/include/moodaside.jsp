<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="col-xs-3" id="aside">
	<ul>
		<li id="title">Mood</li>
        <li><a href="${pageContext.request.contextPath}/mood/daily">마법의 소라고둥</a></li>
        <li><a href="${pageContext.request.contextPath}/mood/test">심리테스트</a></li>
	</ul>
</div>