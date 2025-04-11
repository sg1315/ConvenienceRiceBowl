<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>지점 공지사항</title>
    <link rel="stylesheet" href="/resources/css/btn.css" />
    <style>
      .waper {
        width: 100%;
        padding: 50px;
        font-family: 'Open Sans', sans-serif;
      }
      .main_name {
        font-weight: bolder;
        font-size: 50px;
        margin: 0;
      }
      #top-manu {
        display: flex;
        justify-content: space-between;
      }
      #top-left {
        width: 55%;
      }
      #top-left1 {
        display: flex;
        align-content: center;
        align-items: center;
        width: 100%;
        padding-bottom: 10px;
      }
      #top-left p {
        padding-left: 15px;
      }
      #main {
        background-color: #d9d9d9;
        width: 100%;
        height: 90%;
        border-radius: 20px;
        padding: 50px 50px 100px;
      }
      #main-in {
        background-color: white;
        width: 100%;
        height: 100%;
        border-radius: 20px;
        padding: 50px;
      }

      #main-pageing {
        padding-top: 10px;
        display: flex;
        justify-content: center;
        align-items: center;
      }
      #table1 {
        text-align: center;
        outline: none;
        width: 100%;
        table-layout: auto;
      }

      #main-pageing img {
        width: 70px;
        padding: 10px;
      }
      #main-pageing img:nth-of-type(2) {
        transform: rotate(180deg);
      }

      #main-pageing button {
        border: #b4b4b4 solid 3px;
        background: white;
        color: #b4b4b4;
        font-weight: bold;
        margin: 5px;
      }
      #main-pageing button:hover {
        border: #3c3c3c solid 3px;
        color: #3c3c3c;
        font-weight: bold;
      }





      /*
        -----------------------
        내용모달창
         */
      #modal-content {
        height: 90%;
      }

      .detail-modal-header {
        height: 5%;
        background-color: #D9D9D9;
      }
      .modal-body {
        max-height: 92%;
        padding: 10px 50px !important;
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
    </style>
  </head>
  <body>
    <jsp:include page="../common/header.jsp" />
    <div class="waper">
      <div id="top-manu">
        <div id="top-left">
          <div id="top-left1">
            <img src="../resources/menu_icons/직원 아이콘.png" />
            <p class="main_name">공지사항</p>
          </div>
        </div>

        <div id="top-right1"></div>
      </div>
      <div id="main">
        <div id="main-in">
          <table class="table table-hover" id="table1">
            <colgroup>
              <col style="width: 20%" />
              <col style="width: 20%" />
              <col style="width: 20%" />
              <col style="width: 20%" />
              <col style="width: 20%" />
            </colgroup>
            <thead>
              <tr>
                <th class="col-2">번호</th>
                <th class="col-4">제목</th>
                <th class="col-2">아이디</th>
                <th class="col-3">날짜</th>
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
        <div id="main-pageing">
          <c:if test="${pi.startPage > 1}">
            <a href="spot_notice&cpage=${pi.startPage - 1}">
              <img src="${pageContext.request.contextPath}/resources/common/공통_페이징바화살표.png" alt="이전">
            </a>
          </c:if>
          <c:forEach begin="${pi.startPage}" end="${pi.endPage}" var="p">
            <button type="button"
                    class="btn btn-outline-secondary <c:if test='${pi.currentPage == i}'>active</c:if>'"
                    onclick="location.href='/spot_notice?cpage=${p}'">
                ${p}
            </button>
          </c:forEach>
          <c:if test="${pi.endPage < pi.maxPage}">
            <a href="spot_notice&cpage=${pi.endPage + 1}">
              <img src="${pageContext.request.contextPath}/resources/common/공통_페이징바화살표.png" alt="다음">
            </a>
          </c:if>
        </div>
      </div>

      <!--start point-->
      <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"
      ></script>


      <!-- detail-Modal -->
      <div class="modal fade" id="detail-staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
           aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
          <div class="modal-content" id="modal-content">
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
      <!--end point-->
    </div>
    <script>
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
    </script>
  </body>
</html>
