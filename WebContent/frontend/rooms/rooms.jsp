<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.roomtype.model.*"%>
<%@ page import="java.util.List" %>
<%
RoomTypeService rmtypeSvc = new RoomTypeService();
List<RoomTypeVO> rmtypeList = rmtypeSvc.getAll();
pageContext.setAttribute("rmtypeList", rmtypeList);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/elegant-icons.css"
	type="text/css" />
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/slicknav.min.css"
	type="text/css" />
<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/img/loading.png" />
<title>Rooms</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/rooms.css" />
</head>
<style>
.et-hero-tabs {
	background-image: url(<%=request.getContextPath()%>/img/background_beach.jpg);
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}
</style>
<body>
<%@ include file="/frontend/login.file" %>
<%@ include file="/frontend/loginbox.file" %>
	<div id="preloder">
		<img id="preloaderpic"
			src="<%=request.getContextPath()%>/img/loading.png" />
		<div class="loader"></div>
	</div>
	
	<!-- Offcanvas Menu Section Begin -->
	<div class="offcanvas-menu-overlay"></div>
	<div class="canvas-open">
		<i class="icon_menu"></i>
	</div>
	<div class="offcanvas-menu-wrapper">
		<div class="canvas-close">
			<i class="icon_close"></i>
		</div>

		<div class="header-configure-area">
			<a href="#" class="bk-btn">查看空房</a>
		</div>
		<nav class="mainmenu mobile-menu">
			<ul>
				<li><a
					href="<%=request.getContextPath()%>/members/memberCenter.jsp"
					class="nav-event">會員中心</a>
					<ul class="dropdown">
						<li><a href="./room-details.html">個人檔案</a></li>
						<li><a href="./blog-details.html">我的假期</a></li>
					</ul></li>
				<li><a href="#" class="nav-event">住客專區</a>
					<ul class="dropdown">
						<li><a href="#">活動報名</a></li>
						<li><a href="#">預約服務</a></li>
						<li><a href="#">訂購餐點</a></li>
					</ul></li>
				<li><a href="#" class="nav-evnet">戴蒙商城</a></li>
				<li><a class="nav-event" href="">客房</a>
					<ul class="dropdown">
						<li><a href="#">戴蒙經典房</a></li>
						<li><a href="#">豪華蜜月房</a></li>
						<li><a href="#">奢華海景房</a></li>
						<li><a href="#">波賽頓套房</a></li>
					</ul></li>
				<li><a class="nav-event" href="">精彩活動</a>
					<ul class="dropdown">
						<li><a href="./room-details.html">陸上活動</a></li>
						<li><a href="./room-details.html">海上活動</a></li>
						<li><a href="./room-details.html">網紅行程</a></li>
					</ul></li>
				<li><a href="#" class="nav-event">會員登入</a></li>
				<li><a href="#" class="nav-event"
					style="color: rgb(240, 218, 162)">加入會員</a></li>
			</ul>
		</nav>
		<div id="mobile-menu-wrap"></div>
		<div class="top-social">
			<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
				class="fa fa-twitter"></i></a> <a href="#"><i
				class="fa fa-tripadvisor"></i></a> <a href="#"><i
				class="fa fa-instagram"></i></a>
		</div>
	</div>
	<!-- Offcanvas Menu Section End -->

	<!-- Header Section Begin -->
	<header class="header-section" id="tab-top">
		<div class="menu-item">
			<div class="nav-menu">
				<nav class="mainmenu">
					<ul class="mainmenu-row">
						<li class="nav-list"><a href="#" class="nav-evnet">最新消息</a></li>
						<li class="nav-list"><a class="nav-event">住客專區</a>
							<ul class="dropdown">
								<li><a href="#">活動報名</a></li>
								<li><a href="#">預約服務</a></li>
								<li><a href="#">訂購餐點</a></li>
							</ul></li>
						<li class="nav-list"><a href="#" class="nav-evnet">戴蒙商城</a></li>
						<div class="logobox">
							<a href="${pageContext.request.contextPath}/frontend/index.jsp"><img
								src="${pageContext.request.contextPath}/img/logo.png" />
							</a>
						</div>
						<li class="nav-list"><a class="nav-event"
							href="${pageContext.request.contextPath}/frontend/rooms/rooms.jsp">客房</a>
							<ul class="dropdown">
								<li><a href="#">戴蒙經典房</a></li>
								<li><a href="#">豪華蜜月房</a></li>
								<li><a href="#">奢華海景房</a></li>
								<li><a href="#">波賽頓套房</a></li>
								<li><a href="#">公共空間</a></li>
							</ul></li>
						<li class="nav-list"><a class="nav-event" href="./pages.html">精彩活動</a>
							<ul class="dropdown">
								<li><a href="#">陸上活動</a></li>
								<li><a href="#">海上活動</a></li>
								<li><a href="#">網紅行程</a></li>
							</ul></li>
						<li class="nav-list"><a class="nav-event"> <c:choose>
									<c:when test="${member != null}">${member.mb_name}</a>
							<ul class="dropdown">
								<li><a href="#">個人檔案</a></li>
								<li><a href="#">我的假期</a></li>
								<li><a href="#">歷史訂單</a></li>
								<li><a
									href="${pageContext.request.contextPath}/MembersServlet?mb_email=${member.mb_email}&action=member-logout&location=${pageContext.request.requestURI}">登出</a></li>
							</ul></li>
						</c:when>
						<c:otherwise>
							<i class="fas fa-user-circle log-in"></i>
							</a>
						</c:otherwise>
						</c:choose>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<!-- Hero -->
	<section class="et-hero-tabs">
		<h1>DAIMOND RESORT</h1>
		<h3>Enjoy the stuning view in our resort</h3>
		<div class="et-hero-tabs-container">
			<a class="et-hero-tab" href="#tab-top">TOP</a> 
			<c:forEach var="rmtype" items="${rmtypeList}">
			<a class="et-hero-tab" href="#tab${rmtype.rm_type}">${rmtype.type_eng_name}</a> 
			</c:forEach>
			<span class="et-hero-tab-slider"></span>
		</div>
	</section>
	<jsp:useBean id="rmpicSvc" scope="page" class="com.roompic.model.RoomPicService"/>
	<!-- Main -->
	<main class="et-main">
			<c:forEach var="rmtype" items="${rmtypeList}">
			<section class="et-slide" id="tab${rmtype.rm_type}">
			<div class="room-info">
				<h1>${rmtype.type_name}</h1>
				<h3>${rmtype.type_eng_name}</h3>
				<h6>查看詳情</h6>
				<div class="check-detail-arrow">
					<img class="dropdown"
						src="${pageContext.request.contextPath}/img/drop-down-arrow.svg"
						alt="" />
				</div>
				<div class="room-detail-info">
					<h4>${rmtype.rm_info_title}</h4>
					<br />
					<p>
						${rmtype.rm_info}
					</p>
					<h6>每晚價格</h6>
					<b>\$${rmtype.rm_price}</b>
				</div>
			</div>
			<div class="et-background">
				<ul class="cb-slideshow">
					<c:forEach var="rmtypepics" items="${rmpicSvc.getAllByRoomType(rmtype.rm_type)}" begin="0" end="3">
					<li><span><img src="${pageContext.request.contextPath}/RoomPicServlet?rmpicno=${rmtypepics.rm_pic_no}&action=getOneRmPic" /></span></li>
					</c:forEach>
				</ul>
			</div>
		</section>
			</c:forEach>
		
	</main>
	<div class="booking-now">
		<div id="check-date">
			<a href="#available"><button >查看剩餘空房</button></a>
		</div>
		<div>
			<div id="available"><img class="booking-icon"
				src="<%=request.getContextPath()%>/img/reserve-en-black-pc.svg" /></div>
		</div>
	</div>
	<div class="calendar-available">
		<jsp:include page="/frontend/roomrsv/available.jsp"/>
	</div>
	<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.datetimepicker.full.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/slick.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/js/rooms.js"></script>
	<script>
		$("#check-date a button").click(function(){
			$("div.calendar-available").addClass("show-calendar");
		})
		
		$(".close-calendar").click(function(){
			$("div.calendar-available").removeClass("show-calendar");
		})
	</script>
</body>
</html>
