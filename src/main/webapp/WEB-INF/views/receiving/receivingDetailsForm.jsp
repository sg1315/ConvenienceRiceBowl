<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>receivingDetailsForm</title>
    <style>
        body{
            width: 100%;
            height: 100vh;
        }
        #waper{
            display: grid;
            grid-template-columns: max-content auto;
        }
        #top-menu{
            display: grid;
            grid-template-columns: 50% 50%;
        }
    </style>
</head>

<body>
    
    <div class="waper" id="waper">
        <jsp:include page="../common/header.jsp"/>
        <div id="top-manu">
            <div id="top-reft">
                <div id="top-reft1">
                    <img src="../../../resources/menu_icons/입고 아이콘.png" alt="입고아이콘">
                    <p class="main_name">입고</p>
                </div>
            </div>
            <div id="top-right1">
                <input type="text"> <input type="submit" value="검색">
                <input class="search-input" type="text" placeholder="아이디 or 이름 "/>
                <input class="search-input-submit" type="submit" value="검색" />
            </div>
        </div>
    </div>
</body>

</html>