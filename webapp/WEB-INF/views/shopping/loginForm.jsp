<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
        
<title>MyDeco</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/signup2.css">
<!-- 이부분에 이페이지에 필요한 css 추가 -->	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



</head>

<body>

	<div id="wrap">
		
		<div class="container">
		
			<!-- header -->
			<div class="row">
	            <c:import url="/WEB-INF/views/include/header.jsp"></c:import>    
			</div>
			<!-- //header -->
			
			<div class="row">
				
				<!-- content -->
				<div id= "content">
					
					<div class="row">

						
						<div class="col-xs-12" id="main-content">   <!-- aside가 없는경우 -->    
		
							
							<div id="main">
                   		 	<!-- ---여기에 자신의 코드 작성--------------------------------------------------------------------------------- -->
								<div id="bs-list">
		                        <div class="head">
		                            <div class="title">로그인</div>
		                        </div>
		                            <form action="${pageContext.request.contextPath}/login" method="get">
		                                <ul>
		                                    <li>
		                                        <div class="li-div text-left">
		                                            아이디
		                                            <input id="startdate" type="text" name="id" value="" placeholder="아이디를 입력해주세요">
		                                        </div>
		                                    </li>
		                                    <li>
		                                        <div class="li-div text-left">
		                                            비밀번호
		                                            <input id="totalcnt" type="password" name="password" value="" placeholder="비밀번호를 입력해주세요">
		                                        </div>
		                                    </li>
		                                    <li>
		                                        <div id="submit">
		                                            <input type="submit" class="loginfont" id="submitBtn" value="로그인">
		                                        </div>
		                                    </li>
		                                    <li class="height37">
		                                        <a href="${pageContext.request.contextPath}/my/signup">회원가입</a>
		                                        <a href="${pageContext.request.contextPath}/my/signup">아이디찾기</a>
		                                        <a href="${pageContext.request.contextPath}/my/signup">비밀번호찾기</a>
		                                    </li>
		                                </ul>
		                            </form>
		                    </div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
                   		 	<!-- ---여기에 자신의 코드 작성--------------------------------------------------------------------------------- -->
					
							</div>	
							
		
						</div>
						<!-- //main-content -->
						
					</div>
					<!-- //row -->
					
				</div>
				<!-- //content -->
			
			</div>
			<!-- //row -->
			
			
			<!--footer-->
			<div class="row">
	            <c:import url="/WEB-INF/views/include/footer2.jsp"></c:import>   
			</div>
			<!-- //footer -->
				
			
		</div>
		<!-- //container -->
		
	</div>
	<!-- //wrap -->
	
</body>


<script type="text/javascript">
	var idx_lgth = $("#visual>div").length;
	var srt = 1;
	var idx = 0;

	$("section>a").click(function() {
		idx = $(this).index();
		srt = idx;
		$(this).addClass('on').siblings().removeClass('on');
		$("#visual>div").eq(idx).addClass('on').siblings().removeClass('on');
	});

	var AutoSlide = setInterval(AutoRun, 2000);

	function AutoRun() {
		srt++;

		if (srt == idx_lgth) {
			srt = 0;
		}
		$("section>a").eq(srt).addClass('on').siblings().removeClass('on');
		$("#visual>div").eq(srt).addClass('on').siblings().removeClass('on');
	}

	$("#visual").mouseover(function() {
		clearInterval(AutoSlide);
		$("#right").css({
			opacity : '1'
		});
		$("#left").css({
			opacity : '1'
		});
	});
	$("#visual").mouseleave(function() {
		AutoSlide = setInterval(AutoRun, 2000);
		$("#right").css({
			opacity : '0'
		});
		$("#left").css({
			opacity : '0'
		});
	});

	$("#right").click(function() {
		srt++;
		if (srt == idx_lgth) {
			srt = 0;
		}
		$("#visual>div").eq(srt).addClass('on').siblings().removeClass('on');
		$("section>a").eq(srt).addClass('on').siblings().removeClass('on');
	});

	$("#left").click(function() {
		srt--;
		if (srt == -1) {
			srt = idx_lgth - 1;
		}
		$("#visual>div").eq(srt).addClass('on').siblings().removeClass('on');
		$("section>a").eq(srt).addClass('on').siblings().removeClass('on');
	});
</script>



</html>