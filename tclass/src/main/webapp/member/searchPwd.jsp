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
            <h1>비밀번호 찾기</h1>
            <span class="btnSide"><a href="#" onclick="openNav()">좌측메뉴 펼침</a></span>
        </div>
        <jsp:include page="/menu.jsp" />
        <!--//해더영역-->
        <!--컨텐츠 본문//-->
        <div id="content">
            <!--비밀번호 찾기 전체//-->
            <form id="frmSearchPwd" class="pwSearchWrap" action="searchPwd.do" method="post">
                <h2>T SPOON 가입 시 등록한<br>아이디, 이름과 휴대폰 번호를 입력하세요.</br>T SPOON가입 아이디만 비밀번호 재설정이 가능합니다.</h2>
                <div class="formBox mt_50">
                    <input type="text" class="itxt" id="memberId" name="memberId" placeholder="아이디" />
                    <label class="title" for="memberId">아이디</label>
                </div>
                <div class="formBox ">
                    <input type="text" class="itxt" id="name" name="name" placeholder="이름" />
                    <label class="title" for="name">이름</label>
                </div>
               <div class="formBox">
                    <input type="tel" class="itxt" id="phone" name="phone" placeholder="휴대폰 번호" />
                    <label class="title" for="phone">휴대폰 번호</label>
                </div>
                <button class="button blue big" onclick="location.href='./searchPwd.do' ">비밀번호 찾기</button>
            </form>
            <!--//비밀번호 찾기 전체-->
        </div>
        <!--//컨텐츠 본문-->
    </div>
    <!--//웹영역 전체-->
</body>

<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/member/search_pw.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
</html>
