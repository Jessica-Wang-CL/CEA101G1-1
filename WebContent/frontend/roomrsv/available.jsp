<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.roomtype.model.*"%>
<%@ page import="com.roomrsv.model.*"%>
<%@ page import="java.util.List" %>
<jsp:useBean id="rmtypeSvc" scope="page" class="com.roomtype.model.RoomTypeService" />
<%
RoomRsvService rsvService = new RoomRsvService();
List<RoomRsvVO> rsvList = rsvService.getAll();
pageContext.setAttribute("rsvList", rsvList);

%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/available.css" />
<title>Availability 空房狀況</title>
</head>
<body>
	<h2 class="aval-title">空房狀況</h2>
        <div class="condition">
            <h3>
                此為
                <select name="adult" id="adult">
                    <option selected>2位成人</option>
                    <option>4位成人</option>
                    <option>6位成人</option>
                </select>
                ，入住
                <select name="stay" id="stay">
                    <option value="1">1晚</option>
                    <option value="2" selected>2晚</option>
                    <option value="3">3晚</option>
                    <option value="4">4晚</option>
                    <option value="5">5晚</option>
                    <option value="6">6晚</option>
                    <option value="7">7晚</option>
                </select>
                每人每晚的價格
            </h3>
            <p>Listed price is rate for first night only and is not indicative of average daily rates.</p>
        </div>
        <div class="calendar-backward arrow">
            <i class="fas fa-chevron-left"></i>
        </div>
        <div class="calendar-forward arrow">
            <i class="fas fa-chevron-right"></i>
        </div>
        <div class="view">
            <div id="display"></div>
        </div>
        <div class="logo">
            <img src="<%=request.getContextPath()%>/img/logo.png" alt="" />
        </div>
        <script src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
        <%-- <script src="<%=request.getContextPath()%>/js/available.js"></script> --%>
        <script>
        $(document).ready(function () {
            let display = document.getElementById("display");
            let weeks = ["ㄧ", "二", "三", "四", "五", "六", "日"];
            let today = new Date();
            let thisYear = today.getFullYear();
            let thisMonth = today.getMonth();
            let todayDate = today.getDate();
            let todayStr = thisYear + "-" + (thisMonth+1) + "-" + todayDate
            console.log(todayStr);
            let current = 0;
            
            getCalendars(12); //拿一年份的月曆！

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
                if (firstDayOfWeek == 0) firstDayOfWeek = 7;
                //確認月曆行數
                let rows = (monthOfDay[month] + firstDayOfWeek - 1) / 7;
                //產生月曆行數
                for (let i = 0; i < rows; i++) {
                    let tr = document.createElement("tr");
                    for (let j = 1; j <= 7; j++) {
                        let td = document.createElement("td");
                        let a = document.createElement("a");
                        let img = document.createElement("img");
                        img.setAttribute("src", "<%=request.getContextPath()%>/css/ajax-loader.gif");
                        img.setAttribute("style", "display:none; width:100%")
                        td.classList.add("calendar-td");
                        a.classList.add("calendar-box");
                        let id =
                            year.toString() + "-"
                            + (month + 1).toString().padStart(2, "0") + "-"
                            + (i * 7 + j - firstDayOfWeek + 1).toString().padStart(2, "0");
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
                        a.append(img);
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
            //填充日期資訊
            function fillUpDates(year, month, thisMonthDate) {
                let feb = leapYear(year);
                let monthOfDay = [31, feb, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
                for (let i = thisMonthDate; i <= monthOfDay[month]; i++) {
                    let celldate = document.createElement("div");
                    let cellprice = document.createElement("div");
                    cellprice.classList.add("calendar-price");
                    celldate.classList.add("calendar-date");
                  let hrefstr =
                        "http://localhost:8081/daimondresort/booking?year=" + year 
                        + "&month=" + (month + 1) 
                        + "&date=" + i
                        + "&stay=0";
                    let id = year.toString() + "-" + (month + 1).toString().padStart(2, "0") + "-" + i.toString().padStart(2, "0");
                    let box = document.getElementById(id);
                    box.setAttribute("href", hrefstr);
                    box.classList.add("calendar-default");
                    celldate.innerText = i;
                    box.append(celldate);
                    box.append(cellprice);
                }
            }
            
            function getCalendars(number) {
                for (i = 0; i < number; i++) {
                    let thisMonthDate = 1;
                    let year = thisYear + Math.floor(thisMonth / 12);
                    let month = thisMonth % 12;
                    let calendar = createCalendar(year, month);
                    display.append(calendar);
                    if (i == 0){
                        thisMonthDate = todayDate;
                    } 
                    fillUpDates(year, month, thisMonthDate);
                    thisMonth++;
                }
                thisMonth = today.getMonth();
                let todaybox = document.getElementById(
                           thisYear.toString() + "-" 
                        + (thisMonth + 1).toString().padStart(2, "0") + "-"
                        + today.getDate().toString().padStart(2, "0")
                );
                todaybox.classList.add("calendar-today");

                let position = 0;
                let forward = $(".calendar-forward");
                let backward = $(".calendar-backward");
                let calendars = $(".calendar-wrapper");
                calendars.eq(0).css("opacity", "1");
                calendars.eq(1).css("opacity", "1");
                backward.fadeOut();
              //導覽
                forward.click(function () {
                    current += 1;
                    let calendarWidth = parseInt($(".calendar-wrapper").css("width").split("px")[0]);
                    calendars.css("opacity", "0");
                    if (0 < number - current) {
                        backward.fadeIn(0);
                        $("#display").css("transform", "translateX(-" + (position += calendarWidth) + "px)");
                    }
                    if (1 === number - current) {
                        forward.fadeOut(0);
                    }
                    calendars.eq(current).css("opacity", "1");
                    calendars.eq(current + 1).css("opacity", "1");
                });
                backward.click(function () {
                    current -= 1;
                    let calendarWidth = parseInt($(".calendar-wrapper").css("width").split("px")[0]);
                    calendars.css("opacity", "0");
                    if (number - current > 0) {
                        forward.fadeIn(0);
                        $("#display").css("transform", "translateX(-" + (position -= calendarWidth) + "px)");
                    }
                    if (number - current === 12) {
                        backward.fadeOut(0);
                    }
                    calendars.eq(current).css("opacity", "1");
                    calendars.eq(current + 1).css("opacity", "1");
                });
                $(window).resize(function () {
                    let CalendarWidth = parseInt($(".calendar-wrapper").css("width").split("px")[0]);
                    let reposition = CalendarWidth * current;
                    position = reposition;
                    $("#display").css("transform", "translateX(-" + reposition + "px)");
                });
                fetchAvalibility($(".calendar-wrapper").eq(0));
                fetchAvalibility($(".calendar-wrapper").eq(1));
            }
            var rm_price = {
            		<c:forEach var="rmtypevo" items="${rmtypeSvc.getAll()}">
            			${rmtypevo.rm_type}:${rmtypevo.rm_price},
            		</c:forEach>
            }
            function fetchAvalibility(calendar){
            	console.log(calendar)
                let allDays = calendar.find(".calendar-default");
                let stayDays = $("#stay").val();
                for (let i = 0 ; i < allDays.length; i++){
                	let currentDate = allDays.eq(i);
                    $.ajax({
                         url: "<%=request.getContextPath()%>/booking/Available",
                         data:{
                             date: currentDate.attr("id"),
                             stay: stayDays,
                             rmtype: "all",
                             action:"roomCheck"
                         },
                         type: 'POST',
                         beforeSend: function() {
                        	 currentDate.children("img").show();
                          },
                         success: function(str){
                            var data = JSON.parse(str)
        					if(data.isFull == "true"){
        						currentDate.addClass("calendar-isFull");
        						currentDate.attr("href","");
        					} else {
        						for (let i = 1; i < 10; i++){
        							if (data[i] != null){
        								currentDate.children(".calendar-price").text("$" + rm_price[i] + "-")
        								break;
        							}
        						}
        						currentDate.addClass("calendar-isEmpty");
        						let length = currentDate.attr("href").length;
        						let href = currentDate.attr("href").substring(0, length-1)+ $("#stay").val();
        						currentDate.attr("href", href);
        					}
                            currentDate.children("img").hide();
                         }
                    })
                } 
            }
            
            fetchAvalibility();
            
            $("#stay").change(function(){
            	 $(".calendar-price").text("");
            	 $(".calendar-default").removeClass("calendar-isFull calendar-isEmpty");
            	fetchAvalibility();
            })
        });

        </script>
</body>
</html>