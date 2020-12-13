$(document).ready(function () {
    let display = document.getElementById("display");
    let weeks = ["ㄧ", "二", "三", "四", "五", "六", "日"];

    function createCalendar(year, month) {
        let feb = leapYear(year);
        let monthOfDay = [31, feb, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        let wrapper = document.createElement("div"); //包住個別日曆
        wrapper.classList.add("calendar-wrapper");
        let title = document.createElement("div"); //產生日曆標頭
        title.classList.add("title");
        title.innerHTML = "<b>" + (month + 1) + "月</b><p>" + "," + year + "年</p>";
        let table = document.createElement("table"); //產生日曆表格
        table.classList.add("calendar");
        let firstTr = document.createElement("tr"); //產生標頭列
        firstTr.classList.add("week-title");

        table.append(firstTr);
        wrapper.append(title);
        wrapper.append(table);
        //建立抬頭
        for (let i = 0; i < 7; i++) {
            let th = document.createElement("th");
            th.innerText = weeks[i];
            firstTr.append(th);
        }
        //找出該月第一天是禮拜幾
        let firstDayOfWeek = new Date(year, month, 1).getDay();
        //確認月曆行數
        let rows = (monthOfDay[month] + firstDayOfWeek - 1) / 7;
        //產生月曆行數
        for (let i = 0; i < rows; i++) {
            let tr = document.createElement("tr");
            for (let j = 1; j <= 7; j++) {
                let td = document.createElement("td");
                let a = document.createElement("a");
                td.classList.add("calendar-td");
                a.classList.add("calendar-box");
                let id =
                    year.toString() +
                    (month + 1).toString().padStart(2, "0") +
                    (i * 7 + j - firstDayOfWeek + 1).toString().padStart(2, "0");
                if (i === 0 && j >= firstDayOfWeek) {
                    a.setAttribute("data-year", year);
                    a.setAttribute("data-month", month + 1);
                    a.setAttribute("data-date", j + i * 7 - firstDayOfWeek + 1);
                    a.setAttribute("id", id);
                } else if (i * 7 + j - firstDayOfWeek + 1 <= monthOfDay[month]) {
                    a.setAttribute("data-year", year);
                    a.setAttribute("data-month", month + 1);
                    a.setAttribute("data-date", j + i * 7 - firstDayOfWeek + 1);
                    a.setAttribute("id", id);
                }
                td.append(a);
                tr.append(td);
            }
            table.append(tr);
        }
        return wrapper;
    }

    function leapYear(year) {
        let feb = (year % 4 == 0 && year % 100 != 0) || year % 400 == 0 ? 29 : 28;
        return feb;
    }

    function fillUpDates(year, month) {
        let feb = leapYear(year);
        let monthOfDay = [31, feb, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        for (let i = 1; i <= monthOfDay[month]; i++) {
            let celldate = document.createElement("div");
            let cellprice = document.createElement("div");
            cellprice.classList.add("calendar-price");
            celldate.classList.add("calendar-date");
            cellprice.innerText = "30000$";
            let hrefstr =
                "http://localhost:8081/daimondresort/booking?year=" + year + "&month=" + (month + 1) + "&date=" + i;
            let id = year.toString() + (month + 1).toString().padStart(2, "0") + i.toString().padStart(2, "0");
            let box = document.getElementById(id);
            box.setAttribute("data-content", "○");
            box.setAttribute("href", hrefstr);
            box.classList.add("calendar-default");
            celldate.innerText = i;
            box.append(celldate);
            box.append(cellprice);
        }
    }

    function getCalendars(number) {
        let today = new Date();
        let thisYear = today.getFullYear();
        let thisMonth = today.getMonth();

        for (i = 0; i < number; i++) {
            let year = thisYear + Math.floor(thisMonth / 12);
            let month = thisMonth % 12;
            let calendar = createCalendar(year, month);
            display.append(calendar);
            fillUpDates(year, month);
            thisMonth++;
        }
        thisMonth = today.getMonth();
        let todaybox = document.getElementById(
            thisYear.toString() +
                (thisMonth + 1).toString().padStart(2, "0") +
                today.getDate().toString().padStart(2, "0")
        );
        todaybox.classList.add("calendar-today");

        let marginleft = 0;
        let forward = $(".calendar-forward");
        let backward = $(".calendar-backward");
        let calendars = $(".calendar-wrapper");
        calendars.eq(0).css("opacity", "1");
        backward.fadeOut();
        forward.click(function () {
            calendars.css("opacity", "0");
            if (Math.abs(marginleft) / 50 < number - 1) {
                backward.fadeIn();
                $("#display").css("margin-left", (marginleft -= 50) + "vw");
            }
            if (Math.abs(marginleft) / 50 === number - 1) {
                forward.fadeOut();
            }
            calendars.eq(Math.abs(marginleft) / 50).css("opacity", "1");
        });
        backward.click(function () {
            calendars.css("opacity", "0");
            if (Math.abs(marginleft) > 0) {
                forward.fadeIn();
                $("#display").css("margin-left", (marginleft += 50) + "vw");
            }
            if (Math.abs(marginleft) / 50 === 0) {
                backward.fadeOut();
            }
            calendars.eq(Math.abs(marginleft) / 50).css("opacity", "1");
        });
    }

    getCalendars(6);
});
