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
        <!--제이쿼리-->
        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
 
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
                            <div class="col-xs-12 border-replyread"><!--내가 작성한 카드-->
                                <div class="replyRead-subcard">
                                    <div class="imgdate">2022-02-03</div>
                                    <img src="${pageContext.request.contextPath}/assets/img/card/img (7).jpg" alt="">
                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="col-xs-6">
                        <div class="row">
                            <div class="col-xs-12 border-replyread">
                                <div class="replyRead-subcard">
                                    <div class="imgdate">2022-02-03</div>
                                    <img src="${pageContext.request.contextPath}/assets/img/card/img (1).jpg" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="r-text">원본글</div>
                <div class="r-bgtext"><button type="button" id="popup_open_btn">배경선택</button></div><!--모달창-->


                <div id="my_modal">
                    
                    <div>
                        <div class="bgs">
                            배경 선택
                        </div>
                        
                        <div id="card-read">
                            <img src="${pageContext.request.contextPath}/assets/img/card/img (1).jpg"><!--누르면 적용-->
                            <img src="${pageContext.request.contextPath}/assets/img/card/img (2).jpg">
                            <img src="${pageContext.request.contextPath}/assets/img/card/img (3).jpg">
                            <img src="${pageContext.request.contextPath}/assets/img/card/img (4).jpg">
                            <img src="${pageContext.request.contextPath}/assets/img/card/img (5).jpg">
                            <img src="${pageContext.request.contextPath}/assets/img/card/img (6).jpg">
                            <img src="${pageContext.request.contextPath}/assets/img/card/img (7).jpg">
                            <img src="${pageContext.request.contextPath}/assets/img/card/img (8).jpg">
                        </div>
                    </div>
                    <div class="btn-center">
                        <button class="btn-card-application" type="button">적용</button>
                    </div>
                </div>
            </div>
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
            modal.querySelector('.btn-card-close').addEventListener('click', function() {
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

</body>
</html>