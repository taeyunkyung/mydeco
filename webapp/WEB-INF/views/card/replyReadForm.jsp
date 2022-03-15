	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="utf-8">
	        <meta name="viewport" content="width=device-width, initial-scale=1">
	        <title>Mydeco</title>
	        
	        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.min.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/main.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/card.css">
	        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/> 
	        <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	
	</head>
	
	    <body>
	        <div class="wrap">
	            <div class="container">
	                <div class="row">
	                <!-- header -->
				<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	   			<!-- header끝 -->
	               <!--contents-->
	               <div class="row">
	                   <div class="col-xs-12">
	                       <div id="fTitle">
	                           <h3>소통 카드</h3>
	                       </div>
	                   </div>
	               </div>  
	               <div class="row">
	                   <div class="col-xs-6">
	                       <div class="row">
	                           <div class="col-xs-12 border-cardread"><!--내가 작성한 카드-->
	                               <div class="cardRead-subcard">
	                                   <div class="imgdate">2022-02-03</div>
	                                   <img src="${pageContext.request.contextPath}/assets/img/card/img (7).jpg" alt="">
	                               </div>
	                           </div>
	                       </div>
	                       <div class="row">
	                           <div class="col-xs-12">
	                               <div class="ment">나님이 댓글 작성한 최근 카드</div>
	                           </div>
	                           <div class="row">
	                               <div class="col-xs-12">
	                                   <div class="cardReadImg">
	                                       <div><img src="${pageContext.request.contextPath}/assets/img/card/slideLeft.png"></div>
	                                       <div><img src="${pageContext.request.contextPath}/assets/img/card/img (1).jpg" alt=""></div>
	                                       <div><img src="${pageContext.request.contextPath}/assets/img/card/img (2).jpg" alt=""></div>
	                                       <div><img src="${pageContext.request.contextPath}/assets/img/card/img (3).jpg" alt=""></div>
	                                       <div><img src="${pageContext.request.contextPath}/assets/img/card/img (4).jpg" alt=""></div>
	                                       <div><img src="${pageContext.request.contextPath}/assets/img/card/img (5).jpg" alt=""></div>
	                                       <div><img src="${pageContext.request.contextPath}/assets/img/card/slideRight.png"></div>
	                                       
	                                   </div>
	                               </div>
	                           </div>
	                       </div>
	                   </div>
	
	
	
	                   <div class="col-xs-6">
	                       <div class="row">
	                           <div class="col-xs-12 border-cardread">
	                               <div class="cardRead-subcard">
	                                   <div class="imgdate">2022-02-03</div>
	                                   <img src="${pageContext.request.contextPath}/assets/img/img (1).jpg" alt="">
	                               </div>
	                           </div>
	                       </div>
	                       <div class="row">
	                           <div class="col-xs-12">
	                               <div class="ment">총 50개 댓글</div>
	                           </div>
	                           <div class="row">
	                               <div class="col-xs-12">
	                                   <div class="cardReadImg">
	
	                                       <div><img src="${pageContext.request.contextPath}/assets/img/slideLeft.png"></div>
	                                       <div><img src="${pageContext.request.contextPath}/assets/img/img (3).jpg" alt=""></div>
	                                       <div><img src="${pageContext.request.contextPath}/assets/img/img (4).jpg" alt=""></div>
	                                       <div><img src="${pageContext.request.contextPath}/assets/img/img (5).jpg" alt=""></div>
	                                       <div><img src="${pageContext.request.contextPath}/assets/img/img (6).jpg" alt=""></div>
	                                       <div><img src="${pageContext.request.contextPath}/assets/img/img (7).jpg" alt=""></div>
	                                       <div><img src="${pageContext.request.contextPath}/assets/img/slideRight.png"></div>
	                                       
	                                   </div>
	                               </div>
	                           </div>
	                       </div>
	                   </div>
	               </div>
	               <div class="row">
	                   <div class="col-xs-11">
	                       <div class="button-center">
	                           <button type="button" class="btn-ReadList"><a href="${pageContext.request.contextPath}/card/main">받은카드 리스트</a></button><!--list페이지로 이동-->
	                       </div>
	                   </div>
	                    <div class="col-xs-1">   
	                       <div class="button-right">
	                           <button type="submit" class="btn-ReadComment"><a href="${pageContext.request.contextPath}/card/writereply">댓글카드 작성</a></button>
	                       </div>
	                   </div>
	               </div>
	           </div>
	       </div>
	   </body>
	</html>