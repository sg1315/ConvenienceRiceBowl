<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>지점 연매출</title>
    <link rel="stylesheet" href="/resources/css/btn.css"/>
    <style>
        .waper {
            width: 100%;
            padding: 50px;
            font-family: 'Open Sans', sans-serif;
        }

        .main_name {
            font-weight: bolder;
            font-size: 50px;
            margin: 0;
            padding-left: 15px;
        }

        #top-manu {
            display: flex;
            justify-content: space-between;
        }

        #top-left {
            background-color: #d9d9d9;
            width: 65%;
        }

        #top-left1 {
            background-color: white;
            display: flex;
            align-content: center;
            align-items: center;
            width: 100%;
            border-bottom-right-radius: 20px;
            padding-bottom: 10px;
        }

        #top-right1 {
            background-color: #d9d9d9;
            width: 35%;
            display: flex;
            gap: 10px;
            padding-right: 40px;
            padding-left: 50px;
            justify-content: space-between;
            align-items: center;
            align-content: center;

            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
        }

        #yearPicker {
            text-align: center;
            font-weight: bold;
        }


        #main-title {
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 30px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        #main {
            background-color: #d9d9d9;
            width: 100%;
            height: 90%;
            border-top-left-radius: 20px;
            border-bottom-left-radius: 20px;
            border-bottom-right-radius: 20px;
            padding: 50px 50px 70px;
        }

        #main-in {
            background-color: white;
            width: 100%;
            height: 100%;
            border-radius: 20px;
            padding: 20px 50px 20px;
        }

        #table1 {
            text-align: center;
            outline: none;
            width: 100%;
            height: 90%;
            font-weight: bold;

        }

        #table1 thead {
            background: #477154;
            color: white;
            text-align: center;
        }

        #table1 tbody {
            background: white;
        }

        #table1 tbody tr td {
            vertical-align: middle;
            text-align: center;
        }

        #table1 tbody tr td:nth-child(1) {
            background: #d9d9d9;
        }

        #table1 tbody tr td:nth-child(4) {
            background: #A3B8A9;
        }

        #table1 tbody tr:hover td:nth-child(1) {
            background-color: #cfcfcf;
        }

        #table1 tbody tr:hover td:nth-child(4) {
            background-color: #8fa598;
        }

    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="waper">
    <div id="top-manu">
        <div id="top-left">
            <div id="top-left1">
                <img src="../resources/menu_icons/매출집계 아이콘.png"/>
                <p class="main_name">매출집계</p>
            </div>
        </div>

        <div id="top-right1">
            <a href="/spot_sales">
                <button class="search-input-submit">월별</button>
            </a>
            <div id="searchdate">
                <select class="date-input" id="yearPicker"></select>
            </div>
            <button class="search-input-submit" id="yearBtn">검색</button>
        </div>
    </div>
    <div id="main">
        <div id="main-in">
            <div id="main-title">
                <!-- 초기 로딩 시 실행 -->
                <%
                    String year = String.valueOf(java.time.LocalDate.now().getYear());
                    request.setAttribute("yearCurrent", year);
                %>
                &lt;<p id="year"><span>${yearCurrent}</span></p>&gt;
            </div>
            <table class="table table-hover table-bordered table-sm" id="table1">
                <thead>
                <tr>
                    <th class="col-1">날짜</th>
                    <th class="col-2">입고가</th>
                    <th class="col-2">판매가</th>
                    <th class="col-3">마진</th>
                </tr>
                </thead>

                <tbody>
                <!-- 초기 로딩 시 실행 -->
                <c:forEach var="item" items="${circulationList}">
                    <tr>
                        <td><span class='monthText'>${item.month < 10 ? Integer.parseInt(item.month) : item.month}</span>월</td>
                        <td><fmt:formatNumber value="${item.totalInput}" type="number"/></td>
                        <td><fmt:formatNumber value="${item.totalSale}" type="number"/></td>
                        <td><fmt:formatNumber value="${item.totalSale - item.totalInput}" type="number"/></td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>

    </div>
</div>

<script>
    //페이지 로드 시 실행 (년도 불러오기)
    document.addEventListener("DOMContentLoaded", function () {
        const yearSelect = document.getElementById("yearPicker");
        const currentYear = new Date().getFullYear();
        const startYear = 1980;

        yearSelect.innerHTML = "";

        for (let year = currentYear; year >= startYear; year--) {
            let option = document.createElement("option");
            option.value = year;
            option.textContent = year;

            yearSelect.appendChild(option);
        }
        yearSelect.value = currentYear;
    });

    //페이지 초기 로드 시 실행 (테이블 클릭옵션)
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelectorAll('#table1 tbody tr').forEach((row) => {
            row.addEventListener('click', handleRowClick)
        });
    });

    //검색 기능
    document.getElementById("yearBtn").addEventListener('click', function () {
        const selectedYear = document.getElementById("yearPicker").value;

        fetch("/spot_sales/year?year=" + selectedYear)
            .then(response => response.json())
            .then(data => {
                document.querySelector("#year span").textContent = selectedYear;
                const tbody = document.querySelector("#table1 tbody");
                tbody.innerHTML = "";

                data.forEach(item => {
                    const row = document.createElement("tr");
                    const month = parseInt(item.month);
                    const input = item.totalInput.toLocaleString();
                    const sale = item.totalSale.toLocaleString();
                    const margin = item.totalMargin.toLocaleString();

                    row.innerHTML = "<td>" + "<span class='monthText'>" + month + "</span>월</td>" +
                        "<td>" + input + "</td>" +
                        "<td>" + sale + "</td>" +
                        "<td>" + margin + "</td>";

                    tbody.appendChild(row);
                });

                document.querySelectorAll('#table1 tbody tr').forEach((row) => {
                    row.addEventListener('click', handleRowClick);
                });
            })
            .catch(error => {
                console.error("에러 발생:", error);
            });
    });

    //url요청으로 데이터 불러오기
    function handleRowClick() {
        const cells = this.querySelectorAll('td');
        const year = document.getElementById("year").textContent.trim();
        const currentPage = new URLSearchParams(window.location.search).get('cpage') || 1;

        cells.forEach((cell) => {
            const span = cell.querySelector('.monthText');
            if (span) {
                let month = span.textContent.trim();
                if (month < 10) {
                    month = "0" + month;
                    let add = year + '-' + month;
                    window.location.href = '/spot_sales?startMonth=' + add + '&endMonth=' + add + '&cpage=' + currentPage;
                }

                let add = year + '-' + month;
                window.location.href = '/spot_sales?startMonth=' + add + '&endMonth=' + add + '&cpage=' + currentPage;
            }
        });
    }
</script>
</body>
</html>
