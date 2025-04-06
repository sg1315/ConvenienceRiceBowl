// 발주 요청 상품 목록 검색
$('#search-box').submit(function (e) {
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
                            <td><img src="../resources/common/포스기_추가 아이콘.png"></td>
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
$.ajax({
    url: '/spot_order/productSearch',
    method: 'GET',
    data: {
        keyword: keyword,
        category: category,
        cpage: page
    },
    success: function (data) {
        // 테이블 데이터 렌더링
        let tbody = '';
        data.products.forEach(function (p) {
            tbody += `
                <tr>
                    <td>${p.productNo}</td>
                    <td>${p.categoryName}</td>
                    <td>${p.productName}</td>
                    <td><img src="../resources/common/포스기_추가 아이콘.png"></td>
                </tr>
            `;
        });
        $('#orderRequestProductList tbody').html(tbody);

        // 페이지 버튼 다시 그리기
        let pagination = '';
        for (let i = data.pi.startPage; i <= data.pi.endPage; i++) {
            pagination += `<button class="btn btn-outline-secondary page-btn" data-page="${i}">${i}</button>`;
        }
        $('#pagination').html(pagination);
    },
    error: function () {
        alert("검색 오류 발생!");
    }
});