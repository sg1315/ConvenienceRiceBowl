//최근 버튼
function recent() {
    window.location.href = '/spot_input';
}
//저번달 버튼
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