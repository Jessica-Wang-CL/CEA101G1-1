$(document).ready(function () {
    $.datepicker.regional["zh-TW"] = {
        dayNamesMin: ["日", "一", "二", "三", "四", "五", "六"],
        monthNames: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"],
        monthNamesShort: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"],
        prevText: "上月",
        nextText: "次月",
        weekHeader: "週",
    };
    //將預設語系設定為中文
    $.datepicker.setDefaults($.datepicker.regional["zh-TW"]);

    $(".check-date").datepicker({
        minDate: 0,
        dateFormat: "yy/mm/dd",
        language: "zh-TW",
        numberOfMonths: 12,
        arrow: false,
        onSelect: function () {
            reformat();
        },
    });

    reformat();
    $(".check-date").datepicker("isDisabled");
    function reformat() {
        let tdArray = $(".ui-datepicker-calendar tbody td");
        let tdlength = tdArray.length;
        for (let i = 0; i < tdlength; i++) {
            let info = document.createElement("div");
            if (tdArray.eq(i).children().length === 0) {
                tdArray.eq(i).append(info);
            } else {
                let box = tdArray.eq(i).children().eq(0);
                info.classList.add("booking-info");
                box.append(info);
                box.text("");
            }
        }
    }

    let move = $(".ui-datepicker-group").width();

    $(".left").click(function () {
        let calendar = $(".ui-datepicker").eq(0);
        let right = parseInt(calendar.css("right").split("p")[0]);
        let calendarWidth = $(".ui-datepicker").width();
        let viewWidth = $(".check-date").width();
        if (right <= calendarWidth - viewWidth) {
            right += move;
            calendar.css("right", right + "px");
        }
    });
    $(".right").click(function () {
        let calendar = $(".ui-datepicker").eq(0);
        let right = parseInt(calendar.css("right").split("p")[0]);
        let calendarWidth = $(".ui-datepicker").width();
        let viewWidth = $(".check-date").width();
        if (right >= 0) {
            right -= move;
            calendar.css("right", right + "px");
        }
    });
});
