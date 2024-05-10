<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/mypage/oneboard.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
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
			<!-- 23-02-01 수정 --><h1>1:1 친절 상담</h1>
			<span class="btnSide"><a href="#" onclick="openNav()">좌측메뉴 펼침</a></span>
        </div>
        <jsp:include page="/menu.jsp" />
		<!--//해더영역-->
		<!--컨텐츠 본문//-->
		<div id="content" class="pb_0">
			<!--1:1게시판 전체//-->
			<div class="oneBoardWrap ">
				<!--탭//-->
				<ul class="boardTab">
					<li class="on"><a href="oneboard.do" target="_self">1:1 문의글 작성</a></li>
					<li><a href="./myboard.do" target="_self">내가 작성한 글</a></li>
				</ul>
				<!--//탭-->
				<!--문의 작성//-->
				<form class="boardBox" action="writeBoard.do" method="post">
					<em	class="notice">필수 입력항목</em>
					<ul class="boardWrite">
						<li class="selList">
							<select id="ss1" name="ss1" onchange="optionChange(this)">
								<option value="" disabled="disabled" selected="selected">선택</option>
								<option value="밀크T초등">밀크T초등</option>
								<option value="밀크T중등">밀크T중등</option>
								<option value="T CLASS">T CLASS</option>
							</select>
							<select id="ss2" name="ss2">
								<option value="" disabled="disabled" selected="selected">선택</option>
							</select>
						</li>
						<li>
							<input type="text" id="boardTitle" name="boardTitle" placeholder="제목 입력" />
						</li>
						<script>
						//itxtArea 영역 반응형 리사이징
						$(document).ready(function(){
							$(window).resize(resizeContents);
							resizeContents();
						});
						function resizeContents() {
							$(".itxtArea").height($(window).height()-460);//
						}
						
						// 선택1 옵션에 따라 선택2 옵션변경
						function optionChange(opt) {
							let elementary = ["학습/평가", "결제", "회원정보", "탭장애", "기타"];
							let middle = ["학습/평가", "결제", "회원정보", "탭장애", "기타"];
							let tclass = ["이용문의", "건의/개선", "기타"];
							
							let ss2 = document.getElementById("ss2");
							
							if(opt.value == "밀크T초등") {
								var val = elementary;
							}
							else if(opt.value == "밀크T중등") {
								var val = middle;
							} 
							else if(opt.value == "T CLASS") {
								var val = tclass;	
							}
							
							// 선택2 내용 초기화
							ss2.options.length = 1;
							
							for(v in val) {
								let option = document.createElement("option");
								option.value = val[v];
								option.innerHTML = val[v];
								ss2.appendChild(option);
							}
						}
						
						</script>
						<li class="itxtArea">
							<textarea id="textzone" class="itxtArea" name="boardContent" placeholder="내용"></textarea>
						</li>
					</ul>

					<button id="btn_submit" class="button blue big mt_20">등록</button>
				</form>
				<!--//문의 작성-->
				 <!--안내//-->
				 <div class="boardFooter">
					<p>
					1:1 친절상담은 문의 접수일로부터 평일 기준 24시간 이내
					답변을 받으실 수 있습니다. <strong>결제, 환불/취소, 배송문의</strong>는 담당
					관리선생님 또는 아래의 고객센터로 문의 주시기 바랍니다.
					</p>
					<ul>
						<li><strong>유아</strong><span>1522-6002</span></li>
						<li><strong>초등</strong><span>1577-1533</span></li>
						<li><strong>중고등</strong><span>1522-5533</span></li>
					</ul>
				</div>
				<!--//안내-->
			</div>
			<!--//1:1게시판 전체-->
		</div>
		<!--//컨텐츠 본문-->
	</div>
	<!--//웹영역 전체-->
</body>

<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/mypage/oneboard.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
</html>
<script>
	document.getElementById("btn_submit").addEventListener("click", function(e){
		e.preventDefault();
		
		let ss1 = document.getElementById("ss1");
		let ss2 = document.getElementById("ss2");
		let boardTitle = document.getElementById("boardTitle");
		let boardContent = document.getElementById("textzone");
		
		if(ss1.value == "" || ss2.value == "") {
			alert("제안 대상을 선택하세요.");
			e.preventDefault();
			ss1.focus();
		} else if(boardTitle.value == "") {
			alert("제목을 입력하세요");
			e.preventDefault();
			boardTitle.focus();
		} else if(boardContent.value == "") {
			alert("건의 사항을 입력하세요");
			e.preventDefault();
		} else {
			document.querySelector(".boardBox").submit();
		}
	});
</script>