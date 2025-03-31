<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>DashBoard</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>

        #wrap{
            width: 100%;
            height: 100%;
            padding: 40px;
            display: flex;
            justify-content: center;
            align-content: center;
            border: fuchsia solid 2px;
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
            border-bottom: #3C3C3C solid 2px;
        }
        #alarm-text{
            width: 100%;
            height: 70%;
            display: flex;
            justify-content: space-around;
            align-items: center;
            font-weight: bold;
        }

        #dash-dispose{
            width: 100%;
            height: 50%;

            margin: 5px;
            margin-top: 10px;
            padding: 5px;

            border: #CCCACA solid 2px;
            border-radius: 4px;
            background: #477154;
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

                        </div>
                    </div>
                    <div class="product-box" id="product-top-worst">
                        <div class="product-title" id="worst-title">
                            <p>WORST TOP 3</p>
                        </div>
                        <div class="product-content" id="worst-content">

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
                                <p>부족한 재고가 있습니다.</p>
                                <p>확인부탁드립니다.</p>
                            </div>
                            <div>
                                <button>재고관리이동 -></button>
                            </div>
                        </div>
                    </div>
                    <div id="dash-announcement">

                    </div>
                </div>
                <div id="dash-dispose">

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
                    }
                }
            }
        }
    });
</script>




</body>
</html>
