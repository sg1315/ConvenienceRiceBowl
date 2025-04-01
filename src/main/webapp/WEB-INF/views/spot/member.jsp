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
 
        #top-reft1{
            background-color: white;
            display: flex;
            align-content: center;
            align-items: center;
            width: 100%;
            border-bottom-right-radius: 20px;
            padding-bottom: 10px;
        }

        #top-reft1 p {
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
        #x_img{
            width: 10px;
            height: 10px;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="waper">
    <div id="top-manu">
    
            <div id="top-reft1">
                <img src="../resources/menu_icons/직원 아이콘.png">
                <p class="main_name">직원 정보</p>
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
                    <th class="col-2">직급</th>
                    <th class="col-2">아이디</th>
                    <th class="col-4">이름</th>
                    <th class="col-2">전화번호</th>
                    <th class="col-2">재직</th>
                </tr>
                </thead>
                <tbody >
                <tr>
                    <td>알바</td>
                    <td>abc</td>
                    <td>니들이 게맛을알아</td>
                    <td>010-1111-2222</td>
                    <td>Y</td>
                </tr>
                <tr>
                    <td>알바</td>
                    <td>abc</td>
                    <td>니들이 게맛을알아</td>
                    <td>010-1111-2222</td>
                    <td>Y</td>
                </tr>
                <tr>
                    <td>알바</td>
                    <td>abc</td>
                    <td>니들이 게맛을알아</td>
                    <td>010-1111-2222</td>
                    <td>Y</td>
                </tr>
                <tr>
                    <td>알바</td>
                    <td>abc</td>
                    <td>니들이 게맛을알아</td>
                    <td>010-1111-2222</td>
                    <td>Y</td>
                </tr>
                <tr>
                    <td>알바</td>
                    <td>abc</td>
                    <td>니들이 게맛을알아</td>
                    <td>010-1111-2222</td>
                    <td>Y</td>
                </tr>
                <tr>
                    <td>알바</td>
                    <td>abc</td>
                    <td>니들이 게맛을알아</td>
                    <td>010-1111-2222</td>
                    <td>Y</td>
                </tr>
                <tr>
                    <td>알바</td>
                    <td>abc</td>
                    <td>니들이 게맛을알아</td>
                    <td>010-1111-2222</td>
                    <td>Y</td>
                </tr>
                <tr>
                    <td>알바</td>
                    <td>abc</td>
                    <td>니들이 게맛을알아</td>
                    <td>010-1111-2222</td>
                    <td>Y</td>
                </tr>
                <tr>
                    <td>알바</td>
                    <td>abc</td>
                    <td>니들이 게맛을알아</td>
                    <td>010-1111-2222</td>
                    <td>Y</td>
                </tr>
                <tr>
                    <td>알바</td>
                    <td>abc</td>
                    <td>니들이 게맛을알아</td>
                    <td>010-1111-2222</td>
                    <td>Y</td>
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
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">직원 정보 수정</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="btn-close-modal">
                        <img src="<c:url value='/resources/common/공통_Icon.png'/>" id="x_img">
                    </button>
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
</div>
</body>
</html>
