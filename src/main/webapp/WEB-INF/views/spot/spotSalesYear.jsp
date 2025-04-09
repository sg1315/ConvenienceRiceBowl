<%@ page import="java.time.LocalDate" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>지점 연매출</title>
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
        width: 65%;
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
        width: 35%;
        display: flex;
        gap: 10px;
        padding-right: 40px;
        padding-left: 50px;
         justify-content: space-between;
        /*justify-content: center;*/
        align-items: center;
        align-content: center;

        border-top-left-radius: 20px;
        border-top-right-radius: 20px;
      }

      #yearPicker{
        text-align: center;
        font-weight: bold;
      }
      

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
        padding: 50px 50px 70px;
      }
      #main-in {
        background-color: white;
        width: 100%;
        height: 100%;
        border-radius: 20px;
        padding: 20px 50px 20px;
      }

      #table1 {
        text-align: center;
        outline: none;
        width: 100%;
        height: 90%;
        font-weight: bold;

      }
      #table1 thead{
        background: #477154;
        color: white;
        text-align: center;
      }
      #table1 tbody{
        background: white;
      }
      #table1 tbody tr td{
        vertical-align: middle;
        text-align: center;
       }
      #table1 tbody tr td:nth-child(1){
        background: #d9d9d9;
      }
      #table1 tbody tr td:nth-child(4){
        background: #A3B8A9;
      }
      #table1 tbody tr:hover td:nth-child(1) {
        background-color: #cfcfcf;
      }
      #table1 tbody tr:hover td:nth-child(4) {
        background-color: #8fa598;
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

        <div id="top-right1">
          <a href="/spot_sales"><button class="search-input-submit">월별</button></a>
          <div id="searchdate">
            <select class="date-input" id="yearPicker">

            </select>

          </div>
          <button class="search-input-submit">검색</button>
        </div>
      </div>
      <div id="main">
        <div id="main-in">
          <div id="main-title">
            <%
              String year = String.valueOf(java.time.LocalDate.now().getYear());
              request.setAttribute("yearCurrent", year);
            %>
            &lt;<p id="year"><span>${yearCurrent}</span></p>&gt;
          </div>
          <table class="table table-hover table-bordered table-sm" id="table1">
            <thead>
              <tr>
                <th class="col-1">날짜</th>
                <th class="col-2">입고가</th>
                <th class="col-2">판매가</th>
                <th class="col-3">마진</th>
              </tr>
            </thead>

            <tbody>
              <tr>
                <td><span class="monthText">1</span>월</td>
                <td>200,000</td>
                <td>600,000</td>
                <td>400,000</td>
              </tr>
              <tr>
                <td><span class="monthText">2</span>월</td>
                <td>200,000</td>
                <td>600,000</td>
                <td>400,000</td>
              </tr>
              <tr>
                <td><span class="monthText">3</span>월</td>
                <td>400,000</td>
                <td>600,000</td>
                <td>200,000</td>
              </tr>
              <tr>
                <td><span class="monthText">4</span>월</td>
                <td>400,000</td>
                <td>600,000</td>
                <td>200,000</td>
              </tr>
              <tr>
                <td><span class="monthText">5</span>월</td>
                <td>400,000</td>
                <td>600,000</td>
                <td>200,000</td>
              </tr>
              <tr>
                <td><span class="monthText">6</span>월</td>
                <td>400,000</td>
                <td>600,000</td>
                <td>200,000</td>
              </tr>
              <tr>
                <td><span class="monthText">7</span>월</td>
                <td>400,000</td>
                <td>600,000</td>
                <td>200,000</td>
              </tr>
              <tr>
                <td><span class="monthText">8</span>월</td>
                <td>400,000</td>
                <td>600,000</td>
                <td>200,000</td>
              </tr>
              <tr>
                <td><span class="monthText">9</span>월</td>
                <td>400,000</td>
                <td>600,000</td>
                <td>200,000</td>
              </tr>
              <tr>
                <td><span class="monthText">10</span>월</td>
                <td>400,000</td>
                <td>600,000</td>
                <td>200,000</td>
              </tr>
              <tr>
                <td><span class="monthText">11</span>월</td>
                <td>400,000</td>
                <td>600,000</td>
                <td>200,000</td>
              </tr>
              <tr>
                <td><span class="monthText">12</span>월</td>
                <td>400,000</td>
                <td>600,000</td>
                <td>200,000</td>
              </tr>
            </tbody>
          </table>
        </div>

      </div>
    </div>

    <script>
      document.querySelectorAll('#table1 tbody tr').forEach((row) => {
        row.addEventListener('click', function () {
          const cells = this.querySelectorAll('td');
          const year =  document.getElementById("year").textContent.trim();
          console.log(year);
          cells.forEach((cell) => {
            const span = cell.querySelector('.monthText');
            if (span) {
              let month = span.textContent.trim();

              if(parseInt(month) < 10){
                const paddedMonth = '0'+ month
                let add = year + '-' + paddedMonth;
                window.location.href = '/spot_sales?startMonth='+ add +'&endMonth='+ add;
              }else{
                let add = year + '-' + month;
                window.location.href = '/spot_sales?startMonth='+ add +'&endMonth='+ add;
              }
            }
          });
        });
      });

    </script>
    <script>
      //셀렉스박스 날짜 불러오기
      function populateYearSelect() {
        const yearSelect = document.getElementById("yearPicker");
        const currentYear = new Date().getFullYear();
        const startYear = 1980;

        // 기존 옵션 초기화
        yearSelect.innerHTML = "";

        // 옵션 추가
        for (let year = currentYear; year >= startYear; year--) {
          let option = document.createElement("option");
          option.value = year;
          option.textContent = year;
          yearSelect.appendChild(option);
        }

        // 기본값을 현재 연도로 설정
        yearSelect.value = currentYear;
      }

      // 페이지 로드 시 실행
      document.addEventListener("DOMContentLoaded", populateYearSelect);
    </script>
    </div>
  </body>
</html>
