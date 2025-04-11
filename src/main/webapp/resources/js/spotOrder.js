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
                <td>${inputPrice.toLocaleString()}</td>
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

        // 입력한 수량
        const quantity = parseInt(e.target.value) || 0;

        // data 속성에서 inputPrice 가져오기 (정확하게)
        const inputPrice = parseInt(row.getAttribute('data-inputprice')) || 0;

        // 합계 계산
        const total = quantity * inputPrice;

        // 총 금액 반영 (셀 생성 또는 업데이트)
        let totalCell = row.querySelector('.total-price');
        if (!totalCell) {
            totalCell = document.createElement('td');
            totalCell.classList.add('total-price');
        }
        totalCell.textContent = total.toLocaleString();

        // 전체 요약 업데이트
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
document.getElementById('previousMonthOrder').addEventListener('click', function () {
    const now = new Date();

    // 저번 달 계산
    const previousMonth = new Date(now.getFullYear(), now.getMonth() - 1, 1);
    const year = previousMonth.getFullYear();
    const month = previousMonth.getMonth(); // 0~11

    // 저번 달 1일
    const startDate = new Date(year, month, 1);
    // 저번 달 말일 (다음 달 0일)
    const endDate = new Date(year, month + 1, 0);

    // YYYY-MM-DD 형식으로 변환
    const formatDate = (date) => {
        const yyyy = date.getFullYear();
        const mm = String(date.getMonth() + 1).padStart(2, '0');
        const dd = String(date.getDate()).padStart(2, '0');
        return `${yyyy}-${mm}-${dd}`;
    };

    // input에 날짜 설정
    document.querySelector('input[name="startDate"]').value = formatDate(startDate);
    document.querySelector('input[name="endDate"]').value = formatDate(endDate);

    // 폼 자동 제출
    document.getElementById('btn-order-search').click();

});