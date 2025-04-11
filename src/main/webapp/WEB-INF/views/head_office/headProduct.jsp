<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <!-- JavaScript -->
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

    <!-- CSS -->
    <link
      rel="stylesheet"
      href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"
    />
    <!-- Default theme -->
    <link
      rel="stylesheet"
      href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"
    />
    <!-- Semantic UI theme -->
    <link
      rel="stylesheet"
      href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"
    />
    <!-- Bootstrap theme -->
    <link
      rel="stylesheet"
      href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"
    />

    <!-- Open Sans -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap"
      rel="stylesheet"
    />

    <!-- Latest compiled and minified CSS -->
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />

    <!-- jQuery library  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <title>본사 상품관리</title>
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

      #productadd{
        width: 100%;
        background: #d9d9d9;
        color: black;
      }

      #top_serch {
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
      #main-pageing img:nth-last-child(1) {
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

      .modal-content {
        height: 500px;
      }
      .modal-header {
        border: none !important;
        background-color: #d9d9d9;
        font-size: 40px;
        font-weight: bold;
      }
      #insert-product-form, #update-product-form{
        height: 100%;
        display: flex;
        justify-content: space-between;
        border: none;
      }

      #x_img {
        width: 15px;
        height: 20px;
      }
      #btn-close-modal {
        border: none;
        background: none;
      }
      #product-img {
        background-color: #d9d9d9;
        width: 48%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
      }
      #product-img img{
        width: 350px;
        height: 350px;
      }


      #product-detail-box {
        background-color: #d9d9d9;
        width: 48%;
        display: flex;
        align-items: center;
        justify-content: center;
      }
      #product-detail {
        background-color: white;
        width: 100%;
        height: 90%;
      }
      #product-detail-puts {
        height: 80%;
        display: flex;
        justify-content: center;
        align-items: center;
        
      }
      #product-detail-table tr td input {
        border: 2px solid #d9d9d9;
        border-radius: 5px;
      }
      #product-detail-ok {
        display: flex;
        justify-content: right;
        margin-top: 5px;
        margin-right: 28px;
      }
      #product-detail-table {
        border-collapse: separate;
        border-spacing: 10px 20px; /*상하 간격을 10px로 설정*/
      }
      #product-detail-table tr td {
        font-size: 20px;
        font-weight: bold;
      }
      #select-add-modal, #select-modify-modal{
        width: 100%;
        height: 30px;
        font-weight: normal;
        border: 2px solid #d9d9d9;
        border-radius: 5px;
      }



      /*
        수정하기 모달창
         */
      #modify-x_img {
        width: 15px;
        height: 20px;
      }
      #btn-close-modify-modal {
        border: none;
        background: none;
      }
      #product-modify-img {
        background-color: #d9d9d9;
        width: 48%;
        display: flex;
        justify-content: center;
        align-items: center;
      }
      #product-modify-img img{
        width: 350px;
        height: 350px;
        justify-content: center;
        align-items: center;
      }
      #product-detail-modify-box {
        background-color: #d9d9d9;
        width: 48%;
        display: flex;
        align-items: center;
        justify-content: center;
      }
      #product-detail-modify {
        background-color: white;
        width: 100%;
        height: 90%;
      }
      #product-detail-modify-puts {
        height: 80%;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 5px auto;
      }
      #product-detail-modify-table tr td{
        text-align: center;
      }

      #product-detail-modify-table tr td input {
        border: 2px solid #d9d9d9;
        border-radius: 5px;
      }

      #product-detail-modify-table tr td input[type="checkbox"] {
        width: 20px;
        height: 20px;
      }

      #product-detail-modify-btn {
        display: flex;
        justify-content: right;
        margin-right: 10px;
      }
      #product-detail-modify-btn button {
        margin-right: 18px;
      }
      #product-detail-modify-table {
        border-collapse: separate;
        border-spacing: 10px 15px; /* 상하 간격을 10px로 설정 */
      }
      #product-detail-modify-table tr td {
        font-size: 20px;
        font-weight: bold;
      }

      /*input numberType 화살표 숨기기*/
        /* Firefox 브라우저용 사용자 정의 스타일 */
      input[type="number"] {
        -moz-appearance: textfield;
      }
        /* 그 외(Chrome, Safari, Edge...)의 브라우저용 사용자 정의 스타일 */
      input::-webkit-inner-spin-button {
        -webkit-appearance: none;
      }
      input::-webkit-outer-spin-button {
        -webkit-appearance: none;
        margin: 0;
      }
      /**/

    </style>
  </head>
  <body onload="drawCategoryList()">
    <jsp:include page="../common/header2.jsp" />

        <c:if test="${not empty alertMsg}">
          <script>
            alert("${alertMsg}");
          </script>
          <c:remove var="alertMsg" scope="session"/>
        </c:if>

    <div id="form">
      <div id="form-top">
        <div id="form_name">상품 관리</div>
        <div id="form-top-btn">
          <button
            class="gray-btn-border"
            id="productadd"
            data-bs-toggle="modal"
            data-bs-target="#staticBackdrop"
          >
            상품추가
          </button>
        </div>
      </div>


        <div id="top-manu">
          <div id="top_serch">
            <form id="searchForm" method="post" action="searchProduct">
              <select class="search-input-gray" name="condition">

                <option value="productNo" ${condition == 'productNo' ? 'selected' : ''}>상품번호</option>
                <option value="categoryName" ${condition == 'categoryName' ? 'selected' : ''}>카테고리</option>
                <option value="productName" ${condition == 'productName' ? 'selected' : ''}>상품명</option>
  
              </select>
              <input class="search-input-gray" id="search-filed" type="text" name="keyword" value="${keyword}"/>
              <input class="search-input-submit-gray" type="submit" value="검색" />
            </form>
          </div>
        </div>
        <div id="table-manu">
          <table id="table1">
            <colgroup>
              <col style="width: 10%" />
              <col style="width: 10%" />
              <col style="width: 40%" />
              <col style="width: 15%" />
              <col style="width: 15%" />
            </colgroup>
            <thead>
              <tr>
                <th>상품 번호</th>
                <th>카테고리</th>
                <th style="display: none;">상품이미지</th>
                <th>상품명</th>
                <th>입고가</th>
                <th>판매가</th>
                <th style="display: none;"></th>
                <th style="display: none;"></th>
              
              </tr>
            </thead>
            <tbody>
              <c:forEach var="p" items="${list}">
                <tr>
                  <td>${p.productNo}</td>
                  <td>${p.categoryName}</td>
                  <td style="display: none;"><img width="120px" height="99.5px" src="${p.filePath}" alt="상품이미지" ></td>
                  <td>${p.productName}</td>
                  <td>${p.inputPrice}</td>
                  <td>${p.salePrice}</td>
                  <td style="display: none;">${p.shortageAmount}</td>  
                  <td style="display: none;">${p.availability}</td>         
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
        <div id="footer">
          <div id="main-pageing">

          <c:if test="${pi.startPage > 1}">
            <a href="searchProduct?cpage=${pi.startPage - 1}&condition=${param.condition}&keyword=${param.keyword}">
                <img src="/resources/common/공통_페이징바화살표.png" alt="이전">
            </a>
        </c:if>

        <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}" step="1">


            <button type="button"
                    class="btn btn-outline-secondary
                     <c:if test='${pi.currentPage == i}'>active</c:if>"
                    onclick="location.href='searchProduct?cpage=${i}&condition=${param.condition}&keyword=${param.keyword}'">
                    ${i}
            </button>
        </c:forEach>

        <c:if test="${pi.endPage < pi.maxPage}">
            <a href="searchProduct?cpage=${pi.startPage + 1}&condition=${param.condition}&keyword=${param.keyword}">
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
      <%-- 상품 추가 --%>
      <div
        class="modal fade"
        id="staticBackdrop"
        data-bs-backdrop="static"
        data-bs-keyboard="false"
        tabindex="-1"
        aria-labelledby="staticBackdropLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog modal-lg modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <p>상품 추가</p>
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
            <div class="modal-body" id="modal-body">
              <form 
                action="insertProduct.he"
                id="insert-product-form"
                method="post" enctype="multipart/form-data"
              >
                <div id="product-img">
                  <img src="/resources/common/상품_기본이미지아이콘.png" alt="상품 이미지" style="max-width: 100%; max-height: 100%;" onclick="chooseFile('#upfile')" id="addfile">
                  <input style="display: none;" type="file" id="upfile" name="upfile" onchange="loadImg(this,'#addfile')" />
                </div>
                <div id="product-detail-box">
                  <div id="product-detail">
                    <div id="product-detail-puts">
                      <table id="product-detail-table">
                        <tr>
                          <td>카테고리</td>
                          <td>
                            <select
                              class="search-input-gray"
                              id="select-add-modal" name="categoryNo">
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td>상품명</td>
                          <td>
                            <input
                              type="text"
                              id="productName"
                              name="productName" required
                            />
                          </td>
                        </tr>
                        <tr>
                          <td>입고가</td>
                          <td>
                            <input
                              type="number"
                              id="inputPrice"
                              name="inputPrice" required
                            />
                          </td>
                        </tr>
                        <tr>
                          <td>판매가</td>
                          <td>
                            <input
                              type="number"
                              id="salePrice"
                              name="salePrice" required
                            />
                          </td>
                        </tr>
                        <tr>
                          <td>재고부족량</td>
                          <td>
                            <input
                              type="number"
                              id="shortageAmount"
                              name="shortageAmount" required
                            />
                          </td>
                        </tr>
                      </table>
                    </div>
                    <div id="product-detail-ok">
                      <button class="black-btn" type="submit" form="insert-product-form">완료</button>
                    </div>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>

      <%-- 상품 상세보기 및 수정/삭제 --%>
      <div
        class="modal fade"
        id="staticBackdrop-modify"
        data-bs-backdrop="static"
        data-bs-keyboard="false"
        tabindex="-1"
        aria-labelledby="staticBackdropLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog modal-lg modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <p>상품 정보 수정</p>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
                id="btn-close-modify-modal"
              >
                <img src="/resources/common/공통_Icon.png" id="modify-x_img" />
              </button>
            </div>
            <div class="modal-body" id="modal-modify-body">
              <form action=""
              id="update-product-form"
              method="post" enctype="multipart/form-data">
                <div id="product-modify-img">
                  <img id="modal-image" src="" alt="상품 이미지" onclick="chooseFile('#file1')">
                  <input style="display: none;" type="file" name="file1" id="file1" onchange="loadImg(this,'#modal-image')">
                </div>
                <div id="product-detail-modify-box">
                  <div id="product-detail-modify">
                    <div id="product-detail-modify-puts">
                      <input type="hidden" id="modal-productNo" name="productNo"> 
                      <input type="hidden"  name="product_status">   
                      <table id="product-detail-modify-table">
                        <tr>
                          <td>카테고리</td>
                          <td>
                            <select class="search-input-gray" id="select-modify-modal" name="categoryNo" >  
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td>상품명</td>
                          <td>
                            <input type="text" id="modal-productName" name="productName"/>
                          </td>
                        </tr>
                        <tr>
                          <td>입고가</td>
                          <td>
                            <input type="number" id="modal-inputPrice" name="inputPrice"/>
                          </td>
                        </tr>
                        <tr>
                          <td>판매가</td>
                          <td>
                            <input type="number" id="modal-salePrice" name="salePrice"/>
                          </td>
                        </tr>
                        <tr>
                          <td>재고부족량</td>
                          <td>
                            <input type="number" id="modal-shortageAmount"  name="shortageAmount" />
                          </td>
                        </tr>
                        <tr>
                          <td>입고불가</td>
                          <td>
                            <input type="checkbox" id="modal-availability"  name="availability"/>
                          </td>
                        </tr>
                      </table>
                    </div>
                    <div id="product-detail-modify-btn">
                      <button class="black-btn" onclick="postFormSubmit('edit')">수정완료</button>
                      <button class="red-btn" onclick="postFormSubmit('delete')">삭제</button>
                    </div>
                  </div>
                </div>
              </form>

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
              const productNo = this.children[0].textContent;
              const categoryName = this.children[1].textContent;
              const filePath = this.children[2].querySelector('img').src;
              const productName = this.children[3].textContent;
              const inputPrice = this.children[4].textContent;
              const salePrice = this.children[5].textContent;
              const shortageAmount = this.children[6].textContent;
              const availability = this.children[7].textContent;
       

              document.getElementById('modal-image').src = filePath;
              document.getElementById("modal-productNo").value = productNo;
              let sel = document.getElementById('select-modify-modal').options;
              for (var i = 0; i < sel.length; i++) {
                if (sel[i].label == categoryName) {
                  console.log(sel[i].label);
                   sel[i].selected = true;
                }
              }
              document.getElementById('modal-productName').value = productName;
              document.getElementById('modal-inputPrice').value = inputPrice;
              document.getElementById('modal-salePrice').value = salePrice;
              document.getElementById('modal-shortageAmount').value = shortageAmount;
              if (availability == 'N') {
                document.getElementById('modal-availability').checked = true;
              }
              
              const modal = new bootstrap.Modal(
                document.getElementById('staticBackdrop-modify')
              );
              modal.show();
            });
          });
        });



        function drawCategoryList(){

          getCategory(function (list){
            var addselect = document.getElementById('select-add-modal');
            addselect.setAttribute("name", "categoryNo");
            addselect.innerHTML = '<option value="" name="" >카테고리</option>'; 
              for(var category of list){
                  var option = document.createElement('option');
                  option.value = category.categoryNo;
                  option.textContent = category.categoryName;
                  addselect.appendChild(option);
                  
               
              }

              var modifyselect = document.getElementById('select-modify-modal');
              modifyselect.setAttribute("name", "categoryNo");
              modifyselect.innerHTML = '<option value="">카테고리</option>';
              for(var category of list){

                  var option = document.createElement('option');
                  option.value = category.categoryNo;
                  option.textContent = category.categoryName;
                  modifyselect.appendChild(option);

                }

          })
            }

        function getCategory(callback){

          $.ajax({
            url: '/api/category/drawCategory',
            method: 'get',
            success: function (res) {

              if (typeof res === 'string') {
                res = JSON.parse(res); // 문자열이면 JSON 객체로 변환
              }
              console.log('통신성공');
              callback(res);
            },
            error: function () {
              console.log('통신실패');
            },
          });

        }
        function loadImg(changeInput, targetImg){
                    //파일객체 -> files -> 선택된파일들이 담겨있음
                    console.log(changeInput.files[0])
                    const img = document.querySelector(targetImg);
                    console.log(img)
                    if(changeInput.files.length > 0){ //파일은 선택했을 때
                        //파일을 읽어들일 객체
                        const reader = new FileReader();

                        //해당 파일을 읽얻들여 해당파일만의 고유한 url을 부여
                        //url : Base64로 인코딩된 데이터 url(파일을 실제로 표현하는 형식인 바이너리 코드를 텍스트문자열로 인코딩한 방식)
                        reader.readAsDataURL(changeInput.files[0]);

                        //파일읽어들이기를 완료 했을 때 이벤트핸들러를 실행시켜줘
                        reader.onload = function(ev){
                            img.src = ev.target.result //이미지 요소에 불러온 파일의 url을 넣어준다.
                        }


                    } else { //파일이 있었는데 선택 후 취소했을 때
                        img.src = null;
                    }
                }
                function chooseFile(selector){
                    const fileInput = document.querySelector(selector);
                    fileInput.click();
                }


                function postFormSubmit(type){
                    const formEl = document.querySelector("#update-product-form");
                    switch(type){
                        case "edit" : {
                            //formEl.action = "updateForm.bo";
                            $(formEl).attr("action", "updateProduct");
                        }break;
                        case "delete":{
                            //formEl.action = "delete.bo";
                            $(formEl).attr("action", "deleteProduct")
                        }break;
                    }
                    
                    $(formEl).submit();
                }      
      </script>
      <!--end point-->
    </div>
  </body>
</html>
