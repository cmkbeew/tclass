<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="ko">


<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/main/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:14:14 GMT -->
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
    <meta name="format-detection" content="telephone=no, address=no" />
    <title>T 클래스</title>
    <script src="/tclass/include/js/jquery-3.4.1.min.js"></script>
    <script src="/tclass/include/js/ui.js"></script>
    <script src="/tclass/include/js/chart.js"></script>
    <script src="/tclass/include/js/swiper.js"></script>
    <script src="/tclass/include/js/aos.js"></script>
    <link rel="stylesheet" type="text/css" href="/tclass/include/css/common.css" />
    <link href="/tclass/include/css/aos.css" rel="stylesheet">
    
    <style>
    	.menuStyle_01 nochild {
    		background-color: #222222;
    	}
    </style>
</head>
<body>
    <!--웹영역 전체//-->
    <div id="wrap" class="wrap">
        <!--해더영역//-->
        <div id="header">
            <h1>T SPOON</h1>
            <span class="btnSide"><a href="#" onClick="openNav()">전체메뉴 열기</a></span>
        </div>
        <jsp:include page="/menu.jsp" />
        <!--//해더영역-->
        <!--//전체메뉴-->
        <!--컨텐츠 본문//-->
        <div id="contentMain">
            <!--메인 전체//-->
            <div class="mainWrap">
                <div class="swiper-container-main">
                    <div class="swiper-wrapper">
                        <!--왼쪽 학부모 컨텐츠메뉴//-->
                        <div class="swiper-slide leftWrap">
                            <h3><img src="./cdndata.milkt.co.kr/ele/tspoon/Images/common/main_top_left.png" alt="엄마를 위한 알찬 정보만 모아둔 밀크T 특별 콘텐츠!"></h3>
                            <ul>
                                <li class="menu_eduInfo"><a href="#">교육정보</a></li>
								<li class="menu_milktInfo"><a href="#">밀크T 정보</a></li>
								<li class="menu_foodInfo"><a href="#">학교급식</a></li>
								<li class="menu_classNotice"><a href="#">학교알림장</a></li>
								<!---li class="menu_"><a href="#">말하는 동화책</a></li><!-- 200409추가 -->
								<li class="menu_mall"><a href="#">T SHOP</a></li>
								<!-- <li class="menu_medical"><a href="#">메디컬 콘서트</a></li>
								<li class="menu_healthInfo"><a href="#">건강정보</a></li> -->
                <li class="menu_bnh"><a href="#">뷰티앤헬스</a></li>
								<li class="menu_academy"><a href="#">학원추천</a></li>
								<li class="menu_ai"><a href="#">AI평가</a></li>
                <li class="menu_dictation"><a href="#">도전! AI 받아쓰기</a></li>
                            </ul>
                        </div>
                        <!--//왼쪽 학부모 컨텐츠메뉴-->

                        <!--우측 학생 컨텐츠//-->
                        <div class="swiper-slide rightWrap">
                            <h3><img src="./cdndata.milkt.co.kr/ele/tspoon/Images/common/main_top_right.png" alt="아이를 위한 즐겁고 재미있는 밀크T 특별 콘텐츠!"></h3>
                            <ul>
                                <li><a href="#">밀크TV<span>영상으로 더 즐거운 학습</span></a></li>
                                <li><a href="#">밀크게임<span>게임으로 더 쉽고 재미있게</span></a></li>
                                <li><a href="#">말하는 동화책<span>오디오북으로 더 흥미진진하게</span></a></li>
                                <li><a href="#">밀크T 맛보기<span>우리 아이 학습을 미리 확인</span></a></li>
                            </ul>
                        </div>
                        <!--//우측 학생 컨텐츠-->
                    </div>
                </div>
                <script>
                //스와이프 영역
                var swiper = new Swiper('.swiper-container-main', {
                    //effect : 'fade',
                    autoHeight  : true,
                    spaceBetween:0,
                    centeredSlides: false,
                    initialSlide:1,
                    loop: false,
                });
                </script>



            </div>
            <!--//메인 전체-->
        </div>
        <!--//컨텐츠 본문-->

    </div>
    <!--//웹영역 전체-->
</body>

<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/main/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:14:49 GMT -->
</html>
