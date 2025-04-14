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

    <!-- Open Sans -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap" rel="stylesheet">


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
        padding-top: 20px;
        padding-left: 10px;
        align-items: center
      }
      #pos > a{
        width: 60%;
        text-decoration: none;
      }
      #btn-pos{
        width: 100%;
        font-size: 15px
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

      /* myinfo */
      #myinfo,#logout{
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: #477154;
        border: none;
      }
      #myinfo img,#logout img{
        width: 100%;
        height: 70%;
      }
      /* modal */
      #editInfo_modal-dialog {
        display: flex;
        height: 90vh;
        width: 100%;
        flex-direction: row;
        max-width: 24%;
        max-height: 90vh;
      }
      #editInfo_modal-header,#editInfo_modal-footer{
        background-color: #D9D9D9;
      }
      #editInfo_modal-dialog {
        position: absolute;
        transform: translateX(20%);
        left: 60%;
      }
      /* modal-header */
      #editInfo_header-title{
        display: flex;
        width: 100%;
        margin: auto;
        justify-content: center;
        align-items: flex-start;
      }
      #editInfo_header-name{
        display: flex;
        width: 100%;
      }
      #btn-close-modal{
        display: flex;
        justify-content: flex-start;
        align-items: flex-start;
      }
      #editInfo_header-name p{
        display: flex;
        width: 100%;
        font-size: 40px;
        font-weight: bold;
        align-items: center;
        justify-content: center;
      }
      #editInfo_x_img{
        width: 15px;
        height: 17px;
      }
      #editInfo_modal-header{
        padding-left: 10%;
        height: 12%;
      }
      /* //modal-header */

      /* modal-body */
      #editInfo_modal-body{

        width: 100%;
        height: 60%;
        padding-left: 10%;
        padding-right: 10%;
      }
      #editInfo_modal-content {
        display: flex;
        flex-direction: column;
        gap: 4px;
        width: 100%;
      }

      #editInfo_modal-content strong {
        font-size: 18px;
        margin-bottom: 5px;
        margin-top: 10px;
      }

      #editInfo_modal-content input {
        padding: 8px 12px;
        font-size: 18px;
        border: 1px solid #ccc;
        border-radius: 5px;
        outline: none;
        text-align: center;
        display: flex;
        width: 100%;
        max-height: 200px;
        margin-bottom: 10px;
      }



      #editInfo_modal-content input[readonly] {
        background-color: #f8f8f8;
        color: #777;
        border: 1px solid #ddd;
      }
      /* //modal-body */

      #editInfo_modal-footer{
        display: flex;
        height: 8%;
        padding-left: 10%;
        padding-right: 10%;
        align-items: center;
        justify-content: center;
      }

      .gray-long-btn {
        width: 100%;
        height: 100%;
        font-size: 20px;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        margin-top: 0;
      }
      #btn-close-modal{
        border : none;
        background: none;
      }
      .modal-content{
        height: 80vh;
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
        <a href="pos_go"><button class="white-btn-round 연동" id="btn-pos">POS</button></a>
      </div>
      <div id="logo">
        <a href="spot_dashboard"><img src="/resources/menubar_icons/로고.png"></a>
      </div>
      <div id="mypage">
        <div>
          <p><%=loginUser.getStoreName()%> / <%=loginUser.getMemberName()%></p>
        </div>
        <div>
          <button id="myinfo" data-bs-toggle="modal" data-bs-target="#staticHeader">
            <img src="/resources/menubar_icons/개인정보수정.png">
          </button>
          <button id="logout"><img onclick="location.href='/logout.me'" src="/resources/menubar_icons/로그아웃.png"></button>
        </div>
      </div>
      <div id="nav-menu">
        <div class="menu-bar" id="menu-1">
          <a href="spot_notice">공지사항</a>
        </div>
        <div class="menu-bar" id="menu-2">
          <div>
            직원관리
            <div>
              <ul>
                <li><a href="spot_member"><img src="/resources/menubar_icons/직원정보 아이콘.png"> 직원정보</a></li>
                <li><a href="spot_attendance"><img src="/resources/menubar_icons/근태관리 아이콘.png"> 근태관리</a></li>
              </ul>
            </div>
          </div>
        </div>
        <div class="menu-bar" id="menu-3">
          <div>
            재고관리
            <div>
              <ul>
                <li><a href="spot_dashboard"><img src="/resources/menubar_icons/대시보드 아이콘.png"> 대시보드</a></li>
                <li><a href="spot_order"><img src="/resources/menubar_icons/발주 아이콘.png"> 발주</a></li>
                <li><a href="spot_input"><img src="/resources/menubar_icons/입고 아이콘.png"> 입고</a></li>
                <li><a href="spot_output"><img src="/resources/menubar_icons/출고 아이콘.png"> 출고</a></li>
                <li><a href="spot_expiration"><img src="/resources/menubar_icons/유통기한 아이콘.png"> 유통기한 관리</a></li>
                <li><a href="spot_inventory"><img src="/resources/menubar_icons/재고 아이콘.png"> 재고</a></li>
                <li><a href="spot_salesYear"><img src="/resources/menubar_icons/매출집계 아이콘.png"> 매출 집계</a></li>
                <%--              <li><a>폐기 상품</a></li>--%>
                <li><a href="spot_product"><img src="/resources/menubar_icons/전체 상품목록.png"> 전체 상품 목록</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </nav>

    <!--start point-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

    <!-- Modal -->
    <div class="modal fade" id="editInfo" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
      <div class="modal-dialog" id="editInfo_modal-dialog">
        <div class="modal-content">
          <div class="modal-header" id="editInfo_modal-header">
            <div id="editInfo_header-title">
              <div id="editInfo_header-name">
                <p class="modal-title fs-5">개인 정보 수정</p>
              </div>
              <div id="header-close-btn">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="btn-close-modal">
                  <img src="/resources/common/공통_Icon.png" id="editInfo_x_img">
                </button>
              </div>
            </div>
          </div>

          <div class="modal-body" id="editInfo_modal-body">
            <div id="editInfo_modal-content">
              <form action="updateMemberInfo" method="post">
                <div>
                  <strong>이름</strong>
                  <input type="text" name="memberName" readonly value="<%= loginUser != null ? loginUser.getMemberName() : "" %>">
                </div>

                <div>
                  <strong>휴대폰</strong>
                  <input type="text" name="phone" value="<%= loginUser != null ? loginUser.getPhone() : "" %>">
                </div>

                <div>
                  <strong>주민번호</strong>
                  <input type="text" readonly value="<%= loginUser != null ? loginUser.getResidentNo() : "" %>">
                </div>

                <div>
                  <strong>아이디</strong>
                  <input type="text" readonly value="<%= loginUser != null ? loginUser.getMemberId() : "" %>">
                </div>

                <div>
                  <strong>현재 비밀번호</strong>
                  <input type="password" name="currentPwd" placeholder="현재 비밀번호" required>
                </div>

                <div>
                  <strong>새 비밀번호</strong>
                  <input type="password" name="newPwd" placeholder="새 비밀번호">
                </div>

                <input type="hidden" name="memberNo" value="<%= loginUser != null ? loginUser.getMemberNo() : "" %>">
              </form>
            </div>
          </div>
          <div class="modal-footer" id="editInfo_modal-footer">
            <button type="submit" class="gray-long-btn" id="submit_info">개인정보 수정</button>
          </div>



        </div>
      </div>
    </div>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const modal = new bootstrap.Modal(document.getElementById("editInfo"));
        document.getElementById("myinfo").addEventListener("click", function (event) {
                event.stopPropagation();
                modal.show();
            });
        document.getElementById("btn-close-modal").addEventListener("click", function () {
          modal.hide();
        });
      });
      document.getElementById("submit_info").addEventListener("click", function () {
        document.querySelector("#editInfo_modal-content form").submit();
      });
    </script>
    <!--end point-->
  </div>
  </body>
</html>
