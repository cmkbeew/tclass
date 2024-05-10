<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">


<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/member/edit_myinfo.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
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
            <h1>개인정보수정</h1>
            <span class="btnSide"><a href="#" onclick="openNav()">좌측메뉴 펼침</a></span>
        </div>
        <jsp:include page="/menu.jsp" />
        <!--//해더영역-->
        <!--컨텐츠 본문//-->
        <div id="content">
            <!--개인정보수정 전체//-->
            <form id="frmMyInfo" class="editMyinfoWrap" action="./myInfo.do" method="post">
                <h2>본인 확인을 위해 비밀번호를 입력해 주세요.</h2>
                <div class="formBox mt_50 noEdit"><!--수정불가 noEdit 추가-->
                    <input type="text" class="itxt" id="memberId" name="memberId" placeholder="아이디" value="${sessionScope.memberId}" readonly />
                    <label class="title" for="memberId">아이디</label>
                </div>
               	<div class="formBox" >
                    <input type="password" class="itxt" id="pwd" name="pwd" placeholder="비밀번호" />
                    <label class="title" for="pwd">비밀번호</label>
                    <span class="txtSub">${myInfoErrMsg}</span>
                    <span class="txtSub">${editMyInfoErrMsg}</span>
                    <span class="txtSub">${deleteErrMsg}</span>
                </div>
                <button class="button blue big mt_40">확인</button>
                <p class="subLink mt_50"><a href="./searchPwd.do" target="_self">비밀번호 찾기</a></p>
            </form>
            <!--//개인정보수정  전체-->
        </div>
        <!--//컨텐츠 본문-->
    </div>
    <!--//웹영역 전체-->
</body>

<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/member/edit_myinfo.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
</html>
<script>
	document.getElementById("frmMyInfo").addEventListener("submit", function(e){
		e.preventDefault();
		const memberId = document.getElementById("memberId");
		const pwd = document.getElementById("pwd");
		
		if(memberId.value == "") {
			alert("아이디를 입력하세요.");
			e.preventDefault();
			return false;
		}
		if(pwd.value == "") {
			alert("비밀번호를 입력하세요.");
			pwd.focus();
			e.preventDefault();
			return false;
		}
		
		document.getElementById("frmMyInfo").submit();
	});
	
</script>
