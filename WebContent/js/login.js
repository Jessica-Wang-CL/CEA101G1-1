$("#login").click(function (e) {
    if ($("#user-id").val() !== "admin" && $("#user-pwd").val() !== "admin") {
        e.preventDefault();
        swal({
            title: "帳號或密碼錯誤",
            text: "請重新輸入",
            icon: "error",
            button: true,
            dangerMode: true,
        });
    }
});
