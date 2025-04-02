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
        padding-left: 15px;
      }
      #top-manu {
        display: flex;
        justify-content: space-between;
      }
      #top-left {
        background-color: #d9d9d9;
        width: 30%;
      }
      #top-left1 {
        background-color: white;
        display: flex;
        align-content: center;
        align-items: center;
        width: 100%;
        border-bottom-right-radius: 20px;
        padding-bottom: 10px;
        padding: auto;
      }

      #top-right1 {
        background-color: #d9d9d9;
        width: 70%;
        display: flex;

        justify-content: right;

        align-items: center;
        align-content: center;

        border-top-left-radius: 20px;
        border-top-right-radius: 20px;
        gap: 20px;
      }

      .search-input-submit {
        margin-right: 0px;
      }

      #searchdate {
        display: flex;
        gap: 10px;
        align-items: center;
        margin-right: 50px;
      }
      #searchdate span {
        color: white;
        margin: 0 10px;
        font-size: 20px;
        font-weight: bold;
      }

      /* main */
      #main-title {
        display: flex;
        align-items: end;
        justify-content: center;
        align-items: center;
        font-size: 30px;
        font-weight: bold;
        margin-bottom: 10px;
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

      #table1 {
        text-align: center;
        outline: none;
        width: 100%;
        table-layout: auto;
      }

      #main-pageing {
        padding-top: 10px;
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

      /*모달창*/
      .modal-content {
        height: 90%;
      }

      #modal-header {
        background-color: #d9d9d9;
        border-top-right-radius: 4px;
        border-top-left-radius: 4px;
      }

      #header-title {
        margin: 25px 20px 0px 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
      }

      #header-title p {
        font-size: 30px;
        font-weight: bold;
      }
      #header-title button {
        border: none;
        background: none;
      }
      #x_img {
        width: 15px;
        height: 20px;
      }

      #header-searchbar {
        display: flex;
        margin: 15px 20px;
        gap: 10px;
      }

      #modal-body {
        height: 80%;
        padding: 20px 30px 10px 30px;
      }
      #modal-body-table {
        width: 100%;
        text-align: center;
        border-collapse: separate;
      }

      #modal-body-table th {
        border-bottom: 3px solid #b4b4b4;
        padding-bottom: 7px;
      }

      #modal-body-table td {
        padding: 5px;
      }

      #body-total {
        display: flex;
        justify-content: space-between;
        background-color: #d9d9d9;
        padding: 0 10px;

        border-top: 2px solid white;
        border-bottom: 2px solid white;

        font-size: 20px;
        font-weight: bold;
      }
      #body-total-outline {
        border-top: 3px solid #d9d9d9;
        border-bottom: 3px solid #d9d9d9;
        margin: 0px 30px 10px 30px;
      }

      #modal-footer {
        background-color: #d9d9d9;
        border-top: 3px solid #b4b4b4;
        height: 8%;
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 5px;
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
            <p class="main_name">매출집계</p>
          </div>
        </div>

        <div id="top-right1">
          <button class="search-input-submit">년도별</button>
          <div id="searchdate">
            <input type="month" class="date-input" />
            <span>~</span>
            <input type="month" class="date-input" />
            <button class="search-input-submit">검색</button>
          </div>
        </div>
      </div>
      <div id="main">
        <div id="main-in">
          <div id="main-title">
            <p>03월 ~ 04월</p>
          </div>
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
                <th class="col-2">날짜</th>
                <th class="col-2">총입고가</th>
                <th class="col-2">총판매가</th>
                <th class="col-2">총수량</th>
                <th class="col-2">마진</th>
              </tr>
            </thead>

            <tbody>
              <tr>
                <td>2025-03-01</td>
                <td>160,000</td>
                <td>320,000</td>
                <td>50</td>
                <td>160,000</td>
              </tr>
              <tr>
                <td>2025-03-01</td>
                <td>160,000</td>
                <td>320,000</td>
                <td>50</td>
                <td>160,000</td>
              </tr>
              <tr>
                <td>2025-03-01</td>
                <td>160,000</td>
                <td>320,000</td>
                <td>50</td>
                <td>160,000</td>
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
            <div id="modal-header">
              <div id="header-title">
                <p>일자별 매출집계 내역</p>
                <button
                  type="button"
                  class="btn-close"
                  data-bs-dismiss="modal"
                  aria-label="Close"
                  id="btn-close-modal"
                >
                  <img
                    src="/resources/common/공통_Icon.png"
                    id="detail-x_img"
                  />
                </button>
              </div>
              <div id="header-searchbar">
                <select class="selectbox" placeholder="상태">
                  <option>판매</option>
                  <option>폐기</option>
                </select>
                <select class="selectbox" placeholder="카테고리">
                  <option>카테고리</option>
                  <option>스낵</option>
                  <option>음료</option>
                </select>
                <div class="search-div">
                  <input
                    type="text"
                    class="search-input"
                    placeholder="상품명 or 상품번호"
                  />
                  <input type="submit" class="search-input-submit" />
                </div>
              </div>
            </div>

            <div id="modal-body">
              <table id="modal-body-table">
                <thead>
                  <tr>
                    <th class="col-2">날짜</th>
                    <th class="col-2">상품번호</th>
                    <th class="col-1">카테고리</th>
                    <th class="col-3">상품명</th>
                    <th class="col-1">수량</th>
                    <th class="col-1">판매가</th>
                    <th class="col-2">판매/폐기</th>
                  </tr>
                </thead>

                <tbody>
                  <tr>
                    <td>2025-03-01</td>
                    <td>p1219045</td>
                    <td>스낵</td>
                    <td>달콤 프란찌(딸기)</td>
                    <td>10</td>
                    <td>64,000</td>
                    <td>판매</td>
                  </tr>
                  <tr>
                    <td>2025-03-01</td>
                    <td>p1219045</td>
                    <td>스낵</td>
                    <td>달콤 프란찌(딸기)</td>
                    <td>10</td>
                    <td>0</td>
                    <td>폐기</td>
                  </tr>
                  <tr>
                    <td>2025-03-01</td>
                    <td>p1219045</td>
                    <td>스낵</td>
                    <td>달콤 프란찌(딸기)</td>
                    <td>10</td>
                    <td>64,000</td>
                    <td>판매</td>
                  </tr>
                </tbody>
              </table>
            </div>

            <div id="body-total-outline">
              <div id="body-total">
                <p>2025년 03월 01일</p>
                <p></p>
                <p>총 매출 금액 : 100,000원</p>
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

        document.querySelectorAll('#modal-body button').forEach((button) => {
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
