<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <style>
        /* #top-right1 *{
            border: 1px solid red;
        } */
        .waper{
            width:100%;
            height: 100%;
            display: grid;
            grid-template-rows: 14% 74%;
            padding: 3%;
        }
        .main_name{
            font-size: 2.4em;
        }
        #top-manu{
            width: 100%;
            height: 100%;
            display: grid;
            grid-template-columns: 40% 60%;
            
        }
        #top-left{
            display: grid;
            background-color: #D9D9D9;
            width: 100%;
            height: 100%;

        }
        #top-left1{
            height: 100%;
            background-color: white;
            display: flex;
            align-items: center;
            border-bottom-right-radius: 10px
            
        }
        #top-left1 p{
            margin: 0;
        }
        #top-left1 img{
            width: 14%;
        }
        #top-right1>div *{
            width: auto;
            border-radius: 4px;
        }
        #top-right1{
            width: 100%;
            height: 100%;
            background-color: #D9D9D9;
            
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
            padding: 0 4%;
        }
        #top-right1 *{
            height: 100%;
            display: grid;
            align-items: center;
        }
        
        #top-right2 >div{
            padding-top: 3%;
            grid-template-columns: 24% 72%;
            gap: 4%;
        }
        #top-right21{
            grid-template-columns: auto min-content auto;
        }
        .top-right22{
            grid-template-columns: auto auto;
            gap: 6px;
        }
        
        #main{
            background-color: #D9D9D9;
            width: 100%;
            height: 100%;
            border-bottom-left-radius: 20px;
            border-bottom-right-radius: 20px;
            padding: 3% 3% 6%;
            border-top-left-radius: 20px;
        }
        #main-in{
            background-color: white;
            width: 100%;
            height: 100%;
            border-radius: 10px;
            padding: 0 4% 4%;
        }
        #main-pageing{
            padding-top: 1%;   
        }
        #main-pageing, #modal-pageing-left,#modal-pageing-right{
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        #main-pageing img,#modal-pageing-left img,#modal-pageing-right img,#modal-pageing img{
            width: 4%;
        }
        #main-pageing img:nth-of-type(2),#modal-pageing-left img:nth-of-type(2),#modal-pageing-right img:nth-of-type(2),#modal-pageing img:nth-of-type(2){
            transform: rotate(180deg);
        }

        #main-pageing button,#modal-pageing-left button,#modal-pageing-right button,#modal-pageing button{
            border: #B4B4B4 solid 3px;
            background: white;
            color: #B4B4B4;
            margin: 0.4%;
        }
        /* #main-pageing button:hover,#modal-pageing-left button:hover,#modal-pageing-right button:hover,#modal-pageing button:hover{
            border: #3C3C3C solid 3px;
            color: #3C3C3C;
            font-weight: bold;
        } */
        /* #btn-close-modal{
            width: 20px;
            height: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        } */
        /* .x_img{
            width: 10px;
            height: 10px;
        } */

        /* modal */
        /* #modal-content {
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
        }

        #header-title,#header-title2{
            display:flex;
            width:100%;
            justify-content:space-between;

        }
        #header-title h1, #header-title2 h1{
            font-weight:bold;
            font-color:white;
            font-size:40px;
        }

        #modal_left_wrap{
            padding:10px;
            width: 40%;
        }
        #modal_right_wrap{
            padding:10px;
            width: 60%;
        }

        #modal_header_left,#modal_header_right{
            display:flex;
            flex-wrap:wrap;
            height:16%;
        }
        #modal-pageing-left,#modal-pageing-right,#modal-pageing{
            background-color: #D9D9D9;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            height:9%;
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
        }

        #modal_header{
            display: flex;
            flex-wrap: wrap;
            padding: 10px;
            background-color: #D9D9D9;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        #modal_header p,#modal_header h1{
            font-weight: bold;
        }
        #modal_header1,#modal_header3{
            width: 70%;
        }
        #modal_header2,#modal_header4{
            width: 30%;
            text-align: right;
        }
        #modal_header3{
            display: flex;
            align-items: center;
        }
        #btn-close-modal_table img{
            width: 14px;
            height: 14px;
        }
        #modal-pageing{
            display: flex;
            justify-content:center;
        }
        #order-table{
            text-align: center;
        }
        #modal-pageing{
            display: flex;
            justify-content:center;
            align-items: center;
        }
        #modal-pageing button{
            height:100%;
         }
        #modal-pageing{
            display: flex;
        }
        #modal-page-inner{
            display: flex;
            width: 82%;
            justify-content: center;
            align-items: center;
        }
        #order_cancel,#modal-space{
            display: flex;
            width: 14%;
            justify-content: flex-end;
            align-items: center;
        }
        #order_cancel{
            padding-right: 20px;
        } */
        /* /modal */


    </style>
</head>
<body>
<jsp:include page="../common/header3.jsp"/>
<div class="waper">
    <div id="top-manu">
        <div id="top-left">
            <div id="top-left1">
                <img src="../../../resources/menu_icons/입고 아이콘.png">
                <p class="main_name">입고</p>
            </div>
        </div>

        <div id="top-right1">
            <div id="top-right2">
                <div>
                    <div class="top-right22">
                        <button>저번 달</button>
                        <button>최근</button>
                    </div>
                    <div id="top-right21">
                        <input type="date">~<input type="date">
                    </div>
                </div>
                <div>
                    <select>
                        <option>상태</option>
                        <option>발주대기</option>
                        <option>발주요청</option>
                        <option>발주승인</option>
                        <option>발주거절</option>
                    </select>
                    <div class="top-right22">
                        <input type="text" placeholder="발주번호">
                        <input class="search-input-submit" type="submit" value="검색">
                    </div>
                </div>
            </div>

        </div>

    </div>
    <div id="main">
        <div id="main-in">
            <table class="table table-hover" id="table1">
                <colgroup>
                    <col style="width: 20%;">
                    <col style="width: 20%;">
                    <col style="width: 20%;">
                    <col style="width: 20%;">
                    <col style="width: 20%;">
                </colgroup>
                <thead>
                <tr>
                    <th>발주일자</th>
                    <th>발주번호</th>
                    <th>수량</th>
                    <th>금액</th>
                    <th>상태</th>
                </tr>
                </thead>
                <tbody >
                <tr>
                    <td>2025-03-31</td>
                    <td>123456</td>
                    <td>100</td>
                    <td>1,000,000</td>
                    <td>발주완료</td>
                </tr>
                <tr>
                    <td>2025-03-31</td>
                    <td>123456</td>
                    <td>100</td>
                    <td>1,000,000</td>
                    <td>발주완료</td>
                </tr><tr>
                    <td>2025-03-31</td>
                    <td>123456</td>
                    <td>100</td>
                    <td>1,000,000</td>
                    <td>발주완료</td>
                </tr><tr>
                    <td>2025-03-31</td>
                    <td>123456</td>
                    <td>100</td>
                    <td>1,000,000</td>
                    <td>발주완료</td>
                </tr>
                <tr>
                    <td>2025-03-31</td>
                    <td>123456</td>
                    <td>100</td>
                    <td>1,000,000</td>
                    <td>발주완료</td>
                </tr>
                <tr>
                    <td>2025-03-31</td>
                    <td>123456</td>
                    <td>100</td>
                    <td>1,000,000</td>
                    <td>발주완료</td>
                </tr>
                <tr>
                    <td>2025-03-31</td>
                    <td>123456</td>
                    <td>100</td>
                    <td>1,000,000</td>
                    <td>발주완료</td>
                </tr>
                <tr>
                    <td>2025-03-31</td>
                    <td>123456</td>
                    <td>100</td>
                    <td>1,000,000</td>
                    <td>발주완료</td>
                </tr>
                <tr>
                    <td>2025-03-31</td>
                    <td>123456</td>
                    <td>100</td>
                    <td>1,000,000</td>
                    <td>발주완료</td>
                </tr>
                <tr>
                    <td>2025-03-31</td>
                    <td>123456</td>
                    <td>100</td>
                    <td>1,000,000</td>
                    <td>발주완료</td>
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

    <!-- Button Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" id="modal-content">
                <div id="modal_left_wrap">
                    <div class="modal-header" id="modal_header_left">
                        <div id="header-title">
                            <h1 class="modal-title fs-5">상품 목록</h1>
                        </div>
                        <div id="header-content">
                            <input type="text" placeholder="카테고리">
                            <input type="text" placeholder="상품명 or 상품번호">
                            <button>검색</button>
                        </div>
                    </div>
                        <div class="modal-body">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th class="col-2">상품번호</th>
                                        <th class="col-2">카테고리</th>
                                        <th class="col-5">상품명</th>
                                        <th class="col-1"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>P12334</td>
                                        <td>스낵</td>
                                        <td>홈런볼</td>
                                        <td><img src="../resources/common/포스기_추가 아이콘.png"></td>
                                    </tr>
                                    <tr>
                                        <td>P164532</td>
                                        <td>스낵</td>
                                        <td>새우깡</td>
                                        <td><img src="../resources/common/포스기_추가 아이콘.png"></td>
                                    </tr>
                                    <tr>
                                        <td>P164532</td>
                                        <td>스낵</td>
                                        <td>새우깡</td>
                                        <td><img src="../resources/common/포스기_추가 아이콘.png"></td>
                                    </tr>
                                    <tr>
                                        <td>P164532</td>
                                        <td>스낵</td>
                                        <td>새우깡</td>
                                        <td><img src="../resources/common/포스기_추가 아이콘.png"></td>
                                    </tr><tr>
                                        <td>P164532</td>
                                        <td>스낵</td>
                                        <td>새우깡</td>
                                        <td><img src="../resources/common/포스기_추가 아이콘.png"></td>
                                    </tr><tr>
                                        <td>P164532</td>
                                        <td>스낵</td>
                                        <td>새우깡</td>
                                        <td><img src="../resources/common/포스기_추가 아이콘.png"></td>
                                    </tr>
                                    <tr>
                                        <td>P164532</td>
                                        <td>스낵</td>
                                        <td>새우깡</td>
                                        <td><img src="../resources/common/포스기_추가 아이콘.png"></td>
                                    </tr>
                                    <tr>
                                        <td>P164532</td>
                                        <td>스낵</td>
                                        <td>새우깡</td>
                                        <td><img src="../resources/common/포스기_추가 아이콘.png"></td>
                                    </tr>
                                    <tr>
                                        <td>P164532</td>
                                        <td>스낵</td>
                                        <td>새우깡</td>
                                        <td><img src="../resources/common/포스기_추가 아이콘.png"></td>
                                    </tr>
                                    <tr>
                                        <td>P164532</td>
                                        <td>스낵</td>
                                        <td>새우깡</td>
                                        <td><img src="../resources/common/포스기_추가 아이콘.png"></td>
                                    </tr>


                                </tbody>
                            </table>
                        </div>

                    <div id="modal-pageing-left">
                        <img src="/resources/common/공통_페이징바화살표.png">
                        <button type="button" class="btn btn-outline-secondary">1</button>
                        <button type="button" class="btn btn-outline-secondary">2</button>
                        <button type="button" class="btn btn-outline-secondary">3</button>
                        <button type="button" class="btn btn-outline-secondary">4</button>
                        <button type="button" class="btn btn-outline-secondary">5</button>
                        <img src="/resources/common/공통_페이징바화살표.png">
                    </div>
                </div>

                <div id="modal_right_wrap">
                    <div class="modal-header" id="modal_header_right">
                        <div id="header-title2">
                            <h1 class="modal-title fs-5">발주 요청 목록</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="btn-close-modal">
                                <img src="<c:url value="/resources/common/공통_Icon.png"/>" class="x_img">
                            </button>
                        </div>
                        <div id="header-content2">
                            <div id="header-content2-left">
                                <button>요청</button>
                            </div>
                            <div id="header-content2-right">
                                <p>
                                    종류 수(총 수량 : 3(240)
                                </p>
                                <p>
                                    총 1,000,300 원
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="modal-body">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th class="col-1"></th>
                                <th class="col-2">상품번호</th>
                                <th class="col-2">카테고리</th>
                                <th class="col-5">상품명</th>
                                <th class="col-1">수량</th>
                                <th class="col-2">금액</th>

                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><img src="../resources/common/포스기_삭제 아이콘.png"></td>
                                <td>P12334</td>
                                <td>스낵</td>
                                <td>홈런볼</td>
                                <td>20</td>
                                <td>30000</td>
                            </tr>
                            <tr>
                                <td><img src="../resources/common/포스기_삭제 아이콘.png"></td>
                                <td>P164532</td>
                                <td>스낵</td>
                                <td>새우깡</td>
                                <td>20</td>
                                <td>30000</td>
                            </tr>
                            <tr>
                                <td><img src="../resources/common/포스기_삭제 아이콘.png"></td>
                                <td>P164532</td>
                                <td>스낵</td>
                                <td>새우깡</td>
                                <td>20</td>
                                <td>30000</td>
                            </tr>
                            <tr>
                                <td><img src="../resources/common/포스기_삭제 아이콘.png"></td>
                                <td>P164532</td>
                                <td>스낵</td>
                                <td>새우깡</td>
                                <td>20</td>
                                <td>30000</td>
                            </tr>
                            <tr>
                                <td><img src="../resources/common/포스기_삭제 아이콘.png"></td>
                                <td>P164532</td>
                                <td>스낵</td>
                                <td>새우깡</td>
                                <td>20</td>
                                <td>30000</td>
                            </tr>
                            <tr>
                                <td><img src="../resources/common/포스기_삭제 아이콘.png"></td>
                                <td>P164532</td>
                                <td>스낵</td>
                                <td>새우깡</td>
                                <td>20</td>
                                <td>30000</td>
                            </tr>
                            <tr>
                                <td><img src="../resources/common/포스기_삭제 아이콘.png"></td>
                                <td>P164532</td>
                                <td>스낵</td>
                                <td>새우깡</td>
                                <td>20</td>
                                <td>30000</td>
                            </tr>
                            <tr>
                                <td><img src="../resources/common/포스기_삭제 아이콘.png"></td>
                                <td>P164532</td>
                                <td>스낵</td>
                                <td>새우깡</td>
                                <td>20</td>
                                <td>30000</td>
                            </tr>
                            <tr>
                                <td><img src="../resources/common/포스기_삭제 아이콘.png"></td>
                                <td>P164532</td>
                                <td>스낵</td>
                                <td>새우깡</td>
                                <td>20</td>
                                <td>30000</td>
                            </tr>
                            <tr>
                                <td><img src="../resources/common/포스기_삭제 아이콘.png"></td>
                                <td>P164532</td>
                                <td>스낵</td>
                                <td>새우깡</td>
                                <td>20</td>
                                <td>30000</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div id="modal-pageing-right">
                        <img src="/resources/common/공통_페이징바화살표.png">
                        <button type="button" class="btn btn-outline-secondary">1</button>
                        <button type="button" class="btn btn-outline-secondary">2</button>
                        <button type="button" class="btn btn-outline-secondary">3</button>
                        <button type="button" class="btn btn-outline-secondary">4</button>
                        <button type="button" class="btn btn-outline-secondary">5</button>
                        <img src="/resources/common/공통_페이징바화살표.png">
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!--Table Modal-->
    <div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" id="modal-content2">
                <div id="modal_header">
                    <div id="modal_header1">
                        <p>
                            25-04-01 | 123451 | 발주상태기술
                        </p>
                        <h1 class="modal-title fs-5">발주 요청 목록</h1>
                    </div>
                    <div id="modal_header2">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="btn-close-modal_table">
                            <img src="<c:url value="/resources/common/공통_Icon.png"/>" class="x_img">
                        </button>
                    </div>
                    <div id="modal_header3">
                        <select>
                            <option>카테고리</option>
                            <option>스낵</option>
                            <option>음료</option>
                            <option>머였지</option>
                        </select>
                        <input type="text" placeholder="상품명 or 상품번호">
                        <button>검색</button></div>
                    <div id="modal_header4">
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
                            <tr>
                                <td>1</td>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                                <td>5</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                                <td>5</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                                <td>5</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                                <td>5</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                                <td>5</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                                <td>5</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                                <td>5</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                                <td>5</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                                <td>5</td>
                            </tr>
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
                <div>
                    <div id="modal-pageing">
                        <div id="modal-space">
                        </div>
                        <div id="modal-page-inner">
                            <img src="/resources/common/공통_페이징바화살표.png">
                            <button type="button" class="btn btn-outline-secondary">1</button>
                            <button type="button" class="btn btn-outline-secondary">2</button>
                            <button type="button" class="btn btn-outline-secondary">3</button>
                            <button type="button" class="btn btn-outline-secondary">4</button>
                            <button type="button" class="btn btn-outline-secondary">5</button>
                            <img src="/resources/common/공통_페이징바화살표.png">
                        </div>
                        <div id="order_cancel">
                            <button type="button">발주취소</button>
                        </div>
                    </div>
                </div>

    <!--Table Modal Script -->
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
    <!--end point-->
</div>
</body>
</html>
