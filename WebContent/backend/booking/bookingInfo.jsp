<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/backend/backend_header.file" %> <!-- 加入常用 css -->
<title>預約訂房實況</title>
</head>
<body>
<%@ include file="/backend/backend_sidebar.file" %>
	<section class="wrapper">
		<ul class="tabs">
			<li class="active">客房預約狀況</li>
		</ul>

		<ul class="tab__content">
			<li class="active">
				<div class="content__wrapper">
					<div class="table-wrapper">
						<jsp:include page="showBookingOrder.jsp" />
					</div>
				</div>
			</li>
		</ul>
	</section>

	<%@ include file="/backend/backend_footer.file" %> <!-- 加入常用 js -->
	<script src="${pageContext.request.contextPath}/js/backend.js"></script>
</body>
</html>
