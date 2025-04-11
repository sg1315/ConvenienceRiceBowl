<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>지점 재고</title>
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
      }
      #top-manu {
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

      #top-right1 {
        background-color: #D9D9D9;
        width: 55%;
        display: flex;
        border-top-left-radius: 20px;
        border-top-right-radius: 20px;

      }
      #search-form{
        padding-right: 40px;
        width: 100%;
        gap: 10px;
        display: flex;
        justify-content: space-around;
        align-items: center;
      }

      #right-check {
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

      #table1 {
        outline: none;
        width: 100%;
        table-layout: auto;
        text-align: center;
      }
      #table1 td img {
        width: 20px;
      }
      #table1 td:nth-child(5) {
        font-weight: bold;
        color: red;
      }

      #top-left p {
        padding-left: 15px;
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



      @media screen and (max-width: 1800px) {
        #main-in {
          overflow-x: auto;
        }
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

      

      #footer-btn {
        width: 66%;
        margin-right: 16%;
        background-color: #8a8a8a;
        border: none;
        font-weight: bold;
        font-size: 20px;
        border-radius: 10px;
      }
      #header-title {
        margin-left: 22%;
      }
      #header-title h1 {
        font-weight: bold;
        font-color: white;
      }

      /* 모달창 시작 */
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
      #btn-close-modify-modal {
        width: 20px;
        height: 20px;
        border: none;
        background-color:#d9d9d9;
        display: flex;
        justify-content: center;
        align-items: center;
      }
      #x_img {
        width: 10px;
        height: 10px;
      }


      #product-img {
        background-color: #d9d9d9;
        width: 48%;
        display: flex;
        justify-content: center;
        align-items: center;
      }
      #product-box {
        background-color: #d9d9d9;
        width: 48%;
        display: flex;
        align-items: center;
        justify-content: center;
      }
      #product-outer {
        background-color: white;
        width: 100%;
        height: 90%;
        text-align: center;
      }

      #product-table {
        
        height: 300px;
        border-collapse: separate;
        margin: 0px 15px;
      }

      #product-table tr th,
      #product-table tr td {
        font-size: 20px;
        padding: 10px;
      }

      #product-table p {
        padding-left: 10px;
      }

    </style>
  </head>
  <body>
    <jsp:include page="../common/header.jsp" />
    <div class="waper">
      <div id="top-manu">
        <div id="top-left">
          <div id="top-left1">
            <img src="../resources/menu_icons/재고 아이콘.png" />
            <p class="main_name">재고</p>
          </div>
        </div>
        <div id="top-right1">
          <form id="search-form" action="searchInventory" method="post">
            <div id="right-check">
              <input type="checkbox" name="check" value="1"/>
              <p>재고부족</p>
            </div>
            <div class="selectbox" id="category-select">
              <select name="condition">
                <option value="productNo">상품번호</option>
                <option value="categoryName">카테고리</option>
                <option value="productName">상품명</option>
              </select>
            </div>
            <div id="search-box">
              <input class="search-input" type="text" placeholder="상품명 or 상품번호" name="keyword"/>
              <input class="search-input-submit" type="submit" value="검색" />
            </div>
          </form>
        </div>
      </div>
      <div id="main">
        <div id="main-in">
          <table class="table table-hover" id="table1">
            <thead>
              <tr>
                <th class="col-1">상품번호</th>
                <th class="col-1">카테고리</th>
                <th class="col-3">상품명</th>
                <th class="col-1">수량</th>
                <th class="col-1">상태</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="I" items="${list}">
                <tr data-ano="${I.productNo}">
                  <td>${I.productNo}</td>
                  <td>${I.categoryName}</td>
                  <td>${I.productName}</td>
                  <td>${I.totalInventory}</td>
                  <td>
                    <c:choose>
                      <c:when test="${I.inventoryStatus == 0}">재고부족</c:when>
                    </c:choose>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
        <div id="main-pageing">
          <c:choose>
            <c:when test="${not empty param.condition and not empty param.keyword}">
              <c:set var="baseUrl" value="/searchInventory"/>
              <c:set var="queryString" value="condition=${param.condition}&keyword=${param.keyword}&check=${param.check}"/>
            </c:when>
            <c:otherwise>
              <c:set var="baseUrl" value="/spot_inventory"/>
              <c:set var="queryString" value=""/>
            </c:otherwise>
          </c:choose>

          <c:if test="${pi.startPage > 1}">
            <a href="${baseUrl}?${queryString}&cpage=${pi.startPage - 1}">
              <img src="${pageContext.request.contextPath}/resources/common/공통_페이징바화살표.png" alt="이전">
            </a>
          </c:if>

          <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
            <button type="button"
                    class="btn btn-outline-secondary <c:if test='${pi.currentPage == i}'>active</c:if>'"
                    onclick="location.href='${baseUrl}?${queryString}&cpage=${i}'">
                ${i}
            </button>
          </c:forEach>

          <c:if test="${pi.endPage < pi.maxPage}">
            <a href="${baseUrl}?${queryString}&cpage=${pi.endPage + 1}">
              <img src="${pageContext.request.contextPath}/resources/common/공통_페이징바화살표.png" alt="다음">
            </a>
          </c:if>
        </div>
      </div>
    </div>
  </body>
</html>
