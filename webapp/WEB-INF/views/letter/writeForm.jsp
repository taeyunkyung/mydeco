<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="./assets/bootstrap/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="./assets/css/main.css">
<link rel="stylesheet" href="./assets/css/letter2.css">

<script src="./assets/js/jquery-1.12.4.js"></script>
</head>
<body>
    <div id="wrap">
        <div class="container">
            <div class="row">

	            <!-- header -->
	            <c:import url="/WEB-INF/views/include/header.jsp"></c:import>                          

                <div class="letterwriteForm-write-region clearfix">
                    <div class="letterwriteForm-left">
                        <div class="letterwriteForm-da-we clearfix">

							<div class="letter-openday" style="margin-left: 22px;">공개일
								:</div>
							<select name="Dday" id="openday-select">
								<option value="">-- 공개일 선택 --</option>
								<option value="month">한 달 뒤</option>
								<option value="half-year">반년 뒤</option>
								<option value="year">1년 뒤</option>
							</select>

							<div class="writeform-top-button"> 
                            	<input type="submit" class="button writeform-save" value="편지 보내기">
                            </div>
                           
                        </div>
                        
                        <!--내용-->
          
                        <div class="letter-content">
                            <textarea name="letter-writeForm-content" class="letter-writeForm-content" cols="600" rows="5"></textarea>                                                               
                        </div>
                        <div>
                            <div class="writeform-button">
                                <a class="writeform-modify">임시 저장</a>
                                <a class="writeform-modify">취소</a>
                            </div>

                         
                        </div>
                        
                    </div>                                                    

                    <div class="letterwriteForm-right">

                        <!--스티커/bgm-->
                        <div class="menu-box">
 
                            <ul class="tabs">
								<li class="tab-link current" data-tab="tab-1">
									<form method="post" enctype="multipart/form-data">
                                <div class="letter-file">
                                    <label for="chooseFile">
                                        <div class="file-font">사진 첨부</div>
                                    </label>
                            
                                    <input type="file" id="chooseFile" name="chooseFile" accept="image/*" onchange="loadFile(this)">
                                </div>
                            </form>

								</li>
								<div>
                                <li class="tab-link" data-tab="tab-2">편지지</li>
                              </div>
                              <div>
                                <li class="tab-link" data-tab="tab-3">bgm</li>
                              </div>
                            </ul>
                           
                            <div id="tab-1" class="tab-content current menu-box2">
                             
                            </div>

                            <div id="tab-2" class="tab-content menu-box3">
                                <div class="clearfix">
                                	 <img src="./assets/img/letter1.jpg">
                                	 <img src="./assets/img/letter2.jpg">
                                	 <img src="./assets/img/letter3.jpg">
                                	 <img src="./assets/img/letter4.jpg">
                                </div>
                            </div>

                            
                            <div id="tab-3" class="tab-content">
                                <div class="letter-writeForm-bgmList">
                                    INVU 태연 (TAEYEON)
                                </div>
                                <div class="letter-writeForm-bgmList">
                                    사랑은 늘 도망가 임영웅 
                                </div>
                                <div class="letter-writeForm-bgmList">
                                    INVU 태연 (TAEYEON)
                                </div>
                                <div class="letter-writeForm-bgmList">
                                    INVU 태연 (TAEYEON)
                                </div>
                                <div class="letter-writeForm-bgmList">
                                    ELEVEN IVE (아이브)ELEVEN
                                </div>
                                <div class="letter-writeForm-bgmList">
                                    INVU 태연 (TAEYEON)
                                </div>
                            </div>
                           
                        </div>

                    </div>
                </div>
    
  
            </div>
        </div>    
    </div>

    
</body>

<script type="text/javascript">

$(document).ready(function(){
   
   $('ul.tabs li').click(function(){
     var tab_id = $(this).attr('data-tab');
  
     $('ul.tabs li').removeClass('current');
     $('.tab-content').removeClass('current');
  
     $(this).addClass('current');
     $("#"+tab_id).addClass('current');
   })
  
 })
</script>
</html>