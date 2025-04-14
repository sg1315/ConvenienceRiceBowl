<%@ page import="java.time.LocalDate" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
        contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>
<head>
  <title>지점 월매출</title>
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
      width: 50%;
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
      width: 50%;
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
      padding-top: 5px;
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

    #mo-header-title {
      width: inherit;
      margin: 25px 20px 0px 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    #mo-header-title p {
      font-size: 30px;
      font-weight: bold;
    }
    #mo-header-title button {
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
    #searchdate form input[type=month]{
      text-align: center;
      padding: 5px;
      font-size: 16px;
      border-radius: 6px;
    }
  </style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<div class="waper">
  <div id="top-manu">
    <div id="top-left">
      <div id="top-left1">
        <img src="../resources/menu_icons/매출집계 아이콘.png" />
        <p class="main_name">매출집계</p>
      </div>
    </div>
    <%
      // Java 코드로 오늘 날짜를 'yyyy-MM' 형식으로 JSP에서 쓰기 위해 request에 저장
      String thisMonth = LocalDate.now().toString().substring(0, 7);
      request.setAttribute("thisMonth", thisMonth);
    %>

    <div id="top-right1">
      <a href="/spot_salesYear"><button class="search-input-submit">년도별</button></a>
      <div id="searchdate">
        <c:set var="startMonthVal" value="${param.startMonth ne null ? param.startMonth : thisMonth}" />
        <c:set var="endMonthVal" value="${param.endMonth ne null ? param.endMonth : thisMonth}" />

        <form action="/spot_sales" method="get">
          <label>
            <input type="month" id="startMonth" name="startMonth" class="date-input" required value="${startMonthVal}">
          </label>
          <span>~</span>
          <label>
            <input type="month" id="endMonth" name="endMonth" class="date-input" required value="${endMonthVal}">
          </label>
          <button type="submit" class="search-input-submit" id="submitSearch">검색</button>
        </form>
      </div>
    </div>
  </div>
  <div id="main">
    <div id="main-in">
      <div id="main-title">
        <c:set var="startMonthText" value="${fn:substring(startMonthVal, 5, 7)}" />
        <c:set var="endMonthText" value="${fn:substring(endMonthVal, 5, 7)}" />

        <c:choose>
          <c:when test="${startMonthText eq endMonthText}">
            <p>${startMonthText + 0}월</p>
          </c:when>
          <c:otherwise>
            <p>${startMonthText + 0}월 ~ ${endMonthText + 0}월</p>
          </c:otherwise>
        </c:choose>


      </div>
      <table class="table table-hover" id="table1">
        <thead>
        <tr>
          <th class="col-2">날짜</th>
          <th class="col-2">총입고가</th>
          <th class="col-2">총판매가</th>
          <th class="col-2">마진</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="sales" items="${list}">
          <tr class="table-row" data-date="${sales.circulationDate}">
            <td><fmt:formatDate value="${sales.circulationDate}" pattern="yyyy-MM-dd" /></td>
            <td><fmt:formatNumber value="${sales.inputPrice}" type="number" /></td>
            <td class="sumPrice"><fmt:formatNumber value="${sales.salePrice}" type="number" /></td>
            <td class="margin"><fmt:formatNumber value="${sales.salePrice - sales.inputPrice}" type="number" /></td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
    <div id="main-pageing">
      <c:if test="${pi.startPage > 1}">
        <a href="spot_sales?cpage=${pi.startPage - 1}&startMonth=${param.startMonth}&endMonth=${param.endMonth}">
          <img src="/resources/common/공통_페이징바화살표.png" alt="이전">
        </a>
      </c:if>

      <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}" step="1">
        <button type="button" class="btn btn-outline-secondary <c:if test='${pi.currentPage == i}'>active</c:if>'"
                onclick="location.href='spot_sales?cpage=${i}&startMonth=${param.startMonth}&endMonth=${param.endMonth}'">
            ${i}
        </button>
      </c:forEach>

      <c:if test="${pi.endPage < pi.maxPage}">
        <a href="spot_sales?cpage=${pi.endPage + 1}&startMonth=${param.startMonth}&endMonth=${param.endMonth}">
          <img src="/resources/common/공통_페이징바화살표.png" alt="다음">
        </a>
      </c:if>

    </div>
  </div>
</div>
</div>

<!--start point-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

<!-- Modal -->
<!-- detail-Modal -->
<div class="modal fade" id="detail-staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div id="modal-header">
        <div id="mo-header-title">
          <p>일자별 매출집계 내역</p>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="btn-close-modal">
            <img src="/resources/common/공통_Icon.png" id="detail-x_img"/>
          </button>
        </div>
        <div id="header-searchbar">
          <div class="search-div">
          </div>
        </div>
      </div>

      <div id="modal-body">
        <div style="max-height: 100%; overflow-y: auto;">
        <table id="modal-body-table">
          <thead>
          <tr>
            <th class="col-1">상품번호</th>
            <th class="col-2">카테고리</th>
            <th class="col-4">상품명</th>
            <th class="col-1">수량</th>
            <th class="col-2">금액</th>
            <th class="col-1">구분</th>
          </tr>
          </thead>
            <tbody id="modal-tbody">
            <tr class="table-row"></tr>
            </tbody>
        </table>
      </div>
      </div>

      <div id="body-total-outline">
        <div id="body-total"></div>
      </div>

      <div class="modal-footer" id="modal-footer">
        <div id="modal-pageing"></div>
      </div>
    </div>
  </div>
</div>

<script>
  document.addEventListener("DOMContentLoaded", function () {
    const rows = document.querySelectorAll("#table1 .table-row");

    rows.forEach(row => {
      const rawDate = new Date(row.dataset.date);
      const date = rawDate.toISOString().split("T")[0];
      const countTd = row.querySelector(".countAmount");
      const marginTd = row.querySelector(".margin");
      const inputPrice = parseInt(row.querySelector("td:nth-child(2)")?.innerText.replace(/,/g, "") || "0");
      const salePrice = parseInt(row.querySelector("td:nth-child(3)")?.innerText.replace(/,/g, "") || "0");

      fetch("/spot_sales/detail?date=" + encodeURIComponent(date))
              .then(res => res.json())
              .then(data => {
                let totalAmount = 0;
                data.forEach(item => {
                  totalAmount += item.circulationAmount;
                });
                countTd.textContent = totalAmount;
                marginTd.textContent = (salePrice - inputPrice).toLocaleString();
              });

      row.addEventListener("click", function () {
        const modalTbody = document.getElementById("modal-tbody");
        const bodyTotal = document.getElementById("body-total");

        modalTbody.innerHTML = "";
        bodyTotal.innerHTML = "";
        let inputtotalsal = 0;
        let outtotalsal = 0;
        let inputsal = 0;
        let outsal = 0;

        fetch("/spot_sales/detail?date=" + encodeURIComponent(date))
                .then(res => res.json())
                .then(data => {
                  let countAmount = 0;

                  data.forEach(item => {
                    const tr = document.createElement("tr");
                    const statusText =  item.status === 1 ? "발주요청" :
                                        item.status === 2 ? "입고" :
                                        item.status === 3 ? "판매" :
                                        item.status === 4 ? "폐기" :
                                        item.status === 5 ? "승인" :
                                        item.status === 6 ? "거절" :
                                        item.status === 7 ? "발주완료" :
                                        "알 수 없음";

                    if (item.status === 2 && item.inputPrice && item.circulationAmount) {
                      inputtotalsal += item.circulationAmount * item.inputPrice;
                      inputsal = item.circulationAmount * item.inputPrice;
                    }
                    if (item.status === 3 && item.inputPrice && item.circulationAmount) {
                      outtotalsal += item.circulationAmount * item.salePrice;
                      outsal = item.circulationAmount * item.salePrice;
                    }

                    countAmount += item.circulationAmount;

                    const priceText =
                            item.status === 2 ? '-'+inputsal :
                            item.status === 3 ? outsal :
                            "-";

                    tr.innerHTML =
                            "<td>" + item.productNo + "</td>" +
                            "<td>" + item.categoryName + "</td>" +
                            "<td>" + item.productName + "</td>" +
                            "<td>" + item.circulationAmount + "</td>"+
                            "<td>" + priceText.toLocaleString() + "</td>" +
                            "<td>" + statusText + "</td>";
                    modalTbody.appendChild(tr);
                  });

                  bodyTotal.innerHTML = "<p>" + date + "</p>" +
                          "<p></p>" +
                          "<p>합계 : " + (outtotalsal-inputtotalsal).toLocaleString() + " 원</p>";

                  new bootstrap.Modal(document.getElementById("detail-staticBackdrop")).show();
                });
      });
    });
  });
</script>

<!--end point-->
</div>
</body>
</html>