<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.roomtype.model.*"%>
<%@ page import="java.util.List"%>
<%@ include file="/backend/backend_header.file" %> <!-- 加入常用 css -->
<title>房型管理</title>
</head>
<body>
<%@ include file="/backend/backend_sidebar.file" %>
	<section class="wrapper">
		<ul class="tabs">
			<li class="active">所有房型</li>
			<li>上傳房型照片</li>
			<li>新增房型</li>
		</ul>

		<ul class="tab__content">
			<li class="active">
				<div class="content__wrapper">
					<div class="table-wrapper">
						<jsp:include page="showAllRoomTypes.jsp" />
					</div>
				</div>
			</li>
			<li>
				<div class="content__wrapper">
					<jsp:include page="addRoomTypePic.jsp" />
				</div>
			</li>
			<li>
				<div class="content__wrapper">
					<jsp:include page="addRoomType.jsp" />
				</div>
			</li>
		</ul>
	</section>

	<%@ include file="/backend/backend_footer.file" %> <!-- 加入常用 js -->
	<script src="${pageContext.request.contextPath}/js/backend.js"></script>
</body>
</html>
