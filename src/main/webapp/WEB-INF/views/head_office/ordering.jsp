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
        #top-reft{
            background-color: #D9D9D9;
            width: 70%;
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

        #top-right1{
            background-color: #D9D9D9;
            width: 30%;
            display: flex;
            justify-content: center;
            align-items: center;
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
        }
        #top-reft p {
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

        #main-btn{
            padding-top: 30px;
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

    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="waper">
    <div id="top-manu">
        <div id="top-reft">
            <div id="top-reft1">
                <img src="../resources/menu_icons/직원 아이콘.png">
                <p class="main_name">직원 정보</p>
            </div>
        </div>

        <div id="top-right1">
            <input type="text"> <input type="submit" value="검색">
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
        <div id="main-btn">
            <button><</button>
            <button>1</button>
            <button>2</button>
            <button>3</button>
            <button>4</button>
            <button>5</button>
            <button>></button>
        </div>
    </div>

</div>

</body>
</html>
