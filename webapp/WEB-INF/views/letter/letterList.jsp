<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>My Deco</title>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/letter.css">
</head>

<body>
    <div id="wrap">
        <div class="container">
            <div class="row">
                <div class="col-xs-12" id="header">
                    <h1>
                        <a href=""><img id="logo" src="${pageContext.request.contextPath}/assets/img/logo.png"></a>
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
                            <li class="dropbtn"><a href="">Pen & Paper</a></li>
                            <ul class="dropdown-content">
                                <li><a href="">나의 일기</a></li>
                                <li><a href="">쪽지</a></li>
                                <li><a href="">우체통</a></li>
                            </ul>
                        </div>
                        <div class="dropdown">
                            <li class="dropbtn"><a href="">Shopping</a></li>
                        </div>
                        <div class="dropdown">
                            <li class="dropbtn"><a href="">Mood</a></li>
                            <ul class="dropdown-content">
                                <li><a href="">마법의 소라고둥</a></li>
                                <li><a href="">심리 테스트</a></li>
                            </ul>
                        </div>
                    </ul>
                    <ul id="user" class="clearfix">
                        <li><a href="">로그인</a></li>
                        <li><a href="">회원가입</a></li>
                    </ul>
                </div>
    
    
                <div class="col-xs-3" id="aside">
                    <ul>
                        <li id="title">Pen & Paper</li>
                        <li><a href="">나의 일기</a></li>
                        <li><a href="">쪽지</a></li>
                        <li><a href="">우체통</a></li>
                    </ul>
                </div>
                
    
                <div class="col-xs-9" id="main-content">
                
                	 <div class="letter_list">
                	 
                     	<div id="cTitle">
                      		<h3>우체통</h3>
                   		</div>
                   		
                     	<div id="letter_tap">
                        	<input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
                            <label for="tab1">보낸 편지</label>
                            
                            <input id="tab2" type="radio" name="tabs">
                            <label for="tab2">작성 중인 편지</label>
                                
                            <button class="btn-letter-write" type="button">편지 쓰기</button>
                            
                            <section id="content1">
                            	<div class="tap_content">
                                	<div class="envelope" id="popup_open_btn">
                                    	<div class="envelope-img"> <img src="${pageContext.request.contextPath}/assets/img/envelope.png"> </div>
                                    	<div class="day">
                                    		<h3 class="Dday">D-Day</h3>
                                    		<p class="sendDay">보낸 날짜: 2022.02.14</p>
                                    		<p class="openDay">공개 날짜: 2022.03.14</p>
                                    	</div>
                                   	</div>
                                   	<div class="envelope">
                                    	<div class="envelope-img"> <img src="${pageContext.request.contextPath}/assets/img/envelope.png"> </div>
                                    	<div class="day">
                                    		<h3 class="Dday">D-200</h3>
                                    		<p class="sendDay">보낸 날짜: 2022.02.14</p>
                                    		<p class="openDay">공개 날짜: 2022.03.14</p>
                                    	</div>
                                   	</div>
                                   	<div class="envelope">
                                    	<div class="envelope-img"> <img src="${pageContext.request.contextPath}/assets/img/envelope.png"> </div>
                                    	<div class="day">
                                    		<h3 class="Dday">D-365</h3>
                                    		<p class="sendDay">보낸 날짜: 2022.02.14</p>
                                    		<p class="openDay">공개 날짜: 2022.03.14</p>
                                    	</div>
                                   	</div>
                                   	<div class="envelope">
                                    	<div class="envelope-img"> <img src="${pageContext.request.contextPath}/assets/img/read.png"> </div>
                                    	<div class="day">
                                    		<p class="RsendDay">보낸 날짜: 2021.02.14</p>
                                    		<p class="read">나에게 보내는 편지 잘 살고 있니? 나는 졸리다 가나다라마바사아자차카파타하 예쁜 디자인이란 뭘까
                                    			나에게 보내는 편지 잘 살고 있니? 나는 졸리다 가나다라마바사아자차카파타하 예쁜 디자인이란
                                    		</p>
                                    		<p class="RopenDay">공개 날짜: 2022.02.14</p>
                                    	</div>
                                   	</div>
                                </div>
                                
                                <div class="page">
                                	<p class="page-no">◀  1  2  3  4  5  6  7  8  9  10  ▶</p>
                                </div>
                            </section>
                            
                                <section id="content2">
                                    <div class="tap_content">
                                    	<div class="envelope">
                                    		<div class="envelope-img"> <img src="${pageContext.request.contextPath}/assets/img/read.png"> </div>
                                    		<div class="day">
	                                    		<p class="saveday">저장일: 2021-02-14</p>
	                                    		<p class="letter-ing">나에게 보내는 편지 잘 살고 있니? 나는 졸리다 가나다라마바사아자차카파타하 예쁜 디자인이란 뭘까
	                                    			나에게 보내는 편지 잘 살고 있니? 나는 졸리다 가나다라마바사아자차카파타하....
	                                    		</p>
                                   			</div>
                                   		</div> <!-- //envelope -->
                                   		
                                   		<div class="envelope">
                                    		<div class="envelope-img"> <img src="${pageContext.request.contextPath}/assets/img/read.png"> </div>
                                    		<div class="day">
	                                    		<p class="saveday">저장일: 2021-02-14</p>
	                                    		<p class="letter-ing">나에게 보내는 편지 잘 살고 있니? 나는 졸리다 가나다라마바사아자차카파타하 예쁜 디자인이란 뭘까
	                                    			나에게 보내는 편지 잘 살고 있니? 나는 졸리다 가나다라마바사아자차카파타하....
	                                    		</p>
	                                    	</div>
                                   		</div> <!-- //envelope -->
                                   		
                                   		<div class="envelope">
                                    		<div class="envelope-img"> <img src="${pageContext.request.contextPath}/assets/img/read.png"> </div>
                                    		<div class="day">
	                                    		<p class="saveday">저장일: 2021-02-14</p>
	                                    		<p class="letter-ing">나에게 보내는 편지 잘 살고 있니? 나는 졸리다 가나다라마바사아자차카파타하 예쁜 디자인이란 뭘까
	                                    			나에게 보내는 편지 잘 살고 있니? 나는 졸리다 가나다라마바사아자차카파타하....
	                                    		</p>
											</div>
                                   		</div> <!-- //envelope -->
                                   		
                                   		<div class="envelope">
                                    		<div class="envelope-img"> <img src="${pageContext.request.contextPath}/assets/img/read.png"> </div>
                                    		<div class="day">
	                                    		<p class="saveday">저장일: 2021-02-14</p>
	                                    		<p class="letter-ing">나에게 보내는 편지 잘 살고 있니? 나는 졸리다 가나다라마바사아자차카파타하 예쁜 디자인이란 뭘까
	                                    			나에게 보내는 편지 잘 살고 있니? 나는 졸리다 가나다라마바사아자차카파타하....
	                                    		</p>
											</div>
                                   		</div> <!-- //envelope -->
                                   		
                                    </div>
                                    <!-- //tap_content -->
                                    
                                   	<div class="page">
                                		<p class="page-no">◀  1  2  3  4  5  6  7  8  9  10  ▶</p>
                                	</div>
                                </section>
                        </div>
                 
                	</div>
                
            </div>
        </div>
    </div>
    
    <div id="my_modal">
	    
	    <h3>나에게 보내는 편지</h3>
	    
	    <div>
	    	<div class="days">
	    		<div class="modal-day-left">
	    			보낸 날짜: 2022.02.14
	    		</div>
	    		<div class="modal-day-right">
	    			받은 날짜: 2022.03.14
	    		</div>
	    	</div>
	    	
	    	<textarea id="letter-read" cols="600" rows="5"></textarea>
	    </div>
	    <div class="btn-center">
	    	<button class="btn-letter-close" type="button">닫기</button>
	    </div>
	</div>
</body>

<script type="text/javascript">
function modal(id) {
    var zIndex = 9999;
    var modal = document.getElementById(id);

    // 모달 div 뒤에 희끄무레한 레이어
    var bg = document.createElement('div');
    bg.setStyle({
        position: 'fixed',
        zIndex: zIndex,
        left: '0px',
        top: '0px',
        width: '100%',
        height: '100%',
        overflow: 'auto',
        // 레이어 색갈은 여기서 바꾸면 됨
        backgroundColor: 'rgba(0,0,0,0.4)'
    });
    document.body.append(bg);

    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
    modal.querySelector('.btn-letter-close').addEventListener('click', function() {
        bg.remove();
        modal.style.display = 'none';
    });

    modal.setStyle({
        position: 'fixed',
        display: 'block',
        boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

        // 시꺼먼 레이어 보다 한칸 위에 보이기
        zIndex: zIndex + 1,

        // div center 정렬
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        msTransform: 'translate(-50%, -50%)',
        webkitTransform: 'translate(-50%, -50%)'
    });
}

// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
Element.prototype.setStyle = function(styles) {
    for (var k in styles) this.style[k] = styles[k];
    return this;
};

document.getElementById('popup_open_btn').addEventListener('click', function() {
    // 모달창 띄우기
    modal('my_modal');
});
</script>
</html>