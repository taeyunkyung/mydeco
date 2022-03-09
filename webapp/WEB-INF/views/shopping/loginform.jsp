<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>loginForm</title>
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.min.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/main.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/signup2.css">
   </head>
    <body>
        <div class="wrap">
            <div class="container text-center">
                <!-- 헤더부분 -->
      
					<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
				
                <!-- /헤더끝 -->
				<div class="row">
		                <div class="col-xs-12" id="main-content">
		                    <div id="bs-list">
		                        <div class="head">
		                            <div class="title">로그인</div>
		                        </div>
		                            <form>
		                                <ul>
		                                    <li>
		                                        <div class="li-div text-left">
		                                            아이디
		                                            <input id="startdate" type="text" name="" value="leessun">
		                                        </div>
		                                    </li>
		                                    <li>
		                                        <div class="li-div text-left">
		                                            비밀번호
		                                            <input id="totalcnt" type="text" name="" value="****">
		                                        </div>
		                                    </li>
		                                    <li>
		                                        <div id="submit">
		                                            <input type="submit" class="loginfont" id="submitBtn" value="로그인">
		                                        </div>
		                                    </li>
		                                    <li class="height37">
		                                        <a href="">회원가입</a>
		                                        <a href="">아이디찾기</a>
		                                        <a href="">비밀번호찾기</a>
		                                    </li>
		                                </ul>
		                            </form>
		                    </div>
		                </div>    
		            </div>
		            
		           <c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
          </div>
        </div>
    </body>
</html>