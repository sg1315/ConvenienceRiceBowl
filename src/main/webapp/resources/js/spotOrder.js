// 발주 요청 상품 목록 검색
$(document).on('submit', '#search-box', function (e)  {
    e.preventDefault();

    const keyword = $('#product-search').val();
    const category = $('#order-request-category-select').val();

    $.ajax({
        url: '/spot_order/productSearch',
        method: 'GET',
        data: { keyword: keyword, category: category },
        dataType: 'json',
        success: function (data) {
            let tbody = '';
            data.forEach(function (p) {
                tbody += `
                        <tr>
                            <td>${p['productNo']}</td>
                            <td>${p['categoryName']}</td>
                            <td>${p['productName']}</td>
                            <td>
                                <img 
                                    src="../resources/common/포스기_추가 아이콘.png"
                                    class="add-btn"
                                    data-productno="${p['productNo']}"
                                    data-categoryname="${p['categoryName']}"
                                    data-productname="${p['productName']}"
                                    data-inputprice="${p['inputPrice']}"
                                    style="cursor:pointer;">
                            </td>
                        </tr>
                    `;
            });
            $('#orderRequestProductList tbody').html(tbody);
        },
        error: function () {
            alert("검색 오류 발생!");
        }
    });
});
//페이지 이동
//

//추가 버튼 클릭시 오른쪽 모달 출력 및 데이터 저장
const addedProducts = new Set();

document.addEventListener('click', function (e) {
    if (e.target.classList.contains('add-btn')) {
        const btn = e.target;
        const productNo = btn.dataset.productno;


        if (addedProducts.has(productNo)) {
            alert("이미 추가된 상품입니다.");
            return;
        }
        addedProducts.add(productNo);

        const categoryName = btn.dataset.categoryname;
        const productName = btn.dataset.productname;
        const inputPrice = parseInt(btn.dataset.inputprice);
        const salePrice = parseInt(btn.dataset.saleprice);

        const newRow = `
            <tr data-productno="${productNo}" data-inputprice="${inputPrice}" data-saleprice="${salePrice}">
                <td><img src="../resources/common/포스기_삭제 아이콘.png" class="remove-btn" style="cursor: pointer;"></td>
                <td>${productNo}</td>
                <td>${categoryName}</td>
                <td>${productName}</td>
                <td>
                    <input type="number" class="form-control quantity-input" min="1" value="1" style="width: 80px;">
                </td>
                <td>${inputPrice}</td>
            </tr>
        `;

        document.querySelector("#order-request-table tbody").insertAdjacentHTML('beforeend', newRow);
        updateSummary();
    }
});

// 수량 변경 시 금액 계산
document.querySelector("#order-request-table tbody").addEventListener('input', function (e) {
    if (e.target.classList.contains('quantity-input')) {
        const row = e.target.closest('tr');
        const circulationAmount = parseInt(e.target.value) || 1;
        const inputPrice = parseInt(row.dataset.inputprice);
        const total = circulationAmount * inputPrice;
        row.querySelector('.total-price').textContent = total.toLocaleString();
        updateSummary();
    }
});

// 삭제 버튼 클릭 시 제거
document.querySelector("#order-request-table tbody").addEventListener('click', function (e) {
    if (e.target.classList.contains('remove-btn')) {
        const row = e.target.closest('tr');
        const productNo = row.dataset.productno;
        addedProducts.delete(productNo);
        row.remove();
        updateSummary();
    }
});

// 전체 요청 버튼 클릭 시 데이터 수집 후 서버로 전송
document.getElementById('btn-order-submit').addEventListener('click', function () {
    const rows = document.querySelectorAll("#order-request-table tbody tr");

    const orderList = [];

    rows.forEach(row => {
        const productNo = row.dataset.productno;
        const circulationAmount = parseInt(row.querySelector('.quantity-input').value);
        const inputPrice = parseInt(row.dataset.inputprice);
        const salePrice = parseInt(row.dataset.saleprice);

        orderList.push({
            productNo: productNo,
            circulationAmount: circulationAmount,
            inputPrice: inputPrice,
            salePrice: salePrice,
        });
    });

    if (orderList.length === 0) {
        alert("요청할 상품이 없습니다.");
        return;
    }

    // Ajax로 서버 전송
    fetch('/spot_order/requestOrder', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(orderList)
    })
        .then(res => {
            if (res.ok) {
                alert("발주 요청 완료!");
                location.reload();
            } else {
                alert("요청 중 오류 발생");
            }
        });
});

//발주 목록 검색
$(document).ready(function () {
    $('#btn-order-search').click(function (e) {
        e.preventDefault();
        const startDate = $('input[name="startDate"]').val();
        const endDate = $('input[name="endDate"]').val();
        const status = $('select[name="status"]').val();
        const setNo = $('input[name="setNo"]').val();

        const data = {
            startDate: startDate,
            endDate: endDate,
            status: status,
            setNo: setNo
        };
        console.log(data);

        $.ajax({
            url: '/spot_order/orderSearch',
            type: 'GET',
            data: data,
            success: function (data) {
                console.log(data);
                // renderOrderList(data);
            },
            error: function () {
                alert('검색 중 오류가 발생했습니다.');
            }
        });
    });

});