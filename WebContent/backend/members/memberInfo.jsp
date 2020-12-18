<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.members.model.*"%>
<%@ page import="java.util.List"%>
<%@ include file="/backend/backend_header.file" %> <!-- 加入常用 css -->
<title>會員管理</title>
</head>
<body>
<%@ include file="/backend/backend_sidebar.file" %>
	<section class="wrapper">
		<ul class="tabs">
			<li class="active">會員資料中心</li>
		</ul>

		<ul class="tab__content">
			<li class="active">
				<div class="content__wrapper">
					<div class="table-wrapper">
						<jsp:include page="showAllMembers.jsp" />
					</div>
				</div>
			</li>
		</ul>
	</section>
	<%@ include file="/backend/backend_footer.file" %> <!-- 加入常用 js -->
	<script src="${pageContext.request.contextPath}/js/backend.js"></script>
</body>
</html>
