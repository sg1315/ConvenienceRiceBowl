
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

        </div>
    </div>
</body>
</html>
