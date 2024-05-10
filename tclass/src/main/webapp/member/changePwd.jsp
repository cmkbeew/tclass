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
            <h1>비밀번호 변경</h1>
            <span class="btnSide"><a href="#" onclick="openNav()">좌측메뉴 펼침</a></span>
        </div>
        <jsp:include page="/menu.jsp" />
        <!--//해더영역-->
        <!--컨텐츠 본문//-->
        <div id="content">
            <!--비밀번호 변경 전체//-->
            <form id="frmChangePwd" class="pwSearchWrap" action="./changePwd.do" method="post">
            	<input type="hidden" id="memberId" name="memberId" value="${memberId}"/>
                <h2><strong>아이디</strong></h2>
                <div class="idList">
                    <ul>
                        <li>${memberId}</li>
                    </ul>
                </div>
                <p class="txt_01 mt_20">새로운 비밀번호로 변경하세요.</p>
                <div class="formBox mt_50" >
                    <input type="password" class="itxt" id="pwd" name="pwd" placeholder="비밀번호 (영문, 숫자, 특수문자 조합 10~16자리)" />
                    <label class="title" for="pwd">비밀번호</label>
                    <span class="txtSub" id="pwdCheck">비밀번호를 정확하게 입력하세요.</span>
                </div>
                <div class="formBox" >
                    <input type="password" class="itxt" id="pwd2" name="pwd2" placeholder="비밀번호 재 입력" />
                    <label class="title" for="pwd2">비밀번호 재 입력</label>
                    <span class="txtSub" id="pwd2Check">비밀번호가 일치하지 않습니다.</span>
                </div>
                <span style="color:red;">${changPwdErrMsg}</span>
                <button class="button blue big mt_40">확인</button>
            </form>
            <!--//비밀번호 변경 전체-->
        </div>
        <!--//컨텐츠 본문-->
    </div>
    <!--//웹영역 전체-->
</body>

</html>
<script>
	const pwd = document.getElementById("pwd");
	const pwd2 = document.getElementById("pwd2");
	
	const engChars = "abcdefghijklmnopqrstuvwxyz";
	const EngChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	const numChars = "0123456789";
	const specialChars = "`~!@#$%^&*()-=_+,<.>/?;':\"\"'{}[]";
	
	// 오류 메세지 숨기기
	let messages = document.getElementsByClassName("txtSub");
	for(let i=0; i<messages.length; i++) {
		messages[i].style.display = "none";
	}
	
	// 문자 조합 체크 함수
	function combi_check(inputValue, chars) {
		let cnt = 0;
		for(let i=0; i<inputValue.length; i++) {
			if(chars.indexOf(inputValue.charAt(i)) != -1) {
				cnt += 1;
			}
		}
		
		return cnt;
	}
	
	// 비밀번호 길이/조합 체크
	function pwdCheck() {
		if(pwd.value.length >= 10 && pwd.value.length <= 16) {
			if((combi_check(pwd.value, engChars) > 0 || combi_check(pwd.value, EngChars) > 0) 
					&& combi_check(pwd.value, numChars) > 0 
					&& combi_check(pwd.value, specialChars) > 0) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}
	
	document.querySelector("#frmChangePwd").addEventListener("submit", function(e) {
		e.preventDefault();
		
		// 입력값 공란 체크
		let textTypes = document.querySelectorAll("input[class='itxt']");
		for(let i=0; i<textTypes.length; i++) {
			if(textTypes[i].value.length == 0) {
				document.getElementById(textTypes[i].id + "Check").style.display = "";
			} else {
				document.getElementById(textTypes[i].id + "Check").style.display = "none";
			}
		}
		
		if(!pwdCheck()) {
			document.getElementById("pwdCheck").style.display = "";
			document.getElementById("pwdCheck").innerText = "비밀번호 형식은 영문+숫자+특수문자 10~16글자입니다.";
			pwd.focus();
			
			return false;
		}
		
		if(pwd.value != pwd2.value) {
			document.getElementById("pwd2Check").style.display = "";
			pwd2.focus();
			
			return false;
		}
		
		document.querySelector("#frmChangePwd").submit();
	});
</script>