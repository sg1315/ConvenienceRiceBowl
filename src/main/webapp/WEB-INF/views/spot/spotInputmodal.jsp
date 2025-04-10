<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>입고</title>
  <link rel="stylesheet" href="/resources/css/btn.css">
  <style>
    .waper{
      width:100%;
      padding: 50px;
    }
    .main_name{
      font-weight: bolder;
      font-size: 50px;
      margin: 0;
    }
    #top-manu{
      display: flex;
      /*justify-content: space-between;*/
      /*!*background-color: white;*!*/
      /*background-color: #D9D9D9;*/
      border-top-right-radius: 20px;
    }

    #top-left{
      background-color: #D9D9D9;
      width: 70%;
    }
    #top-left1{
      background-color: white;
      display: flex;
      align-content: center;
      align-items: center;
      height: 100%;
      width: 100%;
      border-bottom-right-radius: 20px;
      padding-bottom: 10px;
      padding-left: 10px;
    }
    .search-input-submit{
      margin: 0px;
    }

    #top-right1{
      background-color: #D9D9D9;
      width: 100%;
      display: flex;
      justify-content: flex-end;
      align-items: center;
      border-top-left-radius: 20px;
      border-top-right-radius: 20px;
      gap: 10px;
      padding-top: 10px;
      padding-right: 3%;
    }
    #top-right1-left{
      display: flex    ;
      width: 90%;
      flex-direction: column;
      padding-top: 10px;

    }
    #top-right1-top{
      height: 50%;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    #top-right1-bottom{
      padding-top: 10px;
      height: 50%;
      display: flex;
      align-items: center;
      gap: 5%;
    }
    #search-text{
      width: 66.8%;
    }
    #search-text input{
      width: 100%;
    }
    #margi {
      height: 60%;
      width: 7%;
      margin-left: 5.5%;
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
      height: 80%;
      border-top-left-radius: 20px;
      border-bottom-left-radius: 20px;
      border-bottom-right-radius: 20px;
      padding: 50px 50px 100px;

    }
    #main-in{
      background-color: white;
      width: 100%;
      height: 100%;
      border-radius: 20px;
      padding: 50px;
    }
    @media screen and (max-width: 1800px) {
      #main-in{
        overflow-x: auto;
      }
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


  </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="waper">
  <div id="top-manu">
    <div id="top-left">
      <div id="top-left1">
        <img src="../resources/menu_icons/입고 아이콘.png">
        <p class="main_name">입고</p>
      </div>
    </div>
    <div id="top-right1">
      <div id="top-right1-left">
        <div id="top-right1-top">
          <input type="button" class="search-input-submit" value="저번 달">
          <input type="button" class="search-input-submit" value="최근">
          <input type="date" class="date-input">
          ~
          <input type="date" class="date-input">
          <div id="margi"></div>
        </div>
        <div id="top-right1-bottom">

          <div class="selectbox" id="category-select">
            <select>
              <option>카테고리</option>
              <option>스낵</option>
              <option>음료</option>
            </select>
          </div>
          <div id="search-text">
            <input class="search-input" type="text" placeholder="상품명 or 상품번호">
          </div>
          <input class="search-input-submit" type="submit" id="btn-search" value="검색"></div>
      </div>
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
        <tr>
          <td>25/12/10</td>
          <td>1219045</td>
          <td>스낵</td>
          <td>달콤 프란찌(딸기)</td>
          <td>입고 대기</td>
        </tr>
        </tbody>
      </table>
    </div>
    <div id="main-pageing">
      <c:if test="${pi.startPage > 1}">
        <a href="spot_order?cpage=${pi.startPage - 1}&setNo=${param.setNo}&status=${param.status}&startDate=${param.startDate}&endDate=${param.endDate}">
          <img src="/resources/common/공통_페이징바화살표.png" alt="이전">
        </a>
      </c:if>

      <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}" step="1">
        <button type="button"
                class="btn btn-outline-secondary <c:if test='${pi.currentPage == i}'>active</c:if>'"
                onclick="location.href='spot_order?cpage=${i}&setNo=${param.setNo}&status=${param.status}&startDate=${param.startDate}&endDate=${param.endDate}'">
            ${i}
        </button>
      </c:forEach>

      <c:if test="${pi.endPage < pi.maxPage}">
        <a href="spot_order?cpage=${pi.endPage + 1}&setNo=${param.setNo}&status=${param.status}&startDate=${param.startDate}&endDate=${param.endDate}">
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
              <p>입고번호</p>
              <p>|</p>
              <p>입고대기</p>
            </div>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="btn-close-modal">
              <img src="/resources/common/공통_Icon.png" id="detail-x_img"/>
            </button>
          </div>

          <div id="header-searchbar">
            <div id="selectbox-div">
              <select class="selectbox" placeholder="카테고리">
                <option>카테고리</option>
                <option>스낵</option>
                <option>음료</option>
              </select>
              <div class="search-div">
                <input type="text" class="search-input" placeholder="상품명 or 상품번호"/>
                <input type="submit" class="search-input-submit" value="검색" />
              </div>
            </div>

            <div class="header-info">
              <div id="header-info-title">
                <p>종류(총수량): 3(340)</p>
                <p>총 1,902,000</p>
              </div>
              <button class="black-big-btn">입고완료</button>
            </div>
          </div>
        </div>

        <div id="modal-body">
          <table id="modal-body-table" class="table table-hover table-sm">
            <thead>
            <tr>
              <th class="col-1">상품번호</th>
              <th class="col-1">카테고리</th>
              <th class="col-3">상품명</th>
              <th class="col-1">발주수량</th>
              <th class="col-1">입고수량</th>
              <th class="col-1">금액</th>
              <th class="col-2">입고수량오류</th>
            </tr>
            </thead>

            <tbody>
            <tr>
              <td>922351</td>
              <td>스낵</td>
              <td>달콤프란찌</td>
              <td>80</td>
              <td><input type="number" value="70" /></td>
              <td>64,000</td>
              <td><input type="checkbox" checked /></td>
            </tr>
            <tr>
              <td>922351</td>
              <td>스낵</td>
              <td>달콤프란찌</td>
              <td>80</td>
              <td>80</td>
              <td>64,000</td>
              <td><input type="checkbox"  /></td>
            </tr>

            <tr>
              <td>922351</td>
              <td>스낵</td>
              <td>달콤프란찌</td>
              <td>80</td>
              <td>80</td>
              <td>64,000</td>
              <td><input type="checkbox" /></td>
            </tr>
            </tbody>
          </table>
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
                document.getElementById('input_list_modal')
        );
        myModal.show(); // 모달 열기
      });
    });

    document.querySelectorAll('#modal-body button').forEach((button) => {
      if (button.textContent === '수정') {
        button.addEventListener('click', function () {
          // 기존 모달을 숨기기
          var myDetailModal = bootstrap.Modal.getInstance(
                  document.getElementById('input_list_modal')
          );
          myDetailModal.hide(); // 기존 모달 숨기기

          // 새로운 모달 띄우기 (새로운 모달 ID와 내용으로 변경 가능)
          var newModal = new bootstrap.Modal(
                  document.getElementById('input_list_modal')
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
