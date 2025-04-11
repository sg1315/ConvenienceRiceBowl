document.addEventListener("DOMContentLoaded", function () {

    $(document).ready(function () {
        const now = new Date();
        const month = now.getMonth() + 1; // 0~11 이므로 +1 필요
        $("#dash-date-month").text(month + "월");
    });

});