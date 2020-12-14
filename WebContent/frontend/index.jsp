<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.members.model.*"%>
<%
	String sessionID = null;
String mb_email = null;
MembersVO member = null;
member = (MembersVO) session.getAttribute("member");

if (member == null) {
	Cookie[] cookieList = request.getCookies();
	if (cookieList != null) {
		for (int i = 0; i < cookieList.length; i++) {
	Cookie theCookie = cookieList[i];
	if (theCookie.getName().equals("diamond-session")) {
		sessionID = theCookie.getValue();
		application.getAttribute("logins");
	}
	if (theCookie.getName().equals("dmUser")) {
		mb_email = theCookie.getValue();
	}
		}
	}
	if (sessionID != null && mb_email != null) {
		MembersService memberSvc = new MembersService();
		member = memberSvc.getOneByMbEmail(mb_email);
		session.setAttribute("member", member);
	} else if (sessionID == null && mb_email != null) {
		Cookie dmresort_user = new Cookie("diamond-session", session.getId());
		dmresort_user.setMaxAge(24 * 60 * 60);
		response.addCookie(dmresort_user);
		pageContext.setAttribute("mb_email", mb_email);
	}
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/img/loading.png" />
<title>Diamond Resort</title>

<link
	href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap"
	rel="stylesheet" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	type="text/css" />
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/elegant-icons.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/flaticon.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/nice-select.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery-ui.min.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/magnific-popup.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/slick.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/slick-theme.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/slicknav.min.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css" type="text/css" />
</head>

<body>

	<div id="preloder">
		<img id="preloaderpic"
			src="${pageContext.request.contextPath}/img/loading.png" />
		<div class="loader"></div>
	</div>

	<div class="login-window-overlay"></div>

	<div class="login-window hide-login-window">
		<div class="cont">
			<form id="login-form" method="POST"
				action="<%=request.getContextPath()%>/MembersServlet">
				<div class="login-form sign-in">
					<h2>Welcome Back</h2>
					<label> <span><i class="fas fa-user-circle"></i></span> 
					<input type="email" id="mb_email" name="mb_email" autocomplete="false" />
					</label> 
					<label> <span><i class="fas fa-key"></i></span> 
					<input type="password" id="mb_pwd" name="mb_pwd" />
					</label>
					<p class="forgot-pass">
						<a href="">忘記密碼?</a>
					</p>
					<input type="text" name="pass" value="pass" style="display: none;" />
					<input type="text" name="action" value="member-login"
						style="display: none;" />
					<button type="submit" class="submit login-button">登入</button>
				</div>
			</form>
			<div class="sub-cont">
				<div class="img">
					<div class="img__text m--up">
						<h2>新訪客?</h2>
						<p>加入戴蒙尊榮會員，開始享受您的奢華假期!</p>
					</div>
					<div class="img__text m--in">
						<h2>會員？</h2>
						<p>如果您已是會員，點選會員登入吧！We've missed you!</p>
					</div>
					<div class="img__btn">
						<span class="m--up">註冊會員</span> <span class="m--in">會員登入</span>
					</div>
				</div>
				<form id="registration-form"
					action="${pageContext.request.contextPath}/frontend/members/registration.jsp" method="POST">
					<div class="form sign-up">
						<h2>期待您的加入</h2>
						<label> <span>姓(Last Name)</span> <input type="text"
							name="temp-lname" autocomplete="false" maxlength="20" required />
						</label> <label> <span>名(First Name)</span> <input type="text"
							name="temp-fname" autocomplete="false" maxlength="20" required />
						</label> <label> <span>EMAIL</span> <input type="email"
							id="temp-email" name="temp-email"
							pattern="^.+[\x40]{1}.+[.]{1}.*$" autocomplete="false" required />
						</label> <label> <span>密碼</span> <input type="password"
							id="temp-password" name="temp-password" required />
						</label> <label> <span>確認密碼</span> <input type="password"
							id="temp-confirm-password" name="temp-confirm-password" required />
						</label>
						<button type="submit" class="submit login-button">立即註冊</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<div class="offcanvas-menu-overlay"></div>
	<div class="canvas-open">
		<i class="icon_menu"></i>
	</div>
	<i class="fas fa-user-circle offcanvs-log-in"></i>
	<div class="offcanvas-menu-wrapper">
		<div class="canvas-close">
			<i class="icon_close"></i>
		</div>
		<div class="header-configure-area">
			<a href="#" class="bk-btn">立刻訂房</a>
		</div>
		<nav class="mainmenu mobile-menu">
			<ul>
				<li><a class="nav-event">住客專區</a>
					<ul class="dropdown">
						<li><a href="./activity.html">活動報名</a></li>
						<li><a href="">預約服務</a></li>
						<li><a href="">訂購餐點</a></li>
					</ul></li>
				<li><a href="shop.html" class="nav-evnet">戴蒙商城</a></li>
				<li><a class="nav-event" href="./rooms.html">客房介紹</a></li>
				<li><a class="nav-event" href="./pages.html">精彩活動</a>
					<ul class="dropdown">
						<li><a href="./room-details.html">陸上活動</a></li>
						<li><a href="./room-details.html">海上活動</a></li>
						<li><a href="./room-details.html">網紅行程</a></li>
					</ul></li>
				<li><a class="nav-event log-in">會員登入</a></li>
				<li><a href="" class="nav-event"
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
		<ul class="top-widget">
			<li><i class="fa fa-phone"></i> (12) 345 67890</li>
			<li><i class="fa fa-envelope"></i> info.colorlib@gmail.com</li>
		</ul>
	</div>


	<header class="header-section">
		<div class="menu-item">
			<div class="row">
				<div class="my-nav col-5">
					<div class="nav-menu">
						<nav class="mainmenu">
							<ul class="mainmenu-left row">
								
								<li class="col-6"><a class="nav-event">住客專區</a>
									<ul class="dropdown">
										<li><a href="#">活動報名</a></li>
										<li><a href="#">預約服務</a></li>
										<li><a href="#">訂購餐點</a></li>
									</ul></li>
								<li class="col-6"><a href="#" class="nav-evnet">戴蒙商城</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-12 logobox">
					<a href="${pageContext.request.contextPath}/frontend/index.jsp"><img
						src="${pageContext.request.contextPath}/img/logo.png" alt="" /> </a>
				</div>
				<div class="my-nav col-5">
					<div class="nav-menu">
						<nav class="mainmenu">
							<ul class="mainmenu-right row">
								<li class="col-4"><a class="nav-event"
									href="${pageContext.request.contextPath}/frontend/rooms/rooms.jsp">客房</a>
									<ul class="dropdown">
										<li><a href="#">戴蒙經典房</a></li>
										<li><a href="#">豪華蜜月房</a></li>
										<li><a href="#">奢華海景房</a></li>
										<li><a href="#">波賽頓套房</a></li>
										<li><a href="#">公共空間</a></li>
									</ul></li>
								<li class="col-4"><a class="nav-event" href="./pages.html">精彩活動</a>
									<ul class="dropdown">
										<li><a href="#">陸上活動</a></li>
										<li><a href="#">海上活動</a></li>
										<li><a href="#">網紅行程</a></li>
									</ul></li>
								<li class="col-4"><a class="nav-event"> <c:choose>
											<c:when test="${member != null}">${member.mb_name}</a>
									<ul class="dropdown">
										<li><a href="#">個人檔案</a></li>
										<li><a href="#">我的假期</a></li>
										<li><a href="#">歷史訂單</a></li>
										<li><a
											href="${pageContext.request.contextPath}/MembersServlet?mb_email=${member.mb_email}&action=member-logout">登出</a></li>
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
			</div>
		</div>
	</header>


	<section class="hero-section">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="hero-text">
						<h1 style="font-size: 60px; text-shadow: 1px 1px black">
							<b style="color: rgb(255, 217, 0)">Deluxe</b>Relax
						</h1>
						<p>全世界最棒的海島型度假村，全方位的體貼服務，享受帝王般的待遇！</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div class="homepage-video">
		<video width="condition" type="video/mp4" autoplay="autoplay"
			loop="loop" muted="muted">
			<source src="${pageContext.request.contextPath}/video/homepage.mp4"
				type="video/mp4" />
		</video>
	</div>
	<!-- Hero Section End -->
	<div class="booking">
		<form action="index.html" method="get">
			<div class="booking-form">
				<div class="box">
					<div class="check-date">
						<input type="text" class="date-input" id="date-in"
							autocomplete="off" placeholder="入住日期" /> <label for="date-in"><i
							class="icon_calendar"></i></label>
					</div>
				</div>
				<div class="box">
					<div class="check-date">
						<input type="text" class="date-input" id="date-out"
							autocomplete="off" placeholder="退房日期" /> <label for="date-out"><i
							class="icon_calendar"></i></label>
					</div>
				</div>
				<div class="box">
					<div class="select-option">
						<select id="guest">
							<option value="" disabled selected>入住人數</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
						</select>
					</div>
				</div>
				<div class="box">
					<div class="select-option">
						<select id="room">
							<option value="" disabled selected>客房數</option>
							<option value="">1</option>
							<option value="">2</option>
						</select>
					</div>
				</div>
				<div class="check-vacant-button">
					<button type="submit" id="check-room" class="vacant-check">空房查詢</button>
				</div>
			</div>
		</form>
	</div>
	<!-- About Us Section Begin -->
	<section class="news-section spad">
		<div class="container news-container">
			<div class="row">
				<div class="col-lg-4">
					<div class="about-text">
						<div class="section-title">
							<span>最新消息</span>
						</div>
						<p class="f-para">戴蒙頂級奢華度假村 - 全年都是完美之選。
							不單從度假村的全包式假期到探索在地特色景點，都給您前所未有的新發現。</p>
						<p class="s-para">
							從交通接送、舒適住房、三餐精緻饗宴、全日無限吧台享用飲品與輕食、豐富水陸活動與指導，還有晚間娛樂活動與表演… 戴蒙度假村
							將假期中的吃、喝、玩、樂、住都為您貼心規劃好，您只需按照您的時間與心情，自由選擇我們為您規劃好的活動！無論是與事業夥伴、昔日同窗或是好友同行，都能在這裡留下獨一無二的美好假期回憶！
						</p>
						<a href="about-us.html" class="primary-btn about-btn">了解更多..</a>
					</div>
				</div>
				<div class="col-lg-8">
					<div class="about-text">
						<div class="section-title">
							<span>網紅推薦</span>
						</div>
						<div class="testimonial-slider">
							<div class="ts-item">
								<p>
									房間很乾淨，明亮。床好睡，地毯乾淨。客房服務快速，要求更換新浴袍，5分鍾內即送達。這次住9478，沙發有嚴重被壓扁的現象，需換新椅子。
									還有早餐也改爲半自助（看菜單點早餐主食）沒有之前的「澎派」據說只有週末的早餐才會是原有的豪華自助餐型態。
									早餐時我共點了3次熱拿鐵，送來的每一杯的溫度都差很多，（溫涼的，熱的，超熱的），可能要再加強。我愛他們check out
									time 12:00,所以可以睡晚一點，吃完早餐再去游泳洗澡後再從容離開飯店。</p>
								<div class="ti-author">
									<div class="rating">
										<i class="icon_star"></i> <i class="icon_star"></i> <i
											class="icon_star"></i> <i class="icon_star"></i> <i
											class="icon_star-half_alt"></i>
									</div>
									<h5>- 大衛海鮮</h5>
								</div>
								<img
									src="${pageContext.request.contextPath}/img/testimonial-logo.png"
									alt="" />
							</div>
							<div class="ts-item">
								<p>首先我非常感謝迎賓櫃檯經理
									周昭安先生，他的服務、他的安排一掃解決我剛check-in的不愉快，真心的很謝謝他，也謝謝他知道我生日，送了一個非常美味的蛋糕～誏我的旅程增加了美好的驚喜～雖然看了很多評價説他們的服務人員態度不佳，但是我必須說他們還是有很多服務人員是非常好的，像是紫艷酒吧的晚上11點的服務先生，更特別感謝周昭安先生，謝謝你的服務令人讚賞！因為之前來台北都是住寒舍艾美，但是因為他「周昭安
									經理」我會選擇W Taipei hotel~~~</p>
								<div class="ti-author">
									<div class="rating">
										<i class="icon_star"></i> <i class="icon_star"></i> <i
											class="icon_star"></i> <i class="icon_star"></i> <i
											class="icon_star-half_alt"></i>
									</div>
									<h5>- 萬磁王</h5>
								</div>
								<img
									src="${pageContext.request.contextPath}/img/testimonial-logo.png"
									alt="" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section class="hp-room-section">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<span>絕美套房</span>
						<h2>在美景裡盡情享受</h2>
					</div>
				</div>
			</div>
			<div class="hp-room-items">
				<div class="row">
					<div class="col-lg-3 col-md-6">
						<div class="hp-room-item set-bg"
							data-setbg="${pageContext.request.contextPath}/img/resort/room/standard-room.jpg">
							<div class="hr-text">
								<h3>經典海景房</h3>
								<h2>
									20000$<span>/每晚</span>
								</h2>
								<table>
									<tbody>
										<tr>
											<td class="r-o">空間:</td>
											<td>500坪</td>
										</tr>
										<tr>
											<td class="r-o">人數:</td>
											<td>最多2人</td>
										</tr>
										<tr>
											<td class="r-o">一大床:</td>
											<td>150 * 200cm</td>
										</tr>
										<tr>
											<td class="r-o">房間特色:</td>
											<td>無限美麗海景</td>
										</tr>
									</tbody>
								</table>
								<a href="rooms.html" class="primary-btn">查看詳情</a>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="hp-room-item set-bg"
							data-setbg="${pageContext.request.contextPath}/img/resort/room/luxury-room.jpg">
							<div class="hr-text">
								<h3>豪華蜜月房</h3>
								<h2>
									30000$<span>/每晚</span>
								</h2>
								<table>
									<tbody>
										<tr>
											<td class="r-o">空間:</td>
											<td>550坪</td>
										</tr>
										<tr>
											<td class="r-o">人數:</td>
											<td>最多2人</td>
										</tr>
										<tr>
											<td class="r-o">一大床:</td>
											<td>200 * 200cm</td>
										</tr>
										<tr>
											<td class="r-o">房間特色:</td>
											<td>200公尺私人海灘</td>
										</tr>
									</tbody>
								</table>
								<a href="rooms.html" class="primary-btn">查看詳情</a>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="hp-room-item set-bg"
							data-setbg="${pageContext.request.contextPath}/img/resort/room/deluxe-room.jpeg">
							<div class="hr-text">
								<h3>奢華海景房</h3>
								<h2>
									50000$<span>/每晚</span>
								</h2>
								<table>
									<tbody>
										<tr>
											<td class="r-o">空間大小:</td>
											<td>600坪</td>
										</tr>
										<tr>
											<td class="r-o">人數:</td>
											<td>最多2人</td>
										</tr>
										<tr>
											<td class="r-o">一大床:</td>
											<td>250cm * 250cm</td>
										</tr>
										<tr>
											<td class="r-o">房間特色:</td>
											<td>提供個人遊艇</td>
										</tr>
									</tbody>
								</table>
								<a href="rooms.html" class="primary-btn">查看詳情</a>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="hp-room-item set-bg"
							data-setbg="${pageContext.request.contextPath}/img/resort/room/Poseidon_Index.jpg">
							<div class="hr-text">
								<h3>波賽頓套房</h3>
								<h2>
									100000$<span>/每晚</span>
								</h2>
								<table>
									<tbody>
										<tr>
											<td class="r-o">空間大小：</td>
											<td>無限</td>
										</tr>
										<tr>
											<td class="r-o">人數:</td>
											<td>最多2人</td>
										</tr>
										<tr>
											<td class="r-o">一大床</td>
											<td>250 * 300cm</td>
										</tr>
										<tr>
											<td class="r-o">房間特色:</td>
											<td>成為海底之王</td>
										</tr>
									</tbody>
								</table>
								<a href="rooms.html" class="primary-btn">查看詳情</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section class="services-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<span>房客專屬</span>
						<h2>享受帝王般的服務</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-12">
					<div class="service-item">
						<i class="flaticon-036-parking"></i>
						<h4>空中接送</h4>
						<p>戴蒙度假村有專屬直升機與特殊海關通行許可，讓您無需等待冗長的過關服務，直接由機場出發到您預定的房間。</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-12">
					<div class="service-item">
						<i class="flaticon-044-clock-1"></i>
						<h4>24HR客房服務</h4>
						<p>每分每秒有專業的服務人員替您服務，泰式MASSAGE，香氛精油SPA，讓您徹底放鬆。</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-12">
					<div class="service-item">
						<i class="flaticon-012-cocktail"></i>
						<h4>上門餐點</h4>
						<p>動一動手指，餐點很快就到你門口！</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Services Section End -->

	<!-- Footer Section Begin -->
	<footer class="footer-section">
		<div class="container">
			<div class="footer-text">
				<div class="row">
					<div class="col-lg-6 ft-info">
						<div class="ft-contact">
							<h6>聯繫我們</h6>
							<ul>
								<li>(08) 0857 9487</li>
								<li>DiamondResort@gmail.com</li>
								<li>Somewhere on the earth</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/slick.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/js/index.js"></script>
</body>
</html>
