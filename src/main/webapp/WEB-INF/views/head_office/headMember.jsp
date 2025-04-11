<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>본사 인사관리</title>
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
    --------------------------------------
    모달창
     */

      .modal-header {
        background-color: #d9d9d9;
        font-size: 25px;
        font-weight: bold;
        width: 100%;
      }

      .modal-footer {
        background-color: #d9d9d9;
        display: flex;
        justify-content: center !important;
        align-items: center;
      }

      .modal-body {
        display: flex;
        justify-content: center;
        align-items: center;
      }

      #modal-top-name {
        display: flex;
        justify-content: center;
        align-items: center;
        padding-left: 20px;
        width: 90%;
      }

      #modal-top-close {
        width: 10%;
      }
      #x_img {
        width: 15px;
        height: 17px;
      }

      #btn-close-modal {
        border: none;
        background: none;
      }

      #member-detail-table {
        width: 100%;
        font-size: 15px;
        font-weight: bold;
        border-collapse: separate;
        border-spacing: 5px 10px;
      }
      #member-detail-table tr {
        width: 100%;
      }
      #member-detail-table tr td:nth-child(1) {
        width: 25%;
        padding-right: 10px;
      }
      #member-detail-table tr td:nth-child(2) {
        width: 60%;
        padding-left: 10px;
        border-left: black solid 2px;
      }
      #member-detail-table tr td > input {
        width: 100%;
      }
    </style>
  </head>
  <body >
    <jsp:include page="../common/header2.jsp" />

    <c:if test="${not empty alertMsg}">
      <script>
        alert("${alertMsg}");
      </script>
      <c:remove var="alertMsg" scope="session"/>
    </c:if>
    <div id="form">
      <div id="form-top">
        <div id="form_name">인사관리</div>
      </div>

      <div id="top-manu">
        <div id="top_serch">
          <form action="searchMember" method="post">
            <select class="search-input-gray" name="condition">
              <option value="storeName" ${condition == 'storeName' ? 'selected' : ''}>지점명</option>
              <option value="position" ${condition == 'position' ? 'selected' : ''}>직급</option>
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
            <col style="width: 10%" />
            <col style="width: 10%" />
            <col style="width: 10%" />
            <col style="width: 10%" />
            <col style="width: 10%" />
            <col style="width: 10%" />
            <col style="width: 10%" />
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
            <c:forEach var="m" items="${list}">
              <tr>
                <td>${m.storeNo}</td>
                <td>${m.storeName}</td>
                <c:choose>
                  <c:when test="${m.position eq '1'}"><td>본사</td></c:when>
                  <c:when test="${m.position eq '2'}"><td>지점장</td></c:when>
                  <c:when test="${m.position eq '3'}"><td>매니저</td></c:when>
                  <c:when test="${m.position eq '4'}"><td>알바</td></c:when>
                  <c:otherwise><td>미지정</td></c:otherwise>
                </c:choose>
                <td>${m.memberNo}</td>
                <td>${m.memberName}</td>
                <td>${m.phone}</td>
                <td>${m.status}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
      <div id="footer">
        <div id="main-pageing">

          <c:if test="${pi.startPage > 1}">
            <a href="searchMember?cpage=${pi.startPage - 1}&condition=${param.condition}&keyword=${param.keyword}">
                <img src="/resources/common/공통_페이징바화살표.png" alt="이전">
            </a>
        </c:if>

        <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}" step="1">


            <button type="button"
                    class="btn btn-outline-secondary
                     <c:if test='${pi.currentPage == i}'>active</c:if>"
                    onclick="location.href='searchMember?cpage=${i}&condition=${param.condition}&keyword=${param.keyword}'">
                    ${i}
            </button>
        </c:forEach>

        <c:if test="${pi.endPage < pi.maxPage}">
            <a href="searchMember?cpage=${pi.startPage + 1}&condition=${param.condition}&keyword=${param.keyword}">
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
        <div class="modal-dialog modal-sm modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <div id="modal-top-name">
                <p>회원정보</p>
              </div>
              <div id="modal-top-close">
                <button
                  type="button"
                  class="btn-close"
                  data-bs-dismiss="modal"
                  aria-label="Close"
                  id="btn-close-modal"
                >
                  <img src="/resources/common/공통_Icon.png" id="x_img" />
                </button>
              </div>
            </div>
            <div class="modal-body">
              <form action="updateHeadMember" method="post" id="updateform">
                <table id="member-detail-table">
                  <input type="hidden" name="memberNo" id="modal-memmberNo">
                  <tr>
                    <td>재직상황</td>
                    <td>
                      <select name="status" id="modal-status">
                        <option value="Y">Y</option>
                        <option value="N">N</option>
                      </select>
                    </td>
                  </tr>
          
                  <tr>
                    <td>직급</td>
                    <td>
                      <input
                        type="text"
                        readonly
                        id="modal-position"
                        name="position"
                      />
                    </td>
                  </tr>
                  <tr>
                    <td>지점명</td>
                    <td>
                      <input type="text" readonly id="modal-storeName" />
                    </td>
                  </tr>
                  <tr>
                    <td>이름</td>
                    <td>
                      <input type="text" readonly id="modal-memberName" />
                    </td>
                  </tr>
                  <tr>
                    <td>휴대폰</td>
                    <td>
                      <input
                        type="number"
                        placeholder="010-1111-2222"
                        readonly
                        id="modal-phone"
                      />
                    </td>
                  </tr>
                </table>
              </form>
            </div>
            <div class="modal-footer">
              <input class="black-btn" type="submit" value="수정완료" form="updateform"/>
            </div>
          </div>
        </div>
      </div>
      <script>

        document.addEventListener('DOMContentLoaded', function () {
          const rows = document.querySelectorAll('#table1 tbody tr');
   
          rows.forEach((row) => {
            
            row.classList.add('table-row');
            
            
            row.addEventListener('click', function () {
              const storeNo = this.children[0].textContent;
              const storeName = this.children[1].textContent;
              const position = this.children[2].textContent; 
              const memberNo = this.children[3].textContent;
              const memberName = this.children[4].textContent;
              const phone = this.children[5].textContent;
              const status = this.children[6].textContent;


           

              let sel = document.getElementById('modal-status').options;
              for (var i = 0; i < sel.length; i++) {
                if (sel[i].label == status) {
                  console.log(sel[i].label);
                  sel[i].selected = true;
                }
              }
              document.getElementById('modal-memmberNo').value = memberNo;
              document.getElementById('modal-position').value = position;
              document.getElementById('modal-storeName').value = storeName;
              document.getElementById('modal-memberName').value = memberName;
              document.getElementById('modal-phone').value = phone;

              const modal = new bootstrap.Modal(
                document.getElementById('staticBackdrop')
              );
              modal.show();
            });
          });
        });
      </script>
      <!--end point-->
    </div>
  </body>
</html>
