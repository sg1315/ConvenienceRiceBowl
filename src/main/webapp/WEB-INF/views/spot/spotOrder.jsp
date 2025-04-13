<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <title>지점 발주</title>
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
            width: 40%;

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
            width: 60%;
            display: flex;
            justify-content: space-between;
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
            justify-content: space-between;
        }
        #order-request{
            width: 15%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        #btn-order-request{
            width: 70%;
            height: 80%;
            border: black solid 4px;
            border-radius: 10px;
        }
        #order-search{
            width: 75%;
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
            margin: 0;
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

        #main-pageing, #modal-pageing-left,#modal-pageing-right{
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
        #main-pageing img,#modal-pageing-left img,#modal-pageing-right img,#modal-pageing img{
            width: 70px;
            padding: 10px;
        }
        #main-pageing img:nth-of-type(2),#modal-pageing-left img:nth-of-type(2),#modal-pageing-right img:nth-of-type(2),#modal-pageing img:nth-of-type(2){
            transform: rotate(180deg);
        }

        #main-pageing button,#modal-pageing-left button,#modal-pageing-right button,#modal-pageing button{
            border: #B4B4B4 solid 3px;
            background: white;
            color: #B4B4B4;
            font-weight: bold;
            margin: 5px;
        }
        #main-pageing button:hover,#modal-pageing-left button:hover,#modal-pageing-right button:hover,#modal-pageing button:hover{
            border: #3C3C3C solid 3px;
            color: #3C3C3C;
            font-weight: bold;
        }
        .btn-close{
            width: 20px;
            height: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            border: none;
            background: #d9d9d9;
        }
        .x_img{
            width: 20px;
            height: 20px;
        }

        /* modal */
        #modal-content {
            display: flex;
            height: 94vh;
            width: 100%;
            flex-direction: row;
        }
        .modal-header{
            background-color: #D9D9D9;
        }
        .modal-body{
            height: 75%;
            flex-grow: 1;
            overflow: hidden;
            padding: 0;
        }
        #modal-body{
            height: 75%;
        /*  이 부분 학원가서 학원 모니터로 확인  */
        }

        .modal-body input, .modal-body select{
            border-radius : 8px;
            width:80%;
            height:8%;
            text-align:center;
            margin-bottom:16px;
        }
        body .modal-dialog {
            max-width: 90%;
            height: 90vh;
        }
        .modal-dialog {
            position: absolute;
            transform: translateX(20%);
        }
        #modal-content2{
            max-width: 60%;
            position: absolute;
            left: 24%;
            height: 100%;
        }

        #header-title2{
            display:flex;
            width:100%;
            justify-content:space-between;
        }
        #header-title{
            width: 100%;
            height: 50%;
        }
        #header-title h1, #header-title2 h1{
            font-weight:bold;
            font-size:32px;
        }

        #modal-right-wrap{
            padding:10px;
            width: 60%;
        }

        #modal-header-right{
            display:flex;
            flex-wrap:wrap;
            height:16%;
        }
        #modal-header-right-form{
            width: 100%;
        }
        #modal-header-left{
            display: block;
            width: 100%;
            height: 16%;
        }
        #modal-left-wrap{
            padding:10px;
            width: 40%;
        }
        #modal-right-wrap{
            padding:10px;
            width: 60%;
        }

        #modal-pageing-left,#modal-pageing-right{
            background-color: #D9D9D9;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            height:9%;
        }
        #header-content{
            width: 100%;
            height: 50%;
            display: flex;
            align-items: center;
        }
        #search-box{
            width: 100%;
            display: flex;
            justify-content: space-around;
        }
        #order-request-category-select{
            width: 100%;
            text-align: center;
        }
        #category-select{
            width: 30%;
        }
        #search-content{
            width: 70%;
            display: flex;
            justify-content: center;
        }
        #product-search{
            width: 70%;
        }
        #header-content2{
            display: flex;
            width:100%;
            justify-content:space-between;
            align-items: center;

        }
        #header-content2-left,#header-content2-right{
            width:100%;
        }
        #header-content2-right p{
            width:100%;
            text-align:right;
            font-weight: bold;
        }

        #modal-header{
            display: flex;
            flex-wrap: wrap;
            height: 15%;
            padding: 10px;
            background-color: #D9D9D9;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        #modal-header p,#modal-header h1{
            font-weight: bold;
        }
        #modal-header1,#modal-header3{
            width: 70%;
        }
        #modal-header1{
            height: 15%;
        }
        #modal-header3 form{
            display: flex;
            gap: 10px;
        }
        #modal-header3 form > select{
            width: 120px;
        }
        #modal-header2,#modal-header4{
            width: 30%;
            text-align: right;
        }
        #modal-header2{
            display: flex;
            justify-content: right;
        }
        #modal-header3{
            display: flex;
            align-items: center;
        }
        #btn-close-modal-table img{
            width: 14px;
            height: 14px;
        }
        #modal-order-detail-footer{
            width: 100%;
            height: 10%;
            display: flex;
        }
        #modal-space, #order-cancel{
            display: flex;
            width: 14%;
            justify-content: center;
            align-items: center;
            background-color: #D9D9D9;
        }
        #modal-space{
            border-bottom-left-radius: 10px;
        }
        #order-cancel{
            border-bottom-right-radius: 10px;
        }
        #modal-pageing {
            display: flex;
            justify-content: center;
            width: 72%;

            background-color: #D9D9D9;
            height: 100%;
        }
        #order-product-table, #order-request-table{
            text-align: center;
        }
        #order-product-table tr, #order-request-table tr{
            border-bottom: #d9d9d9 solid 2px;
        }
        #order-product-table {
            width: 100%;
            height: 100%;
            border-collapse: collapse;
            table-layout: fixed;
        }

        #order-product-table thead {
            display: table;
            width: 100%;
            table-layout: fixed;
        }

        #order-product-table tbody {
            display: block;
            overflow-y: auto;
            width: 100%;
            height: 90%;
        }

        #order-product-table tbody tr {
            display: table;
            width: 100%;
            table-layout: fixed;
        }

        #order-product-table thead th {
            background-color: #f9f9f9;
            position: sticky;
            top: 0;
            z-index: 1;
        }

        #order-request-table td{
            text-align: center;
            vertical-align: middle;
        }
        #order-request-table td:nth-child(5){
            display: flex;
            justify-content: center;
            align-items: center;
        }
        #order-request-table input{
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0px;
        }
        #order-table{
            text-align: center;
        }

        #order-request-table {
            width: 100%;
            height: 100%;
            border-collapse: collapse;
        }

        #order-request-table thead {
            display: table;
            width: 100%;
            table-layout: fixed;
        }

        #order-request-table tbody {
            display: block;
            overflow-y: auto;
            width: 100%;
            height: 90%;
        }

        #order-request-table tbody tr {
            display: table;
            width: 100%;
            table-layout: fixed;
        }

        #order-table {
            table-layout: fixed;
            width: 100%;
            height: 100%;
            border-collapse: collapse;
        }
        #order-table thead {
            display: table;
            width: 100%;
            table-layout: fixed;
        }
        #order-table tbody {
            display: block;
            overflow-y: auto;
            width: 100%;
            height: 90%;
        }

        #order-table tbody tr {
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
                <img src="../resources/menu_icons/발주 아이콘.png">
                <p class="main-name">발주</p>
            </div>
        </div>

        <div id="top-right1">
            <form>
                <div id="order-request">
                    <button class="gray-btn-border" id="btn-order-request" type="button" data-bs-toggle="modal" data-bs-target="#staticOrder">
                        발주<br>요청
                    </button>
                </div>
                <div id="order-search">
                    <form id="order-search-form" method="get" action="/spot_order">
                        <div id="order-search-top">
                            <button type="button" class="search-input-submit" id="previousMonthOrder">저번 달</button>
                            <button type="button" class="search-input-submit" onclick="recent()">최근</button>
                            <input class="date-input" type="date" name="startDate"> ~ <input class="date-input" type="date" name="endDate">
                        </div>
                        <div id="order-search-bottom">
                            <div class="selectbox" id="status-select">
                                <select name="status">
                                    <option value="">상태</option>
                                    <option value="1">발주 대기</option>
                                    <option value="5">발주 승인</option>
                                    <option value="6">발주 거절</option>
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
                    <th class="col-2">발주일자</th>
                    <th class="col-2">발주번호</th>
                    <th class="col-1">수량</th>
                    <th class="col-5">금액</th>
                    <th class="col-2">상태</th>
                </tr>
                </thead>
                <tbody >
                <c:choose>
                    <c:when test="${not empty oslist}">
                        <c:forEach var="os" items="${oslist}">
                            <tr data-setno="${os.setNo}">
                                <td>${os.minuteGroup}</td>
                                <td>${os.setNo}</td>
                                <td>${os.totalAmount}</td>
                                <td><fmt:formatNumber value="${os.totalInputPrice}" type="number" groupingUsed="true" /></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${os.status == 1}">대기</c:when>
                                        <c:when test="${os.status == 2}">입고</c:when>
                                        <c:when test="${os.status == 5}">발주 승인</c:when>
                                        <c:when test="${os.status == 6}">발주 거절</c:when>
                                        <c:when test="${os.status == 7}">입고 대기</c:when>
                                        <c:otherwise>알 수 없음</c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>

                    <c:otherwise>
                        <c:forEach var="o" items="${olist}">
                            <tr data-setno="${o.setNo}">
                                <td>${o.minuteGroup}</td>
                                <td>${o.setNo}</td>
                                <td>${o.totalAmount}</td>
                                <td><fmt:formatNumber value="${o.totalInputPrice}" type="number" groupingUsed="true" /></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${o.status == 1}">대기</c:when>
                                        <c:when test="${o.status == 2}">입고</c:when>
                                        <c:when test="${o.status == 5}">발주 승인</c:when>
                                        <c:when test="${o.status == 6}">발주 거절</c:when>
                                        <c:when test="${o.status == 7}">입고 대기</c:when>
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

    <!-- Button Modal -->
    <!-- 발주 요청 버튼 클릭시 출력되는 modal -->
    <div class="modal fade" id="staticOrder" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" id="modal-content">
                <div id="modal-left-wrap">
                    <div class="modal-header" id="modal-header-left">
                        <div id="header-title">
                            <h1 class="modal-title fs-5">상품 목록</h1>
                        </div>
                        <div id="header-content">
                            <form id="search-box" method="get">
                                <div id="category-select">
                                    <select class="selectbox" id="order-request-category-select" name="category">
                                        <option value="all">카테고리</option>
                                        <c:forEach var="c" items="${clist}">
                                            <option value="${c.categoryName}">
                                                <td>${c.categoryName}</td>
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div id="search-content">
                                    <input class="search-input" type="text" placeholder="상품명 or 상품번호" id="product-search" name="keyword" />
                                    <input class="search-input-submit" type="submit" value="검색" />
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="modal-body" id="orderRequestProductList">
                        <table class="table table-hover" id="order-product-table">
                            <thead>
                            <tr>
                                <th class="col-1">상품번호</th>
                                <th class="col-1">카테고리</th>
                                <th class="col-1">상품명</th>
                                <th class="col-1"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="p" items="${plist}">
                                <tr>
                                    <td>${p.productNo}</td>
                                    <td>${p.categoryName}</td>
                                    <td>${p.productName}</td>
                                    <td>
                                        <img src="../resources/common/포스기_추가 아이콘.png"
                                             class="add-btn"
                                             data-productno="${p.productNo}"
                                             data-categoryname="${p.categoryName}"
                                             data-productname="${p.productName}"
                                             data-inputPrice="${p.inputPrice}"
                                             data-salePrice="${p.salePrice}"
                                             style="cursor: pointer;">
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <div id="modal-pageing-left">
<%--                        <img src="/resources/common/공통_페이징바화살표.png">--%>
<%--                        <c:forEach var="i" begin="${ pi.startPage }" end="${ pi.endPage }">--%>
<%--                            <button type="button" class="btn btn-outline-secondary page-btn" data-page="${i}">${i}</button>--%>
<%--                        </c:forEach>--%>
<%--                        <img src="/resources/common/공통_페이징바화살표.png">--%>
                    </div>
                </div>

                <div id="modal-right-wrap">
                    <div class="modal-header" id="modal-header-right">
                            <div id="header-title2">
                                <h1 class="modal-title fs-5">발주 요청 목록</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                    <img src="<c:url value="/resources/common/공통_Icon.png"/>" class="x_img">
                                </button>
                            </div>
                            <div id="header-content2">
                                <div id="header-content2-left">
                                    <button class="black-btn" id="btn-order-submit">요청</button>
                                </div>
                                <div id="header-content2-right">
                                    <p id="product-summary">
                                        종류 (총 수량) : <span id="kind-count">0</span> (<span id="total-quantity">0</span>)
                                    </p>
                                    <p>
                                        총 <span id="total-price">0</span> 원
                                    </p>
                                </div>
                            </div>

                    </div>
                    <div class="modal-body">
                        <table class="table table-hover" id="order-request-table">
                            <thead>
                            <tr>
                                <th class="col-1"></th>
                                <th class="col-1">상품번호</th>
                                <th class="col-1">카테고리</th>
                                <th class="col-1">상품명</th>
                                <th class="col-1">수량</th>
                                <th class="col-1">금액</th>
                            </tr>
                            </thead>
                            <tbody>
                                <%--             js로 목록 불러옴               --%>
                            </tbody>
                        </table>
                    </div>

                    <div id="modal-pageing-right">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--Table Modal-->
    <!-- 발주 상세 보기 modal -->
    <div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" id="modal-content2">
                <div id="modal-header">
                    <div id="modal-header1">
                        <p id="order-info">
                            <!-- 여기에 내용이 들어갑니다 -->
                        </p>
                        <h1 class="modal-title fs-5">발주 요청 목록</h1>
                    </div>
                    <div id="modal-header2">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                            <img src="<c:url value="/resources/common/공통_Icon.png"/>" class="x_img">
                        </button>
                    </div>
                    <div id="modal-header3">
                        <%--           css 유지를 위해 만든 여백             --%>
                    </div>
                    <div id="modal-header4">
                        <p>
                            종류 (총 수량) : <span id="order-kind-count">0</span> (<span id="order-total-quantity">0</span>)
                        </p>
                        <p>
                            총 <span id="order-total-price">0</span> 원
                        </p>
                    </div>
                </div>
                <div id="modal-body">
                    <table class="table table-hover" id="order-table">
                        <thead>
                        <tr>
                            <th class="col-1">상품번호</th>
                            <th class="col-1">카테고리</th>
                            <th class="col-1">상품명</th>
                            <th class="col-1">수량</th>
                            <th class="col-1">금액</th>
                        </tr>
                        </thead>
                        <tbody>
                            <%-- 불러올 발주 상세 --%>
                        </tbody>
                    </table>
                </div>
                <div id="modal-order-detail-footer">
                    <div id="modal-space">
                    </div>
                    <div id="modal-pageing">

                    </div>
                    <div id="order-cancel">
                        <button id="cancel-order-btn" class="red-btn" type="button" style="display: none;">발주취소</button>
                    </div>
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
                const setNo = this.children[1]?.textContent?.trim();
                console.log("선택된 발주번호 setNo:", setNo);

                if (!setNo) {
                    alert("발주번호를 찾을 수 없습니다.");
                    return;
                }

                $.ajax({
                    url: '/spot_order/orderDetail?setNo=' + setNo,
                    method: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        let str = "";
                        for (let o of data) {
                            str += "<tr>" +
                                "<td>" + o.productNo+ "</td>" +
                                "<td>" + o.categoryName + "</td>" +
                                "<td>" + o.productName + "</td>" +
                                "<td>" + o.circulationAmount + "</td>" +
                                "<td>" + o.sumInputPrice.toLocaleString() + "</td>" +
                                "</tr>";
                        }

                        const ordering = document.querySelector("#order-table tbody");
                        ordering.innerHTML = str;

                        const orderInfo = document.getElementById("order-info");
                        const orderDate = data[0]?.circulationDate || "날짜 없음";
                        const status = data[0]?.status || "상태 없음";

                        let statusText = "";
                        switch (status) {
                            case 1:
                                statusText = "대기";
                                break;
                            case 2:
                                statusText = "입고";
                                break;
                            case 5:
                                statusText = "발주 승인";
                                break;
                            case 6:
                                statusText = "발주 거절";
                                break;
                            case 7:
                                statusText = "입고 대기";
                                break;
                            default:
                                statusText = "알 수 없음";
                        }

                        // orderInfo.innerHTML = orderDate + setNo +  status;
                        orderInfo.innerHTML = `발주일자: `+ orderDate + ` | 발주번호: ` + setNo + ` | 상태: ` + statusText;
                        const myModal = new bootstrap.Modal(document.getElementById('staticBackdrop2'));
                        myModal.show();

                        const cancelButton = document.getElementById("cancel-order-btn");
                        if (status === 1) {
                            cancelButton.style.display = "inline-block";
                        } else {
                            cancelButton.style.display = "none";
                        }

                        updateDetailSummary();
                    },
                    error: function (xhr, status, error) {
                        console.error('AJAX 요청 실패:', error);
                        alert('발주 상세 정보를 불러오는 데 실패했습니다.');
                    }
                });
            });
        });

        //발주 취소
        const cancelButton = document.getElementById("cancel-order-btn");
        cancelButton.addEventListener("click", function () {
            const orderInfo = document.getElementById("order-info");
            const setNoMatch = orderInfo.textContent.match(/발주번호: (\S+)/);
            const setNo = setNoMatch ? setNoMatch[1] : null;

            if (!setNo) {
                alert("발주번호를 찾을 수 없습니다.");
                return;
            }

            if (confirm("정말 발주를 취소하시겠습니까?")) {
                $.ajax({
                    url: '/spot_order/cancelOrder?setNo=' + setNo,
                    method: 'POST',
                    success: function (response) {
                        if (response === "success") {
                            alert("발주가 취소되었습니다.");
                            location.reload();
                        } else {
                            alert("발주 취소에 실패했습니다.");
                        }
                    },
                    error: function () {
                        alert("서버와의 통신에 실패했습니다.");
                    }
                });
            }
        });
    });



    //총 수량, 금액 계산
    function updateDetailSummary() {
        let kindCount = 0;      // 종류 수
        let totalQuantity = 0;  // 총 수량
        let totalPrice = 0;     // 총 금액

        $('#order-table tbody tr').each(function () {
            const td = $(this).find('td');
            kindCount += 1;
            const quantity = parseInt(td[3]?.textContent?.trim()) || 0;
            const priceText = td[4]?.textContent?.trim().replace(/,/g, '') || "0";
            const price = parseInt(priceText);

            totalQuantity += quantity;
            totalPrice += price;
        });

        // 화면에 반영
        $('#order-kind-count').text(kindCount);
        $('#order-total-quantity').text(totalQuantity);
        $('#order-total-price').text(totalPrice.toLocaleString());
    }

</script>

<script>
    //모달 열었을때 HTML을 저장, 닫을때 그 정보를 다시 불러옴
    let initialModalContent = null;

    $('#staticOrder').on('show.bs.modal', function () {
        initialModalContent = $('#staticOrder .modal-content').html();
        $('#order-request-table tbody').empty();
        addedProducts.clear();
    });

    $('#staticOrder').on('hidden.bs.modal', function () {
        if (initialModalContent) {
            $('#staticOrder .modal-content').html(initialModalContent);
        }
    });

    //총 수량, 금액 계산
    function updateSummary() {
        let kindCount = 0;      // 종류 수
        let totalQuantity = 0;  // 총 수량
        let totalPrice = 0;     // 총 금액

        $('#order-request-table tbody tr').each(function () {
            kindCount += 1;
            const quantity = parseInt($(this).find('.quantity-input').val()) || 0;
            const price = parseInt($(this).attr('data-inputprice')) || 0;

            totalQuantity += quantity;
            totalPrice += quantity * price;
        });

        // 화면에 반영
        $('#kind-count').text(kindCount);
        $('#total-quantity').text(totalQuantity);
        $('#total-price').text(totalPrice.toLocaleString());
    }
    //최근 버튼
    function recent() {
        window.location.href = '/spot_order';
    }



</script>

</body>
<!-- spotOrder.js -->
<script src="/resources/js/spotOrder.js"></script>
</html>
