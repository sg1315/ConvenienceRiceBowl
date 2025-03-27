<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>DashBoard</title>

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
            height: 40%;
        }
        #dash-inout-table{
            width: 100%;
            height: 30%;
            padding: 30px;
        }
        #dash-inout-table table{
            width: 100%;

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
                    그래프 어떻게 그리냐
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






</body>
</html>
