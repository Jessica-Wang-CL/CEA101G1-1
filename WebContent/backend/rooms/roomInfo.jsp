<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.rooms.model.*"%>
<%@ page import="java.util.List"%>
<%@ page import="com.roomtype.model.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/backend.css" />
<title>客房管理</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
</head>
<style>
.showAllRooms, .addRoomPic{
height:90vh
}
</style>
<body>
	<section class="wrapper">
		<ul class="tabs">
			<li class="active">客房查詢</li>
			<li>新增客房</li>
		</ul>

		<ul class="tab__content">
			<li class="active">
				<div class="content__wrapper">
					<div class="showAllRooms">
						<jsp:include page="showAllRooms.jsp" />
					</div>

				</div>
			</li>
			<li>
				<div class="content__wrapper">
					<div class="addRoomPic">
						<jsp:include page="addRoom.jsp" />
					</div>

				</div>
			</li>
		</ul>
	</section>

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script src="${pageContext.request.contextPath}/js/backend.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

</body>
</html>
