<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.roomtype.model.*"%>
<%@ page import="java.util.List"%>
<%
RoomTypeService rmtypeSvc = new RoomTypeService();
List<RoomTypeVO> rmtypeList = rmtypeSvc.getAll();
session.setAttribute("rmtypeList", rmtypeList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有房型 - All Room Types</title>
</head>
<style>
</style>
<body>
	<c:if test="${not empty msgs}">
		<ul>
			<c:forEach var="message" items="${msgs}">
				<li style="color: red; list-style: none;">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<c:choose>
		<c:when test="${rmtypeList.size() > 0}">
			<table>
				<tr>
					<th>房型編號</th>
					<th>房型名稱</th>
					<th>房型數量</th>
					<th>房型價格</th>
					<th>最多可入住人數</th>
					<th>房型資訊</th>
					<th>房型圖庫</th>
				</tr>
				<%
					String[] layer = {"odd", "even"};
				int number = 2;
				%>
				<c:forEach var="rmtypevo" items="${rmtypeList}">
					<tr class="<%=layer[number++ % 2]%>">
						<td class="rmtypeno">${rmtypevo.rm_type}</td>
						<td>${rmtypevo.type_name}</td>
						<td>${rmtypevo.rm_qty}</td>
						<td>${rmtypevo.rm_price}</td>
						<td>${rmtypevo.rm_capacity}</td>
						<td style="display: none">${rmtypevo.rm_info}</td>
						<td><input class="update btn btn-primary" type="button" value="修改"> <input
							type="hidden" name="rm_type" value="${rmtypevo.rm_type}">
							<input type="hidden" name="action" value="getOne_For_Update">
						</td>
						<td>
							<button class="showpic btn btn-info"
								value="<%=request.getContextPath() %>/backend/roompic/showAllRoomPic.jsp?rmtype-pic=${rmtypevo.rm_type}">查看房型照片</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
			<h3>查無資料</h3>
		</c:otherwise>
	</c:choose>
	<form class="update-display" method="post"
		action="${pageContext.request.contextPath}/RoomTypeServlet">
		<div class="update-display-div">
			<div class="close-icon">
				<i class="fas fa-times icon"></i>
			</div>
			<h3>
				房型編號：<b id="update-rmtype-no"></b>
			</h3>
			<label for="update-typename"><p>房型名稱</p> <input type="text"
				name="update-typename" id="update-typename" class="rm-input" max="9"
				min="1" autocomplete="off" required /></label> <label for="update-rmprice"><p>房型價格</p>
				<input type="number" name="update-rmprice" id="update-rmprice"
				class="rm-input" autocomplete="off" required /></label> <label
				for="update-rmcap"><p>最大入住人數</p> <select name="update-rmcap"
				id="update-rmcap" class="rm-select" required>
					<option value="2">2</option>
					<option value="4">4</option>
					<option value="6">6</option>
			</select></label> <label for="update-rminfo"><p>客房介紹</p> <textarea
					name="update-rminfo" class="rm-input" id="update-rminfo" required></textarea>
			</label>
			<input name="action" value="update_rm_type" style="display: none">
			<input id="update-rmtype" name="update-rmtype" type="text"
				style="display: none">
			<button class="updateRmTypeData" type="submit" style="width: 100%">更新資料</button>
		</div>
	</form>
	<div class="album-display">
		<div class="album-display-div">
			<div class="close-icon">
				<i class="fas fa-times icon"></i>
			</div>
			<iframe id="showroom"> </iframe>
		</div>
	</div>
	<script>
		$(".showpic").click(function() {
			$(".album-display").addClass("display-show")
			let src = $(this).val();
			$("#showroom").attr("src", src);
		})
		$(".update").click(function() {
			$(".update-display").addClass("display-show")
			let tr = $(this).parents("tr");
			let children = tr.children();
			$("#update-rmtype").val(children.eq(0).text());
			$("#update-rmtype-no").text(children.eq(0).text());
			$("#update-typename").val(children.eq(1).text());
			$("#update-rmprice").val(children.eq(3).text());
			$("#update-rmcap").val(children.eq(4).text()).change();
			$("#update-rminfo").val(children.eq(5).text());
		})
		$(".icon").click(function() {
			let display = $(this).parents(".display-show");
			display.removeClass("display-show");
			$("#showroom").attr("src", "");
		})
	</script>
</body>
</html>