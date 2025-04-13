<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <title>지점 입고</title>
  <link rel="stylesheet" href="/resources/css/btn.css">
  <style>
    .waper{
      width:100%;
      height: 100%;
      padding: 50px;
    }
    .main-name{
      font-weight: bolder;
      font-size: 50px;
      margin: 0;
    }
    #top-manu{
      display: flex;
      justify-content: space-between;
      height: 15%;
    }
    #top-left{
      background-color: #D9D9D9;
      width: 50%;

    }
    #top-left1{
      background-color: white;
      display: flex;
      align-content: center;
      align-items: center;
      width: 100%;
      border-bottom-right-radius: 20px;
      padding-bottom: 10px;
      height: 100%;
    }

    #top-right1{
      background-color: #D9D9D9;
      width: 50%;
      display: flex;
      justify-content: right;
      align-items: center;
      border-top-left-radius: 20px;
      border-top-right-radius: 20px;
      padding-right: 3%;
      flex-wrap: wrap;
      gap: 10px;
      padding-top: 20px;
    }
    #top-right1 form{
      width: 100%;
      height: 100%;
      display: flex;
      justify-content: right;
    }
    #order-search{
      width: 91%;
      height: 100%;
    }
    #order-search-top{
      width: 100%;
      height: 50%;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding-right: 10px;
    }
    #order-search-top button:nth-child(1), #order-search-top button:nth-child(2){
      margin: 0px;
    }
    #order-search-bottom{
      width: 100%;
      height: 50%;
      display: flex;
      justify-content: right;
      align-items: center;
      gap: 10px;
    }

    #top-left p {
      padding-left: 15px;
    }
    #search-text input{
      width: 100%;
    }


    #table1 td img{
      width: 20px;
    }

    #top-left p {
      padding-left: 15px;
    }
    #main{
      background-color: #D9D9D9;
      width: 100%;
      height: 85%;
      border-bottom-left-radius: 20px;
      border-bottom-right-radius: 20px;
      padding: 50px 50px 100px;
      border-top-left-radius: 20px;
    }
    #main-in{
      background-color: white;
      width: 100%;
      height: 100%;
      border-radius: 20px;
      padding: 20px 50px 50px;
    }

    #main-pageing{
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
    #main-pageing img{
      width: 70px;
      padding: 10px;
    }
    #main-pageing img:nth-of-type(2) {
      transform: rotate(180deg);
    }

    #main-pageing button{
      border: #B4B4B4 solid 3px;
      background: white;
      color: #B4B4B4;
      font-weight: bold;
      margin: 5px;
    }
    #main-pageing button:hover{
      border: #3C3C3C solid 3px;
      color: #3C3C3C;
      font-weight: bold;
    }

    /*모달창*/
    #input-modal-content{
      height: 90vh;
    }
    #modal-header {
      background-color: #d9d9d9;
      border-top-right-radius: 4px;
      border-top-left-radius: 4px;
    }

    #mo-header-title {
      width: inherit;
      margin: 25px 20px 0px 20px;
      display: flex;
      justify-content: space-between;
    }

    #header-title p {
      font-size: 30px;
      font-weight: bold;
    }

    #header-title-name {
      display: flex;
    }
    #header-title-name p {
      padding: 0 10px;
      font-weight: bold;
    }
    #header-title-name p:nth-child(2) {
      padding: 0;
    }

    #btn-close-modal {
      border: none;
      background: none;
    }

    #header-searchbar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin: 20px 25px;
    }

    #selectbox-div {
      display: flex;
      justify-content: center;
      align-items: center;
      gap: 10px;
    }
    .selectbox{
      width: 110px;
    }

    .header-info {
      display: flex;
      gap: 10px;
    }
    #header-info-title p:nth-child(1) {
      font-size: 16px;
      font-weight: bold;
    }
    #header-info-title p:nth-child(2) {
      font-size: 20px;
      font-weight: bold;
      text-align: right;
    }
    .black-big-btn{
      font-size: 18px;
    }

    #modal-body {
      height: 80%;
      padding: 20px 30px 10px 30px;
    }
    #modal-body-table {
      width: 100%;
      text-align: center;
      border-collapse: separate;
      font-size: 20px;
    }

    #modal-body-table th {
      border-bottom: 3px solid #b4b4b4;
      padding-bottom: 7px;
    }

    #modal-body-table td {
      padding: 5px;
      vertical-align: middle;
      text-align: center;
    }
    #modal-body-table input {
      width: 50px;
      border: 1px solid #d9d9d9;
      border-radius: 4px;
    }

    #modal-footer {
      background-color: #d9d9d9;
      border-top: 3px solid #b4b4b4;
      height: 10%;
      display: flex;
      justify-content: center;
      align-items: center;
      margin-top: 5px;
    }

    #modal-pageing {
      margin: 0;
    }

    #modal-pageing img {
      width: 50px;
    }

    #modal-pageing img:nth-of-type(2) {
      transform: rotate(180deg);
    }

    #modal-pageing button {
      width: 50px;
      height: 50px;
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
    /* /modal */
    #modal-body-table {
      table-layout: fixed;
      width: 100%;
      height: 100%;
      border-collapse: collapse;
    }
    #modal-body-table thead {
      display: table;
      width: 100%;
      table-layout: fixed;
    }
    #modal-body-table tbody {
      display: block;
      overflow-y: auto;
      width: 100%;
      height: 90%;
    }

    #modal-body-table tbody tr {
      display: table;
      width: 100%;
      table-layout: fixed;
    }


  </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="waper">
  <div id="top-manu">
    <div id="top-left">
      <div id="top-left1">
        <img src="../resources/menu_icons/입고 아이콘.png">
        <p class="main-name">입고</p>
      </div>
    </div>
    <div id="top-right1">
      <form>
        <div id="order-request">

        </div>
        <div id="order-search">
          <form id="order-search-form" method="get" action="/spot_input">
            <div id="order-search-top">
              <button type="button" class="search-input-submit" id="previousMonthOrder">저번 달</button>
              <button type="button" class="search-input-submit" onclick="recent()">최근</button>
              <input class="date-input" type="date" name="startDate"> ~ <input class="date-input" type="date" name="endDate">
            </div>
            <div id="order-search-bottom">
              <div class="selectbox" id="status-select">
                <select name="status">
                  <option value="">상태</option>
                  <option value="7">입고 대기</option>
                  <option value="2">입고</option>
                </select>
              </div>
              <div>
                <input class="search-input" type="text" name="setNo" placeholder="발주번호">
                <button class="search-input-submit" id="btn-order-search" type="submit">검색</button>
              </div>
            </div>
          </form>
        </div>
      </form>
    </div>

  </div>
  <div id="main">
    <div id="main-in">
      <table class="table table-hover" id="table1">
        <thead>
        <tr>
          <th class="col-2">입고일자</th>
          <th class="col-2">발주번호</th>
          <th class="col-1">수량</th>
          <th class="col-5">금액</th>
          <th class="col-2">상태</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
          <c:when test="${not empty islist}">
            <c:forEach var="is" items="${islist}">
              <tr data-setno="${is.setNo}">
                <c:choose>
                  <c:when test="${is.status == 2}">
                    <td>${is.minuteGroup}</td>
                  </c:when>
                  <c:otherwise>
                    <td>-</td>
                  </c:otherwise>
                </c:choose>
                <td>${is.setNo}</td>
                <td>${is.totalAmount}</td>
                <td><fmt:formatNumber value="${is.totalInputPrice}" type="number" groupingUsed="true" /></td>
                <td>
                  <c:choose>
                    <c:when test="${is.status == 2}">입고</c:when>
                    <c:when test="${is.status == 7}">입고 대기</c:when>
                    <c:otherwise>알 수 없음</c:otherwise>
                  </c:choose>
                </td>
              </tr>
            </c:forEach>
          </c:when>

          <c:otherwise>
            <c:forEach var="i" items="${ilist}">
              <tr data-setno="${i.setNo}">
                <c:choose>
                  <c:when test="${i.status == 2}">
                    <td>${i.minuteGroup}</td>
                  </c:when>
                  <c:otherwise>
                    <td>-</td>
                  </c:otherwise>
                </c:choose>
                <td>${i.setNo}</td>
                <td>${i.totalAmount}</td>
                <td><fmt:formatNumber value="${i.totalInputPrice}" type="number" groupingUsed="true" /></td>
                <td>
                  <c:choose>
                    <c:when test="${i.status == 2}">입고</c:when>
                    <c:when test="${i.status == 7}">입고 대기</c:when>
                    <c:otherwise>알 수 없음</c:otherwise>
                  </c:choose>
                </td>
              </tr>
            </c:forEach>
          </c:otherwise>
        </c:choose>
        </tbody>
      </table>
    </div>
    <div id="main-pageing">
      <c:if test="${pi.startPage > 1}">
        <a href="spot_input?cpage=${pi.startPage - 1}&setNo=${param.setNo}&status=${param.status}&startDate=${param.startDate}&endDate=${param.endDate}">
          <img src="/resources/common/공통_페이징바화살표.png" alt="이전">
        </a>
      </c:if>
      <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}" step="1">
        <button type="button"
                class="btn btn-outline-secondary <c:if test='${pi.currentPage == i}'>active</c:if>'"
                onclick="location.href='spot_input?cpage=${i}&setNo=${param.setNo}&status=${param.status}&startDate=${param.startDate}&endDate=${param.endDate}'">
            ${i}
        </button>
      </c:forEach>
      <c:if test="${pi.endPage < pi.maxPage}">
        <a href="spot_input?cpage=${pi.endPage + 1}&setNo=${param.setNo}&status=${param.status}&startDate=${param.startDate}&endDate=${param.endDate}">
          <img src="/resources/common/공통_페이징바화살표.png" alt="다음">
        </a>
      </c:if>
    </div>
  </div>

  <!--start point-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

  <!-- Modal -->
  <!-- detail-Modal -->
  <div class="modal fade" id="input_list_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
      <div class="modal-content" id="input-modal-content">
        <div id="modal-header">
          <div id="mo-header-title">
            <div id="header-title-name">
              <p id="input-info">

              </p>
            </div>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="btn-close-modal">
              <img src="/resources/common/공통_Icon.png" id="detail-x_img"/>
            </button>
          </div>

          <div id="header-searchbar">
            <div id="selectbox-div">
              <h1 style="font-weight: bold;">입고 품목</h1>
              <div class="search-div">

              </div>
            </div>

            <div class="header-info">
              <div id="header-info-title">
                <p>
                  종류 (총 수량) : <span id="kind-count">0</span> (<span id="total-quantity">0</span>)
                </p>
                <p>
                  총 <span id="total-price">0</span> 원
                </p>
              </div>
              <button class="black-big-btn" id="insert-input-btn" style="display: none">입고완료</button>
            </div>
          </div>
        </div>

        <div id="modal-body">
          <table id="modal-body-table" class="table table-hover table-sm">
            <thead>
            <tr>
              <th class="col-1">상품번호</th>
              <th class="col-1">카테고리</th>
              <th class="col-1">상품명</th>
              <th class="col-1">입고수량</th>
              <th class="col-1">금액</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <%--       내용 불러오기       --%>
            </tr>
            </tbody>
          </table>
        </div>

        <div class="modal-footer" id="modal-footer">
          <div id="modal-pageing">
          </div>
        </div>
      </div>
    </div>
  </div>

  <script>
    document.addEventListener("DOMContentLoaded", function () {
      const rows = document.querySelectorAll("#table1 tbody tr");

      rows.forEach(row => {
        row.classList.add("table-row");
        row.addEventListener("click", function () {
          console.log("클릭")
          const setNo = this.children[1]?.textContent?.trim();
          const status = this.children[4]?.textContent?.trim();

          if (!setNo) {
            alert("세트번호를 찾을 수 없습니다.");
            return;
          }

          if(status === "입고 대기"){
            //thaed설정
            let headStr = "<tr>" +
                    "<th class='col-1'>" + "상품번호" + "</th>" +
                    "<th class='col-1'>" + "카테고리" + "</th>" +
                    "<th class='col-1'>" + "상품명" + "</th>" +
                    "<th class='col-1'>" + "발주수량" + "</th>" +
                    "<th class='col-1'>" + "실입고수량" + "</th>" +
                    "<th class='col-1'>" + "금액" + "</th>" +
                    "<th class='col-1'>" + "수량 오류" + "</th>";

            const inputHead = document.querySelector("#modal-body-table thead");
            inputHead.innerHTML = headStr;

            $.ajax({
              url: '/spot_order/orderDetail?setNo=' + setNo,
              method: 'GET',
              dataType: 'json',
              success: function (data) {
                let str = "";
                for (let i of data) {
                  str += "<tr>" +
                          "<td>" + i.productNo+ "</td>" +
                          "<td>" + i.categoryName + "</td>" +
                          "<td>" + i.productName + "</td>" +
                          "<td>" + i.circulationAmount + "</td>" +
                          "<td>" +
                          "<input id='inputAmount' type='number' value='" + i.circulationAmount + "' readonly data-price='" + i.inputPrice + "' data-sale-price='" + i.salePrice + "' />" +
                          "</td>" +
                          "<td><span class='sum-price'>" + i.sumInputPrice.toLocaleString() + "</span></td>" +
                          "<td>" +
                          "<input type='checkbox' class='edit-check''" + "'/>" +
                          "</td>" +
                          "</tr>";
                }

                const inputDetail = document.querySelector("#modal-body-table tbody");
                inputDetail.innerHTML = str;

                document.querySelectorAll('#modal-body-table input[type="number"]').forEach(input => {
                  input.addEventListener('input', () => {
                    const unitPrice = parseFloat(input.dataset.price || "0");
                    const quantity = parseInt(input.value || "0");
                    const newPrice = unitPrice * quantity;

                    const row = input.closest('tr');
                    const priceCell = row.querySelector('.sum-price');
                    if (priceCell) {
                      priceCell.textContent = newPrice.toLocaleString();
                    }

                    updateOrderDetailSummary();
                  });
                });

                document.querySelectorAll('.edit-check').forEach(checkbox => {
                  checkbox.addEventListener('change', function () {
                    const row = this.closest('tr');
                    const input = row.querySelector('#inputAmount');

                    if (this.checked) {
                      input.removeAttribute('readonly');
                      input.focus();
                    } else {
                      input.setAttribute('readonly', true);
                    }
                  });
                });


                const inputInfo = document.getElementById("input-info");
                const inputDate = data[0]?.circulationDate || "날짜 없음";

                inputInfo.innerHTML = `발주일자: `+ inputDate + ` | 발주번호: ` + setNo + ` | 상태: 입고 대기`;
                const myModal = new bootstrap.Modal(document.getElementById('input_list_modal'));
                myModal.show();

                const inputButton = document.getElementById("insert-input-btn");
                  inputButton.style.display = "inline-block";

                updateOrderDetailSummary();


                document.getElementById('insert-input-btn').addEventListener('click', function () {
                  const rows = document.querySelectorAll('#modal-body-table tbody tr');
                  const result = [];

                  rows.forEach(row => {
                    const tds = row.querySelectorAll('td');
                    const productNo = tds[0].textContent.trim();
                    const input = row.querySelector('input[type="number"]');

                    const inputPrice = parseFloat(input.dataset.price || "0");
                    const salePrice = parseFloat(input.dataset.salePrice || "0");
                    const circulationAmount = parseInt(input.value || "0");

                    result.push({
                      productNo: productNo,
                      setNo: setNo,  // 전역 또는 상위 스코프에서 이미 선언된 값
                      inputPrice: inputPrice,
                      salePrice: salePrice,
                      circulationAmount: circulationAmount
                    });
                  });

                  // 이제 POST 요청
                  $.ajax({
                    url: '/spot_order/insertInput',
                    method: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(result),
                    success: function (response) {
                      window.location.href = '/spot_input';
                    },
                    error: function (xhr, status, error) {
                      console.error('입고 등록 실패:', error);
                      alert('입고 등록 중 오류가 발생했습니다.');
                    }
                  });
                });


              },
              error: function (xhr, status, error) {
                console.error('AJAX 요청 실패:', error);
                alert('입고 상세 정보를 불러오는 데 실패했습니다.');
              }
            });

            //총 수량, 금액 계산
            function updateOrderDetailSummary() {
              let kindCount = 0;      // 종류 수
              let totalQuantity = 0;  // 총 수량
              let totalPrice = 0;     // 총 금액

              $('#input_list_modal tbody tr').each(function () {
                const td = $(this).find('td');
                kindCount += 1;
                const input = td[4]?.querySelector('input');  // td[4]는 <td> 요소
                const quantity = parseInt(input?.value) || 0;
                const priceText = td[5]?.textContent?.trim().replace(/,/g, '') || "0";
                const price = parseInt(priceText);

                totalQuantity += quantity;
                totalPrice += price;
              });

              // 화면에 반영
              $('#kind-count').text(kindCount);
              $('#total-quantity').text(totalQuantity);
              $('#total-price').text(totalPrice.toLocaleString());
            }
          }

          if(status === "입고"){
            //thaed설정
            let headStr = "<tr>" +
                    "<th class='col-1'>" + "상품번호" + "</th>" +
                    "<th class='col-1'>" + "카테고리" + "</th>" +
                    "<th class='col-1'>" + "상품명" + "</th>" +
                    "<th class='col-1'>" + "입고수량" + "</th>" +
                    "<th class='col-1'>" + "금액" + "</th>";

            const inputHead = document.querySelector("#modal-body-table thead");
            inputHead.innerHTML = headStr;

            $.ajax({
                url: '/spot_order/inputDetail?setNo=' + setNo,
                method: 'GET',
                dataType: 'json',
                success: function (data) {
                  let str = "";
                  for (let i of data) {
                    str += "<tr>" +
                            "<td>" + i.productNo+ "</td>" +
                            "<td>" + i.categoryName + "</td>" +
                            "<td>" + i.productName + "</td>" +
                            "<td>" + i.circulationAmount + "</td>" +
                            "<td>" + i.sumInputPrice.toLocaleString() + "</td>" +
                            "</tr>";
                  }

                  const inputDetail = document.querySelector("#modal-body-table tbody");
                  inputDetail.innerHTML = str;

                  const inputInfo = document.getElementById("input-info");
                  const inputDate = data[0]?.circulationDate || "날짜 없음";

                  inputInfo.innerHTML = `입고일자: `+ inputDate + ` | 발주번호: ` + setNo + ` | 상태: 입고`;
                  const myModal = new bootstrap.Modal(document.getElementById('input_list_modal'));
                  myModal.show();

                  updateInputDetailSummary();
                },
                error: function (xhr, status, error) {
                  console.error('AJAX 요청 실패:', error);
                  alert('입고 상세 정보를 불러오는 데 실패했습니다.');
                }
            });

            //총 수량, 금액 계산
            function updateInputDetailSummary() {
              let kindCount = 0;      // 종류 수
              let totalQuantity = 0;  // 총 수량
              let totalPrice = 0;     // 총 금액

              $('#input_list_modal tbody tr').each(function () {
                const td = $(this).find('td');
                kindCount += 1;
                const quantity = parseInt(td[3]?.textContent?.trim()) || 0;
                const priceText = td[4]?.textContent?.trim().replace(/,/g, '') || "0";
                const price = parseInt(priceText);

                totalQuantity += quantity;
                totalPrice += price;
              });

              // 화면에 반영
              $('#kind-count').text(kindCount);
              $('#total-quantity').text(totalQuantity);
              $('#total-price').text(totalPrice.toLocaleString());
            }
          }
        });
      });

      document.getElementById('insert-input-btn').addEventListener('click', function () {
        const rows = document.querySelectorAll('#modal-body-table tbody tr');
        const resultData = [];

        rows.forEach((row) => {
          const tds = row.querySelectorAll('td');
          const realInput = row.querySelector('.real-input');

          const productNo = tds[0].textContent.trim();
          const categoryName = tds[1].textContent.trim();
          const productName = tds[2].textContent.trim();
          const circulationAmount = parseInt(realInput.value) || 0;
          const inputPrice = parseInt(realInput.dataset.price);
          const sumInputPrice = inputPrice * circulationAmount;

          resultData.push({
            productNo,
            categoryName,
            productName,
            circulationAmount,
            inputPrice,
            sumInputPrice
          });
        });

        // 전송 (예시)
        $.ajax({
          url: '/spot_order/insertInput',
          method: 'POST',
          contentType: 'application/json',
          data: JSON.stringify({ setNo: setNo, data: resultData }),
          success: function (res) {
            alert('입고 등록 완료');
            // 모달 닫기, 리로드 등
          },
          error: function (xhr, status, error) {
            alert('등록 실패: ' + error);
          }
        });
      });
    });

  </script>
</div>
</body>
<%-- spotInput.js --%>
<script src="/resources/js/spotInput.js"></script>
</html>
