<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.members.model.*"%>
<%@ page import="java.util.List"%>
<%
MembersService memberSvc = new MembersService();
List<MembersVO> members = memberSvc.getAll();
pageContext.setAttribute("members", members);
%>

<!DOCTYPE html>
<html>
<head>
<title>會員一覽 Show All Members</title>
<style>
th {
	position: sticky;
	top: 0;
}

.membertable table {
	margin: 0 auto;
	min-width: 95%;
}

.membertable thead th {
	position: sticky;
}

.membertable {
	height: 80vh;
	overflow: scroll;
}

.showmsg {
	width: 100%;
	height: 60px;
	margin: 0px auto;
	padding: 20px;
	position: relative;
}

.showmsg p {
	position: absolute;
	right: 5vw;
	bottom: 0px;
}

.showmsg p b {
	color: crimson;
}

#room_number {
	text-align-last: center;
	border-radius: 5px;
}

.member-info {
	padding: 10px;
	position: fixed;
	left: 50%;
	top: 20%;
	transform: translate(-50%);
	background-color: white;
	border: 3px solid black;
	height: fit-content;
	width: 60vw;
	height: fit-content;
}

.member-info h6 {
	text-align: left;
	width: fit-content;
	padding-left: 10px;
}
.member-update .update-display-div {
display:inline;
}
.mbpicdiv {
height:250px;
}
img {
	max-height: 100%;
	border-radius: 10px;
}
</style>
</head>
<body>
	<div>
		<div class="showmsg">
			<h3 class="">
				<%
					String msg = (String) request.getAttribute("msg");
				if (msg != null) {
				%>
				<%=msg%>
				<%}%>
			</h3>
			<p class="membertotal">
				當前查詢會員共<b><%=members.size()%></b>人
			</p>
		</div>
		<div class="membertable">
			<table>
				<thead class="firstTr">
					<tr>
						<th><input type="text" id="mb_id" maxlength="10"
							placeholder="會員編號" style="text-transform: uppercase"></th>
						<th>會員姓名</th>
						<th>會員帳號</th>
						<th>擁有積分</th>
						<th>帳號狀態</th>
						<th>會員詳情</th>
						<th>資料修改</th>
					</tr>
				</thead>
				<%
					String[] layer = { "odd", "even" };
				int number = 2;
				%>
				<tbody>
					<%-- <%@ include file="/backend/page.file"%> --%>
					<c:forEach var="member" items="${members}">
						<tr class="<%=layer[number++ % 2]%> ">
							<td class="mb_id" id="${member.mb_id}">${member.mb_id}</td>
							<td class="mb_name">${member.mb_name}</td>
							<td class="mb_acc">${member.mb_acc}</td>
							<td class="mb_point">${member.mb_point}</td>
							<td class="mb_status status-${member.mb_status}"><c:choose>
									<c:when test="${member.mb_status.equals('0')}">未啟用</c:when>
									<c:when test="${member.mb_status.equals('1')}">已啟用</c:when>
									<c:when test="${member.mb_status.equals('2')}">已鎖定</c:when>
									<c:otherwise>已死亡</c:otherwise>
								</c:choose></td>
							<td class="mb_bd" style="display: none">${member.mb_bd.toString()}</td>
							<td class="mb_phone" style="display: none">${member.mb_phone}</td>
							<td class="mb_email" style="display: none">${member.mb_email}</td>
							<td class="mb_city" style="display: none">${member.mb_city}</td>
							<td class="mb_town" style="display: none">${member.mb_town}</td>
							<td class="mb_address" style="display: none">${member.mb_address}</td>
							<td class="create_date" style="display: none">${member.create_date.toString()}</td>
							<td><button class="show-memberdetail btn btn-primary">查看</button></td>
							<td><button class="show-memberupdate btn btn-warning">修改</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<%-- <%@ include file="/backend/page2.file"%> --%>
	<div class="display-hide member-info">
		<div class="close-icon">
			<i class="fas fa-times icon"></i>
		</div>
		<h5 style="text-align: center">
			會員編號：<b id="detail-mbid" style="color: crimson"></b>
		</h5>
		<div class="memberphoto row">
			<div class="col-6">
				<h6>
					會員姓名：<b id="detail-mbname"></b>
				</h6>
				<h6>
					會員生日：<b id="detail-mbbd"></b>
				</h6>
				<h6>
					聯絡電話：<b id="detail-mbphone"></b>
				</h6>
				<h6>
					電子郵箱：<b id="detail-mbemail"></b>
				</h6>
				<h6>
					帳號創建日期：<b id="detail-createdate"></b>
				</h6>
				<h6>
					居住城市：<b id="detail-mbcity"></b>
				</h6>
				<h6>
					居住鄉鎮：<b id="detail-mbtown"></b>
				</h6>
				<h6>
					詳細地址：<b id="detail-mbaddress"></b>
				</h6>
			</div>
			<div class="col-6 mbpicdiv">
				<img id="detail-mbpic" src="">
			</div>
		</div>
	</div>

	<form class="display-hide member-update" method="post" enctype="multipart/form-data"
		action="${pageContext.request.contextPath}/MembersServlet">
		<div class="update-display-div">
			<div class="close-icon">
				<i class="fas fa-times icon"></i>
			</div>
			<h3>
				會員編號：<b id="update-mbID"></b>
			</h3>
			<label for="update-mbname">
				<p>會員姓名</p> 
				<input type="text" name="update-mbname" id="update-mbname" class="rm-input" max="9" min="1" autocomplete="off" required />
			</label>
			
			<label for="update-mbname">
				<p>會員生日</p> 
				<input type="date" name="update-mbbd" id="update-mbbd" class="rm-input" max="9" min="1" autocomplete="off" required />
			</label>
			
			<label for="update-mbphone">
				<p>聯絡號碼</p> 
				<input type="text" name="update-mbphone" id="update-mbphone" class="rm-input" max="9" min="1" autocomplete="off" required />
			</label>
			
			<label for="update-mbemail">
				<p>電子信箱</p> 
				<input type="email" name="update-mbemail" id="update-mbemail" class="rm-input" max="9" min="1" autocomplete="off" required />
			</label> 
			<label for="update-mbcity">
				<p>居住縣市</p> 
				<input type="text" name="update-mbcity" id="update-mbcity" class="rm-input" max="9" min="1" autocomplete="off" required />
			</label> 
			<label for="update-mbtown">
				<p>居住鄉鎮</p> 
				<input type="text" name="update-mbtown" id="update-mbtown" class="rm-input" max="9" min="1" autocomplete="off" required />
			</label> 
			<label for="update-mbaddress">
				<p>詳細地址</p> 
				<input type="text" name="update-mbaddress" id="update-mbaddress" class="rm-input" max="9" min="1" autocomplete="off" required />
			</label> 
			<label for="update-mbpic">
				<p>上傳個人圖片</p> 
				<input type="file" name="update-mbpic" id="update-mbpic" class="rm-input" max="9" min="1" autocomplete="off"/>
			</label> 
				 <input name="action" value="update_member" style="display: none"> 
				 <input id="update-mbid" name="update-mbid" type="text" style="display: none">
			<button class="sendUpdateData" type="submit" style="width: 100%">更新資料</button>
		</div>
	</form>
	<script src="${pageContext.request.contextPath}/js/member-backend.js"></script>
</body>
</html>