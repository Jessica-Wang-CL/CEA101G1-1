/*  ---------------------------------------------------
    Template Name: Sona
    Description: Sona Hotel Html Template
    Author: Colorlib
    Author URI: https://colorlib.com
    Version: 1.0
    Created: Colorlib
---------------------------------------------------------  */
/*------------------
        Preloader
    --------------------*/
$(window).on("load", function () {
    $(".loader").delay(400).fadeOut();
    $("#preloder").delay(600).fadeOut("slow");
});
("use strict");

/*------------------
		My Settings
    --------------------*/

$(document).ready(function () {
    $(".mainmenu li a").hover(function () {
        let number = this.id;
        let strip = $(".accordion ul li:nth-child(" + number + ")");
        strip.addClass("hover");
    });
    /*------------------
        Button Effect
    --------------------*/
    $(function () {
        $(".btn-wow")
            .on("mouseenter", function (e) {
                var parentOffset = $(this).offset(),
                    relX = e.pageX - parentOffset.left,
                    relY = e.pageY - parentOffset.top;
                console.log(relX + "," + relY);
                $(this).find("span").css({ top: relY, left: relX });
            })
            .on("mouseout", function (e) {
                var parentOffset = $(this).offset(),
                    relX = e.pageX - parentOffset.left,
                    relY = e.pageY - parentOffset.top;
                $(this).find("span").css({ top: relY, left: relX });
            });
    });

    /*------------------
        RWD用縮放式導覽
    --------------------*/
    $(".canvas-open").on("click", function () {
        $(".offcanvas-menu-wrapper").addClass("show-offcanvas-menu-wrapper");
        $(".offcanvas-menu-overlay").addClass("active");
    });

    $(".canvas-close, .offcanvas-menu-overlay").on("click", function () {
        $(".offcanvas-menu-wrapper").removeClass("show-offcanvas-menu-wrapper");
        $(".offcanvas-menu-overlay").removeClass("active");
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
	--------------------*/
    $("select").niceSelect();

    /*------------------
		CodePen Slider
    --------------------*/

    //Slider
    $(".slideshow-pic")
        .slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            arrows: false,
            dots: false,
            fade: true,
            asNavFor: ".slider-nav",
            speed: 1000,
            cssEase: "linear",
        })
        .on("mousewheel", function (event) {
            if (event.deltaX > 0) {
                $(this).slick("slickNext");
            } else {
                $(this).slick("slickPrev");
            }
        });
    // .on("mousewheel", function (event) {
    //     if (event.deltaX > 0 || event.deltaY < 0) {
    //         $(this).slick("slickNext");
    //         $(".slideshow-text", $(this).parent().parent()).slick("slickNext");
    //     } else {
    //         $(this).slick("slickPrev");
    //         $(".slideshow-text", $(this).parent().parent()).slick("slickPrev");
    //     }
    // });

    $(".slider-nav")
        .slick({
            slidesToShow: 3,
            slidesToScroll: 1,
            autoplay: true,
            asNavFor: ".slideshow-pic",
            dots: false,
            arrows: false,
            centerMode: true,
            focusOnSelect: true,
            autoplaySpeed: 3000,
            speed: 1000,
            infinite: true,
        })
        .on("mousewheel", function (event) {
            if (event.deltaX > 0) {
                $(this).slick("slickNext");
            } else {
                $(this).slick("slickPrev");
            }
        });
    // $(".slideshow-text").slick({
    //     vertical: true,
    //     arrows: false,
    //     infinite: true,
    //     speed: 1000,
    //     cssEase: "cubic-bezier(0.7, 0, 0.3, 1)",
    // });
    /*-----------------.-
		CodePen Strip
    --------------------*/
    var Expand = (function () {
        var tile = $(".strips__strip");
        var tileLink = $(".strips__strip > .strip__content");
        // var tileText = tileLink.find(".strip__inner-text");
        var stripClose = $(".strip__close");
        //找到RWD按鈕
        var iconmenu = $("div.canvas-open");
        //找到Header列
        var menuitem = $(".menu-item");
        //抓到訂房欄位
        // var booking = $(".booking");
        var expanded = false;
        var slickdot;
        //開
        var open = function () {
            var tile = $(this).parent();
            slickdot = $(".slick-dots", this);

            if (!expanded) {
                tile.addClass("strips__strip--expanded");
                tile.css("top", "0");
                tile.css("min-height", "100vh");
                // add delay to inner text
                // tileText.css("transition", "all .5s .3s cubic-bezier(0.23, 1, 0.32, 1)");
                stripClose.addClass("strip__close--show");
                stripClose.css("transition", "all .2s .4s cubic-bezier(0.23, 1, 0.32, 1)");
                // booking.addClass("booking-show");
                // booking.css("transition", "all .5s linear");
                menuitem.addClass("menu-item-out");
                menuitem.css("transition", "all .5s linear");
                slickdot.css("visibility", "visible");
                iconmenu.css("visibility", "hidden");
                expanded = true;
            }
        };
        //關
        var close = function () {
            if (expanded) {
                tile.removeClass("strips__strip--expanded");
                tile.css("top", "10vh");
                tile.css("min-height", "90vh");
                // remove delay from inner text
                // tileText.css("transition", "all 1s 0 cubic-bezier(0.23, 1, 0.32, 1)");
                stripClose.removeClass("strip__close--show");
                stripClose.css("transition", "all 0.5s 0s cubic-bezier(0.23, 1, 0.32, 1)");
                // booking.removeClass("booking-show");
                // booking.css("transition", "all .1s linear");
                menuitem.removeClass("menu-item-out");
                menuitem.css("transition", "all .5s linear");
                slickdot.css("visibility", "hidden");
                iconmenu.css("visibility", "visible");
                expanded = false;
                $(".slideshow-left").slick("slickGoTo", 0, true);
                $(".slideshow-text").slick("slickGoTo", 0, true);
            }
        };

        var bindActions = function () {
            tileLink.on("click", open);
            stripClose.on("click", close);
        };

        var init = function () {
            bindActions();
        };

        return {
            init: init,
        };
    })();

    Expand.init();
});
