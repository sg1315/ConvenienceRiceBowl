
<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  
    <!-- jQuery library  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/resources/css/pos.css">
  <style>
    body{
      box-sizing: border-box;
    }
    *{
      
      margin: 0px;
      padding: 0px;
    }
    .outer{
      font-family: "Open Sans", sans-serif;
      width: 1024px;
      height: 770px;
      border: 1px solid black;
      margin: auto;
    }
  </style>
</head>
<body>
<div class="outer">
  <div class="header">
    <p>편이덮밥 pos</p>
    <div>
      <p >판매일자 : <div type="text" id="currentDate"></div></p>
      <div><a href="spot_dashboard"><img src="resources/common/공통_엑스아이콘.png"  alt="엑스"></a> </div>
      
    </div>

  </div>
  <div class="main">
    <section class="pos-searchitem">

      <!--searchBar : 상품목록 검색창 -->
      <div class="searchBar">
        <div class="searchBar-outer">
          <p>상품목록</p>
          <div class="searchBar-div">
            <img src="/resources/common/포스기_검색아이콘.png" alt="돋보기">
            <input type="text" placeholder="상품번호입력" id="keyword" onkeyup="searchProductList()">
          </div>
        </div>
      </div>

      <!--searchItem : 상품목록  -->
      <div class="itemList">
        <div class="itemList-outer">
          <form action="">
            <table class ="item-table">
              <thead>
                <tr>
                  <th>상품번호</th>
                  <th>상품명</th>
                  <th style="display: none;">수량</th>
                  <th>금액</th>
                  <th>추가</th>
                </tr>
              </thead>
              <tbody id="tbodyel" >
                <c:forEach var="p" items="${list}">
                  <tr>
                    <td>${p.productNo}</td>
                    <td>${p.productName}</td>
                    <td style="display: none;">${p.inventoryCount}</td>   
                    <td><fmt:formatNumber value="${p.salePrice}" type="number" groupingUsed="true" /></td>      
                    <td><img src="resources/common/포스기_추가 아이콘.png" onclick="addList(this)" alt=""></td>  
                    
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </form>
        </div>
      </div>

      <div class="enteritem">
        <div class="enteritem-outer">
          <div class="enteritem-inner">
            <div class="enter-title">
              <img src="resources/menubar_icons/로고ver2.png" alt="">
            </div>
            <div class="enter-content">
              <div class="enter1">
                <div onclick="writeNo(this)">1</div>
                <div onclick="writeNo(this)">2</div>
                <div onclick="writeNo(this)">3</div>
                <div onclick="writeNo(this)">4</div>
                <div onclick="writeNo(this)">5</div>

              </div>
              <div class="enter2">
                <div>6</div>
                <div  onclick="writeNo(this)">7</div>
                <div  onclick="writeNo(this)">8</div>
                <div  onclick="writeNo(this)">9</div>
                <div  onclick="writeNo(this)">0</div>
              </div>
            </div>
            <div class="enter-show" >
                <div onclick="searchProductList()">검색하기</div>
                <div onclick="clearInput()">c</div>
            </div>
          </div>
        </div>

      </div>

    </section>

    <section class="pos-payitem">

      <div class="payList-head">
        <div class="payList-title">
          <p>POS-Recipt</p>
        </div>
        <p>결제목록</p>
      </div>

      <div class="payTable-outer">
       
          <table class="payTable">
            <thead>
               <tr>
                  <th>삭제</th>
                  <th>상품번호</th>
                  <th>상품명</th>
                  <th>수량</th>
                  <th>금액</th>
              </tr>
            </thead>
            <tbody id="tbshow">
            </tbody>
          </table>
        </div>
        <div class="payCount" >
          <div class="payCount-content">
            <p>결제금액</p>
            <p id="totalcount">총액 : </p>
          </div>
          <button class="pay-btn" onclick="submitCirculation()" >결제하기</button>
        </div>
 
       
    </section>
</div>
<script>



function searchProductList(){
  const keyword = document.getElementById('keyword').value.trim();

  $.ajax({
        url: '/pos/productSearch',
        method: 'GET',
        data: { keyword: keyword },
        dataType: 'json',
        success: function (data) {
    
          let tbodyContent = '';
           
          for(var i =0 ; i<data.length; i++ ){
            tbodyContent += "<tr> <td name='productNo'>" + data[i].productNo + "</td>"+
                                  "<td name='productName'>" + data[i].productName + "</td>"+
                                  "<td name ='count'>1</td>" +
                                  "<td name='salePrice'>" + parseInt(data[i].salePrice).toLocaleString()  + "</td>"+
                            "<td> <img src='resources/common/포스기_추가 아이콘.png' onclick='addList(this)'' alt=''> </td> </tr>"
                            
                    ;
          }
            console.log(tbodyContent)
            document.getElementById("tbodyel").innerHTML = tbodyContent;
        },
        error: function () {
            alert("검색 오류 발생!");
        }
    });
}
function addList(this_tb) {
  const payTable = document.getElementById("tbshow");
  const selectedRow = this_tb.closest('tr');
  const productNo = selectedRow.cells[0].innerText;
  const productName = selectedRow.cells[1].innerText;
  let productCount = selectedRow.cells[2];
  const price = selectedRow.cells[3].innerText;

  let found = false;


  // payTable에 동일한 상품번호가 있는지 확인
  for (let i = 0; i < payTable.rows.length; i++) {
    const row = payTable.rows[i];
    const existingProductNo = row.cells[1].innerText;

    if (existingProductNo === productNo) {
      // 수량 input 박스의 값을 +1
      const qtyInput = row.cells[3].querySelector("input");
      qtyInput.value = parseInt(qtyInput.value) + 1;

      found = true;
      break;
    }
  }

  // 없다면 새 행 추가
  if (!found) {
    const newRow = payTable.insertRow();

    // 삭제 버튼
    let cell = newRow.insertCell();
    cell.innerHTML = "<img src='../resources/common/포스기_삭제 아이콘.png' alt='삭제' onclick='deleteList(this)'>";

    // 상품번호
    cell = newRow.insertCell();
    cell.innerText = productNo;
    
    // 상품명
    cell = newRow.insertCell();
    cell.innerText = productName;

    // 수량 input
    cell = newRow.insertCell();
    cell.innerHTML = `<input type='text' value='1' onchange='priceCount(this)'>`;

    // 가격
    cell = newRow.insertCell();
    cell.innerText = price.toLocaleString();
}

  priceCount();
}
  // function addList(this_tb){
  //   const objRow = document.all("tbshow").insertRow();
  //   const test = this_tb.closest('tr');
  //   var rowNum = test.childElementCount;

  //   for (var i =0; i < rowNum; i++){
  //     var addrow;
  //     if(i==0){
  //       addrow = objRow.insertCell();
  //       addrow.innerHTML="<img src='../resources/common/포스기_삭제 아이콘.png' alt='삭제' onclick='deleteList(this)'>"

  //     }else if(i == 3){
  //       addrow = objRow.insertCell();
  //       const num = test.cells[i-1].innerHTML;
  //       addrow.innerHTML = "<input type='text' onchange='priceCount()' value ='1' >";
  //     }else{
  //       addrow = objRow.insertCell();
  //       addrow.innerHTML = test.cells[i-1].innerHTML;
  //     }
  //   }
  //   priceCount();

  // }
  

  function deleteList(this_tb){
    const test = this_tb.closest('tr');
    test.remove();
    priceCount();

  }

  function priceCount(this_input){

    const table = document.getElementById('tbshow').getElementsByTagName('tr')
    const total = document.getElementById('totalcount');

    var sum =0;


    for(i=0;i<table.length;i++){
      var cnt = table[i].cells[3].querySelector('input').value;
      var price = table[i].cells[4].innerText;
     
      sum += cnt* parseInt(price.replace(",", "")) ;
    }
 

    total.innerText = "총액 : " + sum;
  }

  function submitCirculation() {
  const rows = document.querySelectorAll("#tbshow tr");
  const dataList = [];

  rows.forEach(row => {
    const cells = row.cells;
    const productNo = parseInt(cells[1].innerText);
    const productName = cells[2].innerText;
    const circulationAmount = parseInt(cells[3].querySelector("input").value);
    const salePrice = parseInt(cells[4].innerText.replace(",", ""));

    dataList.push({
      productNo: productNo,
      circulationAmount: circulationAmount,
      salePrice: salePrice
    });
  });

  console.log("전송할 데이터:", dataList);

  $.ajax({
    url: "/posCirculationInsert",
    method: "POST",
    contentType: "application/json",
    data: JSON.stringify(dataList),
    success: function(response) {
      alert("전송 성공!");
      // 필요 시 리다이렉트 or 초기화
      location.reload();
    },
    error: function(xhr, status, error) {
      console.error("전송 실패", error);
      alert("전송 실패!");
      location.reload();
    }
  });
}


// 계산기
function writeNo(this_div){
  let number = this_div.innerHTML
  let inputBox = document.getElementById("keyword");

  inputBox.value += number
}


function clearInput(){
  let inputBox = document.getElementById("keyword");
  inputBox.value="" 
}


document.getElementById('currentDate').innerText = new Date().toISOString().substring(0, 10);



</script>
</body>
</html>
