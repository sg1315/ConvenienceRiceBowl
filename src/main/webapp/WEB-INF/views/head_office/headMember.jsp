
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>본사 인사관리</title>
  <link rel="stylesheet" href="/resources/css/btn.css">
  <style>
    #form{
      width: 100%;
      padding: 30px;
    }
    #form-top{
      display: flex;
      justify-content: space-between;
      align-items: end;
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
      justify-content: right;
      align-items: center;
    }

    #top_serch{
      display: flex;
      justify-content: right;
      padding-right: 61px;
      width: 35%;
    }
    .search-input-gray{
      width: 100px;
      font-size: 16px;
      padding: 0;
      text-align: center;
    }

    #search-filed{
      width: 300px;
      text-align: left;
      padding-left: 10px;
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
      display: flex;
      justify-content: center;
    }
    #main-pageing img{
      width: 70px;
      padding: 10px;
    }
    #main-pageing img:nth-of-type(2) {
      transform: rotate(180deg);
    }

    #main-pageing button{
      border: #B4B4B4 solid 3px;
      background: white;
      color: #B4B4B4;
      font-weight: bold;
      margin: 5px;
    }
    #main-pageing button:hover{
      border: #3C3C3C solid 3px;
      color: #3C3C3C;
      font-weight: bold;
    }

    /*
    --------------------------------------
    모달창
     */

    .modal-header{
      background-color: #D9D9D9;
      font-size: 25px;
      font-weight: bold;
      width: 100%;
    }

    .modal-footer{
      background-color: #D9D9D9;
      display: flex;
      justify-content: center !important;
      align-items: center;
    }

    .modal-body{
      display: flex;
      justify-content: center;
      align-items: center;
    }

    #modal-top-name{
      display: flex;
      justify-content: center;
      align-items: center;
      padding-left: 20px;
      width: 90%;
    }

    #modal-top-close{
      width: 10%;
    }
    #x_img{
      width: 15px;
      height: 17px;
    }

    #btn-close-modal{
      border: none ;
      background: none;
    }

    #member-detail-table{
      font-size: 15px;
      font-weight: bold;
      border-collapse: separate;
      border-spacing: 5px 10px;
    }

  </style>
</head>
<body>
  <jsp:include page="../common/header2.jsp"/>
  <div id="form">
    <div id="form-top">
      <div id="form_name">
        인사관리
      </div>
    </div>

    <div id="top-manu">
      <div id="top_serch">
        <form>
          <select class="search-input-gray" name="condition">
            <option>지점명</option>
            <option>직급</option>
            <option>직원이름</option>
          </select>
          <input class="search-input-gray" id="search-filed" type="text">
          <input class="search-input-submit-gray" type="submit" value="검색">
        </form>
      </div>
    </div>
    <div id ="table-manu">
      <table id="table1">
        <colgroup>
          <col style="width: 10%;">
          <col style="width: 10%;">
          <col style="width: 10%;">
          <col style="width: 10%;">
          <col style="width: 10%;">
          <col style="width: 10%;">
          <col style="width: 10%;">
        </colgroup>
        <thead>
        <tr>
          <th>지점번호</th>
          <th>지점명</th>
          <th>직급</th>
          <th>직원번호</th>
          <th>직원이름</th>
          <th>전화번호</th>
          <th>재직</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td>1</td>
          <td>강남점</td>
          <td>지점장</td>
          <td>1</td>
          <td>아무개</td>
          <td>010-9999-8888</td>
          <td>Y</td>
        </tr>
        <tr>
          <td>1</td>
          <td>강남점</td>
          <td>알바생</td>
          <td>2</td>
          <td>이알바</td>
          <td>010-7777-8888</td>
          <td>Y</td>
        </tr>
        <tr>
          <td>1</td>
          <td>강남점</td>
          <td>매니저</td>
          <td>3</td>
          <td>이퇴사</td>
          <td>010-7777-6666</td>
          <td>N</td>
        </tr>
        </tbody>
      </table>
    </div>
    <div id="footer">
      <div id="main-pageing">
        <img src="/resources/common/공통_페이징바화살표.png">
        <button type="button" class="btn btn-outline-secondary">1</button>
        <button type="button" class="btn btn-outline-secondary">2</button>
        <button type="button" class="btn btn-outline-secondary">3</button>
        <button type="button" class="btn btn-outline-secondary">4</button>
        <button type="button" class="btn btn-outline-secondary">5</button>
        <button type="button" class="btn btn-outline-secondary">6</button>
        <button type="button" class="btn btn-outline-secondary">7</button>
        <button type="button" class="btn btn-outline-secondary">8</button>
        <button type="button" class="btn btn-outline-secondary">9</button>
        <button type="button" class="btn btn-outline-secondary">10</button>
        <img src="/resources/common/공통_페이징바화살표.png">
      </div>
    </div>

    <!--start point-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
      <div class="modal-dialog modal-sm modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <div id="modal-top-name">
              <p>회원정보</p>
            </div>
            <div id="modal-top-close">
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="btn-close-modal">
                <img src="/resources/common/공통_Icon.png" id="x_img">
              </button>
            </div>
          </div>
          <div class="modal-body">
                  <table id="member-detail-table">
                    <tr>
                      <td>
                        재직상황
                      </td>
                      <td>
                        <select>
                          <option>Y</option>
                          <option style="color: red">N</option>
                        </select>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        직급
                      </td>
                      <td style="border-left: black solid 2px; padding-left: 5px">
                        <input type="text" readonly>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        지점명
                      </td>
                      <td>
                        <input type="text" readonly>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        이름
                      </td>
                      <td>
                        <input type="text" readonly>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        휴대폰
                      </td>
                      <td>
                        <input type="number" readonly>
                      </td>
                    </tr>
                  </table>
          </div>
          <div class="modal-footer">
            <input class="black-btn" type="submit" value="수정완료">
          </div>
        </div>
      </div>
    </div>
    <script>

      // 테이블의 모든 행에 클릭 이벤트 추가
      document.querySelectorAll('#table1 tbody tr').forEach(row => {
        row.addEventListener('click', function() {
          // 모달을 띄우기 위한 코드
          var myModal = new bootstrap.Modal(document.getElementById('staticBackdrop'));
          myModal.show(); // 모달 열기
        });
      });

    </script>
    <!--end point-->

  </div>
</body>
</html>
