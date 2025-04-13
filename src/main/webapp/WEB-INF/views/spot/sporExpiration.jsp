<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>유통기한 관리</title>
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
            justify-content: space-between;
        }
        #top-left{
            background-color: #D9D9D9;
            width: 60%;
        }
        #top-left1{
            background-color: white;
            display: flex;
            align-content: center;
            align-items: center;
            width: 100%;
            border-bottom-right-radius: 20px;
            padding-bottom: 10px;
            padding-left: 10px;
        }

        #top-right1{
            background-color: #D9D9D9;
            width: 40%;
            display: flex;
            justify-content: right;
            align-items: center;
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
            gap: 10px;
            padding-right: 50px ;
        }
        #right-check p {
            padding-left: 5px;
        }
        #search-box{
            width: 70%;
            display: flex;
            justify-content: center;
        }
        #top-left p {
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
        #table1 tbody tr td:nth-child(7) button{
            border: #959595 solid 2px;
            background: #f5f5f5;

        }
        #table1 tbody tr td:nth-child(7){
            color: red;
            font-weight: bold;
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

        .expiryList td{
            align-content: center;

        }
        .expiryBtn{
            font-size: 0.76em;
            font-weight: 600;
            color: black;
            background-color: #dddddd;
            border-radius: 4px;
            border: 1px solid black;
            padding: 2px;
        }
        .expiryBtn:active{
            filter: brightness(85%);
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<form class="waper" id="seach-form" action="searchExpiry">
    <div id="top-manu">
        <div id="top-left">
            <div id="top-left1">
                <img src="../resources/menu_icons/유통기한관리 아이콘.png">
                <p class="main_name">유통기한 관리</p>
            </div>
        </div>
        <div id="top-right1">
            <div class="selectbox" id="option-select">
                <select name="searchExpiry" >
                    <option value="productNo" ${searchExpiry == 'productNo' ? 'selected' : ''}>상품번호</option>
                    <option value="categoryName" ${searchExpiry == 'categoryName' ? 'selected' : ''}>카테고리</option>
                    <option value="productName" ${searchExpiry == 'productName' ? 'selected' : ''}>상품명</option>
                </select>
            </div>
            <div id="search-box">
                <input class="search-input" type="text" name="keyword" value="${keyword}">
                <button class="search-input-submit" type="submit">검색</button>
            </div>
        </div>
    </div>
    <div id="main">
        <div id="main-in">
            <table class="table table-hover" id="table1">
                <colgroup>
                    <col style="width: 10%;">
                    <col style="width: 10%;">
                    <col style="width: 20%;">
                    <col style="width: 10%;">
                    <col style="width: 10%;">
                    <col style="width: 10%;">
                    <col style="width: 10%;">
                </colgroup>
                <thead>
                <tr>
                    <th>상품번호</th>
                    <th>카테고리</th>
                    <th>상품명</th>
                    <th>유통기한</th>
                    <th>수량</th>
                    <th>금액</th>
                    <th>폐기/임박</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="e" items="${expiryList}">
                    <tr class="expiryList">
                        <td>${e.productNo }</td>
                        <td>${e.categoryName }</td>
                        <td>${e.productName }</td>
                        <td>${e.expirationDate }</td>
                        <td>${e.inventoryCount}</td>
                        <td>${e.price }</td>
                        <td>
                            <c:choose>
                                <c:when test="${e.nearExpiry == 1}">
                                    <button class="expiryBtn"
                                            data-store="${loginMember.storeNo}"
                                            data-product="${e.productNo}"
                                            data-count="${e.inventoryCount}"
                                            data-date="${e.expirationDate}"
                                            onclick="expiryBtn(this)">폐기하기</button>
                                </c:when>
                                <c:when test="${e.nearExpiry == 2}">
                                    <p style="color: red; font-weight: 600">임박 -1</p>
                                </c:when>
                                <c:otherwise>
                                    -
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
                <input type="button" onclick="location.href='/searchExpiry?cpage=${pi.startPage - 1}&searchExpiry=${param.searchExpiry}&keyword=${param.keyword}'">
                <img src="/resources/common/공통_페이징바화살표.png" alt="이전">
                </input>
            </c:if>
            <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}" step="1">
                <button type="button"
                        class="btn btn-outline-secondary <c:if test='${pi.currentPage == i}'>active</c:if>'"
                        onclick="location.href='/searchExpiry?cpage=${i}&searchExpiry=${param.searchExpiry}&keyword=${param.keyword}'">${i}</button>
            </c:forEach>
            <c:if test="${pi.endPage < pi.maxPage}">
                <input type="button" onclick="location.href='/searchExpiry?cpage=${pi.endPage + 1}&searchExpiry=${param.searchExpiry}&keyword=${param.keyword}'">
                <img src="/resources/common/공통_페이징바화살표.png" alt="다음">
                </input>
            </c:if>
        </div>
    </div>
    <script>
        function expiryBtn(btn){
            const storeNo = btn.dataset.store;
            const productNo = btn.dataset.product;
            const inventoryCount = btn.dataset.count;
            const expirationDate = btn.dataset.date;

            if(confirm("폐기 하시겠습니까?")){
                $.ajax({
                    url: "/api/circulation/expiry",
                    data: {
                        storeNo: storeNo,
                        productNo: productNo,
                        inventoryCount: inventoryCount,
                        expirationDate: expirationDate
                    },
                    success: function (isCheck){
                        if (isCheck === "NNNNY") {
                            location.reload();
                        } else {
                            alert("폐기가 되지 않았습니다. 다시 시도해 주시고 여러번 시도해도 안될 시 관리자에게 문의주세요.");
                        }
                    }, error: function (){
                        console.log("폐기 ajax 실패");
                    }
                })
            }
        }
    </script>
</form>
</body>
</html>
