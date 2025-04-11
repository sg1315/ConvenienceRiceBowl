<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="now" class="java.util.Date" scope="page" />
<html>
<head>
    <title>대시보드</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="/resources/css/btn.css">
    <style>
        #wrap{
            width: 100%;
            height: 100%;
            padding: 40px;
            display: flex;
            justify-content: center;
            align-content: center;
        }
        #wrap-inner{
            width: 100%;
        }
        #dash-head{
            width: 100%;
            height: 10%;
            display: flex;
            justify-content: left;
            align-items: center;
            font-size: 60px;
            font-weight: bold;

            padding: 10px;
        }
        #dash-head img{
            width: 70px;
            height: 70px;
            margin-right: 20px;
        }

        #dash-main{
            width: 100%;
            height: 90%;
            display: flex;
        }

        #dash-left{
            width: 70%;
            height: 100%;

            margin: 5px;
            margin-top: 10px;
            padding: 5px;

            border: #CCCACA solid 2px;
            border-radius: 4px;
        }
        #dash-date{
            width: 100%;
            height: 6%;
            display: flex;
            justify-content: left;
            align-items: center;
        }
        #dash-date > p{
            margin-left: 50px;
            font-size: 20px;
            font-weight: bold;
        }

        #dash-product-top{
            width: 100%;
            height: 24%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .product-box{
            width: 45%;
            height: 90%;

            margin: 10px;

            border: #CCCACA solid 2px;
            border-radius: 4px;
        }
        .product-title{
            width: 100%;
            height: 30%;
            border-bottom: #CCCACA solid 2px;
            display: flex;
            justify-content: left;
            align-items: center;
            padding-left: 14px;

            color: white;
            font-weight: bold;
        }
        #best-title{
            background: #FFC000;
        }
        #worst-title{
            background: #477154;
        }
        .product-content{
            width: 100%;
            height: 70%;
            display: flex;
            justify-content: space-around;
            align-items: center;
            padding: 5px;
        }
        .best3{
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 12px;
        }
        #best-1-text{
            font-weight: bold;
            font-size: 14px;
        }
        #worst-1-text{
            font-weight: bold;
            font-size: 14px;
        }


        #dash-inout-graph{
            width: 100%;
            height: 35%;
            display: flex;
            justify-content: center;
            align-items: center;
            padding-right: 40px;
            padding-left: 40px;
        }


        #dash-inout-table{
            width: 100%;
            height: 35%;
            padding: 30px;
        }
        #dash-inout-table table{
            width: 100%;
            height: 100%;
            font-size: 14px;
        }
        #dash-inout-table table th{
            border-top: solid;
            border-bottom: solid;
        }
        #dash-inout-table table tr:nth-child(3){
            background: #FFC000;
        }


        #dash-right{
            width: 30%;
            height: 100%;

            padding: 5px;
        }

        #dash-right-top{
            width: 100%;
            height: 50%;

            margin: 5px;
            padding: 5px;

            border: #CCCACA solid 2px;
            border-radius: 4px;
        }

        #dash-alarm{
            width: 100%;
            height: 40%;
            background: #f6e6b5;
            padding: 10px;
        }
        #alarm-title{
            width: 100%;
            height: 30%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-weight: bold;
            padding-bottom: 10px;
            border-bottom: #3C3C3C solid 2px;
        }
        #alarm-text{
            width: 100%;
            height: 70%;
            display: flex;
            justify-content: space-between;
            align-items: center;

            font-size: 14px;
            font-weight: bold;
        }
        #move_inven{
            width: 100%;
            height: 40px;
            border: none;
            background-color: #477154;
            border-radius: 4px;
            font-size: 12px;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        #move_inven img{

        }

        #dash-announcement{
            width: 100%;
            height: 60%;
            padding: 10px;
        }
        #announcement-title{
            width: 100%;
            height: 30%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-weight: bold;
            border-bottom: #3C3C3C solid 2px;

        }
        #announcement-text{
            width: 100%;
            height: 70%;
            padding-top: 10px;
            font-size: 14px;
        }

        #dash-dispose{
            width: 100%;
            height: 50%;

            margin: 5px;
            margin-top: 10px;
            padding: 10px;

            border: #CCCACA solid 2px;
            border-radius: 4px;
            background: #477154;
            color: white;
        }
        #dispose-title{
            width: 100%;
            height: 10%;
            display: flex;
            justify-content: space-between;
            align-items: end;
            padding: 2px;
            border-bottom: white solid 2px;
        }
        #dispose-count{
            width: 100%;
            height: 40%;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }
        #dispose-quantity{
            width: 100%;
            height: 80%;
            text-align: center;
            padding: 10px;
        }
        #dispose-quantity div:nth-child(1){
            width: 100%;
            height: 40%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-weight: bold;
        }
        #dispose-quantity div:nth-child(2){
            width: 100%;
            height: 60%;
            display: flex;
            justify-content: center;
            align-items: center;

            color: #FFC000;
            font-weight: bold;
            font-size: 36px;
            -webkit-text-stroke: 1px black;

            font-family: "Open Sans", sans-serif;
            font-optical-sizing: auto;
            font-style: normal;
            font-variation-settings: "wdth" 100;
        }

        #dispose-amount{
            width: 100%;
            height: 80%;
            text-align: center;
            padding: 10px;
        }
        #dispose-amount div:nth-child(1){
            width: 100%;
            height: 40%;
            display: flex;
            justify-content: center;
            align-items: center;

            font-weight: bold;
        }
        #dispose-amount div:nth-child(2){
            width: 100%;
            height: 60%;
            display: flex;
            justify-content: center;
            align-items: center;

            color: #FFC000;
            font-weight: bold;
            font-size: 36px;
            -webkit-text-stroke: 1px black;

            font-family: "Open Sans", sans-serif;
            font-optical-sizing: auto;
            font-style: normal;
            font-variation-settings: "wdth" 100;
        }


        #dispose-content{
            width: 100%;
            height: 50%;
            display: block;
            overflow: auto;
        }
        #dispose-content table{
            height: 100%;
            text-align: center;
            border-collapse: collapse;
            border: white solid 2px;
        }
        #dispose-content table th{
            position: sticky;
            top: 0px;
            z-index: 1;
            background: #477154;
            color: white;
        }
        #dispose-content table tbody{
            overflow-y: auto;
        }
        #dispose-content table td{
            background: white;
        }

    </style>

</head>
<body>
<jsp:include page="../common/header.jsp"/>

<div id="wrap">
    <div id="wrap-inner">
        <div id="dash-head">
            <img src="/resources/menu_icons/대시보드%20아이콘.png">
            <p>대시보드</p>
        </div>
        <div id="dash-main">
            <div id="dash-left">
                <div id="dash-date">
                    <p>&lt; 3월 &gt;</p>
                </div>
                <div id="dash-product-top">
                    <div class="product-box" id="product-top-best">
                        <div class="product-title" id="best-title">
                            <p>BEST TOP 3</p>
                        </div>
                        <div class="product-content" id="best-content">
                            <div class="best3">
                                <div id="best-1-img">
                                    <img src="/resources/common/대시보드_Trophy.png">
                                </div>
                                <div id="best-1-text">
                                    <p>아몬드 빼빼로</p>
                                    <p>100개</p>
                                </div>
                            </div>
                            <div class="best3">
                                <div>
                                    <img src="/resources/common/대시보드_Medal%20Second%20Place.png">
                                </div>
                                <div>
                                    <p>oo커피</p>
                                    <p>70개</p>
                                </div>
                            </div>
                            <div class="best3">
                                <div>
                                    <img src="/resources/common/대시보드_Medal%20Third%20Place.png">
                                </div>
                                <div>
                                    <p>ooo과자</p>
                                    <p>50개</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="product-box" id="product-top-worst">
                        <div class="product-title" id="worst-title">
                            <p>WORST TOP 3</p>
                        </div>
                        <div class="product-content" id="worst-content">
                            <div class="best3">
                                <div id="worst-1-img">
                                    <img src="/resources/common/대시보드_Thumbs%20Down.png">
                                </div>
                                <div id="worst-1-text">
                                    <p>ooo음료</p>
                                    <p>1개</p>
                                </div>
                            </div>
                            <div class="best3">
                                <div>
                                    <img src="/resources/common/대시보드_Low%20Price.png">
                                </div>
                                <div>
                                    <p>oo커피</p>
                                    <p>5개</p>
                                </div>
                            </div>
                            <div class="best3">
                                <div>
                                    <img src="/resources/common/대시보드_Low%20Price.png">
                                </div>
                                <div>
                                    <p>ooo과자</p>
                                    <p>10개</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="dash-inout-graph">
                    <canvas id="barChart"></canvas>
                </div>
                <div id="dash-inout-table">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>날짜</th>
                            <th>1월</th>
                            <th>2월</th>
                            <th>3월</th>
                            <th>4월</th>
                            <th>5월</th>
                            <th>6월</th>
                            <th>7월</th>
                            <th>8월</th>
                            <th>9월</th>
                            <th>10월</th>
                            <th>11월</th>
                            <th>12월</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>입고가</td>
                            <td>200</td>
                            <td>400</td>
                            <td>400</td>
                            <td>200</td>
                            <td>200</td>
                            <td>400</td>
                            <td>400</td>
                            <td>200</td>
                            <td>200</td>
                            <td>200</td>
                            <td>400</td>
                            <td>200</td>
                        </tr>
                        <tr>
                            <td>판매가</td>
                            <td>600</td>
                            <td>600</td>
                            <td>600</td>
                            <td>600</td>
                            <td>600</td>
                            <td>800</td>
                            <td>600</td>
                            <td>800</td>
                            <td>600</td>
                            <td>600</td>
                            <td>800</td>
                            <td>800</td>
                        </tr>
                        <tr>
                            <td>마진</td>
                            <td>400</td>
                            <td>200</td>
                            <td>200</td>
                            <td>200</td>
                            <td>400</td>
                            <td>400</td>
                            <td>200</td>
                            <td>600</td>
                            <td>400</td>
                            <td>400</td>
                            <td>400</td>
                            <td>600</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div id="dash-right">
                <div id="dash-right-top">
                    <div id="dash-alarm">
                        <div id="alarm-title">
                            <p>재고부족 알림</p>
                            <img src="/resources/common/대시보드_알림창.png">
                        </div>
                        <div id="alarm-text">
                            <div>
                                <p>부족한 재고가 있습니다. 확인부탁드립니다.</p>
                            </div>
                            <div>
                                <a><button id="move_inven">재고관리이동<img src="/resources/common/화살표_아이콘.png"></button></a>
                            </div>
                        </div>
                    </div>
                    <div id="dash-announcement">
                        <div id="announcement-title">
                            <p>공지사항</p>
                            <a><img src="/resources/common/대시보드_Plus%20Math.png"></a>
                        </div>
                        <div id="announcement-text">
                            가맹점주님들에게 알립니다. oo상품이 oo월부터........
                        </div>
                    </div>
                </div>
                <div id="dash-dispose">
                    <div id="dispose-title">
                        <div>
                            <p style="font-size: 18px; font-weight: bold">금일 폐기상품</p>
                        </div>
                        <div>
                            <p style="font-size: 12px">
                                <fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일" />
                            </p>
                        </div>
                    </div>
                    <div id="dispose-count">
                        <div id="dispose-quantity">
                            <div>
                                <p>금일 폐기수량</p>
                            </div>
                            <div>
                                <p>35</p>
                            </div>
                        </div>
                        <div id="dispose-amount">
                            <div>
                                <p>금일 폐기금액</p>
                            </div>
                            <div>
                                <p>20,000</p>
                            </div>
                        </div>
                    </div>
                    <div id="dispose-content">
                        <table class="table table-bordered">
                        
                            <thead>
                            <tr>
                                <th>상품명</th>
                                <th>수량</th>
                                <th>총금액</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>AA</td>
                                <td>1ea</td>
                                <td>5000</td>
                            </tr>
                            <tr>
                                <td>BB</td>
                                <td>3ea</td>
                                <td>6000</td>
                            </tr>
                            <tr>
                                <td>CC</td>
                                <td>4ea</td>
                                <td>4000</td>
                            </tr>
                            <tr>
                                <td>DD</td>
                                <td>2ea</td>
                                <td>3000</td>
                            </tr>
                            <tr>
                                <td>EE</td>
                                <td>1ea</td>
                                <td>1000</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    const labels = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
    const incomingData = [200, 400, 400, 200, 200, 400, 400, 200, 200, 200, 400, 200];
    const salesData = [600, 600, 600, 600, 600, 800, 600, 800, 600, 600, 800, 800];
    const ctx = document.getElementById('barChart').getContext('2d');

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [
                {
                    label: "입고",
                    data: incomingData,
                    backgroundColor: "#CCCACA",
                    borderColor: "#CCCACA",
                    borderWidth: 1
                },
                {
                    label: "출고",
                    data: salesData,
                    backgroundColor: "#FFC000",
                    borderColor: "#FFC000",
                    borderWidth: 1
                }
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                title: {
                    display: true,
                    text: '월별 입출고 현황',
                    font: {
                        size: 18,
                        weight: 'bold',
                        family: 'Arial',
                    },
                    color: '#333',
                    padding: {
                        top: 10,
                        bottom: 10
                    },
                    align: 'start',
                },
                legend: {
                    position: 'bottom',
                    labels: {
                        usePointStyle: true,
                        pointStyle: 'rect'
                    }
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    min: 0,
                    max: 1000,
                    ticks: {
                        stepSize: 200
                    },
                },
                x: {
                    grid: {
                        display: false
                    }
                }
            }
        }
    });
</script>




</body>
</html>
