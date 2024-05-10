<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="ko">


<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/member/join.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
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
            <h1>가입하기</h1>
            <span class="btnSide"><a href="#" onclick="openNav()">좌측메뉴 펼침</a></span>
        </div>
        <jsp:include page="/menu.jsp" />
        <!--//해더영역-->
        <!--컨텐츠 본문//-->
        <div id="content">
            <!--가입하기 전체//-->
            <form id="frmJoin" class="joinWrap" action="./join.do" method="post">
                <h2>T SPOON ID로<br/>밀크T 모든 사이트를 모두 이용하실 수 있습니다.</h2>
                <h3 class="condition">필수 정보</h3>
                <div class="formBox">
                    <input type="text" class="itxt" id="name" name="name" placeholder="이름" maxlength="5" value="${name}"/>
                    <label class="title" for="name">이름</label>
                    <span class="txtSub" id="nameCheck">이름을 입력하세요.</span>
                </div>
                <div class="formBox">
                    <input type="text" class="itxt" id="memberId" name="memberId" placeholder="아이디" maxlength="10" value="${memberId}" />
                    <label class="title" for="memberId">아이디</label>
                    <c:if test="${not empty idCheckErrMsg}">
                    	<span class="txtSub" id="memberIdCheck">${idCheckErrMsg}</span>
                    </c:if>
                    <c:if test="${empty idCheckErrMsg}">
                    	<span class="txtSub" id="memberIdCheck">아이디를 입력하세요.</span>
                    </c:if>
                </div>
               <div class="formBox" >
                    <input type="password" class="itxt" id="pwd" name="pwd" placeholder="비밀번호 (영문, 숫자, 특수문자 조합 10~16자리)" maxlength="16" />
                    <label class="title" for="pwd">비밀번호</label>
                    <span class="txtSub" id="pwdCheck">비밀번호를 정확하게 입력하세요.</span>
                </div>
                <div class="formBox" >
                    <input type="password" class="itxt" id="pwd2" name="pwd2" placeholder="비밀번호 재 입력" />
                    <label class="title" for="pwd2">비밀번호 재 입력</label>
                    <span class="txtSub" id="pwd2Check">비밀번호가 일치하지 않습니다.</span>
                </div>
                <!--//아이디및 비밀번호입력-->
                <!--생일 생년월일//-->
                <div class="formBox birthday" >
                     <label class="title year" for="year">생년</label>
                     <select class="year" id="year" name="year" onchange="birthCheck()">
                        <option value="" disabled="disabled" selected="selected">생년</option>
                        <%
                        for(int i=2024; i>=1950; i--) {
                       	%>
                      		<option value="<%=i %>"><%=i %></option>
                       	<%
                        }
                        %>
                    </select>
                    <label class="title month" for="month">월</label>
                    <select class="month" id="month" name="month" onchange="birthCheck()">
                        <option value="" disabled="disabled" selected="selected">월</option>
                        <%
                        for(int i=1; i<=12; i++) {
                        	if(i<10) {
                        	%>
	                        	<option value="0<%=i %>"><%=i %></option>
                        	<%
                        	} else {
                        	%>
                        		<option value="<%=i %>"><%=i %></option>
                        	<%
                        	}
                        }
                        %>
                    </select>
                    <label class="title day" for="day">일</label>
                    <select class="day"  id="day" name="day" onchange="birthCheck()">
                        <option value="" disabled="disabled" selected="selected">일</option>
                        <%
                        for(int i=1; i<=31; i++) {
                        	if(i<10) {
                        	%>
	                        	<option value="0<%=i %>"><%=i %></option>
                        	<%
                        	} else {
                        	%>
                        		<option value="<%=i %>"><%=i %></option>
                        	<%
                        	}
                        }
                        %>
                    </select>
                    <span class="txtSub" id="birthCheck">생년월일을 입력하세요.</span>
                </div>
                <!--//생일 생년월일-->
                <!--성별구분//-->
                <div class="formBox sexSelect">
                    <span class="title" >성별</span>
                    <input type="radio" id="r1" name="gender" value="남자" <c:if test="${gender eq '남자'}">checked</c:if> /><label for="r1"><span></span>남자</label>
                    <input type="radio" id="r2" name="gender" value="여자" <c:if test="${gender eq '여자'}">checked</c:if> /><label for="r2"><span></span>여자</label>
                    <span class="txtSub" id="genderCheck">성별을 선택해주세요.</span>
                </div>
                <!--//성별구분-->
                <div class="formBox pNumber_01" >
                    <input type="tel" class="itxt" id="phone" name="phone" placeholder="휴대폰 번호" maxlength="11" value="${phone}"/>
                    <label class="title" for="phone">휴대폰 번호</label>
                    <span class="txtSub" id="phoneCheck">휴대폰 번호를 정확하게 입력하세요.</span>
                </div>
                <div class="formBox" >
                    <input type="text" class="itxt" id="email" name="email" placeholder="이메일 주소" value="${email}" />
                    <label class="title" for="email">이메일 주소</label>
                    <span class="txtSub" id="emailCheck">이메일 형식에 알맞게 입력하세요.</span>
                </div>
                <!--이메일 -->
                
                <!--관심분야선택-->
                <!--학년//-->
                <div class="formBox changeid">
                     <label class="title year" for="selectInterest">관심분야</label>
                     <select class="year" id="selectInterest" name="interest" onchange="optionChange(this)">
                        <option value="" selected="selected">관심분야 선택</option>
                        <option value="유/초등" >유/초등</option>
                        <option value="중/고등" >중/고등</option>
                    </select>
                    <label class="title year" for="selectGrade"></label>
                    <select class="year01" id="selectGrade" name="grade">
                        <option value="" disabled="disabled" selected="selected">학년</option>
                    </select>
                    <span class="txtSub" id="interestCheck">관심분야를 선택하세요.</span>
                </div>
                <!--//학년-->
                <!--관심분야선택-->
                
                <script>
					// 선택1 옵션에 따라 선택2 옵션변경
					function optionChange(opt) {
						let baby = ["7세 이하", "1학년", "2학년", "3학년", "4학년", "5학년", "6학년"];
						let teen = ["중1", "중2", "중3", "고1", "고2", "고3"];
						
						let grade = document.getElementById("selectGrade");
						
						if(opt.value == "유/초등") {
							var val = baby;
						}
						else if(opt.value == "중/고등") {
							var val = teen;
						} 
						
						// 선택2 내용 초기화
						grade.options.length = 1;
						
						for(v in val) {
							let option = document.createElement("option");
							option.value = val[v];
							option.innerHTML = val[v];
							grade.appendChild(option);
						}
					}
					
				</script>
                <!--이용약관 동의//-->
                <div class="agreeBox ">
                    <dl>
                        <dt>
                            <input type="checkbox" id="checkall" name="checkall"/>
                            <label for="checkall"><span></span>통합 이용약관, 개인정보수집 및 이용, 위치정보이용약관 (선택), 프로모션  전화 및 SMS 안내수신 (선택), 개인정보 제 3자 제공동의 (선택),에모두 동의 합니다.</label>
                        </dt>
                        <dd>
                            <input type="checkbox" class="cc" id="cc1" name="cc1" onclick="unchecked(this)" />
                            <label for="cc1"><span></span>통합 이용약관 (필수)</label>
                            <span class="moreBtn"><a href="#none" onclick="javascript:alert('어드민등록한거 새창 열림')">전문보기</a></span>
                        </dd>
                        <dd>
                            <input type="checkbox" class="cc"  id="cc2" name="cc2" onclick="unchecked(this)" />
                            <label for="cc2"><span></span>개인정보 수집·이용 동의 (필수)</label>
                            <span class="moreBtn"><a href="#none" onclick="javascript:alert('어드민등록한거 새창 열림')">전문보기</a></span>
                        </dd>
                        <dd>
                            <input type="checkbox" class="cc" id="cc3" name="cc3" onclick="unchecked(this)" />
                            <label for="cc3"><span></span>위치정보 이용약관 (선택)</label>
                            <span class="moreBtn"><a href="#none" onclick="javascript:alert('어드민등록한거 새창 열림')">전문보기</a></span>
                        </dd>
                        <dd>
                            <input type="checkbox" class="cc" id="cc4" name="cc4" onclick="unchecked(this)" />
                            <label for="cc4"><span></span>마케팅 활용동의 (선택)</label>
                            <span class="moreBtn"><a href="#none" onclick="javascript:alert('어드민등록한거 새창 열림')">전문보기</a></span>
                        </dd>
                        <dd>
                            <input type="checkbox" class="cc" id="cc5" name="cc5" onclick="unchecked(this)" />
                            <label for="cc5"><span></span>제3자 제공동의 (선택)</label>
                            <span class="moreBtn"><a href="#none" onclick="javascript:alert('어드민등록한거 새창 열림')">전문보기</a></span>
                        </dd>
                        <dd class="disabled">
                            <input type="checkbox" class="cc" id="cc6" name="cc6" onclick="unchecked(this)" />
                            <label for="cc6"><span></span>천재교육 이용약관 동의 (선택)</label>
                            <span class="moreBtn"><a href="#none" onclick="javascript:alert('어드민등록한거 새창 열림')">전문보기</a></span>
                        </dd>
                    </dl>
                    <span class="txtSub" id="agreeCheck" style="color:red;">필수 약관 동의가 필요합니다.</span>
                </div>
				<p class="txt_02 center">※ 데이터 집계 작업으로 인해 자녀 등록이 불가능한 경우, 5분 후에 이용 부탁드립니다.</p>
                <!--//이용약관 동의-->
                <button class="button blue big bold">가입하기</button>
            </form>
            <!--//가입하기 전체-->
        </div>
        <!--//컨텐츠 본문-->
    </div>
    <!--//웹영역 전체-->
</body>

<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/member/join.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
</html>
<script>
	const name = document.getElementById("name");
	const memberId = document.getElementById("memberId");
	const pwd = document.getElementById("pwd");
	const pwd2 = document.getElementById("pwd2");
	const phone = document.getElementById("phone");
	const email = document.getElementById("email");
	const interest = document.getElementById("selectInterest");
	const grade = document.getElementById("selectGrade");
	let gender = "";
	
	const engChars = "abcdefghijklmnopqrstuvwxyz";
	const EngChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	const numChars = "0123456789";
	const specialChars = "`~!@#$%^&*()-=_+,<.>/?;':\"\"'{}[]";
	const emailValCheck = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-za-z0-9\-]+/;
	const phoneValCheck = /^(010)[1-9]{1}[0-9]{3}[0-9]{4}$/;
	const numCheck = /^[0-9]+$/; //숫자만 입력
	const engCheck = /^[a-z|A-Z]+$/; //영어만 입력
	const korCheck = /^[가-힣]+$/; //한글만 입력
	const korCheck2 = /^[ㄱ-ㅎ|가-힣]+$/; //한글(자음/모음) 입력
	
	const year = document.querySelector("#year");
	const month = document.querySelector("#month");
	const day = document.querySelector("#day");
	
	// 오류 메세지 숨기기
	let messages = document.getElementsByClassName("txtSub");
	for(let i=0; i<messages.length; i++) {
		messages[i].style.display = "none";
	}
	if("${not empty idCheckErrMsg}") {
		document.getElementById("memberIdCheck").style.display = "";
	}
	
	// 오늘 날짜
	let date = new Date();
	let y = date.getFullYear();
	let m = (date.getMonth()+1 < 10) ? ("0" + (date.getMonth()+1)) : date.getMonth()+1;
	let d = (date.getDate() < 10) ? "0" + date.getDate() : date.getDate();
	let today = y + "-" + m + "-" + d;
	
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
	
	// 공백 입력 방지 함수
	function space_check(obj) { 
	    var str_space = /\s/;  // 공백체크
	    if(str_space.exec(obj.value)) { //공백 체크
	        alert("공백을 사용할수 없습니다.\n\n공백은 자동적으로 제거 됩니다.");
	        obj.focus();
	        obj.value = obj.value.replace(' ',''); // 공백제거
	        return false;
	    }
	}
	
	// 이름 길이 체크
	function nameCheck() {
		return name.value.length >= 2 && name.value.length <= 5;
	}
	
	// 아이디 길이 체크
	function memberIdCheck() {
		if(memberId.value.length >= 2 && memberId.value.length <= 10) {
			if(engCheck.test(memberId.value) ) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
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
	
	// 생년월일 체크 (현재일 기준보다 늦으면 안됨)
	function birthCheck() {
		let birth = year.value + "-" + month.value + "-" + day.value;
		
		if(birth > today) {
			alert("생년월일을 확인해주세요.");
			year.value = "";
			month.value = "";
			day.value = "";
			document.getElementById("birthCheck").style.display = "";
		} else {
			document.getElementById("birthCheck").style.display = "none";
		}
	}
	
	// 성별 값 입력
	document.querySelector("#r1").addEventListener("click", function(e) {
		gender = document.querySelector("#r1").value;
	}, false);
	document.querySelector("#r2").addEventListener("click", function(e) {
		gender = document.querySelector("#r2").value;
	}, false);
	
	// 휴대폰 번호 체크
	function phoneCheck() {
		if(phoneValCheck.test(phone.value) === true) {
			return true;
		} else {
			return false;
		}
	}
	
	// 이메일 체크
	function emailCheck() {
		if(emailValCheck.test(email.value) === true) {
	    	return true;
	    } else {
	    	return false;
	    }
	}	
	
	// 이용약관 동의 모두 체크
	let checkAll = document.querySelector("#checkall");
	let checkboxes = document.querySelectorAll(".cc");
	checkAll.addEventListener("click", function(){
		if(checkAll.checked) {
			for(let i=0; i<checkboxes.length; i++) {
				checkboxes[i].checked = true;
			}
		} else {
			for(let i=0; i<checkboxes.length; i++) {
				checkboxes[i].checked = false;
			}
		}
	});
	
	// 이용약관 필수 체크 확인
	function agreeCheck() {
		return document.getElementById("cc1").checked && document.getElementById("cc2").checked;
	}
	
	// 모두 동의 on/off
	let cnt = 0;
	function unchecked(box) {
		if(box.checked == false) {
			checkAll.checked = false;
		}
	}
	
	// 회원가입 폼 전송 시 체크
	document.querySelector("#frmJoin").addEventListener("submit", function(e) {
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
		
		// 성별 체크
		if(gender == "") {
			document.getElementById("genderCheck").style.display = "";
		} else {
			document.getElementById("genderCheck").style.display = "none";
		}

		if(!nameCheck()) {
			document.getElementById("nameCheck").style.display = "";
			document.getElementById("nameCheck").innerText = "이름은 5글자 이내로 작성하세요.";
			name.focus();
			
			return false;
		}
		
		if(!memberIdCheck()) {
			document.getElementById("memberIdCheck").style.display = "";
			document.getElementById("memberIdCheck").innerText = "2~10글자 이내의 영문만 입력하세요.";
			memberId.focus();
			
			return false;
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
		
		if(year.value == "" || month.value == "" || day.value == "") {
			document.getElementById("birthCheck").style.display = "";
			year.focus();
			
			return false;
		}
		
		if(!phoneCheck()) {
			document.getElementById("phoneCheck").style.display = "";
			document.getElementById("phoneCheck").innerText = "01012345678 형식의 11자리의 숫자로 입력하세요.";
			phone.focus();
			
			return false;
		}
		
		if(!emailCheck()) {
			document.getElementById("emailCheck").style.display = "";
			email.focus();
			
			return false;
		}
		
		if(interest.value == null || interest.value == "" || grade.value == null || grade.value == "") {
			document.getElementById("interestCheck").style.display = "";
			interest.focus();
			
			return false;
		} else {
			document.getElementById("interestCheck").style.display = "none";
		}
		
		if(!agreeCheck()) {
			document.getElementById("agreeCheck").style.display = "";
			
			return false;
		} else {
			document.getElementById("agreeCheck").style.display = "none";
		}
		
		document.querySelector("#frmJoin").submit();
	});
	
</script>
