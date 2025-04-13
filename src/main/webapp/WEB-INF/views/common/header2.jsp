<%@ page import="com.kh.project.cse.boot.domain.vo.Member" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>

    <!-- JavaScript -->
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

    <!-- CSS -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
    <!-- Default theme -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
    <!-- Semantic UI theme -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
    <!-- Bootstrap theme -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"/>


    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- default css -->


    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>

      /* default css */
      html, body, div, p, span, strong, b, em, iframe, pre,
      h1, h2, h3, h4, h5, h6,
      img, dl, dt, dd,
      fieldset, form, legend, label,
      table, caption, thead, tbody, tfoot, tr, th, td,
      ul, ol, li, a, input, select, textarea {margin: 0;padding: 0; border: 0 none; }

      /*body {font-family: MalgunGothic, '맑은 고딕','돋움', Dotum, AppleGothic, Sans-serif, Arial; font-size: 12px; line-height: 1;color: #333;}*/

      ul, ol, li {list-style: none;}
      em, address {font-style: normal;}
      img {border: 0 none; font-size: 0;line-height: 0;}
      sup {position: relative;top: 2px;font-size: 11px;line-height: 100%;}

      table {border-collapse: collapse; border-spacing:0; }
      caption {overflow: hidden;width: 0;height: 0;font-size: 0; line-height: 0;}
      th, td { vertical-align: middle;/* white-space: nowrap */}

      a {color: #333; text-decoration: none;}
      a:hover, a:focus, a:active {text-decoration: underline;}
      a:visited {color: #333;}
      *, html {box-sizing: border-box; -webkit-box-sizing: border-box; -moz-box-sizing: border-box; }
      *, *:before, *:after {box-sizing: border-box;-webkit-box-sizing: border-box; -moz-box-sizing: border-box;}
      /* default css */
      div{box-sizing: border-box}
      body{
        font-family: MalgunGothic, '맑은 고딕','돋움', Dotum, AppleGothic, Sans-serif, Arial;
        color: #333;
        width: 100%;
        height: 100%;
        /*min-width: 1440px;*/
        /*min-height: 810px;*/

        min-width: 1920px;
        min-height: 953px;

        max-width: 1920px;
        /*max-height: 1080px;*/
        max-height: 953px;
        display: flex;
        /*border: purple solid 5px;*/
      }
      #outer{

      }
      nav{
        width: 100%;
        height: 100%;

        min-width: 250px;
        min-height: 800px;

        max-width: 250px;
        max-height: 1080px;

        padding-right: 40px;
        background-color: #477154;
        /*border: red solid 1px;*/
        color: white;
      }
      nav ul{
        list-style-type: none;
      }
      nav ul>li{

      }
      nav ul>li a{
        text-decoration: none;
        color: white;
      }
      nav ul>li a:visited{
        color: white;
      }
      nav ul>li a:hover{
        text-decoration: none;
        color: white;
      }


      #pos{
        width: 100%;
        height: 5%;
        /*border: blue solid 1px;*/
        display: flex;
        padding-left: 10px;
        align-items: center
      }
      #logo{
        margin-left: 20px;
        width: 100%;
        height: 20%;
        /*border: orange solid 1px;*/
        display: flex;
        justify-content: center;
        align-items: center;
      }
      #logo img{
        /*width: 50%;*/
        /*height: 80%;*/
      }
      #mypage{
        margin-left: 20px;
        width: 100%;
        height: 10%;
        /*border: green solid 1px;*/
        font-size: 16px;

      }
      #mypage div{
        width: 100%;
        height: 50%;
        /*border: purple solid 1px;*/
        display: flex;
        justify-content: center;
        align-items: center;
      }
      #mypage img{
        width: 50%;
      }


      #nav-menu{
        padding-top: 20px;
        font-weight: bold;
        height: 65%;
      }
      .menu-bar{
        padding-left: 30px;
        padding-bottom: 10px;
        display: flex;

        font-size: 22px;

      }
      .menu-bar a{
        text-decoration: none;
        color: white;
      }
      .menu-bar li{
        font-size: 20px;
        padding-top: 2px;
        position: relative;
        left: 20px
      }

      #logoutBtn{
        border-style: none;
        border-radius: 50px;
        font-weight: 600;
        padding: 5px 10px;
      }
    </style>
  </head>
  <body>
  <%
    // 세션에서 로그인 유저 정보 가져오기
    Member loginUser = (Member) session.getAttribute("loginMember");
  %>
  <div id="outer">
    <nav>
      <div id="pos">
        <%--  지점사이드바 기준 id="pos"에 height 5%부여해서 여기도 남겨야 본사/지점간의 ui차이가 없어짐  --%>
      </div>
      <div id="logo">
        <a href="dashboard"><img src="/resources/menubar_icons/로고.png"></a>
      </div>
      <div id="mypage">
        <div>
          <p><%=loginUser.getStoreName()%></p>
        </div>
        <div>
          <button type="button" id="logoutBtn" onclick="location.href='/logout.me'">로그아웃</button>
<%--          <img src="/resources/menubar_icons/개인정보수정.png">--%>
<%--          <img src="/resources/menubar_icons/로그아웃.png">--%>
        </div>
      </div>
      <div id="nav-menu">
        <div class="menu-bar" id="menu-1">
          <a href="head_order">발주관리</a>
        </div>
        <div class="menu-bar" id="menu-2">
          <a href="head_announcement">공지사항</a>
        </div>
        <div class="menu-bar" id="menu-3">
          <a href="head_product">상품관리</a>
        </div>
        <div class="menu-bar" id="menu-4">
          <div>
            직원관리
            <div>
              <ul>
                <li><a href="head_store"><img src="/resources/menubar_icons/근태관리 아이콘.png"> 지점관리</a></li>
                <li><a href="head_member"><img src="/resources/menubar_icons/직원정보 아이콘.png"> 인사관리</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </nav>

  </div>
  </body>
</html>
