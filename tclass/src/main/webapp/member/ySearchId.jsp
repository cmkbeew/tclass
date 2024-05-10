<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
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
</head>
<body>
    <!--웹영역 전체//-->
    <div id="wrap" class="wrap">
        <!--해더영역//-->
        <div id="header">
            <h1>아이디 확인</h1>
            <span class="btnSide"><a href="#" onclick="openNav()">좌측메뉴 펼침</a></span>
        </div>
        <jsp:include page="/menu.jsp" />
        <!--//해더영역-->
        <!--컨텐츠 본문//-->
        <div id="content">
            <!--아이디확인 전체//-->
            <div  class="idSerachWrap">
                <h2><strong>입력하신 정보와 일치하는 아이디</strong></h2>
                <!-- <div class="idList">
                    <ul>
                        <li>[밀크T 초등] jenn**** (18.09.07)</li>
                        <li>[밀크T 초등] jjnn**** (18.09.05)</li>
                    </ul>
                </div> -->
                <div class="formBox idList atten mt_40">
                    <label class="title" for="111">아이디 선택</label>
                    <select id="111">
                        <option value=""selected="selected">[${interest}] ${memberId} (${regDate})</option>
                    </select>
                </div>
                <p class="txt_01 mt_20">개인정보 보호를 위해<br>아이디는 앞의 4자리만 공개되며, 총 8자리로만 표시합니다.<br>실제 아이디와 글자 수는 다를 수 있습니다.</p>
                <button class="button blue big mt_10" onclick="location.href='./login.do' ">로그인</button>
            </div>
            <!--//아이디확인 전체-->
        </div>
        <!--//컨텐츠 본문-->
    </div>
    <!--//웹영역 전체-->
</body>

<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/member/search_id_02.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
</html>
