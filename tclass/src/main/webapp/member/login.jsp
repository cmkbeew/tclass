<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">


<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/member/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
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
            <h1>로그인</h1>
            <span class="btnSide"><a href="#" onclick="openNav()">좌측메뉴 펼침</a></span>
        </div>
        <jsp:include page="/menu.jsp" />
        <!--//해더영역-->
        <!--컨텐츠 본문//-->
        <div id="content">
            <!--로그인 전체//-->
            <form id="frmLogin" class="loginWrap" action="./login.do" method="post">
                <h2>T SPOON, 밀크T 학부모 아이디로<br/>로그인 하실 수 있습니다.</h2>
                <div class="formBox">
                    <input type="text" class="itxt" id="memberId" name="memberId" placeholder="아이디" />
                    <label class="title" for="memberId">아이디</label>
                    <span class="txtSub" id="memberIdCheck">${memberIdCheck}</span>
                </div>
               <div class="formBox">
                    <input type="password" class="itxt" id="pwd" name="pwd" placeholder="비밀번호" />
                    <label class="title" for="pwd">비밀번호</label>
                    <span class="txtSub" id="pwdCheck">${pwdCheck}</span>
                </div>
                <span class="txtSub" style="color:red;">${loginErrMsg}</span>
<!--                 <div class="saveLog"> -->
<!--                     <input type="checkbox" id="saveid" name="" /> -->
<!--                     <label for="saveid"><span></span>로그인 상태 유지</label> -->
<!--                 </div> -->
               <button id="btn_login" class="button blue big">로그인</button>
               <ul class="bottomMenu">
                    <li><a href="./searchId.do" target="_self">아이디 찾기</a></li>
                    <li><a href="./searchPwd.do" target="_self">비밀번호 찾기</a></li>
                    <li><a href="./join.do" target="_self">가입하기</a></li>
               </ul>

               <p class="btn_privacyPolicy"><a href="#">개인정보 처리방침 &gt;</a></p>

<!--                <a href="#" class="button white big"  style="padding:20px 0;font-size:1rem;text-align:center;position:absolute;left:0;bottom:10px;width:90%;margin-left:5%;">쿠키 삭제 클릭(추후 오픈시에는 삭제예정)</a> -->
            </form>
            <!--//로그인 전체-->
        </div>
        <!--//컨텐츠 본문-->
    </div>
    <!--//웹영역 전체-->
</body>

</html>
<script>
	document.getElementById("frmLogin").addEventListener("submit", function(e){
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
			e.preventDefault();
			return false;
		}
		
		document.getElementById("frmLogin").submit();
	});
	
</script>
