<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="ko">


<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/mypage/message_02.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
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
                    <select>
                        <option value="${name}" selected="selected">${name}</option>
                    </select>
                    <span class="btnWrite"><a href="./send.do">쪽지쓰기</a></span>
                </div>
                <!--//학생 선택-->
                <!--쪽지 컨텐츠 박스//-->
                <form id="sendForm" class="msgBox" action="./send.do" method="post" enctype="multipart/form-data">
                    <!--쪽지 쓰기//-->
                    <ul class="msgWrite">
                        <li class="selList">
                            <label for="touser">받는사람</label>
                            <select id="receiverId" name="receiverId">
                                <option value="" disabled="disabled" selected="selected">관리선생님</option>
                                <option value="관리선생님1" <c:if test="${receiverId eq 'teacher1'}">selected</c:if>>관리선생님1</option>
                                <option value="관리선생님2" <c:if test="${receiverId eq 'teacher2'}">selected</c:if>>관리선생님2</option>
                                <option value="관리선생님3" <c:if test="${receiverId eq 'teacher3'}">selected</c:if>>관리선생님3</option>
                            </select>
                        </li>
                        <li class="titleWrite">
                            <input type="text" class="itxt" id="messageTitle" name="messageTitle" value="${messageTitle}" placeholder="제목" />
                            <div class="btnFile">
                                <label for="fileupload">업로드</label>
                                <input type="file" name="file" id="fileupload" accept="image/*">
                            </div>
                        </li>
                        <li class="fileList" style="display:none;">
                             <span class="file"><u id="uploadFileName"></u><a href="#" id="deleteFile">삭제</a></span>
                        </li>
                        <script >
                        //itxtArea 영역 반응형 리사이징
                        $(document).ready(function(){
                            $(window).resize(resizeContents);
                            resizeContents();
                        });
                        function resizeContents() {
                            $(".itxtArea").height($(window).height()-473);
                        }
                        </script>
                        <li class="itxtArea">
                            <textarea id="messageContent" class="itxtArea" name="messageContent" placeholder="내용 작성">${messageContent}</textarea>
                            <span class="count">(<strong>0</strong>/1000)</span>
                        </li>
                    </ul>
                   	<span class="txtSub" id="sendErrMsg">${uploadFileError}</span>
                   	<span class="txtSub" id="sendErrMsg">${sendErrMsg}</span>
                    <button class="button blue big mt_40">보내기</button>
                    <!--//쪽지 쓰기-->


                </form>
                <!--//쪽지 컨텐츠 박스-->
            </div>
            <!--//쪽지 전체-->
        </div>
        <!--//컨텐츠 본문-->
    </div>
    <!--//웹영역 전체-->
</body>

<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/mypage/message_02.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
</html>
<script>
	let fileName = document.getElementById("fileupload");
	let fileList = document.querySelector(".fileList");
	let uploadFileName = document.getElementById("uploadFileName");
	
	fileName.addEventListener("change", function() {
		if(fileName.files.length != 0) {
			uploadFileName.innerText = fileName.files[0].name;
			fileList.style.display = "";
		} else {
			uploadFileName.innerText = "";
			fileList.style.display = "none";
		}
	});
	
	document.getElementById("deleteFile").addEventListener("click", function(e) {
		e.preventDefault();
		fileName.value = "";
		fileList.style.display = "none";
	});
	
	document.getElementById("sendForm").addEventListener("submit", function(e) {
		e.preventDefault();
		
		let receiverId = document.getElementById("receiverId");
		let title = document.getElementById("messageTitle");
		let content = document.getElementById("messageContent");
 
		if(receiverId.value == "") {
			alert("받는 사람을 선택하세요.");
			receiverId.focus();
			return false;
		}
		if(title.value == "") {
			alert("제목을 입력하세요.");
			title.focus();
			return false;
		}
		if(content.value == "") {
			alert("내용을 입력하세요.");
			content.focus();
			return false;
		}
		
		document.getElementById("sendForm").submit();
	});
	
</script>
