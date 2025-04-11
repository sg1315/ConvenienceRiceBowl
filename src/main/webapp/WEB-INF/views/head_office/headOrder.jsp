<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>본사 발주관리</title>
    <link rel="stylesheet" href="/resources/css/btn.css">
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
        #top_search{
            width: 50%;
            padding-right: 10px;
        }
        #top_search_form{
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 5px;
        }
        #marge{
            width: 30%;
        }
        #table-manu{
            height: 75%;
            width: 100%;
            border-top: 3px solid black;
        }
       #table1 {
         width: 100%;
         text-align: center;
         table-layout: auto;
       }
       #table1 thead {
         height: 60px;
         font-size: 22px;
         background-color: #d9d9d9;
         border-bottom: 3px solid #939393;
       }
       #table1 tbody tr {
        border-bottom: 3px solid #939393;
        font-size: 16px;
        height: 60px;
      }
      #footer {
        border-top: 2px solid #939393;
        background-color: #d9d9d9;
        height: 8%;
        border-bottom: 3px solid black;
        display: flex;
        justify-content: center;
        align-items: center;
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
            display: flex;
            justify-content: center;
            align-items: center;
            border: none;
            background: #d9d9d9;
        }
        #x_img{
            width: 20px;
            height: 20px;
        }


        .modal-content{
            height: 90%;
        }


        #modal-head{
            background-color: #D9D9D9;
            border-bottom: 3px solid black;
        }
        #modal-header2{
            display: flex;
        }
        #modal-header2-low{
            width: 35%;
            padding-left: 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        #modal-header2-low2{
            width: 72%;
            text-align: right;
            margin-right: 10px;
        }
        #modal-header2-low p{
            font-size: 20px;
            font-weight: bold;
        }
        .modal-body{
            padding: 0 !important;
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

        .modal-footer{
            border-top: 3px solid black !important;
            background-color: #D9D9D9;
            display: flex !important;
            justify-content: center !important;
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
        .modal-header{
            border:none !important;
        }

        .modal-footer{
            height: 8%;
        }
        #modal-table {
            display: block;
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
        }

        #modal-table thead {
            display: table;
            width: 100%;
            table-layout: fixed;
        }

        #modal-table thead th {
            position: sticky;
            top: 0;
            background-color: #D9D9D9;
            z-index: 2;
            border-bottom: 2px solid black;
        }

        #modal-table tbody {
            display: block;
            max-height: 840px; /* 원하는 스크롤 높이 */
            overflow-y: auto;
            width: 100%;
        }

        #modal-table tbody tr {
            display: table;
            table-layout: fixed;
            width: 100%;
        }

        #modal-header2-low2 div{
            display: flex;
            justify-content: right;
        }

        #modal-head-left{
            font-weight: bold;
            display: flex;
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
                <button class="gray-btn-border" id="btn-last-month">저번달</button>
                <button class="gray-btn-border" onclick="recent()">최근</button>
            </div>
            <div id="marge">
            </div>
            <div id="top_search">
                <form id="top_search_form" action="head_order" method="post">
                    <input class="date-input" type="date" name="startDate">
                    ~
                    <input class="date-input" type="date" name="endDate">
                    <input class="search-input" type="number" name="setNo" placeholder="발주번호">
                    <input class="search-input-submit-gray" type="submit" value="검색">
                </form>
            </div>
        </div>
        <div id ="table-manu">
            <table id="table1">
                <colgroup>
                    <col style="width: 17%;">
                    <col style="width: 17%;">
                    <col style="width: 17%;">
                    <col style="width: 17%;">
                    <col style="width: 17%;">
                    <col style="width: 17%;">
                </colgroup>
                <thead>
                    <tr>
                        <th>발주 일자</th>
                        <th>발주 번호</th>
                        <th>지점명</th>
                        <th>수량</th>
                        <th>금액</th>
                        <th>상태</th>
                    </tr>
                </thead>
                <tbody id="order-list-body">
                <c:choose>
                    <c:when test="${not empty oslist}">
                        <c:forEach var="C" items="${oslist}">
                            <tr data-sno="${C.setNo}"
                                data-minuteGroup="${C.minuteGroup}"
                                data-storeName="${C.storeName}"
                                data-totalAmount="${C.totalAmount}"
                                data-totalInputPrice="${C.totalInputPrice}"
                                data-status="${C.status}">
                                <td>${C.minuteGroup}</td>
                                <td>${C.setNo}</td>
                                <td>${C.storeName}</td>
                                <td>${C.totalAmount}</td>
                                <td>${C.totalInputPrice}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${C.status == 1}">대기</c:when>
                                        <c:when test="${C.status == 5}">승인</c:when>
                                        <c:when test="${C.status == 6}">거절</c:when>
                                        <c:when test="${C.status == 7}">발주완료</c:when>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                            <c:forEach var="C" items="${olist}">
                                <tr data-sno="${C.setNo}"
                                    data-minuteGroup="${C.minuteGroup}"
                                    data-storeName="${C.storeName}"
                                    data-totalAmount="${C.totalAmount}"
                                    data-totalInputPrice="${C.totalInputPrice}"
                                    data-status="${C.status}">
                                    <td>${C.minuteGroup}</td>
                                    <td>${C.setNo}</td>
                                    <td>${C.storeName}</td>
                                    <td>${C.totalAmount}</td>
                                    <td>${C.totalInputPrice}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${C.status == 1}">대기</c:when>
                                            <c:when test="${C.status == 5}">승인</c:when>
                                            <c:when test="${C.status == 6}">거절</c:when>
                                            <c:when test="${C.status == 7}">발주완료</c:when>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>
        <div id="footer">
            <div id="main-pageing">
                <c:set var="hasCondition" value="${not empty param.setNo or not empty param.startDate or not empty param.endDate}" />

                <c:choose>
                    <c:when test="${hasCondition}">
                        <c:set var="baseUrl" value="head_order?setNo=${param.setNo}&startDate=${param.startDate}&endDate=${param.endDate}" />
                        <c:set var="connector" value="&" />
                    </c:when>
                    <c:otherwise>
                        <c:set var="baseUrl" value="head_order" />
                        <c:set var="connector" value="?" />
                    </c:otherwise>
                </c:choose>

                <c:if test="${pi.startPage > 1}">
                    <a href="${baseUrl}${connector}cpage=${pi.startPage - 1}">
                        <img src="${pageContext.request.contextPath}/resources/common/공통_페이징바화살표.png" alt="이전">
                    </a>
                </c:if>

                <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
                    <button type="button"
                            class="btn btn-outline-secondary <c:if test='${pi.currentPage == i}'>active</c:if>'"
                            onclick="location.href='${baseUrl}${connector}cpage=${i}'">
                            ${i}
                    </button>
                </c:forEach>

                <c:if test="${pi.endPage < pi.maxPage}">
                    <a href="${baseUrl}${connector}cpage=${pi.endPage + 1}">
                        <img src="${pageContext.request.contextPath}/resources/common/공통_페이징바화살표.png" alt="다음">
                    </a>
                </c:if>
            </div>
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
                        <div id="modal-head-left">
                            <p class="modal-title fs-5" id="staticBackdropLabel"></p>
                            <p id="order-num"></p>
                            <p id="spot-name"></p>
                        </div>
                        <button type="button" data-bs-dismiss="modal" aria-label="Close" id="btn-close-modal">
                            <img src="<c:url value="/resources/common/공통_Icon.png"/>" id="x_img">
                        </button>
                    </div>
                    <div id="modal-header2">
                        <div id="modal-header2-low">
                            <p>발주 요청 품목</p>
                            <button class="yes-btn" id="modal-header2-btn" style="width: 100px">발주 승인</button>
                            <button class="no-btn" id="modal-header2-btn2">거절</button>
                        </div>
                        <div id="modal-header2-low2">
                            <div>
                                종류 수 (총수량) : <p id="sett"></p> (<p id="set"></p>)
                            </div>
                            <div>
                                총금액: <p id="pice"></p>
                            </div>
                        </div>
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
                                <th>상품번호</th>
                                <th>카테고리</th>
                                <th>상품명</th>
                                <th>수량</th>
                                <th>금액</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">

                </div>
            </div>
        </div>
    </div>
    <script>
        document.querySelectorAll('#table1 tbody tr').forEach(row => {
            row.addEventListener('click', function () {
                const sno = this.getAttribute('data-sno');
                const minuteGroup = this.getAttribute('data-minuteGroup');
                const storeName = this.getAttribute('data-storeName');
                const totalAmount = this.getAttribute('data-totalAmount');
                const totalInputPrice = this.getAttribute('data-totalInputPrice');
                const status=this.getAttribute('data-status');
                document.querySelector('#set').innerHTML = totalAmount;
                document.querySelector('#pice').innerHTML = totalInputPrice;
                document.querySelector('#staticBackdropLabel').innerHTML = minuteGroup+ " |"+ '&nbsp';
                document.querySelector('#order-num').innerHTML =sno;
                document.querySelector('#spot-name').innerHTML = '&nbsp' + "|"+ '&nbsp'+storeName;
                if(status != 1){
                    document.querySelector('#modal-header2-btn').style.display = 'none';
                    document.querySelector('#modal-header2-btn2').style.display = 'none';
                } else{
                    document.querySelector('#modal-header2-btn').style.display = 'block';
                    document.querySelector('#modal-header2-btn2').style.display = 'block';
                }


                // 기존의 fetch를 jQuery AJAX로 변경
                $.ajax({
                    url: '/getOderDetail?sno=' + sno, // 서버에서 데이터를 가져오는 URL
                    method: 'GET', // HTTP 요청 메소드
                    dataType: 'json', // 응답 데이터 타입 (JSON)
                    success: function (data) {
                        let str = "";
                        for(let o of data){

                            str+= "<tr>" +
                                "<td>" + o.productNo+ "</td>" +
                                "<td>" + o.categoryName + "</td>" +
                                "<td>" + o.productName + "</td>" +
                                "<td>" + o.circulationAmount + "</td>" +
                                "<td>" + o.sumInputPrice + "</td>" +
                                "</tr>";
                        }


                        const odering = document.querySelector("#modal-table tbody");
                        odering.innerHTML = str;

                        let rowCount = $("#modal-table tbody tr").length;
                        document.querySelector('#sett').innerHTML = rowCount;

                        // 모달 띄우기
                        const myModal = new bootstrap.Modal(document.getElementById('staticBackdrop'));
                        myModal.show();


                    },

                    error: function (xhr, status, error) {
                        console.error('AJAX 요청 실패:', error);
                    }
                });
            });
        });

        function updateOrderStatus(statusCode) {
            const sno = document.querySelector('#order-num').innerHTML;
            console.log(sno);
            $.ajax({
                url: '/updateheadorder',
                method: 'POST', // HTTP 요청 메소드
                dataType: 'json', // 응답 데이터 타입 (JSON)
                data:{
                    sno: sno,
                    status: statusCode },
                success: function(data) {
                    alert(data.message);

                    // 모달 닫기
                    const modal = bootstrap.Modal.getInstance(document.getElementById('staticBackdrop'));
                    if (modal) {
                        modal.hide();
                    }
                    location.reload();
                },
                error: function(err) {
                    alert("상태 변경 실패");
                    console.error(err);
                }
            })
        }
        document.getElementById('modal-header2-btn').addEventListener('click', () => updateOrderStatus(5)); // 승인
        document.getElementById('modal-header2-btn2').addEventListener('click', () => updateOrderStatus(6)); // 거절

        function recent() {
            window.location.href = '/head_order';
        }

        function statusText(code) {
            switch (code) {
                case 1: return '대기';
                case 5: return '승인';
                case 6: return '거절';
                case 7: return '발주완료';
            }
        }

        // 버튼 클릭 이벤트
        document.getElementById('btn-last-month').addEventListener('click', function () {
            const today = new Date();
            const lastMonthStart = new Date(today.getFullYear(), today.getMonth() - 1, 1);
            const lastMonthEnd = new Date(today.getFullYear(), today.getMonth(), 0);

            const format = (date) => date.toISOString().split('T')[0];
            const startDate = format(lastMonthStart);
            const endDate = format(lastMonthEnd);

            $.ajax({
                type: 'POST',
                url: '/head_lastorder',
                dataType: 'json',
                data: {
                    startDate: startDate,
                    endDate: endDate
                },
                success: function (data) {
                    console.log(data);
                    let html = '';
                    for (let C of data) {
                        html +=
                        "<tr data-sno="+C.setNo+
                            "data-minuteGroup=" +C.minuteGroup+
                            "data-storeName=" + C.storeName +
                            "data-totalAmount=" + C.totalAmount +
                            "data-totalInputPrice=" +C.totalInputPrice +
                            "data-status=" + C.status +">" +
                            "<td>" +C.minuteGroup+"</td>" +
                            "<td>" +C.setNo + "</td>" +
                            "<td>" +C.storeName + "</td>" +
                            "<td>" +C.totalAmount + "</td>" +
                            "<td>" +C.totalInputPrice + "</td>" +
                            "<td>" +statusText(C.status) + "</td>" +
                        "</tr>";
                    }
                    $('#order-list-body').html(html);
                },
                error: function () {
                    alert("저번달 데이터 조회 실패!");
                }
            });
        });

    </script>

</body>
</html>
