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
        width: 60%;
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
        width: 40%;
        display: flex;
        gap: 15px;
        /* justify-content: space-around; */
        justify-content: center;
        align-items: center;
        align-content: center;

        border-top-left-radius: 20px;
        border-top-right-radius: 20px;
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
      }
      #table1 thead{
        background: #477154;
        color: white;
        text-align: center;
      }
      #table1 tbody{
        background: white;
      }
      th, td{
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
          <a href="/spot-sales"><button class="search-input-submit">월별</button></a>
          <div id="searchdate">
            <input type="date" class="date-input" id="yearPicker">
          </div>
          <button class="search-input-submit">검색</button>
        </div>
      </div>
      <div id="main">
        <div id="main-in">
          <div id="main-title">
            <p>< 2025 ></p>
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
                <td>1월</td>
                <td>200,000</td>
                <td>600,000</td>
                <td>400,000</td>
              </tr>
              <tr>
                <td>2월</td>
                <td>200,000</td>
                <td>600,000</td>
                <td>400,000</td>
              </tr>
              <tr>
                <td>3월</td>
                <td>400,000</td>
                <td>600,000</td>
                <td>200,000</td>
              </tr>
              <tr>
                <td>4월</td>
                <td>400,000</td>
                <td>600,000</td>
                <td>200,000</td>
              </tr>
              <tr>
                <td>5월</td>
                <td>400,000</td>
                <td>600,000</td>
                <td>200,000</td>
              </tr>
              <tr>
                <td>6월</td>
                <td>400,000</td>
                <td>600,000</td>
                <td>200,000</td>
              </tr>
              <tr>
                <td>7월</td>
                <td>400,000</td>
                <td>600,000</td>
                <td>200,000</td>
              </tr>
              <tr>
                <td>8월</td>
                <td>400,000</td>
                <td>600,000</td>
                <td>200,000</td>
              </tr>
              <tr>
                <td>9월</td>
                <td>400,000</td>
                <td>600,000</td>
                <td>200,000</td>
              </tr>
              <tr>
                <td>10월</td>
                <td>400,000</td>
                <td>600,000</td>
                <td>200,000</td>
              </tr>
              <tr>
                <td>11월</td>
                <td>400,000</td>
                <td>600,000</td>
                <td>200,000</td>
              </tr>
              <tr>
                <td>12월</td>
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
        // 테이블의 모든 행에 클릭 이벤트 추가
        document.querySelectorAll('#table1 tbody tr').forEach((row) => {
          row.addEventListener('click', function () {
            // myModal.show(); // 모달 열기
            //클릭시 해당 월로 월 매출집계로 가는 기능 추가해야함
          });
        });

      </script>
    </div>
  </body>
</html>
