<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
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
        background-color: #d9d9d9;
        width: 55%;
      }
      #top-left1 {
        background-color: white;
        display: flex;
        align-content: center;
        align-items: center;
        width: 100%;
        border-bottom-right-radius: 20px;
        padding-bottom: 10px;
      }

      #top-right1 {
        background-color: #d9d9d9;
        width: 45%;
        display: flex;
        justify-content: right;
        align-items: center;
        border-top-left-radius: 20px;
        border-top-right-radius: 20px;
      }

      
      #top-left p {
        padding-left: 15px;
      }
      #main {
        background-color: #d9d9d9;
        width: 100%;
        height: 90%;
        border-top-left-radius: 20px;
        border-bottom-left-radius: 20px;
        border-bottom-right-radius: 20px;
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
        모달창
         */
      .modal-header {
        display: flex;
        justify-content: right !important;
        background-color: #d9d9d9;
      }

      .modal-content {
        height: 90%;
      }

      .modal-body {
        padding: 10px 50px !important;
      }

      .modal-footer {
        background-color: #d9d9d9;
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
        height: 95%;
      }

      /*
        -----------------------
        내용모달창
         */

      .detail-modal-header {
        height: 5%;
        background-color: #d9d9d9;
      }

      .modal-body {
        height: 40%;
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
        height: 20%;
        /* 퍼센트수정 */
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-bottom: 3px solid #d9d9d9;
      }
      /* 내용 크기 수정 */
      #detail-modal-body-top-title {
        font-size: 25px;
        font-weight: bold;
      }
      #detail-modal-body-top-content {
        padding-top: 5px;
        font-size: 15px;
      }

      

      #comment-btn-div {
        border-bottom: 3px solid #b4b4b4;
        border-top: 3px solid #b4b4b4;
        height: 8%;
        display: flex;
        align-items: center;
        background-color: #d9d9d9;
      }
      .comment-btn{
        margin-left: 10px;
      }
      .comment-div{
        margin-top: 5px;
      }

      #comment {
        height: 30%;
        width: 100%;
        background-color: #d9d9d9;
        display: flex;
        justify-content: center;
      }

      #comment-detail {
        width: 50%;
      }

      #comment-detail input {
        width: 82%;
        /* 퍼센트수정 */
      }

      #comment-table {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0px 5px; /* 상하 간격을 10px로 설정 */
      }

      #comment-table td {
        border-bottom: 3px solid #b4b4b4;
        padding-bottom: 5px;
      }

      #modal-footer {
        border-top: 3px solid #b4b4b4;
        height: 8%;
        display: flex;
        justify-content: center;
        align-items: center;
      }

      #modal-pageing {
        margin: 0;
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
        border: #b4b4b4 solid 3px;
        background: white;
        color: #b4b4b4;
        font-weight: bold;
        margin: 0px;
        padding: 0px;
      }

      #modal-pageing button:hover {
        border: #3c3c3c solid 3px;
        color: #3c3c3c;
        font-weight: bold;
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
              <tr>
                <td>1</td>
                <td>3월26일(금) 업데이트 점검 안내</td>
                <td>abcd123</td>
                <td>2025-03-25</td>
              </tr>
                <tr>
                  <td>2</td>
                  <td>3월26일(금) 업데이트 점검 안내</td>
                  <td>abcd123</td>
                  <td>2025-03-25</td>
                </tr>
                <tr>
                  <td>3</td>
                  <td>3월26일(금) 업데이트 점검 안내</td>
                  <td>abcd123</td>
                  <td>2025-03-25</td>
                </tr>
            </tbody>
          </table>
        </div>
        <div id="main-pageing">
          <img src="/resources/common/공통_페이징바화살표.png" />
          <button type="button" class="btn btn-outline-secondary">1</button>
          <button type="button" class="btn btn-outline-secondary">2</button>
          <button type="button" class="btn btn-outline-secondary">3</button>
          <button type="button" class="btn btn-outline-secondary">4</button>
          <button type="button" class="btn btn-outline-secondary">5</button>
          <button type="button" class="btn btn-outline-secondary">6</button>
          <button type="button" class="btn btn-outline-secondary">7</button>
          <button type="button" class="btn btn-outline-secondary">8</button>
          <button type="button" class="btn btn-outline-secondary">9</button>
          <button type="button" class="btn btn-outline-secondary">10</button>
          <img src="/resources/common/공통_페이징바화살표.png" />
        </div>
      </div>

      <!--start point-->
      <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"
      ></script>

      <!-- Modal -->
      <div
        class="modal fade"
        id="staticBackdrop"
        data-bs-backdrop="static"
        data-bs-keyboard="false"
        tabindex="-1"
        aria-labelledby="staticBackdropLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog modal-xl">
          <div class="modal-content">
            <div class="modal-header">
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
                id="btn-close-modal"
              >
                <img src="/resources/common/공통_Icon.png" id="x_img" />
              </button>
            </div>
            <div class="modal-body">
              <!--모달 내용-->
              <div id="modal-body-top">
                <input type="text" placeholder="제목을 입력하세요" />
                <p>2025.04.01</p>
              </div>
              <textarea
                id="textbox"
                placeholder="내용을 입력하세요(1000자 이하)"
              >
              </textarea>
            </div>
            <div class="modal-footer">
              <button>완료</button>
            </div>
          </div>
        </div>
      </div>
      <!-- detail-Modal -->
      <div
        class="modal fade"
        id="detail-staticBackdrop"
        data-bs-backdrop="static"
        data-bs-keyboard="false"
        tabindex="-1"
        aria-labelledby="staticBackdropLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog modal-xl">
          <div class="modal-content">
            <div class="detail-modal-header">
              <div id="detail-modal-header">
                <p>2025-03-20/09:21:08</p>
                <button
                  type="button"
                  class="btn-close"
                  data-bs-dismiss="modal"
                  aria-label="Close"
                  id="detail-btn-close-modal"
                >
                  <img
                    src="/resources/common/공통_Icon.png"
                    id="detail-x_img"
                  />
                </button>
              </div>
            </div>

            <div class="modal-body" id="detail-modal-body">
              <div id="detail-modal-body-top">
                <p id="detail-modal-body-top-title">3월28일 업데이트</p>
              </div>
              <div>
                <p id="detail-modal-body-top-content">
                  3월 28일(화) v7.1업데이트 점검에 대해 안내드립니다.
                  지점장님들은 숙지하시어 매장운영에 차질없이 준비하시길
                  바랍니다.
                  <br />
                  -----------------------------------------
                  <br />
                  일시 : 2025년 03월 25일(화) 10:00 ~ 11:00
                  <br />
                  (1시간)
                  <br />
                  내용
                  <br />
                  - ERP 안정화
                  <br />
                  - 신규상품 추가
                </p>
              </div>
            </div>
            <div id="comment-btn-div">
              <button class="comment-btn">댓글</button>
            </div>
            <div id="comment">
              <div id="comment-detail">
                <div class="comment-div">
                  <input type="text" class="comment-input" />
                  <button class="comment-button-submit">작성</button>
                </div>
                <div id="comment-table-box">
                  <table id="comment-table">
                    <tr>
                      <th>강남점 25-03-20/09:31:20</th>
                    </tr>
                    <tr>
                      <td>확인</td>
                    </tr>
                    <tr>
                      <th>잠실점 25-03-20/09:31:20</th>
                    </tr>
                    <tr>
                      <td>확인</td>
                    </tr>
                  </table>
                </div>
              </div>
            </div>

            <div class="modal-footer" id="modal-footer">
              <div id="modal-pageing">
                <img src="/resources/common/공통_페이징바화살표.png" />
                <button type="button" class="btn btn-outline-secondary">
                  1
                </button>
                <button type="button" class="btn btn-outline-secondary">
                  2
                </button>
                <button type="button" class="btn btn-outline-secondary">
                  3
                </button>
                <button type="button" class="btn btn-outline-secondary">
                  4
                </button>
                <button type="button" class="btn btn-outline-secondary">
                  5
                </button>
                <button type="button" class="btn btn-outline-secondary">
                  6
                </button>
                <button type="button" class="btn btn-outline-secondary">
                  7
                </button>
                <button type="button" class="btn btn-outline-secondary">
                  8
                </button>
                <button type="button" class="btn btn-outline-secondary">
                  9
                </button>
                <button type="button" class="btn btn-outline-secondary">
                  10
                </button>
                <img src="/resources/common/공통_페이징바화살표.png" />
              </div>
            </div>
          </div>
        </div>
      </div>

      <script>
        // 테이블의 모든 행에 클릭 이벤트 추가
        document.querySelectorAll('#table1 tbody tr').forEach((row) => {
          row.addEventListener('click', function () {
            // 모달을 띄우기 위한 코드
            var myModal = new bootstrap.Modal(
              document.getElementById('detail-staticBackdrop')
            );
            myModal.show(); // 모달 열기
          });
        });

        document
          .querySelectorAll('#detail-modal-body button')
          .forEach((button) => {
            if (button.textContent === '수정') {
              button.addEventListener('click', function () {
                // 기존 모달을 숨기기
                var myDetailModal = bootstrap.Modal.getInstance(
                  document.getElementById('detail-staticBackdrop')
                );
                myDetailModal.hide(); // 기존 모달 숨기기

                // 새로운 모달 띄우기 (새로운 모달 ID와 내용으로 변경 가능)
                var newModal = new bootstrap.Modal(
                  document.getElementById('modify-staticBackdrop')
                );
                newModal.show(); // 새로운 모달 열기
              });
            }
          });
      </script>
      <!--end point-->
    </div>
  </body>
</html>
