<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="ko">


<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/mypage/message_03.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
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
            <h1>쪽지</h1>
            <span class="btnSide"><a href="#" onclick="openNav()">좌측메뉴 펼침</a></span>
        </div>
        <jsp:include page="/menu.jsp" />
        <!--//해더영역-->
        <!--컨텐츠 본문//-->
        <div id="content">
            <!--쪽지 전체//-->
            <div class="msgWrap ele"> <!-- 학생별 클래스명 추가 초:ele / 중:mid / 고:high -->
                <!--학생 선택//-->
                <div class="childStatus">
                  <div class="profileWrap">
                    <p class="photo">
                      <img src="/tclass/cdndata.milkt.co.kr/ele/tspoon/Images/common/img_profile_tmp.png" alt="내 프로필 이미지" />
                      <span></span>
                    </p>
                  </div>
                    <select id="loginMember">
                        <option value="${name}" selected="selected">${name}</option>
                    </select>
                    <span class="btnWrite02"><a href="./send.do">쪽지쓰기</a></span>
                    <span class="btnPra"><a href="#">칭찬하기</a></span>
                </div>
                <!--//학생 선택-->
                <!--쪽지 컨텐츠 박스//-->
                <div class="msgBox">
                    <!--쪽지탭//-->
                    <ul class="msgTab">
                        <li><a href="./receiveList.do" target="_self">받은 쪽지함</a></li>
                        <li class="on"><a href="./sendList.do" target="_self">보낸 쪽지함</a></li>
                    </ul>
                    <!--//쪽지탭-->
                    <!--보낸 쪽지 리스트//-->
                    <ul class="msgList">
                        <li class="status">
                            <input type="checkbox" id="checkall" name="checkall"  />
                            <label for="checkall"><span></span>선택</label>
                            <button class="btn" onclick="">삭제</button>
                        </li>
                        <c:if test="${not empty list}">
	                        <c:forEach var="list" items="${list}">
		                        <li class="noRead">
		                            <input type="checkbox" class="cc" id="c1" name="c1"  />
		                            <label for="c1"><span></span>선택</label>
		                            <a href="./sendDetail.do?messageIdx=${list.messageIdx}" target="_self">
		                                <p class="name">${list.receiverName}</p>
		                                <span class="title">${list.messageTitle}</span>
		                                <c:if test="${not empty list.orgFileName}">
		                                	<u class="file">첨부파일</u>
		                                </c:if>
		                                <span class="date">${list.sendDate}</span>
		                            </a>
		                        </li>
	                        </c:forEach>
                        </c:if>
                        <c:if test="${empty list}">
                        	<li class="noRead">
	                                <span class="title">${noSendList}</span>
	                            </a>
	                        </li>
                        </c:if>
                    </ul>
                    <!--//보낸 쪽지 리스트-->
                    <div style="font-size:18px; text-align:center; margin-bottom: 50px;">
		                <div id="paging">${maps.paging}</div>
				    </div>
                </div>
                <!--//쪽지 컨텐츠 박스-->
            </div>
            <!--//쪽지 전체-->
        </div>
        <!--//컨텐츠 본문-->
    </div>
    <!--//웹영역 전체-->
</body>

<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/mypage/message_03.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
</html>
<script>
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
</script>
