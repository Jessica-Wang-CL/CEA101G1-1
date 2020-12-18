<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Diamond Resort 後台管理</title>
        <link rel="icon" type="image/png" href="<%=request.getContextPath()%>/img/loading.png" />
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/backend_sidebar.css" />
        <script src="https://kit.fontawesome.com/dc3c868026.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="page-wrapper chiller-theme toggled">
            <a id="show-sidebar" class="btn btn-sm btn-dark" href="#"> <i class="fas fa-bars"></i> </a>
            <nav id="sidebar" class="sidebar-wrapper">
                <div class="sidebar-content">
                    <div class="sidebar-brand">
                        <img src="<%=request.getContextPath()%>/img/logo.png" alt="" />
                        <div id="close-sidebar">
                            <i class="fas fa-times"></i>
                        </div>
                    </div>

                    <div class="sidebar-header">
                        <div class="user-pic">
                            <img class="img-responsive img-rounded emp-pic" src="<%=request.getContextPath()%>/img/avatar-1.jpg" alt="User picture" />
                        </div>
                        <div class="user-info">
                            <span class="emp-name">員工姓名<span class="emp-title">職稱</span></span>

                            <span class="user-status"> <i class="fa fa-circle"></i> <span>Online</span> </span>
                        </div>
                    </div>

                    <div class="sidebar-menu">
                        <ul>
                            <li class="header-menu"><span>員工功能</span></li>
                            <li>
                                <a href="#"> <i class="fa fa-user"></i> <span>個人資訊</span> </a>
                            </li>
                            <li class="header-menu"><span>戴蒙度假村系統</span></li>
                            <li>
                                <a href="#"> <i class="fa fa-user"></i> <span>員工管理</span> </a>
                            </li>
                             <li>
                                <a href="<%=request.getContextPath()%>/backend/members/memberInfo.jsp"> <i class="fa fa-user"></i> <span>會員管理</span> </a>
                            </li>
                            <li class="sidebar-dropdown">
                                <a href="#"> <i class="fa fa-file-alt"></i> <span>渡假村資料管理</span> </a>
                                <div class="sidebar-submenu">
                                    <ul>
                                        <li><a href="<%=request.getContextPath()%>/backend/roomtype/roomTypeInfo.jsp">房型</a></li>
                                        <li><a href="<%=request.getContextPath()%>/backend/rooms/roomInfo.jsp">客房</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="sidebar-dropdown">
                                <a href="#"> <i class="fa fa-bell"></i> <span>前台房務系統</span> </a>
                            </li>
                            <li class="sidebar-dropdown">
                                <a href="#"> <i class="fa fa-users"></i> <span>會員管理系統</span> </a>
                            </li>
                            <li class="sidebar-dropdown">
                                <a href="#"> <i class="fas fa-utensils"></i> <span>餐飲管理</span> </a>
                            </li>
                            <li class="sidebar-dropdown">
                                <a href="#"> <i class="fa fa-user-tie"></i> <span>服務管理</span> </a>
                                <div class="sidebar-submenu">
                                    <ul>
                                        <li><a href="#">功能 1</a></li>
                                        <li><a href="#">功能 2</a></li>
                                        <li><a href="#">功能 3</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="sidebar-dropdown">
                                <a href="#"> <i class="fas fa-snowboarding"></i> <span>活動管理</span> </a>
                                <div class="sidebar-submenu">
                                    <ul>
                                        <li><a href="#">功能 1</a></li>
                                        <li><a href="#">功能 2</a></li>
                                        <li><a href="#">功能 3</a></li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
        <div class="page-content"></div>
    </body>
</html>
