$(document).ready(function() {
	//頂端nav section 漸變
	window.addEventListener("scroll", function() {
		let opac = "rgba(34, 39, 54," + (window.scrollY / 620).toString() + ")";
		$(".menu-item").css("background-color", opac);
		console.log();
		if ($(".booking").position().top > window.innerHeight) {
			$(".booking").css("background-color", "rgb(34, 39, 54)");
		} else {
			$(".booking").css("background-color", "rgba(0, 0, 0, 0)");
		}
	});
	//滑鼠到頂層導覽變色
	$(".menu-item").mouseover(() => $(".menu-item").css("background-color", "#222736"));
	$(".menu-item").mouseout(() =>
		$(".menu-item").css("background-color", "rgba(34, 39, 54," + (window.scrollY / 620).toString() + ")")
	);
	//確認輸入日期正確才送出查詢
	$("#check-room").on("click", function(e) {
		if ($("#date-in").val() === "" || $("#date-out").val() === "") {
			e.preventDefault();
			swalfire("日期未填寫", "");
		} else {
			return;
		}
	});
    /*------------------
		Navigation
	--------------------*/
	$(".testimonial-slider").slick({
		speed: 1000,
		slidesToScroll: 1,
		slidesToShow: 1,
		autoplay: true,
		fade: true,
		autoplaySpeed: 5000,
		infinite: true,
	});


    /*------------------
		Date Picker 日期
    --------------------*/
	$("#date-in").datepicker({
		minDate: 0,
		dateFormat: "yy/mm/dd",
		language: "zh-TW",
		numberOfMonths: 2,
		onSelect: function(selectedDate) {
			$("#date-out").datepicker("option", "minDate", selectedDate);
		},
	});

	$("#date-out").datepicker({
		minDate: 1,
		dateFormat: "yy/mm/dd",
		language: "zh-TW",
		numberOfMonths: 2,
		onSelect: function(selectedDate) {
			$("#date-in").datepicker("option", "maxDate", selectedDate);
		},
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


    /*------------------
        Background Set
    --------------------*/
	$(".set-bg").each(function() {
		var bg = $(this).data("setbg");
		$(this).css("background-image", "url(" + bg + ")");
	});
	/*------------------
       確認Email沒有重複
    --------------------*/
	$("#registration-form").submit(function(event) {
		event.preventDefault();
		let form = $(this);
		let email = $("#temp-email").val();
		let password = $("#temp-password").val();
		let confirmPassword = $("#temp-confirm-password").val();
		if (password !== confirmPassword) {
			swalfire("密碼確認錯誤", "請確認兩次密碼輸入是否相同")
			return;
		}
		let data = new FormData();
		data.append("email", email);
		data.append("action", "email_confirm");
		let xhr = new XMLHttpRequest();
		xhr.open("post", "http://localhost:8080/CEA101G1/MembersServlet");
		xhr.onload = function() {
			if (xhr.readyState === xhr.DONE) {
				if (xhr.status === 200) {
					console.log("Status 200")
					if (xhr.responseText === "used") {
						swalfir("您輸入的EMAIL已註冊", "請從會員登入進入")
						Swal.fire({
							position: "top-end",
							icon: "error",
							showConfirmButton: false,
							timer: 1500,
						});
					} else {
						form.unbind('submit').submit();
					}
				}
			}
		};
		xhr.send(data);
	});
	/*------------------
           登入確認
    --------------------*/
	$("#login-form").submit(function(event){
		event.preventDefault();
		let form = $(this);
		let mb_email = $("#mb_email").val();
		let mb_pwd = $("#mb_pwd").val();
		let data = new FormData();
		data.append("mb_email", mb_email);
		data.append("mb_pwd", mb_pwd);
		data.append("action", "member-login");
		let xhr = new XMLHttpRequest();
		xhr.open("post", "http://localhost:8080/CEA101G1/MembersServlet");
		xhr.onload = function() {
			if (xhr.readyState === xhr.DONE) {
				if (xhr.status === 200) {
					if (xhr.responseText === "email_not_found") {
						swalfir("此EMAIL尚未註冊會員", "是否要註冊會員" )
					} else if (xhr.responseText === "pwd_incorrect"){
						swalfir("密碼錯誤", "已錯誤" + n + "次 (超過三次將封鎖帳號)" )
					} else {
						form.unbind('submit').submit();
					}
				}
			}
		};
		xhr.send(data);
	})
	/*------------------
       通用錯誤訊息發射～
    --------------------*/
	function swalfire(msgTitle, msg) {
        Swal.fire({
            position: "center",
            icon: "error",
            title: msgTitle,
			text: msg,
            showConfirmButton: false,
            timer: 1500,
        });
    }
});
