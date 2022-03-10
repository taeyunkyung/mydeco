<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Mydeco</title>
        <link rel="stylesheet" href="../assets/css/main.css">
        <link rel="stylesheet" href="../assets/css/card.css">
        <link rel="stylesheet" href="../assets/css/bootstrap.css">
        <!--제이쿼리-->
        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
 
</head>
<body>
			<div id="wrap">
            <!-- header -->
            <div id="header" class="clearfix">
                <h1>
                    <a href=""><img id="logo" src="../assets/img/logo.png"></a>
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
                    <li><a href="">회원가입</a></li>
                    <li><a href="">로그인</a></li>
                </ul>
            </div>

        <!-- header끝 -->
        <!--content-->
            <div class="cwTitle">
                <h3>소통 카드</h3>
            </div>
            <div class="col-xs-6">
                <div class="cardReply-left"><!--보더상자-->
                    <div class="Reply-LB"><img src="../assets/img/img (1).jpg" alt=""></div>
                </div>
            </div>
            <div class="col-xs-6">
                <div class="cardReply-right"><!--보더상자-->
                    <div class="Reply-RB"><img class="ReplyRightImg" src="../assets/img/img (2).jpg" alt=""></div>
                </div>
            </div>
            <div class="r-text">원본글</div>
            <div class="r-bgtext"><button type="button" id="popup_open_btn">배경선택</button></div><!--모달창-->
            
            <div>
                <button type="submit" class="btn-ReplyComment"><a href="cardReply.html">댓글카드 작성</a></button>
            </div>

            <div id="my_modal">
                
                <div>
                    <div class="bgs">
                        배경 선택
                    </div>
                    
                    <div id="card-read">
                        <img src="../assets/img/img (1).jpg"><!--누르면 적용-->
                        <img src="../assets/img/img (2).jpg">
                        <img src="../assets/img/img (3).jpg">
                        <img src="../assets/img/img (4).jpg">
                        <img src="../assets/img/img (5).jpg">
                        <img src="../assets/img/img (6).jpg">
                        <img src="../assets/img/img (7).jpg">
                        <img src="../assets/img/img (8).jpg">
                    </div>
                </div>
                <div class="btn-center">
                    <button class="btn-card-close" type="button">닫기</button>
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