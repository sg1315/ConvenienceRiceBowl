<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

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
            width: 30%;

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
            width: 70%;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
            padding-right: 3%;
            flex-wrap: wrap;
            gap: 10px;
        }
        #top-right1 div:first-child {
            font-size: 18px;
            font-weight: bold;
            text-align: center;
            margin-right: auto;
            margin-left: 2%;
        }
        #top_right2_in{
            display: flex;
            justify-content: flex-end;
            gap: 20px;
            margin-top: 10px;
        }
        #top-left p {
            padding-left: 15px;
        }
        #main{
            background-color: #D9D9D9;
            width: 100%;
            height: 90%;
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
        #select-modal-rank{
            margin-bottom:6px;
            margin-right: 20%;
        }
        #select-modal-status{
            width: 24%;
            border-radius: 8px;
        }
        #modal-div{
            display:flex;
            height:8%;
            flex-direction:row-reverse;
            justify-content:space-between;
            margin-bottom:6px;
            align-items: flex-end;
        }
        #select-modal-rank{
            width:20%;
            height:100%;
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
        #table1 td, #table1 th{
            border-right:1px solid gray;
        }
        #table1 td:nth-of-type(5),#table1 th:nth-of-type(5){
            border-right:none;
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
                <p class="main_name">발주</p>
            </div>
        </div>

        <div id="top-right1">
            <div>
                발주<br>요청
            </div>
            <div>
                <button>저번 달</button>
                <button>최근</button>
                <input type="date"> ~ <input type="date">
                <div id="top_right2">
                <div id="top_right2_in">
                    <select>
                        <option>상태</option>
                        <option>발주대기</option>
                        <option>발주요청</option>
                        <option>발주승인</option>
                        <option>발주거절</option>
                    </select>
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
                    <col style="width: 10%;">
                    <col style="width: 20%;">
                    <col style="width: 20%;">
                </colgroup>
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

    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div id="header-title">
                        <h1 class="modal-title fs-5">직원 정보 수정</h1>
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="btn-close-modal">
                        <img src="<c:url value="/resources/common/공통_Icon.png"/>" id="x_img">
                    </button>
                </div>
                <div class="modal-body">
                    <!--모달 내용-->
                    <div id="modal-body-div">
                        <div id="modal-div">
                            <select id="select-modal-rank">
                                <option value="직급">직급</option>
                                <option value="알바">알바</option>
                                <option value="매니저">매니저</option>
                                <option value="지점장">지점장</option>
                            </select>
                            <p>
                                <strong>이름</strong> <br>
                        </div>
                                <input type="text" id="modal-name">
                            </p>

                            <p>
                                <strong>휴대폰</strong><br>
                                <input type="text" id="modal-phone">
                            </p>
                            <p>
                                <strong>주민번호</strong><br>
                                <input type="text" id="modal-identify" value="여기에 주민등록번호 가져와서 넣어야함">
                            </p>
                            <p>
                                <strong>아이디</strong><br>
                                <input type="text" id="modal-id">
                            </p>
                            <p>
                                <strong>재직상황</strong><br>
                                <select id="select-modal-status">
                                    <option value="Y">Y</option>
                                    <option value="N">N</option>
                                </select>
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
        document.addEventListener("DOMContentLoaded", function () {

            const rows = document.querySelectorAll("#table1 tbody tr");

            rows.forEach(row => {
                row.classList.add("table-row");

                row.addEventListener("click", function () {
                    const rank = this.children[0].textContent;
                    const id = this.children[1].textContent;
                    const name = this.children[2].textContent;
                    const phone = this.children[3].textContent;
                    const status = this.children[4].textContent;

                    document.getElementById("modal-id").value = id;
                    document.getElementById("modal-name").value = name;
                    document.getElementById("modal-phone").value = phone;
                    document.getElementById("select-modal-status").value = status;
                    document.getElementById("select-modal-rank").value = rank;

                    const modal = new bootstrap.Modal(document.getElementById("staticBackdrop"));
                    modal.show();
                });
            });
        });

    </script>
    <!--end point-->
</div>
</body>
</html>
