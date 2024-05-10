<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="ko">


<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/member/edit_myinfo_01.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
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
            <!--개인정보 수정 전체//-->
            <form id="frmMyInfo" class="editPageWrap" action="./editMyInfo.do" method="post">
            	<input type="hidden" name="orgPwd" value="${requestScope.orgPwd}">
            	<input type="hidden" name="memberIdx" value="${requestScope.memberIdx}">
            
                <div class="myProfile">
                    <p class="myPhoto"><img src="/tclass/cdndata.milkt.co.kr/ele/tspoon/Images/common/img_profile_noimg.png" alt="내 프로필 이미지" /></p>
                    <div class="btnFile">
                        <label for="fileupload">프로필 사진 설정</label>
                        <input type="text" name="file" id="fileupload" accept="image/*">                        
                    </div>
                    <a href="#" class="btnLogout" id="btn_delete">회원탈퇴</a><!-- #89500 티스푼 회원탈퇴 버튼 추가 22-08-31 -->
                </div>
                <div class="editPage">
                    <!--아이디및 비밀번호입력//-->
                    <div class="formBox noEdit mt_40"><!--수정불가 noEdit 추가-->
                        <input type="text" class="itxt" id="iname" name="iname" placeholder="이름" disabled="disabled" value="${sessionScope.name}" />
                        <label class="title" for="iname">이름</label>
                    </div>
                    <div class="formBox noEdit memberChange">
                        <input type="text" class="itxt" id="idn" name="idn" placeholder="아이디" disabled="disabled" value="${sessionScope.memberId}"  />
                        <label class="title" for="idn">아이디</label>
                    </div>
                   <div class="formBox pwChange" >
                        <input type="password" class="itxt" id="pwd" name="pwd" placeholder="비밀번호 (영문, 숫자, 특수문자 조합 10~16자리)" disabled />
                        <label class="title" for="pwd">비밀번호</label>
                        <button type="button" class="btn" id="btn_pwd" onclick="pwd_active()">변경</button>
                        <span class="txtSub" id="pwdCheck">영문, 숫자, 특수문자 조합 10~16자리</span>
                    </div>
                    <div class="formBox" >
                        <input type="password" class="itxt" id="pwd2" name="pwd2" placeholder="비밀번호 재 입력" />
                        <label class="title" for="pwd2">비밀번호 재 입력</label>
                        <span class="txtSub" id="pwd2Check">비밀번호가 일치하지 않습니다.</span>
                    </div>
                    <!--//아이디및 비밀번호입력-->
                    <!--생일 생년월일//-->
                    <div class="formBox birthday noEdit" >
                         <label class="title year" for="selectborn1">생년</label>
                         <select class="year" id="selectborn1">
                            <option value="">생년</option>
                            <option value="${sessionScope.year}" selected>${sessionScope.year}</option>
                        </select>
                        <label class="title month" for="selectborn2">월</label>
                        <select class="month" id="selectborn2">
                            <option value="" >월</option>
                            <option value="${sessionScope.month}" selected>${sessionScope.month}</option>
                        </select>
                        <label class="title day" for="selectborn3">일</label>
                        <select class="day"  id="selectborn3">
                            <option value="" disabled="disabled" selected="selected">일</option>
                            <option value="${sessionScope.day}" selected>${sessionScope.day}</option>
                        </select>
                    </div>
                    <!--//생일 생년월일-->
                    <!--성별구분//-->
                    <div class="formBox sexSelect noEdit">
                        <span class="title" >성별</span>
                        <input type="radio"  id="r1" name="rr" onclick="return(false);" <c:if test="${sessionScope.gender eq '남자'}">checked</c:if> /><label for="r1"><span></span>남자</label>
                        <input type="radio"  id="r2" name="rr" onclick="return(false);" <c:if test="${sessionScope.gender eq '여자'}">checked</c:if> /><label for="r2"><span></span>여자</label>
                    </div>
                    <!--//성별구분-->
                    <!--휴대폰 인증번호//-->
                    <div class="formBox pNumber_01" >
                        <input type="tel" class="itxt" id="phone" name="phone" placeholder="휴대폰 번호" maxlength="11" value="${orgPhone}" readonly />
                        <label class="title" for="phone">휴대폰 번호</label>
                        <button type="button" class="btn" id="btn_phone" onclick="phone_active()">변경</button>
                        <span class="txtSub" id="phoneCheck" style="display: none;">휴대폰 번호를 정확하게 입력하세요.</span>
                    </div>
                    <button class="button blue big mt_40">확인</button>
                </div>
            </form>
            <!--//개인정보 수정  전체-->
        </div>
        <!--//컨텐츠 본문-->
    </div>
    <!--//웹영역 전체-->
</body>

<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/member/edit_myinfo_01.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
</html>
<script>
	const pwd = document.getElementById("pwd");
	const phone = document.getElementById("phone");

	const engChars = "abcdefghijklmnopqrstuvwxyz";
	const EngChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	const numChars = "0123456789";
	const specialChars = "`~!@#$%^&*()-=_+,<.>/?;':\"\"'{}[]";
	const phoneValCheck = /^(010)[1-9]{1}[0-9]{3}[0-9]{4}$/;
	const numCheck = /^[0-9]+$/; //숫자만 입력
	const engCheck = /^[a-z|A-Z]+$/; //영어만 입력
	const korCheck = /^[가-힣]+$/; //한글만 입력
	const korCheck2 = /^[ㄱ-ㅎ|가-힣]+$/; //한글(자음/모음) 입력
	
	// 조합 체크
	function combi_check(inputValue, chars) {
		let cnt = 0;
		for(let i=0; i<inputValue.length; i++) {
			if(chars.indexOf(inputValue.charAt(i)) != -1) {
				cnt += 1;
			}
		}
		
		return cnt;
	}

	// 오류 메세지 숨기기
	let messages = document.getElementsByClassName("txtSub");
	for(let i=0; i<messages.length; i++) {
		messages[i].style.display = "none";
	}
	
	// 변경 버튼 클릭 함수
	function pwd_active() {
		pwd.disabled = false;
		pwd.focus();
	}
	function phone_active() {
		phone.readOnly = false;
		phone.focus();
	}
	phone_active
	
	// 비밀번호 조합 체크
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
	
	// 휴대폰번호 체크
	function phoneCheck() {
		if(phoneValCheck.test(phone.value) === true) {
			return true;
		} else {
			return false;
		}
	}
	
	document.getElementById("frmMyInfo").addEventListener("submit", function(e) {
		e.preventDefault();
		
		
		if(pwd.value != "" || pwd2.value != "") {
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
		}
		
		if(!phoneCheck()) {
			document.getElementById("phoneCheck").style.display = "";
			document.getElementById("phoneCheck").innerText = "01012345678 형식의 11자리의 숫자로 입력하세요.";
			phone.focus();
			
			return false;
		}
		
		document.getElementById("frmMyInfo").submit();
	});
	
	document.getElementById("btn_delete").addEventListener("click", function(e) {
		let deleteFlag = confirm("삭제하시겠습니까?");
		
		if(deleteFlag == true) {
			window.location.href = "./delete.do?memberIdx=${memberIdx}";
		}
	});
</script>