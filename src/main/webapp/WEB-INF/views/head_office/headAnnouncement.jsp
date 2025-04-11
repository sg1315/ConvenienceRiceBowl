<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>본사 공지사항</title>
    <link rel="stylesheet" href="/resources/css/btn.css">
    <style>
        #form {
            width: 100%;
            padding: 30px;
        }

        #form-top {
            display: flex;
            justify-content: space-between;
            align-items: end;
        }

        #form_name {
            font-size: 40px;
            font-weight: bold;
            padding: 10px;
        }

        #form-top-btn {
            padding-bottom: 10px;
        }

        #top-manu {
            border-top: 3px solid black;
            height: 8%;
            background-color: #D9D9D9;
            display: flex;
            justify-content: right;
            align-items: center;
        }

        #announcement-add{
            background: #d9d9d9;
            color: black;
        }

        #top_serch {
            display: flex;
            justify-content: right;
            padding-right: 61px;
            width: 35%;
        }
        .search-input-gray{
            width: 100px;
            font-size: 16px;
            padding: 0;
            text-align: center;
        }

        #search-filed{
            width: 300px;
            text-align: left;
            padding-left: 10px;
        }

        #table-manu {
            height: 75%;
            width: 100%;
            border-top: 3px solid black;
        }

        #table1 {
            width: 100%;
            text-align: center;
            table-layout: auto;
        }
        #table1 thead {
            height: 60px;
            font-size: 22px;
            background-color: #d9d9d9;
            border-bottom: 3px solid #939393;
        }
        #table1 tbody tr {
        border-bottom: 3px solid #939393;
        font-size: 16px;
        height: 60px;
      }
      #footer {
        border-top: 2px solid #939393;
        background-color: #d9d9d9;
        height: 8%;
        border-bottom: 3px solid black;
        display: flex;
        justify-content: center;
        align-items: center;
      }

        #main-pageing img {
            width: 70px;
            padding: 10px;
        }

        #main-pageing img:nth-of-type(2) {
            transform: rotate(180deg);
        }

        #main-pageing button {
            border: #B4B4B4 solid 3px;
            background: white;
            color: #B4B4B4;
            font-weight: bold;
            margin: 5px;
        }

        #main-pageing button:hover {
            border: #3C3C3C solid 3px;
            color: #3C3C3C;
            font-weight: bold;
        }

        /*
        -----------------------
        모달창
         */
        .modal-header {
            display: flex;
            justify-content: right !important;
            background-color: #D9D9D9;
        }

        .modal-content {
            height: 90%;
        }

        .modal-body {
            padding: 10px 50px !important;
        }

        .modal-footer {
            background-color: #D9D9D9;
        }

        #x_img {
            width: 15px;
            height: 20px;
        }

        #btn-close-modal {
            border: none;
            background: none;
        }

        #modal-body-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid black;
            height: 5%;
            font-weight: bold;
        }

        #modal-body-top input {
            height: 90%;
            width: 90%;
        }

        #textbox {
            width: 100%;
            height: 85%;
        }

        /*
        -----------------------
        내용모달창
         */

        .detail-modal-header {
            height: 5%;
            background-color: #D9D9D9;
        }
        #insert-modal-form{
            height: 100%;
        }

        .modal-body {
            max-height: 92%;
        }

        #detail-x_img {
            width: 15px;
            height: 20px;
        }

        #detail-btn-close-modal {
            border: none;
            background: none;
        }

        #detail-modal-header {
            height: 100%;
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-left: 30px;
            padding-right: 15px;
        }

        #detail-modal-body-top {
            height: 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 3px solid #D9D9D9;
        }

        #comment-btn {
            border-bottom: 3px solid #B4B4B4;
            border-top: 3px solid #B4B4B4;
            height: 5%;
            background-color: #D9D9D9;
            display: flex;
            align-items: center;
            padding-left: 30px;
            position: absolute;
            bottom: 0;
            width: 100%;
        }
        #comment-btn button{
            width: 7%;
            height: 90%;
        }

        #comment {
            height: 30%;
            width: 100%;
            background-color: #D9D9D9;
            display: flex;
            justify-content: center;
        }

        #comment-detail {
            width: 50%;
        }

        #comment-detail-input{
            display: flex;
            align-items: center;
            gap: 10px;
            padding-top: 10px;
        }

        #comment-detail-input > button{
            height: 100%;
        }

        #comment-detail input {
            border: 2px solid black;
            border-radius: 5px;
            width: 90%;
        }

        #comment-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0px 5px; /* 상하 간격을 10px로 설정 */
        }

        #comment-table td {
            border-bottom: 3px solid #B4B4B4;
            padding-bottom: 5px;
        }

        #modal-pageing img {
            width: 30px;
        }

        #modal-pageing img:nth-of-type(2) {
            transform: rotate(180deg);
        }

        #modal-pageing button {
            width: 30px;
            height: 30px;
            border: #B4B4B4 solid 3px;
            background: white;
            color: #B4B4B4;
            font-weight: bold;
            margin: 0px;
            padding: 0px;
        }

        #modal-pageing button:hover {
            border: #3C3C3C solid 3px;
            color: #3C3C3C;
            font-weight: bold;
        }
        #comment-table-box {
            max-height: 180px; /* 높이는 원하는 대로 조정 가능 */
            overflow-y: auto;
        }

        #comment-table {
            width: 100%;
            border-collapse: collapse;
        }

        #comment-table td {
            padding: 8px;
        }

        /*
        -----------------------
        모달수정창
         */
        .modal-header {
            display: flex;
            justify-content: right !important;
            background-color: #D9D9D9;
        }

        .modal-content {
            height: 90%;
        }
        #modify-form{
            height: 100%;
        }

        .modal-body {
            padding: 10px 50px !important;
        }

        .modal-footer {
            height: 8%;
        }

        #modify-x_img {
            width: 15px;
            height: 20px;
        }

        #modify-btn-close-modal {
            border: none;
            background: none;
        }

        #modify-modal-body-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid black;
            height: 5%;
            font-weight: bold;
        }

        #modify-modal-body-top input {
            height: 90%;
            width: 90%;
        }

        #modify-textbox {
            width: 100%;
            height: 85%;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header2.jsp"/>

<c:if test="${not empty alertMsg}">
    <script>
        alert("${alertMsg}");
    </script>
    <c:remove var="alertMsg" scope="session"/>
</c:if>

<div id="form">
    <div id="form-top">
        <div id="form_name">
            공지 사항
        </div>
        <div id="form-top-btn">
            <button class="gray-btn-border" id="announcement-add" data-bs-toggle="modal" data-bs-target="#staticBackdrop">글쓰기</button>
        </div>
    </div>

    <div id="top-manu">
        <div id="top_serch" >
            <form id="search-form" action="searchAnnouncement" method="post">
                <select class="search-input-gray" name="condition">
                    <option value="announcementTitle">제목</option>
                    <option value="storeName">아이디</option>
                </select>
                <input class="search-input-gray" id="search-filed" type="text" name="keyword">
                <input class="search-input-submit-gray" type="submit" value="검색">
            </form>
        </div>
    </div>
    <div id="table-manu">
        <table id="table1">
            <colgroup>
                <col style="width: 5%;">
                <col style="width: 35%;">
                <col style="width: 10%;">
                <col style="width: 10%;">
            </colgroup>
            <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>날짜</th>

            </tr>
            </thead>
            <tbody>
                <c:forEach var="A" items="${list}">
                    <tr data-ano="${A.announcementNo}">
                        <td>${A.announcementNo}</td>
                        <td>${A.announcementTitle}</td>
                        <td>${A.storeName}</td>
                        <td>${A.announcementDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div id="footer">
        <div id="main-pageing">
            <c:choose>
                <c:when test="${not empty param.condition and not empty param.keyword}">
                    <c:set var="baseUrl" value="/searchAnnouncement"/>
                    <c:set var="queryString" value="condition=${param.condition}&keyword=${param.keyword}"/>
                </c:when>
                <c:otherwise>
                    <c:set var="baseUrl" value="/head_announcement"/>
                    <c:set var="queryString" value=""/>
                </c:otherwise>
            </c:choose>

            <c:if test="${pi.startPage > 1}">
                <a href="${url}&cpage=${pi.startPage - 1}">
                    <img src="${pageContext.request.contextPath}/resources/common/공통_페이징바화살표.png" alt="이전">
                </a>
            </c:if>

            <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
                <button type="button"
                        class="btn btn-outline-secondary <c:if test='${pi.currentPage == i}'>active</c:if>'"
                        onclick="location.href='${baseUrl}?${queryString}&cpage=${i}'">
                        ${i}
                </button>
            </c:forEach>

            <c:if test="${pi.endPage < pi.maxPage}">
                <a href="${url}&cpage=${pi.endPage + 1}">
                    <img src="${pageContext.request.contextPath}/resources/common/공통_페이징바화살표.png" alt="다음">
                </a>
            </c:if>
        </div>
    </div>
    <%
        LocalDate today = LocalDate.now();
        String formattedDate = today.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        request.setAttribute("thisDate", formattedDate);
    %>

    <!--start point-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
            integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
            crossorigin="anonymous"></script>

    <!--Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
         aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <p value="${loginMember.memberNo}" name="memberNo" style="display: none"></p>
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                            id="btn-close-modal">
                        <img src="/resources/common/공통_Icon.png" id="x_img">
                    </button>
                </div>
                <form action="insertAnnouncement.he" id="insert-modal-form" method="post">
                    <div class="modal-body">
                        <!--모달 내용-->
                        <div id="modal-body-top">
                            <input type="text" placeholder="제목을 입력하세요" name="announcementTitle">
                            <p> ${thisDate}</p>
                        </div>
                        <textarea id="textbox" name="announcementDetail" placeholder="내용을 입력하세요(2000자 이하)"></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="black-btn">완료</button>
                    </div>
                </form>

            </div>
        </div>
    </div>

    <!-- detail-Modal -->
    <div class="modal fade" id="detail-staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
         aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="detail-modal-header">
                    <div id="detail-modal-header">
                        <p id="detail-modal-date"></p>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                                id="detail-btn-close-modal">
                            <img src="/resources/common/공통_Icon.png" id="detail-x_img">
                        </button>
                    </div>
                </div>

                <div class="modal-body" id="detail-modal-body">
                    <div id="detail-modal-body-top">
                        <p id="detail-modal-title"></p>
                        <p id="detail-modal-ano" style="display: none"></p>
                        <div>
                            <button class="black-btn" id="modify-btn" data-bs-dismiss="modal">수정</button>
                            <button class="red-btn" onclick="postFormSubmit('delete')">삭제</button>
                        </div>
                    </div>
                    <div>
                        <p id="detail-modal-detail"></p>
                    </div>
                </div>
                <div id="comment-btn">
                    <button class="white-btn-border" onclick="replyon()">∧댓글</button>
                </div>
                <div id="comment" style="display: none;">
                    <div id="comment-detail">
                        <div id="comment-detail-input">
                            <input class="search-input" type="text" id="reply-input">
                            <button class="gray-btn-border" onclick="insertReply()">작성</button>
                        </div>
                        <div id="comment-table-box">
                            <table id="comment-table">
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!--modify-Modal -->
    <div class="modal fade" id="modify-staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
         aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header" >
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="modify-btn-close-modal">
                        <img src="/resources/common/공통_Icon.png" id="modify-x_img">
                    </button>
                </div>
                <form id="modify-form" action="updateAnnouncementDetail.he" method="post">
                    <div class="modal-body">
                        <!--모달 내용-->
                        <div id="modify-modal-body-top">
                            <input type="text" id="modify-title" name="announcementTitle" placeholder="제목을 입력하세요">
                            <input id="modify-modal-ano" style="display: none" name="announcementNo">
                            <p id="modify-date"></p>
                        </div>
                        <textarea id="modify-textbox" placeholder="내용을 입력하세요(1000자 이하)" name="announcementDetail"></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="black-btn">완료</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


</div>
<script>
    // 테이블의 모든 행에 클릭 이벤트 추가
    document.querySelectorAll('#table1 tbody tr').forEach(row => {
        row.addEventListener('click', function () {
            const ano = this.getAttribute('data-ano');
            document.querySelector('#comment').style.display = 'none';
            document.querySelector('#comment-btn').style.position = 'absolute';

            // 기존의 fetch를 jQuery AJAX로 변경
            $.ajax({
                url: '/getAnnouncementDetail?ano=' + ano, // 서버에서 데이터를 가져오는 URL
                method: 'GET', // HTTP 요청 메소드
                dataType: 'json', // 응답 데이터 타입 (JSON)
                success: function (data) {
                    // 데이터를 모달에 뿌리기
                    document.querySelector("#detail-modal-date").textContent = data.announcementDate;
                    document.querySelector('#detail-modal-title').textContent = data.announcementTitle;
                    document.querySelector('#detail-modal-detail').textContent = data.announcementDetail;
                    document.querySelector('#detail-modal-ano').textContent = ano;

                    // 모달 띄우기
                    const myModal = new bootstrap.Modal(document.getElementById('detail-staticBackdrop'));
                    myModal.show();
                },
                error: function (xhr, status, error) {
                    console.error('AJAX 요청 실패:', error);
                }
            });
        });
    });

    function postFormSubmit(action) {
        // 삭제 버튼을 클릭하면 'delete'를 전달하고, 삭제할 데이터의 id(ano)를 찾습니다.
        const ano = document.querySelector('#detail-modal-ano').innerHTML;

        if (action === 'delete') {
            // 확인 메시지 (사용자에게 삭제 여부 확인)
            if (confirm('정말로 삭제하시겠습니까?')) {
                // AJAX 요청을 보내 삭제 요청
                $.ajax({
                    url: '/deleteAnnouncement',  // 서버에서 삭제를 처리할 URL
                    type: 'POST',  // POST 방식으로 요청
                    data: {
                        ano: ano
                    },
                    success: function(response) {
                        alert('삭제되었습니다.');

                        location.reload();
                    }
                });
            }
        }
    }

    document.querySelector('#modify-btn').addEventListener('click', function() {

        document.querySelector('#modify-title').value = document.querySelector('#detail-modal-title').innerHTML;
        document.querySelector('#modify-textbox').value = document.querySelector('#detail-modal-detail').innerHTML;
        document.querySelector('#modify-date').textContent = document.querySelector('#detail-modal-date').innerHTML;
        document.querySelector('#modify-modal-ano').value = document.querySelector('#detail-modal-ano').innerHTML;


        const myModal = new bootstrap.Modal(document.getElementById('modify-staticBackdrop'));
        myModal.show();
    });

    function replyon() {
        const comment= document.querySelector('#comment-btn');
        const reply = document.querySelector('#comment');
        const ano = document.querySelector('#detail-modal-ano').innerHTML;
        if(reply.style.display === 'none') {
            reply.style.display = 'flex';
            comment.style.position = "relative";
            getReplyList(ano, function(data){
                drawReplyList(data);
            });
        } else{
            reply.style.display = 'none';
            comment.style.position = 'absolute';
            comment.style.bottom = '0';
            comment.style.width = '100%';
        }
    }

    function insertReply() {
        const ano = document.querySelector('#detail-modal-ano').innerHTML;
        const comment = document.querySelector('#reply-input');
        const memberNo = "${loginMember.memberNo}";
        
        $.ajax({
            url: "/insertReply",
            type: "post",
            data: {
                announcementNo: ano,
                replyContent: comment.value,
                memberNo: memberNo
            },
            success: function (res) {
                if (res === "success") {
                    comment.value = "";
                    // 댓글 등록 후 댓글 리스트 다시 불러오기
                    getReplyList(ano, function (data) {
                        drawReplyList(data);  // 댓글 렌더링
                    });
                } else {
                    console.log("reply insert 실패");
                }
            },
            error: function () {
                console.log("reply insert ajax 요청 실패");
            }
        });
    }
    function getReplyList(announcementNo, callback){
        $.ajax({
            url : "replylist",
            // contextType: "application/json",
            dataType: "json", //응답 데이터 타입(json, text, html, xml)
            data : {
                ano : announcementNo
            },
            success: function(replyList){
                callback(replyList);
            },
            error: function(){
                console.log("댓글 조회 ajax통신 실패");
            }
        });
    }
    function drawReplyList(replyList){

        let str = "";
        for(let r of replyList) {
            str += "<tr>" +
                    "<td>" + r.storeName + "&nbsp;&nbsp;&nbsp;" +  r.createDate + "</td>" +
                    "</tr>"+
                    "<tr>"+ "<td>" + r.replyContent + "</td>" + "</tr>";
        }

        const replyBody = document.querySelector("#comment-table");
        replyBody.innerHTML = str;
    }

    const textarea = document.getElementById("textbox");
    const maxLength = 2000;

    textarea.addEventListener("input", function () {
        if (textarea.value.length > maxLength) {
            alert("글자수가 초과되었습니다 (최대 2000자까지 입력 가능합니다)");
            textarea.value = textarea.value.substring(0, maxLength); // 초과된 부분 자동 제거
        }
    });
</script>
</body>
</html>
