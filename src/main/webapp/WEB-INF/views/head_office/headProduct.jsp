<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>본사 상품관리</title>
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
        background-color: #d9d9d9;
        display: flex;
        justify-content: right;
        align-items: center;
      }

      #productadd{
        width: 100%;

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
        height: 30px;
        background-color: #d9d9d9;
        border-bottom: 3px solid #939393;
      }
      #table1 tbody tr {
        border-bottom: 3px solid #939393;
        height: 50px;
      }
      #footer {
        border-top: 3px solid #939393;
        background-color: #d9d9d9;
        height: 8%;
        border-bottom: 3px solid black;
        display: flex;
        justify-content: center;
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

      .modal-content {
        height: 500px;
      }
      .modal-header {
        border: none !important;
        background-color: #d9d9d9;
        font-size: 40px;
        font-weight: bold;
      }
      .modal-body {
        display: flex;
        justify-content: space-between;
        border: none !important;
      }
      #x_img {
        width: 15px;
        height: 20px;
      }
      #btn-close-modal {
        border: none;
        background: none;
      }
      #product-img {
        background-color: #d9d9d9;
        width: 48%;
        display: flex;
        justify-content: center;
        align-items: center;
      }
      #product-detail-box {
        background-color: #d9d9d9;
        width: 48%;
        display: flex;
        align-items: center;
        justify-content: center;
      }
      #product-detail {
        background-color: white;
        width: 100%;
        height: 90%;
      }
      #product-detail-puts {
        height: 80%;
        display: flex;
        justify-content: center;
        align-items: center;
      }
      #product-detail-table tr td input {
        border: 2px solid #d9d9d9;
        border-radius: 5px;
      }
      #product-detail-ok {
        display: flex;
        justify-content: right;
        margin-right: 28px;
      }
      #product-detail-table {
        border-collapse: separate;
        border-spacing: 10px 30px; /* 상하 간격을 10px로 설정 */
      }
      #product-detail-table tr td {
        font-size: 20px;
        font-weight: bold;
      }
      #product-add-select{
        width: 100%;
        height: 30px;
        font-weight: normal;
        border: 2px solid #d9d9d9;
        border-radius: 5px;
      }

      /*
        수정하기 모달창
         */
      #modify-x_img {
        width: 15px;
        height: 20px;
      }
      #btn-close-modify-modal {
        border: none;
        background: none;
      }
      #product-modify-img {
        background-color: #d9d9d9;
        width: 48%;
        display: flex;
        justify-content: center;
        align-items: center;
      }
      #product-detail-modify-box {
        background-color: #d9d9d9;
        width: 48%;
        display: flex;
        align-items: center;
        justify-content: center;
      }
      #product-detail-modify {
        background-color: white;
        width: 100%;
        height: 90%;
      }
      #product-detail-modify-puts {
        height: 80%;
        display: flex;
        justify-content: center;
        align-items: center;
      }
      #product-detail-modify-table tr td{
        text-align: center;
      }

      #product-detail-modify-table tr td input {
        border: 2px solid #d9d9d9;
        border-radius: 5px;
      }

      #product-detail-modify-table tr td input[type="checkbox"] {
        width: 20px;
        height: 20px;
      }

      #product-detail-modify-btn {
        display: flex;
        justify-content: right;
        margin-right: 10px;
      }
      #product-detail-modify-btn button {
        margin-right: 18px;
      }
      #product-detail-modify-table {
        border-collapse: separate;
        border-spacing: 10px 20px; /* 상하 간격을 10px로 설정 */
      }
      #product-detail-modify-table tr td {
        font-size: 20px;
        font-weight: bold;
      }
    </style>
  </head>
  <body>
    <jsp:include page="../common/header2.jsp" />
    <div id="form">
      <div id="form-top">
        <div id="form_name">상품 관리</div>
        <div id="form-top-btn">
          <button
            class="gray-btn-border"
            id="productadd"
            data-bs-toggle="modal"
            data-bs-target="#staticBackdrop"
          >
            상품추가
          </button>
        </div>
      </div>

      <div id="top-manu">
        <div id="top_serch">
          <form>
            <select class="search-input-gray">
              <option>상품번호</option>
              <option>카테고리</option>
              <option>상품명</option>
            </select>
            <input  class="search-input-gray" id="search-filed" type="text" />
            <input class="search-input-submit-gray" type="submit" value="검색" />
          </form>
        </div>
      </div>
      <div id="table-manu">
        <table id="table1">
          <colgroup>
            <col style="width: 15%" />
            <col style="width: 5%" />
            <col style="width: 50%" />
            <col style="width: 10%" />
            <col style="width: 10%" />
          </colgroup>
          <thead>
            <tr>
              <th>상품 번호</th>
              <th>카테고리</th>
              <th>상품명</th>
              <th>입고가</th>
              <th>판매가</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>18982</td>
              <td>스낵</td>
              <td>생생칩</td>
              <td>1500</td>
              <td>3000</td>
            </tr>
            <tr>
              <td>1800</td>
              <td>스낵</td>
              <td>태양칩</td>
              <td>900</td>
              <td>1800</td>
            </tr>
            <tr>
              <td>17083</td>
              <td>김밥</td>
              <td>치킨삼각김밥</td>
              <td>500</td>
              <td>1500</td>
            </tr>
            <tr>
              <td>18983</td>
              <td>스낵</td>
              <td>사르르초코칩</td>
              <td>1200</td>
              <td>2700</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div id="footer">
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
      <%--   상품 추가   --%>
      <div
        class="modal fade"
        id="staticBackdrop"
        data-bs-backdrop="static"
        data-bs-keyboard="false"
        tabindex="-1"
        aria-labelledby="staticBackdropLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog modal-lg modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <p>상품 추가</p>
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
              <div id="product-img">
                <button>이미지 찾기</button>
              </div>
              <div id="product-detail-box">
                <div id="product-detail">
                  <div id="product-detail-puts">
                    <table id="product-detail-table">
                      <tr>
                        <td>카테고리</td>
                        <td>
                          <select class="search-input-gray" id="product-add-select">
                            <option>스낵</option>
                            <option>음료</option>
                            <option>기타</option>
                          </select>
                        </td>
                      </tr>
                      <tr>
                        <td>상품명</td>
                        <td>
                          <input type="text" />
                        </td>
                      </tr>
                      <tr>
                        <td>입고가</td>
                        <td>
                          <input type="number" />
                        </td>
                      </tr>
                      <tr>
                        <td>판매가</td>
                        <td>
                          <input type="number" />
                        </td>
                      </tr>
                    </table>
                  </div>
                  <div id="product-detail-ok">
                    <button class="black-btn">완료</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <%--   상품 상세보기 및 수정/삭제   --%>
      <div class="modal fade" id="staticBackdrop-modify" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <p>상품 정보 수정</p>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="btn-close-modify-modal">
                <img src="/resources/common/공통_Icon.png" id="modify-x_img">
              </button>
            </div>
            <div class="modal-body">
              <div id="product-modify-img">
                이미지사진
              </div>
              <div id="product-detail-modify-box">
                <div id="product-detail-modify">
                  <div id="product-detail-modify-puts">
                    <table id="product-detail-modify-table">
                      <tr>
                        <td>
                          카테고리
                        </td>
                        <td>
                          <select class="search-input-gray" id="product-add-select">
                            <option>스낵</option>
                            <option>음료</option>
                            <option>기타</option>
                          </select>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          상품명
                        </td>
                        <td>
                          <input type="text">
                        </td>
                      </tr>
                      <tr>
                        <td>
                          입고가
                        </td>
                        <td>
                          <input type="number">
                        </td>
                      </tr>
                      <tr>
                        <td>
                          판매가
                        </td>
                        <td>
                          <input type="number">
                        </td>
                      </tr>
                      <tr>
                        <td>
                          입고불가
                        </td>
                        <td>
                          <input type="checkbox">
                        </td>
                      </tr>
                    </table>
                  </div>
                  <div id="product-detail-modify-btn">
                    <button class="black-btn">수정완료</button>
                    <button class="red-btn">삭제</button>
                  </div>
                </div>
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
              document.getElementById('staticBackdrop-modify')
            );
            myModal.show(); // 모달 열기
          });
        });
      </script>
      <!--end point-->
    </div>
  </body>
</html>
