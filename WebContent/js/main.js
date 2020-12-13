/*------------------
    Preloader
--------------------*/
$(window).on("load", function () {
    $(".loader").delay(400).fadeOut();
    $("#preloder").delay(600).fadeOut("slow");
});

$(document).ready(function () {
    /*------------------
            登入視窗
    --------------------*/
    $(".log-in").on("click", function () {
        $(".offcanvas-menu-overlay").removeClass("active");
        $(".login-window-overlay").addClass("active");
        $(".login-window").addClass("show-login-window");
        $(".offcanvas-menu-wrapper").removeClass("show-offcanvas-menu-wrapper");
    });
    $(".login-window-overlay").on("click", function (e) {
        $(".login-window-overlay").removeClass("active");
        $(".login-window").removeClass("show-login-window");
    });
    $(".img__btn").click(function () {
        document.querySelector(".cont").classList.toggle("s--signup");
    });
    /*------------------
        Navigation
    --------------------*/
    $(".mobile-menu").slicknav({
        prependTo: "#mobile-menu-wrap",
        allowParentLinks: true,
    });
    /*------------------
        Nice Select
    -------------------*/
    $("select").niceSelect();
    /*------------------
        RWD用導覽側窗
    --------------------*/
    $(".canvas-open").on("click", function () {
        $(".offcanvas-menu-wrapper").addClass("show-offcanvas-menu-wrapper");
        $(".offcanvas-menu-overlay").addClass("active");
    });

    $(".canvas-close, .offcanvas-menu-overlay").on("click", function () {
        $(".offcanvas-menu-wrapper").removeClass("show-offcanvas-menu-wrapper");
        $(".offcanvas-menu-overlay").removeClass("active");
    });

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
});
