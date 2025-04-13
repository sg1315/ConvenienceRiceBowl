<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>출고</title>
  <link rel="stylesheet" href="/resources/css/btn.css">
  <style>
    .waper{
      width:100%;
      height: 100%;
      padding: 50px;
    }
    .main_name{
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
    #top-right1-top{
      height: 50%;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    #top-right1-bottom{
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

    #table1 td img{
      width: 20px;
    }
    #search-text{
      width: 66.8%;
    }
    #search-text input{
      width: 100%;
    }
    #top-left p {
      padding-left: 15px;
    }
    #margi {
      height:50%;
    }

    #table1 td img{
      width: 20px;
    }


    #main{
      background-color: #D9D9D9;
      width: 100%;
      height: 85%;
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

    #product-detail-table tr td {
      font-size: 20px;
      font-weight: bold;
    }


    #product-detail-modify-table tr td input {
      /*border: 2px solid #d9d9d9;*/
      border-radius: 5px;
    }

    #product-detail-modify-table tr td {
      font-size: 18px;
      font-weight: bold;
    }
    #product-detail-modify-table td{
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

  <form class="waper" action="search_output">
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
          <input type="button" class="search-input-submit" onclick="location.href='/search_output?lastMonth=${'lastMonth'}'" value="저번 달">
          <input type="button" class="search-input-submit" onclick="location.href='/search_output?today=${'today'}'"  value="최근">

          <input type="date" class="date-input" id="since" name="since" value="${since}">
          ~
          <input type="date" class="date-input" id="until" name="until" value="${until}">

      </div>
      <div id="top-right1-bottom">
        <div class="selectbox" id="status-check">
          <select name="OptionStatus">
            <option value=""
            ${empty OptionStatus or
                    (fn:contains(OptionStatus,'3') and fn:contains(OptionStatus,'4'))
                    ? 'selected="selected"' : ''}
            > 상태 </option>
            <option value= "3" ${OptionStatus == '3' ? 'selected' : ''}>판매</option>
            <option value= "4" ${OptionStatus == '4' ? 'selected' : ''}>폐기</option>
          </select>
        </div>
        <div class="selectbox" id="category-select">
          <select name="searchOutput">
            <option value="productNo" ${searchOutput == 'productNo' ? 'selected' : ''}>상품번호</option>
            <option value="productName" ${searchOutput == 'productName' ? 'selected' : ''}>상품명</option>
            <option value="categoryName" ${searchOutput == 'categoryName' ? 'selected' : ''}>카테고리</option>
          </select>
        </div>
        <div id="search-text">
          <input class="search-input" type="text" name="keyword" value="${keyword}" placeholder="상품명 or 상품번호"/>
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
        <c:forEach var="o" items="${outputList}">
          <tr class="outputList">
            <td>${o.circulationDate}</td>
            <td>${o.productNo}</td>
            <td>${o.categoryName}</td>
            <td>${o.productName}</td>
            <td>${o.circulationAmount}</td>
            <td>${o.price}</td>
            <td>
                  <c:choose>
                    <c:when test="${o.status == 3}">
                      <p style="color: green; font-weight: 600">판매</p>
                    </c:when>
                    <c:otherwise>
                      <p style="color: red; font-weight: 600">폐기</p>
                    </c:otherwise>
                  </c:choose>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
    <div id="main-pageing">
      <c:if test="${pi.startPage > 1}">
        <input type="button" onclick="location.href='/search_output?cpage=${pi.startPage - 1}&since=${since}&until=${until}&OptionStatus=${OptionStatus}&searchOutput=${searchOutput}&keyword=${keyword}'">
          <img src="/resources/common/공통_페이징바화살표.png" alt="이전">
        </input>
      </c:if>
      <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}" step="1">
        <button type="button"
                class="btn btn-outline-secondary <c:if test='${pi.currentPage == i}'>active</c:if>'"
                onclick="location.href='/search_output?cpage=${i}&since=${since}&until=${until}&OptionStatus=${OptionStatus}&searchOutput=${searchOutput}&keyword=${keyword}'">${i}</button>
      </c:forEach>
      <c:if test="${pi.endPage < pi.maxPage}">
        <input type="button" onclick="location.href='/search_output?cpage=${pi.endPage + 1}&since=${since}&until=${until}&OptionStatus=${OptionStatus}&searchOutput=${searchOutput}&keyword=${keyword}'">
          <img src="/resources/common/공통_페이징바화살표.png" alt="다음">
        </input>
      </c:if>
    </div>
  </div>
  </form>

  <script>
    //저번달 버튼

  </script>
  <!--end point-->
</div>
</body>
</html>
