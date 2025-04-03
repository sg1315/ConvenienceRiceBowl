
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>본사 지점관리</title>
    <link rel="stylesheet" href="/resources/css/btn.css">
    <style>
        #form{
            width: 100%;
            padding: 30px;
        }
        #form-top{
            display: flex;
            justify-content: space-between;
            align-items: end;
        }
        #form_name{
            font-size: 40px;
            font-weight: bold;
            padding: 10px;
        }
        #form-top-btn{
            padding-bottom: 10px;
        }
        #top-manu{
            border-top: 3px solid black;
            height: 8%;
            background-color: #D9D9D9;
            display: flex;
            justify-content: right;
            align-items: center;
        }

        #top_serch{
            display: flex;
            justify-content: right;
            padding-right: 61px;
            width: 35%;
        }
        .search-input-gray{
            width: 100px;
            font-size: 16px;
            padding: 0;
            text-align: center;
        }

        #search-filed{
            width: 300px;
            text-align: left;
            padding-left: 10px;
        }

        #table-manu{
            height: 75%;
            width: 100%;
            border-top: 3px solid black;
        }
        #table1{
            width: 100%;
            text-align: center;
            table-layout: auto;
        }
        #table1 thead{
            height: 30px;
            background-color: #D9D9D9;
            border-bottom: 3px solid #939393;
        }
        #table1 tbody tr{
            border-bottom: 3px solid #939393;
            height: 50px;
        }
        #footer{
            border-top: 3px solid #939393;
            background-color: #D9D9D9;
            height: 8%;
            border-bottom: 3px solid black;
            display: flex;
            justify-content: center;
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

        /*
        ------------------------------------------------------------------------------------------
         모달창
         */

        .modal-content{
            height: 90%;
        }

        .modal-header{
            border-bottom: 3px solid black !important;
        }

        .modal-footer{
            width: 100%;
            background-color: #D9D9D9;
            border-top: 3px solid #939393 !important;
            display: flex;
        }

        .modal-body{
            padding: 0 !important;
        }


        #btn-close-modal{
            border: none;
            background: none;
        }

        #x_img{
            width: 10px;
            height: 15px;
        }

        #staticBackdropLabel{
            font-size: 30px;
            font-weight: bold;
        }

        #modal-table{
            width: 100%;
            text-align: center;
        }

        #modal-table thead{
            height: 40px;
            background-color: #D9D9D9;
            border-bottom: 2px solid black;
        }

        #modal-table tbody tr{
            border-bottom: 3px solid #939393;
            height: 50px;
        }


        #table1 td, #table1 th, #modal-table td, #modal-table th{
            position: relative;
            padding: 10px;
        }

        #table1 td::after, #table1 th::after, #modal-table td::after, #modal-table th::after{
            content: '';
            position: absolute;
            top: 20%;
            left: 0;
            width: 2px;
            height: 60%;
            background-color: black;
        }

        #table1 td:first-child::after, #table1 th:first-child::after, #modal-table td:first-child::after, #modal-table th:first-child::after{
            content: none;
        }
        #tr td input[type="checkbox"] {
            width: 20px;
            height: 20px;
        }

        #modal-pageing{
            width: 80%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #modal-pageing img{
            width: 70px;
            padding: 10px;
        }
        #modal-pageing img:nth-of-type(2) {
            transform: rotate(180deg);
        }

        #modal-pageing button{
            border: #B4B4B4 solid 3px;
            background: white;
            color: #B4B4B4;
            font-weight: bold;
            margin: 5px;
        }
        #modal-pageing button:hover{
            border: #3C3C3C solid 3px;
            color: #3C3C3C;
            font-weight: bold;
        }
        #mobal-footer-btn{
            width: 10%;
            display: flex;
            justify-content: space-around;
            gap: 5px;
        }
        #modal-table tbody tr td input[type="checkbox"]{
            width: 20px;
            height: 20px;
        }

    </style>
</head>
<body>
<jsp:include page="../common/header2.jsp"/>
<div id="form">
    <div id="form-top">
        <div id="form_name">
            지점 관리
        </div>
        <div id="form-top-btn">
            <button class="black-btn" id="insertstore" data-bs-toggle="modal" data-bs-target="#staticBackdrop">승인목록</button>
        </div>
    </div>

    <div id="top-manu">
        <div id="top_serch">
            <form>
                <select class="search-input-gray">
                    <option>지점번호</option>
                    <option>지점명</option>
                    <option>지점장</option>
                </select>
                <input class="search-input-gray" id="search-filed" type="text" >
                <input class="search-input-submit-gray" type="submit" value="검색">
            </form>
        </div>
    </div>
    <div id ="table-manu">
        <table id="table1">
            <colgroup>
                <col style="width: 5%;">
                <col style="width: 20%;">
                <col style="width: 10%;">
                <col style="width: 10%;">
            </colgroup>
            <thead>
                <tr>
                    <th>지점번호</th>
                    <th>지점명</th>
                    <th>지점장</th>
                    <th>지점 창업일</th>
                </tr>
            </thead>
            <tbody>
            <tr>
                <td>001234</td>
                <td>강남역점</td>
                <td>아무개</td>
                <td>2025-03-21</td>
            </tr>
            <tr>
                <td>001235</td>
                <td>강원도 속초점</td>
                <td>김감자</td>
                <td>2022-03-22</td>
            </tr>
            <tr>
                <td>001236</td>
                <td>부산 해운대점</td>
                <td>이해물</td>
                <td>2023-02-01</td>
            </tr>
            <tr>
                <td>000986</td>
                <td>대전정역점</td>
                <td>김성심</td>
                <td>2021-05-27</td>
            </tr>
            </tbody>
        </table>
    </div>
    <div id="footer">
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
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div id="modal-head">
                    <div class="modal-header">
                        <p class="modal-title fs-5" id="staticBackdropLabel">승인 목록</p>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="btn-close-modal">
                            <img src="/resources/common/공통_Icon.png" id="x_img">
                        </button>
                    </div>
                </div>
                <div class="modal-body">
                    <!--모달 내용-->
                    <table id="modal-table">
                        <colgroup>
                            <col style="width: 20%;">
                            <col style="width: 20%;">
                            <col style="width: 30%;">
                            <col style="width: 10%;">
                            <col style="width: 10%;">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>지점번호</th>
                                <th>지점명</th>
                                <th>지점장</th>
                                <th>요청날짜</th>
                                <th>확인</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>01234</td>
                                <td>강원 춘천점</td>
                                <td>김닭갈비</td>
                                <td>2025-03-31</td>
                                <td><input type="checkbox"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <div id="modal-pageing">
                        <img src="/resources/common/공통_페이징바화살표.png">
                        <button type="button" class="btn btn-outline-secondary">1</button>
                        <button type="button" class="btn btn-outline-secondary">2</button>
                        <button type="button" class="btn btn-outline-secondary">3</button>
                        <button type="button" class="btn btn-outline-secondary">4</button>
                        <button type="button" class="btn btn-outline-secondary">5</button>
                        <img src="/resources/common/공통_페이징바화살표.png">
                    </div>
                    <div id="mobal-footer-btn">
                        <button class="yes-btn">승인</button>
                        <button class="no-btn">거절</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
