<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.members.model.*"%>
<%@ include file="/frontend/login.file"%> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="description" content="Sona Template" />
        <meta name="keywords" content="Sona, unica, creative, html" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Diamond Resort</title>
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/loading.png" />
        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet" />

        <!-- Css Styles -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
        <link
            rel="stylesheet"
            href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
            integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
            crossorigin="anonymous"
        />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/elegant-icons.css" type="text/css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaticon.css" type="text/css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css" type="text/css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.min.css" type="text/css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css" type="text/css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css" type="text/css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slick-theme.css" type="text/css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slick.css" type="text/css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/rooms.css" />
        <style>
            .allrooms {
            }
            .accordion {
                position: fixed;
                top: 120px;
                bottom: 0px;
                left: 0px;
                right: 0px;
                width: 80%;
                max-width: 1080px;
                height: 70vh;
                overflow: hidden;
                margin: 0px auto;
            }
            .accordion ul {
                width: 100%;
                display: table;
                table-layout: fixed;
                margin: 0;
                padding: 0;
            }
            .accordion ul li {
                display: table-cell;
                vertical-align: bottom;
                position: relative;
                width: 20%;
                height: 70vh;
                background-repeat: no-repeat;
                background-position: center center;
                transition: all 500ms ease;
                opacity: 0.5;
            }
            .accordion ul li div {
                display: block;
                overflow: hidden;
                width: 100%;
            }
            .accordion ul li div a {
                display: block;
                height: 100px;
                width: 100%;
                position: relative;
                z-index: 3;
                vertical-align: bottom;
                padding: 15px 20px;
                box-sizing: border-box;
                color: #fff;
                text-decoration: none;
                font-family: Open Sans, sans-serif;
                transition: all 200ms ease;
            }
            .accordion ul li div a * {
                opacity: 0;
                margin: 0;
                width: 100%;
                text-overflow: ellipsis;
                position: relative;
                z-index: 5;
                white-space: nowrap;
                overflow: hidden;
                -webkit-transform: translateX(-20px);
                transform: translateX(-20px);
                -webkit-transition: all 400ms ease;
                transition: all 400ms ease;
            }
            .accordion ul li div a h2 {
                font-family: Montserrat, sans-serif;
                text-overflow: clip;
                font-size: 24px;
                text-transform: uppercase;
                margin-bottom: 2px;
            }
            .accordion ul li div a p {
                font-size: 13.5px;
            }
            .accordion ul li:nth-child(1) {
                background-image: url("${pageContext.request.contextPath}/img/room/honeymoon/honeymoon.jpg");
                background-repeat: no-repeat;
                background-size: cover;
            }
            .accordion ul li:nth-child(2) {
                background-image: url("${pageContext.request.contextPath}/img/room/standard/standard2.jpg");
                background-repeat: no-repeat;
                background-size: cover;
            }
            .accordion ul li:nth-child(3) {
                background-image: url("${pageContext.request.contextPath}/img/room/deluxe/deluxe2.jpg");
                background-repeat: no-repeat;
                background-size: cover;
            }
            .accordion ul li:nth-child(4) {
                background-image: url("${pageContext.request.contextPath}/img/room/poseidon/poseidon.jpg");
                background-repeat: no-repeat;
                background-size: cover;
            }

            .accordion ul:hover li,
            .accordion ul:focus-within li {
                width: 8%;
            }

            .accordion ul:hover li:hover,
            .accordion ul li:focus,
            .accordion ul:focus-within li:focus {
                width: 60%;
            }
            .accordion ul:hover li:hover a,
            .accordion ul li:focus a,
            .accordion ul:focus-within li:focus a {
                background: rgba(0, 0, 0, 0.4);
            }
            .accordion ul:hover li:hover a *,
            .accordion ul li:focus a *,
            .accordion ul:focus-within li:focus a * {
                opacity: 1;
                -webkit-transform: translateX(0);
                transform: translateX(0);
            }
            .accordion ul:hover li {
                width: 8% !important;
            }
            .accordion ul:hover li a * {
                opacity: 0 !important;
            }
            .accordion ul:hover li:hover {
                width: 60% !important;
                opacity: 1;
            }
            .accordion ul:hover li:hover,
            li.hover {
                color: none;
            }
            .accordion ul:hover li:hover a {
                background: rgba(255, 255, 255, 0.575);
            }
            .accordion ul:hover li:hover a * {
                opacity: 1 !important;
            }
            /* @media screen and (max-width: 600px) {
                body {
                    margin: 0;
                }

                .accordion {
                    height: auto;
                }
                .accordion ul li,
                .accordion ul li:hover,
                .accordion ul:hover li,
                .accordion ul:hover li:hover {
                    position: relative;
                    display: table;
                    table-layout: fixed;
                    width: 100%;
                    -webkit-transition: none;
                    transition: none;
                }
            }
            .about {
                text-align: center;
                font-family: "Open Sans", sans-serif;
                font-size: 12px;
                color: #666;
            }
            .about a {
                color: blue;
                text-decoration: none;
            }
            .about a:hover {
                text-decoration: underline;
            } */
        </style>
    </head>

    <body>
        <!-- Page Preloder -->

        <div id="preloder">
            <img id="preloaderpic" src="${pageContext.request.contextPath}/img/loading.png" />
            <div class="loader"></div>
        </div>
        <!-- login-in-window 登入視窗 -->
		<%@ include file="/frontend/loginbox.file" %>
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
                <a href="#booking" class="bk-btn">立刻訂房</a>
            </div>
            <nav class="mainmenu mobile-menu">
                <ul>
                    <li>
                        <a class="nav-event">住客專區</a>
                        <ul class="dropdown">
                            <li><a href="./activity.html">活動報名</a></li>
                            <li><a href="">預約服務</a></li>
                            <li><a href="">訂購餐點</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="shop.html" class="nav-evnet">戴蒙商城</a>
                    </li>
                    <li>
                        <a class="nav-event" href="">精彩活動</a>
                        <ul class="dropdown">
                            <li><a>陸上活動</a></li>
                            <li><a>海上活動</a></li>
                            <li><a>網紅行程</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <div id="mobile-menu-wrap"></div>
            <div class="top-social">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-tripadvisor"></i></a>
                <a href="#"><i class="fa fa-instagram"></i></a>
            </div>
            <ul class="top-widget">
                <li><i class="fa fa-phone"></i> (12) 345 67890</li>
                <li><i class="fa fa-envelope"></i> info.colorlib@gmail.com</li>
            </ul>
        </div>
        <!-- Offcanvas Menu Section End -->

        <!-- Header Section Begin -->
        <header class="header-section">
            <div class="menu-item">
                <div class="row">
                    <div class="my-nav col-5">
                        <div class="nav-menu">
                            <nav class="mainmenu">
                                <ul class="mainmenu-left row">
                                    <li class="col-6">
                                        <a class="nav-event">住客專區</a>
                                        <ul class="dropdown">
                                            <li><a href="#">活動報名</a></li>
                                            <li><a href="#">預約服務</a></li>
                                            <li><a href="#">訂購餐點</a></li>
                                        </ul>
                                    </li>
                                    <li class="col-6">
                                        <a href="shop.html" class="nav-evnet">戴蒙商城</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-12 logobox">
                            <a href="${pageContext.request.contextPath}/frontend/index.jsp">
                                <img src="${pageContext.request.contextPath}/img/logo.png" alt="" />
                            </a>
                    </div>
                    <div class="my-nav col-5">
                        <div class="nav-menu">
                            <nav class="mainmenu">
                                <ul class="mainmenu-right row">
                                    <li class="col-6">
                                        <a class="nav-event" href="#">精彩活動</a>
                                        <ul class="dropdown">
                                            <li><a href="#">陸上活動</a></li>
                                            <li><a href="#">海上活動</a></li>
                                            <li><a href="#">網紅行程</a></li>
                                        </ul>
                                    </li>
                                    <li class="col-6"><a class="nav-event"> <c:choose>
											<c:when test="${member != null}">${member.mb_name}</a>
												<ul class="dropdown">
													<li><a href="#">個人檔案</a></li>
													<li><a href="#">我的假期</a></li>
													<li><a href="#">歷史訂單</a></li>
													<li><a href="${pageContext.request.contextPath}/MembersServlet?mb_email=${member.mb_email}&action=member-logout">登出</a></li>
												</ul></li>
								</c:when>
								<c:otherwise>
									<i class="fas fa-user-circle log-in"></i></a>
								</c:otherwise>
								</c:choose>
								</li>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Header End -->
        
        <!-- Booking form -->
        <section class="page-content">
            <	qw	qwertyu  div class="allrooms">
                <div class="accordion">
                    <ul>
                        <li tabindex="1">
                            <div>
                                <a href="#">
                                    <h2>Lorem Ipsum</h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
                                </a>
                            </div>
                        </li>
                        <li tabindex="2">
                            <div>
                                <a href="#">
                                    <h2>Lorem Ipsum</h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
                                </a>
                            </div>
                        </li>
                        <li tabindex="3">
                            <div>
                                <a href="#">
                                    <h2>Lorem Ipsum</h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
                                </a>
                            </div>
                        </li>
                        <li tabindex="4">
                            <div>
                                <a href="#">
                                    <h2>Lorem Ipsum</h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="room-section row">
                <div class="room-slider col-8">
                    <div class="slideshow-pic">
                        <div class="item">
                            <img src="${pageContext.request.contextPath}/img/room/standard/standard.jpg" />
                        </div>
                        <div class="item">
                            <img src="${pageContext.request.contextPath}/img/room/standard/standard1.jpg" />
                        </div>
                        <div class="item">
                            <img src="${pageContext.request.contextPath}/img/room/standard/standard2.jpg" />
                        </div>
                        <div class="item">
                            <img src="${pageContext.request.contextPath}/img/room/standard/standard3.jpg" />
                        </div>
                    </div>
                    <div class="slider-nav">
                        <div class="item">
                            <img src="${pageContext.request.contextPath}/img/room/standard/standard.jpg" />
                        </div>
                        <div class="item">
                            <img src="${pageContext.request.contextPath}/img/room/standard/standard1.jpg" />
                        </div>
                        <div class="item">
                            <img src="${pageContext.request.contextPath}/img/room/standard/standard2.jpg" />
                        </div>
                        <div class="item">
                            <img src="${pageContext.request.contextPath}/img/room/standard/standard3.jpg" />
                        </div>
                    </div>
                </div>
                <div class="room-info col-4">
                    <div class="room-tag">
                        <h3>標準海景房</h3>
                        <span class="room-price"><b>$20000</b> TWD / NIGHT</span>
                    </div>
                    <p>
                        設計以藍色為基調，充分感受沖繩的海洋氣息。房內空間約200平方公尺，客廳擁有舒適高質感的沙發、65吋電視，搭配琉球榻榻米的和式空間，提供您舒適自在的空間。可以容納4人的寬敞客房，每個人都能選擇自己喜歡的方式度過悠閒時光。徐徐南風吹過客廳，在沙發椅午歇是最棒的享受。打開浴室窗戶，您可以一邊泡澡一邊欣賞窗外庭園景致、聆聽鳥兒歌唱。
                    </p>
                    <h6>最多住宿人數</h6>
                    <p>2位</p>
                    <h6>客房設備</h6>
                    <p>
                        電視/衛星播放頻道/CS通信衛星頻道/電話/熱水壺/茶具組/冰箱/吹風機/免治馬桶/沐浴乳/洗髮乳/潤髮乳/身體乳液/臉部及洗手皂/牙刷組/刮鬍刀/浴帽/梳子/磨甲刀/放大化妝鏡/體重計/咖啡機/飾品盤/加濕空氣清淨機/毛巾/浴巾/睡袍/拖鞋/保險箱/傘/Bose
                        藍芽/除臭噴霧
                    </p>
                    <a class="btn-wow" href="#">查看空房<span></span></a>
                </div>
            </div>
        </section>
        <!-- <div class="room-section">
            <div class="room-info">
                <p>
                    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Laborum nisi, itaque consequatur sapiente
                    nam soluta praesentium quaerat, exercitationem reprehenderit dolorem, iusto atque ut obcaecati!
                    Ipsam culpa architecto commodi dolore sunt?
                </p>
            </div>
            <section class="strips strip0">
                <article class="strips__strip">
                    <div class="strip__content">
                        <div class="split-slideshow0">
                            <div class="slideshow">
                                <div class="slider">
                                    <div class="item">
                                        <img src="img/room/standard/standard.jpg" />
                                    </div>
                                    <div class="item">
                                        <img src="img/room/standard/standard1.jpg" />
                                    </div>
                                    <div class="item">
                                        <img src="img/room/standard/standard2.jpg" />
                                    </div>
                                    <div class="item">
                                        <img src="img/room/standard/standard3.jpg" />
                                    </div>
                                </div>
                            </div>
                            <div class="slideshow-text">
                                <div class="item">STANDARD</div>
                                <div class="item">LIVING ROOM</div>
                                <div class="item">BATHROOM</div>
                                <div class="item">OUTDOOR</div>
                            </div>
                        </div>
                        <h1 class="strip__title" data-name="Lorem"></h1>

                        <div class="strip__inner-text">
                            <p>
                                Featuring a bath area twice as large as in other rooms, this maisonette-style room
                                provides a living area that is furnished for in-room dining, and still features a
                                floor-level lounge sofa for enjoying the view. Only five of these rooms are available.
                                The bath area features a sofa instead of a bench for added comfort after a soak. Tatami
                                flooring made of rush straw fills the room with a fresh earthy scent.
                            </p>
                        </div>
                    </div>
                </article>
                <img src="img/close_x.png" class="strip__close" alt="" />
            </section>
        </div> -->

        <!-- <section class="strip strip1">
            <article class="strips__strip">
                <div class="strip__content">
                    <div class="split-slideshow1">
                        <div class="slideshow">
                            <div class="slider">
                                <div class="item">
                                    <img src="img/room/honeymoon/honeymoon.jpg" />
                                </div>
                                <div class="item">
                                    <img src="img/room/honeymoon/honeymoon1.jpg" />
                                </div>
                            </div>
                        </div>
                        <div class="slideshow-text">
                            <div class="item">COUPLE</div>
                            <div class="item">LIVING ROOM</div>
                        </div>
                    </div>
                    <div class="strip__inner-text"></div>
                </div>
            </article>
        </section>
        <section class="strip strip2">
            <article class="strips__strip">
                <div class="strip__content">
                    <div class="split-slideshow2">
                        <div class="slideshow">
                            <div class="slider">
                                <div class="item">
                                    <img src="img/room/deluxe/deluxe.jpeg" />
                                </div>
                                <div class="item">
                                    <img src="img/room/deluxe/deluxe1.jpg" />
                                </div>
                                <div class="item">
                                    <img src="img/room/deluxe/deluxe2.jpg" />
                                </div>
                            </div>
                        </div>
                        <div class="slideshow-text">
                            <div class="item">DELUXE</div>
                            <div class="item">LIVING ROOM</div>
                            <div class="item">BATHROOM</div>
                        </div>
                    </div>
                    <div class="strip__inner-text"></div>
                </div>
            </article>
        </section>
        <section class="strip strip3">
            <article class="strips__strip">
                <div class="strip__content">
                    <div class="split-slideshow3">
                        <div class="slideshow">
                            <div class="slider">
                                <div class="item">
                                    <img src="img/room/poseidon/poseidon.jpg" />
                                </div>
                                <div class="item">
                                    <img src="img/room/poseidon/poseidon1.jpg" />
                                </div>
                                <div class="item">
                                    <img src="img/room/poseidon/poseidon2.jpg" />
                                </div>
                                <div class="item">
                                    <img src="img/room/poseidon/poseidon4.jpg" />
                                </div>
                            </div>
                        </div>
                        <div class="slideshow-text">
                            <div class="item">POSEIDON</div>
                            <div class="item">LIVING ROOM</div>
                            <div class="item">BATHROOM</div>
                            <div class="item">OUTDOOR</div>
                        </div>
                    </div>
                    <div class="strip__inner-text"></div>
                </div>
            </article>
           
        </section> -->

        <!-- Js Plugins -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="${pageContext.request.contextPath}/js/slick.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.mousewheel.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
        <script src="${pageContext.request.contextPath}/js/room.js"></script>
    </body>
</html>
