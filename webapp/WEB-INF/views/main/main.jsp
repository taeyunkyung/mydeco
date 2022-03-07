<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>MyDeco</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/home.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>

	<div id="wrap">
		<div class="container">
			<div class="row">
			
			<!-- header -->
            <c:import url="/WEB-INF/views/include/header.jsp"></c:import>    

				<div id="visual">
					<div class="on">
						<a href="#"><img src="${pageContext.request.contextPath}/assets/img/login_main.jpg" alt="1"
							width="100%" height="100%"></a>
					</div>
					<div>
						<a href="#"><img
							src="${pageContext.request.contextPath}/assets/img/mainbackground_before_login.png" alt="2"
							width="100%" height="100%"></a>
					</div>
					<div>
						<a href="#"><img
							src="${pageContext.request.contextPath}/assets/img/mainbackground_before_login.jpg" alt="3"
							width="100%" height="100%"></a>
					</div>
					<section>
						<div id="left">
							<span></span> <span></span>
						</div>
						<div id="right">
							<span></span> <span></span>
						</div>
					</section>
					<section id="control">
						<a class="on" href="#"></a> <a href="#"></a> <a href="#"></a>
					</section>
				</div>
				<!--footer영역-->
				<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>    
			</div>
		</div>
	</div>
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