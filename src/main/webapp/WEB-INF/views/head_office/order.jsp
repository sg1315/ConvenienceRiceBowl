
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="../resources/css/btn.css">
    <style>
        #form{
            width: 100%;
            padding: 30px;
        }
        #form_name{
            font-size: 40px;
            font-weight: bold;
            padding: 10px;
        }
        #top-manu{
            border-top: 3px solid black;
            height: 8%;
            background-color: #D9D9D9;
            display: flex;
            align-items: center;
        }
        #top_btn{
            padding-left: 10px;
            width: 30%;
        }
        #top_serch{
            width: 35%;
        }
        #marge{
            width: 35%;
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

        #modal-head{
            background-color: #D9D9D9;
            border-bottom: 3px solid black;
        }
        #modal-header2{
            display: flex;
            justify-content: space-between;
        }
        #modal-header2-low{
            padding-left: 10px;
            display: flex;
            align-items: center;
            justify-content: space-around;
         }
        #modal-header2-low p{
            font-size: 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <jsp:include page="../common/header2.jsp"/>
    <div id="form">
        <div id="form_name">
            발주 관리
        </div>
        <div id="top-manu">
            <div id="top_btn">
                <button class="gray-btn-border">저번달</button>
                <button class="gray-btn-border">최근</button>
            </div>
            <div id="marge">
            </div>
            <div id="top_serch">
                <form>
                    <input class="date-input" type="date">
                    ~
                    <input class="date-input" type="date">
                    <input class="search-input" type="number" >
                    <input class="search-input-submit" type="submit" value="검색">
                </form>
            </div>
        </div>
        <div id ="table-manu">
            <table id="table1">
                <thead>
                    <tr>
                        <th colspan="2">발주 일자</th>
                        <th colspan="2">발주 번호</th>
                        <th colspan="2">지점명</th>
                        <th colspan="2">수량</th>
                        <th colspan="2">금액</th>
                        <th colspan="2">상태</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="2">25-12-08</td>
                        <td colspan="2">1234</td>
                        <td colspan="2">강남점</td>
                        <td colspan="2">240</td>
                        <td colspan="2">1,902,000</td>
                        <td colspan="2">발주완료</td>
                    </tr>
                    <tr>
                        <td colspan="2">25-12-08</td>
                        <td colspan="2">1234</td>
                        <td colspan="2">강남점</td>
                        <td colspan="2">240</td>
                        <td colspan="2">1,902,000</td>
                        <td colspan="2">대기</td>
                    </tr>
                    <tr>
                        <td colspan="2">25-12-08</td>
                        <td colspan="2">1234</td>
                        <td colspan="2">강남점</td>
                        <td colspan="2">240</td>
                        <td colspan="2">1,902,000</td>
                        <td colspan="2">대기</td>
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
    </div>

    <!--start point-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div id="modal-head">
                    <div class="modal-header">
                        <p class="modal-title fs-5" id="staticBackdropLabel">25-12-08 | 1234 | 강남점</p>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="btn-close-modal">
                            <img src="/resources/common/공통_Icon.png" id="x_img">
                        </button>
                    </div>
                    <div id="modal-header2">
                        <div id="modal-header2-low">
                            <p>발주 요청 품목</p>
                            <button id="modal-header2-btn">발주 승인</button>
                            <button id="modal-header2-btn2">거절</button>
                        </div>
                        <div>
                            <div>
                                종류수 (총수량) : 3 (240)
                            </div>
                            <div>
                                총 1,902,000원
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-body">
                    <!--모달 내용-->
                    <span id="modal-rank"></span>
                    <select id="select-rank">
                        <option value="직급">직급</option>
                        <option value="알바">알바</option>
                        <option value="매니저">매니저</option>
                        <option value="지점장">지점장</option>
                    </select>
                    <p><strong>아이디:</strong> <span id="modal-id"></span></p>
                    <p><strong>이름:</strong> <span id="modal-name"></span></p>
                    <p><strong>전화번호:</strong> <span id="modal-phone"></span></p>
                    <p><strong>재직:</strong> <span id="modal-status"></span></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary">수정하기</button>
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

                    document.getElementById("modal-rank").textContent = rank;
                    document.getElementById("modal-id").textContent = id;
                    document.getElementById("modal-name").textContent = name;
                    document.getElementById("modal-phone").textContent = phone;
                    document.getElementById("modal-status").textContent = status;

                    const modal = new bootstrap.Modal(document.getElementById("staticBackdrop"));
                    modal.show();
                });
            });
        });

    </script>
    <!--end point-->
</body>
</html>
