<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <html>

    <head>
        <title>Title</title>

        <!-- JavaScript -->
        <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

        <!-- CSS -->
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
        <!-- Default theme -->
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css" />
        <!-- Semantic UI theme -->
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />
        <!-- Bootstrap theme -->
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css" />

        <!-- Open Sans -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap"
            rel="stylesheet">


        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <style>
            /* default css */
            * {
                margin: 0;
                padding: 0;
                border: 0 none;
                font-family: MalgunGothic, '맑은 고딕', '돋움', Dotum, AppleGothic, Sans-serif, Arial;
                font-weight: 600;
                box-sizing: border-box;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
            }

            /* {font-family: MalgunGothic, '맑은 고딕','돋움', Dotum, AppleGothic, Sans-serif, Arial; font-size: 12px; line-height: 1;color: #333;}*/
            *:before,
            *:after {
                box-sizing: border-box;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
            }

            ul,
            ol,
            li {
                list-style: none;
            }

            em,
            address {
                font-style: normal;
            }

            img {
                border: 0 none;
                font-size: 0;
                line-height: 0;
            }

            sup {
                position: relative;
                top: 2px;
                font-size: 11px;
                line-height: 100%;
            }

            table {
                border-collapse: collapse;
                border-spacing: 0;
            }

            caption {
                overflow: hidden;
                width: 0;
                height: 0;
                font-size: 0;
                line-height: 0;
            }

            th,
            td {
                vertical-align: middle;
                /* white-space: nowrap */
            }

            a {
                color: #333;
                text-decoration: none;
            }

            a:hover,
            a:focus,
            a:active {
                text-decoration: underline;
            }

            a:visited {
                color: #333;
            }

            /* default css */
            div {
                box-sizing: border-box
            }

            body {
                color: #333;
            
                display: grid;
                grid-template-columns: 20% 80%;
            }

            nav {
                width: 100%;
                height: 100%;
                background-color: #477154;
                color: white;
            }

            nav ul>li a {
                color: white;
            }

            nav ul>li a:visited {
                color: white;
            }

            nav ul>li a:hover {
                text-decoration: none;
            }

            .outer *{
                width: 100%;
                display: grid;
                font-size: 1em;
            }
            .outer>div{
                padding: 2%;
            }
            #pos img{
                width: 30%;
            }
            #logo,#mypage-1,#mypage-2{
                display: flex;
                justify-content: center;
            }
            #logo a{
                width: 50%;
            }
            #mypage-2 {
                padding: 0 6%;
                grid-template-columns: repeat(2, 1fr);
                gap: 2%;
            }
            #mypage-2>button {
                border-radius: 1em;
                font-size: 0.8em;
                padding: 1% 0;
            }
            #menu-bar{
                padding-top: 4%;
            }
            #menu-bar >div{
                padding-left: 14%;
                padding-bottom: 2%;
            }
            #menu-bar li{
                padding-left: 18%;
            }
            #menu-bar>ul a{
                display: flex;
                align-items: center;
                padding-bottom: 1%;
                
            }
            #menu-bar img{
                width: 10%;
                margin-right: 1%;
            }
        </style>
    </head>

    <body>
        <nav class="outer">
            <div id="pos">
                <a href="pos_go"><img src="/resources/menubar_icons/포스 연동 버튼.png"></a>
            </div>
            <div id="logo">
                <a href="dashboard"><img src="/resources/menubar_icons/로고.png"></a>
            </div>
            <div id="mypage-1">OO지점 사장님</div>
            <div id="mypage-2">
                <button>개인정보수정</button>
                <button>로그아웃</button>
                <!-- <img src="/resources/menubar_icons/개인정보수정.png"> -->
                <!-- <img src="/resources/menubar_icons/로그아웃.png"> -->
            </div>
            <div id="menu-bar">
                <div><a>공지사항</a></div>
                <div>
                    직원관리
                </div>
                <ul>
                    <li><a><img src="/resources/menubar_icons/직원정보 아이콘.png"> 직원정보</a></li>
                    <li><a><img src="/resources/menubar_icons/근태관리 아이콘.png"> 근태관리</a></li>
                </ul>
                <div>재고관리</div>
                <ul>
                    <li><a href="https://naver.com"><img src="/resources/menubar_icons/대시보드 아이콘.png">
                            대시보드</a></li>
                    <li><a><img src="/resources/menubar_icons/발주 아이콘.png"> 발주</a></li>
                    <li><a><img src="/resources/menubar_icons/입고 아이콘.png"> 입고</a></li>
                    <li><a><img src="/resources/menubar_icons/출고 아이콘.png"> 출고</a></li>
                    <li><a><img src="/resources/menubar_icons/유통기한 아이콘.png"> 유통기한 관리</a></li>
                    <li><a><img src="/resources/menubar_icons/재고 아이콘.png"> 재고</a></li>
                    <li><a><img src="/resources/menubar_icons/매출집계 아이콘.png"> 매출 집계</a></li>
                    <!-- <li><a>폐기 상품</a></li>--%> -->
                    <li><a><img src="/resources/menubar_icons/전체 상품목록.png"> 전체 상품 목록</a></li>
                </ul>
            </div>
        </nav>
    </body>
    <script>
        const screenWidth = window.innerWidth;
        const screenHeight = window.innerHeight;
        const bo = document.body;
        bo.style.width = screenWidth + 'px';
        bo.style.height = screenHeight + 'px';
        bo.style.fontSize = screenWidth * 0.0126 + 'px';
    </script>

    </html>