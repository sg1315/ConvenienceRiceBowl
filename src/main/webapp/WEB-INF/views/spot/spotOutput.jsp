<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>출고</title>
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
      width: 40%;
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
      width: 60%;
      display: flex;
      justify-content: center;
      align-items: center;
      border-top-left-radius: 20px;
      border-top-right-radius: 20px;
      flex-wrap: wrap;
      gap: 10px;
      padding-top: 10px;
    }
    #top-right1-left{
      width: 80%;

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

    #btn-close-modal{
      width: 20px;
      height: 20px;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    #x_img{
      width: 10px;
      height: 10px;
    }
    .modal-content {
      height: 80vh;
    }
    .modal-header, .modal-footer{
      background-color: #D9D9D9;
    }
    .modal-body input, .modal-body select{
      border:1px solid gray;
      border-radius : 8px;
      width:80%;
      height:8%;
      text-align:center;
      margin-bottom:16px;
    }
    #modal-body-div{
      padding-left:18%;
      padding-top:4%;
    }
    #footer-btn{
      width:66%;
      margin-right:16%;
      background-color: #8A8A8A;
      border:none;
      font-weight:bold;
      font-size:20px;
      border-radius:10px;
    }
    #header-title{
      margin-left:22%;
    }
    #header-title h1{
      font-weight:bold;
      font-color:white;
    }
    .modal-dialog {
      position: absolute;
      top:5%;
      left: 20%;
      transform: translateX(20%);
    }


  </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="waper">
  <div id="top-manu">
    <div id="top-left">
      <div id="top-left1">
        <img src="../resources/menu_icons/출고 아이콘.png">
        <p class="main_name">출고</p>
      </div>
    </div>

    <div id="top-right1">
      <div id="top-right1-left">
        <div id="top-right1-top">
          <input type="button"  class="search-input-submit" value="저번 달">
          <input type="button"  class="search-input-submit" value="최근">
          <input type="date" class="date-input">
          ~
          <input type="date" class="date-input">
        </div>
        <div id="top-right1-bottom">
          <div class="selectbox" id="status-check">
            <select>
              <option>상태</option>
              <option>판매</option>
              <option>폐기</option>
            </select>
          </div>
          <div class="selectbox" id="category-select">
            <select>
              <option>카테고리</option>
              <option>스낵</option>
              <option>음료</option>
            </select>
          </div>
          <div id="search-text">
            <input class="search-input" type="text" placeholder="상품명 or 상품번호"/>
          </div>
        </div>
      </div>

      <div id="search-box">
        <div id="margi"></div>
        <input class="search-input-submit" type="submit" id="btn-search" value="검색" />
      </div>
    </div>

  </div>
  <div id="main">
    <div id="main-in">
      <table class="table table-hover" id="table1">
        <thead>
        <tr>
          <th class="col-1">출고날짜</th>
          <th class="col-1">상품번호</th>
          <th class="col-1">카테고리</th>
          <th class="col-2">상품명</th>
          <th class="col-1">수량</th>
          <th class="col-1">금액</th>
          <th class="col-1">상태</th>
        </tr>
        </thead>
        <tbody >
        <tr>
          <td>25/12/10</td>
          <td>1219045</td>
          <td>스낵</td>
          <td>달콤 프란찌(딸기)</td>
          <td>2</td>
          <td>0</td>
          <td>폐기</td>
        </tr>
        <tr>
          <td>25/12/10</td>
          <td>1219046</td>
          <td>스낵</td>
          <td>달콤 프란찌(메론)</td>
          <td>80</td>
          <td>64,000</td>
          <td>판매</td>
        </tr>
        <tr>
          <td>25/12/10</td>
          <td>1219047</td>
          <td>스낵</td>
          <td>달콤 프란찌(초코)</td>
          <td>50</td>
          <td>40,000</td>
          <td>판매</td>
        </tr>

        </tbody>
      </table>
    </div>
    <div id="main-pageing">
      <img src="/resources/common/공통_페이징바화살표.png">
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
      <img src="/resources/common/공통_페이징바화살표.png">
    </div>
  </div>

  <!--start point-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

  <!-- Modal -->
  <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <div id="header-title">
            <h1 class="modal-title fs-5">상품정보</h1>
          </div>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="btn-close-modal">
            <img src="<c:url value="/resources/common/공통_Icon.png"/>" id="x_img">
          </button>
        </div>
        <div class="modal-body">
          <!--모달 내용-->
          <div id="modal-body-div">
            <p>
              <strong>상품번호</strong>
              <input type="text" id="modal-productCode" readonly>
            </p>
            <p>
              <strong>카테고리</strong>
              <input type="text" id="modal-productCategory" readonly>
            </p>
            <p>
              <strong>상품명</strong>
              <input type="text" id="modal-productName" readonly>
            </p>
            <p>
              <strong>입고가</strong>
              <input type="text" id="modal-productInputPrice" readonly>
            </p>
            <p>
              <strong>판매가</strong>
              <input type="text" id="modal-productSalePrice" readonly>
            </p>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" id="footer-btn">수정</button>
        </div>
      </div>
    </div>
  </div>
  <script>
    <!-- 모달 funcion -->
    document.addEventListener("DOMContentLoaded", function () {

      const rows = document.querySelectorAll("#table1 tbody tr");

      rows.forEach(row => {
        row.classList.add("table-row");

        row.addEventListener("click", function () {
          const code = this.children[0].textContent;
          const category = this.children[1].textContent;
          const name = this.children[2].textContent;
          const input = this.children[3].textContent;
          const sale = this.children[4].textContent;

          document.getElementById("modal-productCode").value = code;
          document.getElementById("modal-productCategory").value = category;
          document.getElementById("modal-productName").value = name;
          document.getElementById("modal-productInputPrice").value = input;
          document.getElementById("modal-productSalePrice").value = sale;

          const modal = new bootstrap.Modal(document.getElementById("staticBackdrop"));
          modal.show();
        });
      });
    });

    <!-- 검색 function -->

  </script>
  <!--end point-->
</div>
</body>
</html>
