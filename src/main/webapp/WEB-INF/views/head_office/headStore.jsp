<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>본사 지점관리</title>
    <link rel="stylesheet" href="/resources/css/btn.css" />
    <style>
      #form {
        width: 100%;
        padding: 30px;
      }
      #form-top {
        display: flex;
        justify-content: space-between;
        align-items: end;
      }
      #form_name {
        font-size: 40px;
        font-weight: bold;
        padding: 10px;
      }
      #form-top-btn {
        padding-bottom: 10px;
      }
      #top-manu {
        border-top: 3px solid black;
        height: 8%;
        background-color: #d9d9d9;
        display: flex;
        justify-content: right;
        align-items: center;
      }

      #top_serch {
        display: flex;
        justify-content: right;
        padding-right: 61px;
        width: 35%;
      }
      .search-input-gray {
        width: 100px;
        font-size: 16px;
        padding: 0;
        text-align: center;
      }

      #search-filed {
        width: 300px;
        text-align: left;
        padding-left: 10px;
      }

      #table-manu {
        height: 75%;
        width: 100%;
        border-top: 3px solid black;
      }
      #table1 {
        width: 100%;
        text-align: center;
        table-layout: auto;
      }
      #table1 thead {
        height: 60px;
        font-size: 22px;
        background-color: #d9d9d9;
        border-bottom: 3px solid #939393;
      }
      #table1 tbody tr {
        border-bottom: 3px solid #939393;
        font-size: 16px;
        height: 60px;
      }
      #footer {
        border-top: 2px solid #939393;
        background-color: #d9d9d9;
        height: 8%;
        border-bottom: 3px solid black;
        display: flex;
        justify-content: center;
        align-items: center;
      }
      #main-pageing img {
        width: 70px;
        padding: 10px;
      }
      #main-pageing img:nth-of-type(2) {
        transform: rotate(180deg);
      }

      #main-pageing button {
        border: #b4b4b4 solid 3px;
        background: white;
        color: #b4b4b4;
        font-weight: bold;
        margin: 5px;
      }
      #main-pageing button:hover {
        border: #3c3c3c solid 3px;
        color: #3c3c3c;
        font-weight: bold;
      }

      /*
        ------------------------------------------------------------------------------------------
         모달창
         */

      .modal-content {
        height: 90%;
      }

      .modal-header {
        border-bottom: 3px solid black !important;
      }

      .modal-footer {
        width: 100%;
        background-color: #d9d9d9;
        border-top: 3px solid #939393 !important;
        display: flex;
      }

      .modal-body {
        padding: 0 !important;
      }

      #btn-close-modal {
        border: none;
        background: none;
      }

      #x_img {
        width: 10px;
        height: 15px;
      }

      #staticBackdropLabel {
        font-size: 30px;
        font-weight: bold;
      }

      #modal-table {
        width: 100%;
        text-align: center;
      }

      #modal-table thead {
        height: 40px;
        background-color: #d9d9d9;
        border-bottom: 2px solid black;
      }

      #modal-table tbody tr {
        border-bottom: 3px solid #939393;
        height: 50px;
      }

      #table1 td,
      #table1 th,
      #modal-table td,
      #modal-table th {
        position: relative;
        padding: 10px;
      }

      #table1 td::after,
      #table1 th::after,
      #modal-table td::after,
      #modal-table th::after {
        content: '';
        position: absolute;
        top: 20%;
        left: 0;
        width: 2px;
        height: 60%;
        /*background-color: black;*/
      }

      #table1 td:first-child::after,
      #table1 th:first-child::after,
      #modal-table td:first-child::after,
      #modal-table th:first-child::after {
        content: none;
      }
      #tr td input[type='checkbox'] {
        width: 20px;
        height: 20px;
      }

      #modal-pageing {
        width: 80%;
        display: flex;
        justify-content: center;
        align-items: center;
      }

      #modal-pageing img {
        width: 70px;
        padding: 10px;
      }
      #modal-pageing img:nth-of-type(2) {
        transform: rotate(180deg);
      }

      #modal-pageing button {
        border: #b4b4b4 solid 3px;
        background: white;
        color: #b4b4b4;
        font-weight: bold;
        margin: 5px;
      }
      #modal-pageing button:hover {
        border: #3c3c3c solid 3px;
        color: #3c3c3c;
        font-weight: bold;
      }
      #mobal-footer-btn {
        width: 10%;
        display: flex;
        justify-content: space-around;
        gap: 5px;
      }
      #modal-table tbody tr td input[type='checkbox'] {
        width: 20px;
        height: 20px;
      }

    </style>
  </head>
  <body>
    <jsp:include page="../common/header2.jsp" />
    <div id="form">
      <div id="form-top">
        <div id="form_name">지점 관리</div>
        <div id="form-top-btn">
          <button
            class="black-btn"
            id="insertstore"
            data-bs-toggle="modal"
            data-bs-target="#staticBackdrop"
            onclick="drawTableList(1)"
          >
            승인목록
          </button>
        </div>
      </div>

      <div id="top-manu">
        <div id="top_serch">
          <form action="searchStore" method="post">
            <select
              class="search-input-gray"
              id="search-select"
              name="condition"
            >
              <option value="storeNo" ${condition == 'storeNo' ? 'selected' : ''}>지점번호</option>
              <option value="storeName" ${condition == 'storeName' ? 'selected' : ''}>지점명</option>
              <option value="memberName" ${condition == 'memberName' ? 'selected' : ''}>직원이름</option>
            </select>
            <input
              class="search-input-gray"
              id="search-filed"
              type="text"
              name="keyword"
            />
            <input
              class="search-input-submit-gray"
              type="submit"
              value="검색"
            />
          </form>
        </div>
      </div>
      <div id="table-manu">
        <table id="table1">
          <colgroup>
            <col style="width: 5%" />
            <col style="width: 20%" />
            <col style="width: 10%" />
            <col style="width: 10%" />
          </colgroup>
          <thead>
            <tr>
              <th>지점번호</th>
              <th>지점명</th>
              <th>지점장</th>
              <th>지점 창업일</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="s" items="${list}">
              <tr>
                <td>${s.storeNo}</td>
                <td>${s.storeName}</td>
                <td>${s.memberName}</td>
                <td>${s.storeDate}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
      <div id="footer">
        <div id="main-pageing">


        <c:if test="${pi.startPage > 1}">
            <a href="searchStore?cpage=${pi.endPage - 1}&&condition=${condition}&keyword=${keyword}">
                <img src="/resources/common/공통_페이징바화살표.png" alt="이전">
            </a>
        </c:if>

        <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}" step="1">


            <button type="button"
                    class="btn btn-outline-secondary
                     <c:if test='${pi.currentPage == i}'>active</c:if>"
                    onclick="location.href='searchStore?cpage=${i}&condition=${param.condition}&keyword=${param.keyword}'">
                    ${i}
            </button>
        </c:forEach>

        <c:if test="${pi.endPage < pi.maxPage}">
            <a href="searchStore?cpage=${pi.endPage + 1}&&condition=${condition}&keyword=${keyword}">
                <img src="/resources/common/공통_페이징바화살표.png" alt="다음">
            </a>
        </c:if>
        </div>
      </div>

      <!--start point-->
      <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"
      ></script>

      <!-- Modal -->
      <div
        class="modal fade"
        id="staticBackdrop"
        data-bs-backdrop="static"
        data-bs-keyboard="false"
        tabindex="-1"
        aria-labelledby="staticBackdropLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog modal-xl">
          <div class="modal-content">
            <div id="modal-head">
              <div class="modal-header">
                <p class="modal-title fs-5" id="staticBackdropLabel">
                  승인 목록
                </p>
                <button
                  type="button"
                  class="btn-close"
                  data-bs-dismiss="modal"
                  aria-label="Close"
                  id="btn-close-modal"
                  onclick="drawTableList()"
                >
                  <img src="/resources/common/공통_Icon.png" id="x_img" />
                </button>
              </div>

            </div>
            <div class="modal-body">
              <!--모달 내용-->
              

             
              <table id="modal-table">
                <colgroup>
                  <col style="width: 20%" />
                  <col style="width: 20%" />
                  <col style="width: 30%" />
                  <col style="width: 10%" />
                  <col style="width: 10%" />
                </colgroup>
                <thead>
                  <tr>
                    <th>지점번호</th>
                    <th>지점명</th>
                    <th>지점장</th>
                    <th>요청날짜</th>
                    <th>확인</th>
                    <th style="display: none;">test</th>
                  </tr>
                </thead>
                <tbody id="modal-tbody">
                </tbody>
              </table>
            </div>
            <div class="modal-footer">
              <div id="mobal-footer-btn">
                <button class="yes-btn" onclick="checkedYes()">승인</button>
                <button class="no-btn" onclick="checkedNo()">거절</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script>
      function selectStoreStatus(page,callback) {
        $.ajax({
          url: '/api/store/selectStoreStatus',
          method: 'get',
          data: {
            cpage: page,
          },
          success: function (res) {
            console.log('모달 통신성공');
            callback(res);
          },
          error: function () {
            console.log('통신실패');
          },
        });
      }

      function drawTableList(page = 1) {
        const contentBody = document.querySelector('#modal-table tbody');
        contentBody.innerHTML = '';
    
        selectStoreStatus(page, function (res) {
            const storeList = res.list;
            const pi = res.pi;

            
      // 테이블 채우기
      for (const store of storeList) {
        
        const storeTr = document.createElement('tr');
        
        contentBody.appendChild(storeTr);

        const storeNoTd = document.createElement('td');
        storeNoTd.setAttribute("name", "storeNo");
        storeNoTd.innerText = store.storeNo;
        storeTr.appendChild(storeNoTd);

        const storeNameTd = document.createElement('td');
        storeNameTd.innerText = store.storeName;
        storeTr.appendChild(storeNameTd);

        const memberNameTd = document.createElement('td');
        memberNameTd.innerText = store.memberName;
        storeTr.appendChild(memberNameTd);

        const storeDateTd = document.createElement('td');
        storeDateTd.innerText = store.storeDate;
        storeTr.appendChild(storeDateTd);

        const storeStatustd = document.createElement('td');
        if(store.storeStatus == 1){
            storeStatustd.innerHTML = "<input type='checkbox' checked></input>";
        }else{
            storeStatustd.innerHTML = "<input type='checkbox'></input>";
        }
        storeTr.appendChild(storeStatustd);

        const memberNoTd = document.createElement('input');
        memberNoTd.innerText = store.memberNo;
        storeTr.appendChild(memberNoTd);
        memberNoTd.type = "hidden";
        

        
      }

      // 동적 페이징 생성
      const pagingDiv = document.querySelector('#modal-pageing');
      pagingDiv.innerHTML = ''; // 기존 버튼 제거

      const leftArrow = document.createElement('img');
      leftArrow.src = '/resources/common/공통_페이징바화살표.png';
      pagingDiv.appendChild(leftArrow);

      for (let i = pi.startPage; i <= pi.endPage; i++) {
        const pageBtn = document.createElement('button');
        pageBtn.className = 'btn btn-outline-secondary';
        pageBtn.type = 'button';
        pageBtn.innerText = i;
        pageBtn.onclick = function () {
          drawTableList(i);
        };
        pagingDiv.appendChild(pageBtn);
      }

      const rightArrow = document.createElement('img');
      rightArrow.src = '/resources/common/공통_페이징바화살표.png';
      pagingDiv.appendChild(rightArrow);
    });
  }

  function checkedYes(){

  var storeNoList = "";
  var checkbox1 = $("input[type='checkbox']:checked");
  checkbox1.each(function(i){

    var tr = checkbox1.parent().parent().eq(i);
    var td = tr.children();

    var storeNumber = td.eq(0).text(); 
    storeNoList += storeNumber+"/";


  });

  storeNoList = storeNoList.substring(0,storeNoList.length-1);
  
  $.ajax({
          url: '/api/store/updateStoreStatus',
          method: 'post',
          data: {
            storeNo : storeNoList,
          },
          success: function (res) {
            console.log('모달 통신성공');
            alert(res);
            location.reload();
            $('#staticBackdrop').modal('hide');
          },
          error: function () {
            console.log('통신실패');
            alert(res);
            location.reload();
            $('#staticBackdrop').modal('hide');
          },
        });
}
function checkedNo(){

var memberNoList = "";
var storeNoList = "";
var checkbox1 = $("input[type='checkbox']:checked");
checkbox1.each(function(i){

        var tr = checkbox1.parent().parent().eq(i);
        var td = tr.children();

        var storeNumber = td.eq(0).text(); 
        storeNoList += storeNumber+"/";

        var memberNoes = td.eq(5).text(); 
        memberNoList += memberNoes+"/";

    
    });
    memberNoList = memberNoList.substring(0,memberNoList.length-1);
    storeNoList = storeNoList.substring(0,storeNoList.length-1);

    $.ajax({
            url: '/api/store/deleteStoreStatus',
            method: 'post',
            data: {
            memberNo : memberNoList,
            storeNo : storeNoList
          },
            success: function (res) {
            console.log('모달 통신성공');
            alert(res);
            location.reload();
            $('#staticBackdrop').modal('hide');
            },
            error: function () {
            console.log('통신실패');
            alert(res);
            location.reload();
            $('#staticBackdrop').modal('hide');
            },
        });
    }

</script>

  </body>
</html>
