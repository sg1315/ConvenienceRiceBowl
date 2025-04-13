<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>상품정보</title>
  <link rel="stylesheet" href="/resources/css/btn.css">
  <style>
    .waper{
      width:100%;
      padding: 50px;
      font-family: 'Open Sans', sans-serif;
    }
    .main_name{
      font-weight: bolder;
      font-size: 50px;
      margin: 0;
    }
    #top-manu{
      display: flex;
      justify-content: space-between;
    }
    #top-left{
      background-color: #D9D9D9;
      width: 45%;
    }
    #top-left1{
      background-color: white;
      display: flex;
      align-content: center;
      align-items: center;
      width: 100%;
      border-bottom-right-radius: 20px;
      padding-bottom: 10px;
    }

    #top-right1{
      background-color: #D9D9D9;
      width: 55%;
      display: flex;
      justify-content: space-around;
      align-items: center;
      padding-right: 40px;
      border-top-left-radius: 20px;
      border-top-right-radius: 20px;
      gap: 10px;
    }
    #top-right1 form{
      width: 100%;
      display: flex;
      justify-content: space-around;
      align-items: center;
      margin: auto;
      gap: 10px;

    }

    #right-check{
      display: flex;
      padding: 5px;
      width: 15%;
      justify-content: center;
      font-weight: bold;
      align-items: center;
    }
    #right-check > input[type="checkbox"]{
      width: 15px;
      height: 15px;
    }
    #right-check p {
      padding-left: 5px;
    }
    #search-box{
      width: 70%;
      display: flex;
      justify-content: center;
    }
    #search-box input:nth-child(1){
      width: 80%;
      padding: 10px;
    }
    .selectbox select {
      color: #8a8a8a;
    }
    .selectbox option {
      color: black;
    }

    #table1 td img{
      width: 20px;
    }

    #top-l p {
      padding-left: 15px;
    }
    #main{
      background-color: #D9D9D9;
      width: 100%;
      height: 90%;
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
    #x_img {
      width: 15px;
      height: 20px;
    }

    /* 모달창 시작 */
    #modify-x_img {
      width: 15px;
      height: 20px;
    }
    #btn-close-modify-modal {
      border: none;
      background: none;
    }
    #modal-content {
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



    #product-modify-img {
      background-color: #d9d9d9;
      width: 48%;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    #product-modify-img img{
        width: 350px;
        height: 350px;
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
    }
    #product-detail-modify-puts {
      display: flex;
      justify-content: center;
      align-items: center;
    }
    #product-detail-modify-table tr td input {
      border-radius: 5px;
    }

    #product-detail-modify-table {
      border-collapse: separate;
      border-spacing: 10px 20px;
    }
    #product-detail-modify-table tr td {
      font-size: 18px;
      font-weight: bold;
    }


    #product-detail-modify-table p {
      padding-left: 10px;
    }
    #product-detail-modify-table input {
      padding-left: 10px;
      border: none;
      outline: none;
      box-shadow: none;
    }

    #product-detail-modify-table td{
      position: relative;
      padding: 5px;
    }

    #product-detail-modify-table td::after{
      content: '';
      position: absolute;
      top: 20%;
      left: 0;
      width: 2px;
      height: 60%;
      background-color: black;
    }

    #product-detail-modify-table td:first-child::after{
      content: none;
    }
    



  </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="waper">
  <div id="top-manu">
    <div id="top-left">
      <div id="top-left1">
        <img src="../resources/menu_icons/상품목록 아이콘.png">
        <p class="main_name">상품정보</p>
      </div>
    </div>

    <div id="top-right1">
      <form action="spotSearchForm" method="post">
      <div id="right-check">
        <input type="checkbox" name="inputcheck" ${inputcheck == 'on' ? 'checked' : ''} >
        <p>입고불가</p>
      </div>
        <div class="selectbox" id="category-select" >
          <select name="condition">
            <option value="productNo" ${condition == 'productNo' ? 'selected' : ''}>상품번호</option>
              <option value="category" ${condition == 'category' ? 'selected' : ''}>카테고리</option>
              <option value="productName" ${condition == 'productName' ? 'selected' : ''}>상품명</option>n>
          </select>
        </div>
        <div id="search-box">
          <input class="search-input" type="text" placeholder="상품명 or 상품번호" name="keyword" />
          <input class="search-input-submit" type="submit" value="검색" />
        </div>
      </div>
      </form>
  </div>
  <div id="main">
    <div id="main-in">
      <table class="table table-hover" id="table1">
        <thead>

          <th class="col-1">상품 번호</th>
          <th class="col-1">카테고리</th>
          <th style="display: none;">상품이미지</th>
          <th class="col-2">상품명</th>
          <th class="col-1">입고가</th>
          <th class="col-1">판매가</th>
          <th class="col-1">입고불가</th>
          <th style="display: none;"></th>
        </thead>
        <tbody >
          <c:forEach var="p" items="${list}">
            <tr>
              <td >${p.productNo}</td>
              <td >${p.categoryName}</td>
              <td style="display: none;"><img width="120px" height="99.5px" src="${p.filePath}" alt="상품이미지" ></td>
              <td >${p.productName}</td>
              <td  >${p.inputPrice}</td>
              <td  >${p.salePrice}</td>
              <td >
                <c:if test="${p.availability eq 'N'}">
                  <img src="/resources/common/상품목록_Cancel.png" alt="">
                   <br>
                </c:if>
               </td>         
              <td style="display: none;">${p.shortageAmount}</td>         
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
    <div id="main-pageing">
      <c:if test="${pi.startPage > 1}">
        <a href="spotSearchForm?cpage=${pi.endPage - 1}&inputcheck=${inputcheck}&condition=${condition}&keyword=${keyword}">
            <img src="/resources/common/공통_페이징바화살표.png" alt="이전">
        </a>
    </c:if>

    <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}" step="1">


        <button type="button"
                class="btn btn-outline-secondary
                 <c:if test='${pi.currentPage == i}'>active</c:if>"
                onclick="location.href='spotSearchForm?&inputcheck=${inputcheck}&cpage=${i}&condition=${param.condition}&keyword=${param.keyword}'">
                ${i}
        </button>
    </c:forEach>

    <c:if test="${pi.endPage < pi.maxPage}">
        <a href="spotSearchForm?cpage=${pi.endPage + 1}&inputcheck=${inputcheck}&condition=${condition}&keyword=${keyword}">
            <img src="/resources/common/공통_페이징바화살표.png" alt="다음">
        </a>
    </c:if>
    </div>
  </div>

  <!--start point-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

  <!-- Modal -->
  <div class="modal fade"
       id="staticBackdrop"
       data-bs-backdrop="static"
       data-bs-keyboard="false"
       tabindex="-1"
       aria-labelledby="staticBackdropLabel"
       aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
      <div class="modal-content" id="modal-content">
        <div class="modal-header">
          <div id="header-title">
            <h1 class="modal-title fs-5">상품정보</h1>
          </div>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="btn-close-modal">
            <img src="/resources/common/공통_Icon.png" id="modify-x_img" />
          </button>
        </div>
        <div class="modal-body" >
          <!--모달 내용-->
          <div id="product-modify-img"> 
            <img id="modal-image" src="" alt="상품 이미지">
          </div>
          <div id="product-detail-modify-box">
            <div id="product-detail-modify">
              <div id="product-detail-modify-puts">
                <table id="product-detail-modify-table">
                  <tr>
                    <td>상품번호</td>
                    <td>
                      <input type="text" id="modal-productNo"  readonly>
                    </td>
                  </tr>
                  <tr>
                    <td>카테고리</td>
                    <td>
                      <input type="text" id="modal-productCategory" readonly>
                    </td>
                  </tr>
                  <tr>
                    <td>상품명</td>
                    <td>
                      <input type="text" id="modal-productName" readonly>
                    </td>
                  </tr>
                  <tr>
                    <td>입고가</td>
                    <td>
                      <input type="text" id="modal-inputPrice" readonly>
                    </td>
                  </tr>
                  <tr>
                    <td>판매가</td>
                    <td>
                      <input type="text" id="modal-salePrice" readonly>
                    </td>
                  </tr>
                </table>
              </div>
            </div>
          </div>

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

        row.addEventListener('click', function () {
              const productNo = this.children[0].textContent;
              const categoryName = this.children[1].textContent;
              const filePath = this.children[2].querySelector('img').src;
              const productName = this.children[3].textContent;
              const inputPrice = this.children[4].textContent;
              const salePrice = this.children[5].textContent;
              const availability = this.children[6].textContent;
              const shortageAmount = this.children[7].textContent;

          document.getElementById("modal-productNo").value = productNo;
          document.getElementById("modal-productCategory").value = categoryName;
          document.getElementById('modal-image').src = filePath;

          document.getElementById("modal-productName").value = productName;
          document.getElementById("modal-inputPrice").value = inputPrice;
          document.getElementById("modal-salePrice").value = salePrice;
          // document.getElementById('modal-shortageAmount').value = shortageAmount;

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
