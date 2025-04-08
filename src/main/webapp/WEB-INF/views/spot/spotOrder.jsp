<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
            padding: 50px;
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

        #modal-page-inner{
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
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
                    <form id="order-search-form">
                        <div id="order-search-top">
                            <button type="button" class="search-input-submit" id="previousMonth">저번 달</button>
                            <button type="button" class="search-input-submit" id="lastMonth">최근</button>
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
                                <button class="search-input-submit" id="btn-order-search" type="button">검색</button>
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
                <c:forEach var="o" items="${olist}">
                    <tr>
                        <td>${o.minuteGroup}</td>
                        <td>${o.setNo}</td>
                        <td>${o.totalAmount}</td>
                        <td>${o.totalInputPrice}</td>
                        <td>
                            <c:choose>
                                <c:when test="${o.status == 1}">
                                    <span>발주 대기</span>
                                </c:when>
                                <c:when test="${o.status == 2}">
                                    <span>입고</span>
                                </c:when>
                                <c:when test="${o.status == 5}">
                                    <span style="color: #0073ff">발주 승인</span>
                                </c:when>
                                <c:when test="${o.status == 6}">
                                    <span style="color: red">발주 거절</span>
                                </c:when>
                                <c:when test="${o.status == 7}">
                                    <span>입고 대기</span>
                                </c:when>
                                <c:otherwise>
                                    <span>알 수 없음</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
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
                            <form id="search-box" action="productSearch" method="get">
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
                                <th class="col-2">상품번호</th>
                                <th class="col-2">카테고리</th>
                                <th class="col-5">상품명</th>
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
                                <th class="col-2">상품번호</th>
                                <th class="col-2">카테고리</th>
                                <th class="col-4">상품명</th>
                                <th class="col-2">수량</th>
                                <th class="col-2">금액</th>
                            </tr>
                            </thead>
                            <tbody>
                                <%--             js로 목록 불러옴               --%>
                            </tbody>
                        </table>
                    </div>

                    <div id="modal-pageing-right">
<%--                        <img src="/resources/common/공통_페이징바화살표.png">--%>
<%--                        <button type="button" class="btn btn-outline-secondary">1</button>--%>
<%--                        <button type="button" class="btn btn-outline-secondary">2</button>--%>
<%--                        <button type="button" class="btn btn-outline-secondary">3</button>--%>
<%--                        <button type="button" class="btn btn-outline-secondary">4</button>--%>
<%--                        <button type="button" class="btn btn-outline-secondary">5</button>--%>
<%--                        <img src="/resources/common/공통_페이징바화살표.png">--%>
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
                        <p>
                            25-04-01 | 123451 | 발주상태기술
                        </p>
                        <h1 class="modal-title fs-5">발주 요청 목록</h1>
                    </div>
                    <div id="modal-header2">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                            <img src="<c:url value="/resources/common/공통_Icon.png"/>" class="x_img">
                        </button>
                    </div>
                    <div id="modal-header3">
                        <form>
                            <select class="selectbox">
                                <option>카테고리</option>
                                <option>스낵</option>
                                <option>음료</option>
                                <option>기타</option>
                            </select>
                            <input class="search-input" type="text" placeholder="상품명 or 상품번호" />
                            <input class="search-input-submit" type="submit" value="검색" />
                        </form>
                    </div>
                    <div id="modal-header4">
                        <p>
                            종류 수(총 수량 : 3(240)
                        </p>
                        <p>
                            총 1,000,300 원
                        </p>
                    </div>
                </div>
                <div id="modal-body">
                    <table class="table table-hover" id="order-table">
                        <thead>
                        <tr>
                            <th class="col-1">상품번호</th>
                            <th class="col-2">카테고리</th>
                            <th class="col-5">상품명</th>
                            <th class="col-1">수량</th>
                            <th class="col-2">금액</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>1</td>
                            <td>2</td>
                            <td>3</td>
                            <td>4</td>
                            <td>5</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div id="modal-order-detail-footer">
                    <div id="modal-space">
                    </div>
                    <div id="modal-pageing">
                        <div id="modal-page-inner">
                            <img src="/resources/common/공통_페이징바화살표.png">
                            <button type="button" class="btn btn-outline-secondary">1</button>
                            <button type="button" class="btn btn-outline-secondary">2</button>
                            <button type="button" class="btn btn-outline-secondary">3</button>
                            <button type="button" class="btn btn-outline-secondary">4</button>
                            <button type="button" class="btn btn-outline-secondary">5</button>
                            <img src="/resources/common/공통_페이징바화살표.png">
                        </div>
                    </div>
                    <div id="order-cancel">
                        <button class="red-btn" type="button">발주취소</button>
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
                const modal = new bootstrap.Modal(document.getElementById("staticBackdrop2"));
                modal.show();
            });
        });
    });
</script>

<!-- spotOrder.js -->
<script src="/resources/js/spotOrder.js"></script>
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

    //삭제 버튼 클릭시 제거
    document.querySelector("#order-request-table tbody").addEventListener('click', function (e) {
        if (e.target.classList.contains('remove-btn')) {
            const row = e.target.closest('tr');
            const productNo = row.dataset.productno;
            addedProducts.delete(productNo);
            row.remove();
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
            const price = parseInt($(this).data('inputprice')) || 0;

            totalQuantity += quantity;
            totalPrice += quantity * price;
        });

        // 화면에 반영
        $('#kind-count').text(kindCount);
        $('#total-quantity').text(totalQuantity);
        $('#total-price').text(totalPrice.toLocaleString()); // 콤마 붙이기
    }
</script>
</body>
</html>
