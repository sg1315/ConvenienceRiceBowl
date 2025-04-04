<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <!-- JavaScript -->
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

    <!-- CSS -->
    <link
      rel="stylesheet"
      href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"
    />
    <!-- Default theme -->
    <link
      rel="stylesheet"
      href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"
    />
    <!-- Semantic UI theme -->
    <link
      rel="stylesheet"
      href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"
    />
    <!-- Bootstrap theme -->
    <link
      rel="stylesheet"
      href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"
    />

    <!-- Open Sans -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap"
      rel="stylesheet"
    />

    <!-- Latest compiled and minified CSS -->
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />

    <!-- jQuery library  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <title>본사 상품관리</title>
    <link rel="stylesheet" href="/resources/css/btn.css" />
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

      #productadd {
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
      .search-input-gray {
        width: 100px;
        font-size: 16px;
        padding: 0;
        text-align: center;
      }

      #search-filed {
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
      #insert-product-form {
        height: 100%;
        display: flex;
        justify-content: space-between;
        border: none;
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
      #product-add-select {
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
      #modal-modify-body {
        display: flex;
        justify-content: space-between;
        border: none !important;
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
      #product-detail-modify-table tr td {
        text-align: center;
      }

      #product-detail-modify-table tr td input {
        border: 2px solid #d9d9d9;
        border-radius: 5px;
      }

      #product-detail-modify-table tr td input[type='checkbox'] {
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
          <form id="searchForm" method="post" action="searchProduct">
            <select class="search-input-gray" name="condition">
              <option value="productNo">상품번호</option>
              <option value="category">카테고리</option>
              <option value="productName">상품명</option>
            </select>
            <input
              class="search-input-gray"
              id="search-filed"
              type="text"
              name="keyword"
            />
            <input
              class="search-input-submit-gray"
              type="submit"
              value="검색"
            />
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
              <th hidden></th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="p" items="${list}">
              <tr>
                <td>${p.productNo}</td>
                <td>${p.categoryName}</td>
                <td>${p.productName}</td>
                <td>${p.inputPrice}</td>
                <td>${p.salePrice}</td>
                <td hidden>${p.availavility}</td>
              </tr>
            </c:forEach>
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
      <%-- 상품 추가 --%>
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
            <div class="modal-body" id="modal-body">
              <form
                action="insertProduct.he"
                id="insert-product-form"
                method="post"
              >
                <div id="product-img">
                  <input type="file" value="이미지 찾기" />
                </div>
                <div id="product-detail-box">
                  <div id="product-detail">
                    <div id="product-detail-puts">
                      <table id="product-detail-table">
                        <tr>
                          <td>카테고리</td>
                          <td>
                            <select
                              class="search-input-gray"
                              id="product-add-select11"
                            >
                              <!--
                                    <option>스낵</option>
                                    <option>음료</option>
                                    <option>기타</option>
                                    -->
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td>상품명</td>
                          <td>
                            <input
                              type="text"
                              id="productName"
                              name="productName"
                            />
                          </td>
                        </tr>
                        <tr>
                          <td>입고가</td>
                          <td>
                            <input
                              type="number"
                              id="inputPrice"
                              name="inputPrice"
                            />
                          </td>
                        </tr>
                        <tr>
                          <td>판매가</td>
                          <td>
                            <input
                              type="number"
                              id="salePrice"
                              name="salePrice"
                            />
                          </td>
                        </tr>
                      </table>
                    </div>
                    <div id="product-detail-ok">
                      <button class="black-btn" type="submit">완료</button>
                    </div>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>

      <%-- 상품 상세보기 및 수정/삭제 --%>
      <div
        class="modal fade"
        id="staticBackdrop-modify"
        data-bs-backdrop="static"
        data-bs-keyboard="false"
        tabindex="-1"
        aria-labelledby="staticBackdropLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog modal-lg modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <p>상품 정보 수정</p>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
                id="btn-close-modify-modal"
              >
                <img src="/resources/common/공통_Icon.png" id="modify-x_img" />
              </button>
            </div>
            <div class="modal-body" id="modal-modify-body">
              <div id="product-modify-img">이미지사진</div>
              <div id="product-detail-modify-box">
                <div id="product-detail-modify">
                  <div id="product-detail-modify-puts">
                    <table id="product-detail-modify-table">
                      <tr>
                        <td>수정중모달</td>
                        <td>
                          <select
                            class="search-input-gray"
                            id="product-add-select"
                          >
                            <!--
                            <option>스낵</option>
                            <option>음료</option>
                            <option>기타</option>
                            -->
                          </select>
                        </td>
                      </tr>
                      <tr>
                        <td>상품명</td>
                        <td>
                          <input type="text" id="modal-productName" />
                        </td>
                      </tr>
                      <tr>
                        <td>입고가</td>
                        <td>
                          <input type="number" id="modal-inputPrice" />
                        </td>
                      </tr>
                      <tr>
                        <td>판매가</td>
                        <td>
                          <input type="number" id="modal-salePrice" />
                        </td>
                      </tr>
                      <tr>
                        <td>입고불가</td>
                        <td>
                          <input type="checkbox" id="modal-availavility" />
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
        document.addEventListener('DOMContentLoaded', function () {
          const rows = document.querySelectorAll('#table1 tbody tr');
          rows.forEach((row) => {
            row.classList.add('table-row');

            row.addEventListener('click', function () {
              const productNo = this.children[0].textContent;
              const categoryName = this.children[1].textContent;
              const productName = this.children[2].textContent;
              const inputPrice = this.children[3].textContent;
              const salePrice = this.children[4].textContent;
              const availavility = this.children[5].textContent;

              //document.getElementById("modal-productNo").value = productNo;
              let sel = document.getElementById('product-add-select').options;
              for (var i = 0; i < sel.length; i++) {
                if (sel[i].value == 'categoryName') {
                  sel[i].selected = true;
                }
              }
              document.getElementById('modal-productName').value = productName;
              document.getElementById('modal-inputPrice').value = inputPrice;
              document.getElementById('modal-salePrice').value = salePrice;
              if (availavility == 'Y') {
                document.getElementById('modal-availavility').checked = true;
              }

              const modal = new bootstrap.Modal(
                document.getElementById('staticBackdrop-modify')
              );
              modal.show();
            });
          });
        });
        $(document).ready(function () {
          $.ajax({
            url: '/api/category/drawCategory',
            method: 'get',
            success: function (data) {
              console.log('받은 데이터:', data); // 데이터 확인하기

              if (typeof data === 'string') {
                data = JSON.parse(data); // 문자열이면 JSON 객체로 변환
              }

              var selectElement = document.getElementById('product-add-select');
              selectElement.innerHTML = '<option value="">카테고리</option>';

              var selectElement = document.getElementById('product-add-select');
              selectElement.innerHTML = '<option value="">카테고리</option>';
              
              
              const test = document.getElementById('product-add-select');

              data.forEach(function (category) {
                const option = document.createElement('option');
                option.value = category.categoryNo;
                option.textContent = category.categoryName;
                selectElement.appendChild(option);

                console.log(option);
                console.log(test);
              });
              test.innerHTML = option;

              console.log('통신성공');
            },
            error: function () {
              console.log('통신실패');
            },
          });
        });
      </script>
      <!--end point-->
    </div>
  </body>
</html>
