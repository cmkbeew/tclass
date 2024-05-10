<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
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
	<div id="mySidenav" class="sidenav" >
	    <!--전체메뉴 해더//-->
		<div class="navHeader">
		    <span class="closebtn"><a href="javascript:void(0)" onClick="closeNav()">전체메뉴 닫기</a></span>
			<h2>T SPOON</h2>
			<span class="setBtn"><a href="#none" onClick="alert('환경설정 APP');return false;">환경설정</a></span>
		</div>
		<!--//전체메뉴 해더-->
		<!--전체메뉴 컨텐츠//-->
		<div class="navContent">
	    	<!--미 로그인 시//-->
			<c:if test="${empty sessionScope.memberIdx}">
				<div class="userStatus_02">
				    <p class="photo"><img src="/tclass/cdndata.milkt.co.kr/ele/tspoon/Images/common/img_profile_noimg.png" alt="" /></p>
				    <button class="btnLogin" onclick="location.href='/tclass/member/login.do'">로그인</button>
			   </div>
			</c:if>
	  		<!--//미 로그인 시-->
	
			<!-- 로그인 상태 -->
			<c:if test="${not empty sessionScope.memberIdx}">
				<div class="userStatus">
					<a href="/tclass/member/myInfo.do">
					    <p class="photo"><img src="/tclass/cdndata.milkt.co.kr/ele/tspoon/Images/common/img_profile_noimg.png" alt="내 프로필 이미지" /></p>
					    <p class="name">${name}</p>
					</a>
					<button class="btnLogOut" onclick="location.href='/tclass/member/logout.do'">로그아웃</button>
				</div>
			</c:if>
			<!-- //로그인 상태 -->
		   	<div class="menuStyle_02">
		        <ul>
		            <li class="ico_info"><a href="/tclass/message/receiveList.do">쪽지<span>+99</span></a></li>
		            <li class="ico_note"><a href="/tclass/board/oneboard.do">1:1 게시판</a></li>
		        </ul>
		    </div>
		</div>
		<!--//전체메뉴 컨텐츠-->
	</div>
</body>
</html>