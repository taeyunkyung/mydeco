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
      <div id="container">
          <!-- aside -->
          <div class="col-xs-3">
              <div id="aside">
                  <ul id="aside_ul" class="clearfix">
                      <li class="aside_top">pen&paper</li>
                      <li>나의 일기</li>
                      <li>소통 카드</li>
                      <li>미래 편지</li>
                  </ul>
              </div>
          </div>
          <!-- aside 끝 -->
          <!--content-->
          <div class="col-xs-9">
              <div class="card_list">
                  <div id="cTitle">
                      <h3>소통 카드</h3>
                   </div>
                   
                  <div id="card_tap">
                      <input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
                      <label for="tab1">작성 카드</label>
                  
                      <input id="tab2" type="radio" name="tabs">
                      <label for="tab2">받은 카드</label>

                          <section id="content1">
                              <button class="btn-card-write" type="button"><a class="cardWriteForm" href="cardWrite.html">카드 쓰기</a></button>
                          
                              <div class="tap_content">
                                  <div class="card-letter">
                                      <div class="card-text">
                                              <div class="subcard">
                                                  <img src="../assets/img/img (1).jpg" alt="">
                                                  <span class="imgdate">2022-03-03</span>
                                                  <span class="imgtext">여러분<br>저 오늘 생일인데<br>축하해주세요♡</span>
                                                  <span class="imgnum">답장10개</span>
                                              </div>
                                              <div class="subcard">
                                                  <img src="../assets/img/img (2).jpg" alt="">
                                                  <span class="imgdate">2022-01-14</span>
                                                  <span class="imgtext">살쪄서 바지가 안맞아요 수선맛집 찾아요 관악구 위주!!</span>
                                                  <span class="imgnum">답장0개</span>
                                              </div>
                                              <div class="subcard">
                                                  <img src="../assets/img/img (3).jpg" alt="">
                                                  <span class="imgdate">2022-01-01</span>
                                                  <span class="imgtext">취업이 하고싶어요ㅠㅠ제 고민 좀 들어주실분</span>
                                                  <span class="imgnum">답장3개</span>
                                              </div>
                                      </div>
                                      <div class="card-text">
                                          <div class="subcard">
                                              <img src="../assets/img/img (4).jpg" alt="">
                                              <span class="imgdate">2021-12-01</span>
                                              <span class="imgtext">오늘밤 달이 차다<br>넌 내 생각을 할까?</span>
                                              <span class="imgnum">답장1개</span>
                                          </div>
                                          <div class="subcard">
                                              <img src="../assets/img/img (5).jpg" alt="">
                                              <span class="imgdate">2021-12-25</span>
                                              <span class="imgtext">짝사랑 그만하고 싶어요...하지만 포기가 되지 않네요</span>
                                              <span class="imgnum">답장10개</span>
                                          </div>
                                          <div class="subcard">
                                              <img src="../assets/img/img (6).jpg" alt="">
                                              <span class="imgdate">2021-12-24</span>
                                              <span class="imgtext">내일 크리스마스인데 다들 솔크 맞죠??</span>
                                              <span class="imgnum">답장8개</span>
                                          </div>
                                      </div>
                                      <div class="row">
                                          <div class="col-xs-12">
                                              <li>
                                                  <div id="divPaging" class="divPaging1">
                                                      <div>◀</div>
                                                      <div><b>1</b></div>
                                                      <div>2</div>
                                                      <div>3</div>
                                                      <div>4</div>
                                                      <div>5</div>
                                                      <div>▶</div>
                                                  </div>
                                              </li>
                                          </div>
                                          
                                      </div>
                                  </div>
                              </div>
                          </section>
                      
                          <section id="content2">
                              <div class="tap_content">
                                  <div class="card-letter">
                                      <div class="card-text">
                                          <div class="subcard">
                                              <img src="../assets/img/img (7).jpg" alt="">
                                              <span class="imgdate">2022-03-07</span>
                                              <input type="checkbox" class="chk-del" name="del" />
                                              <span class="imgtext">심심한데 끝말잇기 하고 놀자</span>
                                              <span class="imgnum">답장11개</span>
                                          </div>
                                          <div class="subcard">
                                              <img src="../assets/img/img (8).jpg" alt="">
                                              <span class="imgdate">2022-03-01</span>
                                              <input type="checkbox" class="chk-del" name="chk-del" value="del"/>
                                              <span class="imgtext">오빠 여자친구를 봤는데 너무 예뻐요!!어떻게 우리 오빠랑..</span>
                                              <span class="imgnum">답장3개</span>
                                          </div>
                                      </div>

                                      <div class="row">
                                          <div class="col-xs-9">
                                              <li>
                                                  <div id="divPaging" class="divPaging2">
                                                      <div>◀</div>
                                                      <div><b>1</b></div>
                                                      <div>2</div>
                                                      <div>3</div>
                                                      <div>4</div>
                                                      <div>5</div>
                                                      <div>▶</div>
                                                  </div>
                                              </li>
                                          </div>
                                          <div class="col-xs-3">
                                              <button class="btn-card-del" type="reset">삭제</button>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                          </section>
                     
                  </div>
              </div>
          </div>
          <!--content끝-->
      </div>
      <!--wrap 끝-->
     

       
      <!--footer-->
      
      <!--footer끝-->
  </div>
  <!--wrap끝-->
 
</body>
</html>