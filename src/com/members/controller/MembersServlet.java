package com.members.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.*;
import com.members.model.MembersService;
import com.rooms.model.*;
import com.roomtype.model.RoomTypeService;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;

@MultipartConfig
@WebServlet("/MembersServlet")
public class MembersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MembersServlet() {
		super();
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text; charset=utf-8");
		PrintWriter out = res.getWriter();
		String action = req.getParameter("action").trim();
		RequestDispatcher dispatcher = null;
		InputStream is = null;
		
		if ("insert_member".equals(action)) {
			try {
				String mb_name = req.getParameter("mb_name").trim();
				String mb_acc = req.getParameter("mb_acc").trim();
				String mb_pwd = req.getParameter("mb_pwd").trim();
				String mb_bd_str = req.getParameter("mb_bd").trim();
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				Date mb_bd = new Date(df.parse(mb_bd_str).getTime());
				is = req.getPart("mb_pic").getInputStream();
				byte[] mb_pic = new byte[is.available()];
				is.read(mb_pic);
				String mb_phone = req.getParameter("mb_phone").trim();
				String mb_email = req.getParameter("mb_email").trim();

				String mb_city = req.getParameter("mb_city").trim();
				String mb_town = req.getParameter("mb_town").trim();
				String mb_address = req.getParameter("mb_address").trim();
				
				MembersService memberSvc = new MembersService();
				memberSvc.addNewMem(mb_name, mb_acc, mb_pwd, mb_bd, mb_pic, mb_phone, mb_email, mb_city, mb_town, mb_address);
				dispatcher = req.getRequestDispatcher("/frontend/members/memberCenter.jsp");
				req.setAttribute("msg", "啟用帳號連結已發送至註冊電子信箱");
				dispatcher.forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("msg", "請不要擅自繞過JavaScript驗證");
				dispatcher.forward(req, res);
			} finally {
				if (is != null) {
					is.close();
				}
			}
		}

		if ("update_member".equals(action)) {
			try {
				String mb_name = req.getParameter("mb_name").trim();
				String mb_bd_str = req.getParameter("mb_bd").trim();
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				Date mb_bd = new Date(df.parse(mb_bd_str).getTime());
				String mb_phone = req.getParameter("mb_phone").trim();
				String mb_email = req.getParameter("mb_email").trim();
				String mb_city = req.getParameter("mb_city").trim();
				String mb_town = req.getParameter("mb_town").trim();
				String mb_address = req.getParameter("mb_address").trim();
				String mb_id = req.getParameter("mb_id").trim();
				MembersService memberSvc = new MembersService();
				memberSvc.updateMem(mb_name, mb_bd, mb_phone, mb_email, mb_city, mb_town, mb_address, mb_id);
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("msg", "");
				dispatcher.forward(req, res);
			} 
		}

		if ("update_password".equals(action)) {
			try {
				String mb_name = req.getParameter("mb_name").trim();
				
				String mb_pwd = req.getParameter("mb_pwd");
				
				String mb_id = req.getParameter("mb_id").trim();
				MembersService memberSvc = new MembersService();
				memberSvc.updatePwd(mb_pwd, mb_id);
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("msg", "");
				dispatcher.forward(req, res);
			} 
		}

		if ("update_check_in".equals(action)) {
			try {
				String rm_no = req.getParameter("rm_no");
				String mb_id = req.getParameter("mb_id");
				RoomsService rmSvc = new RoomsService();
				rmSvc.updateCheckIn(rm_no, mb_id);
			} catch (Exception e) {
				e.printStackTrace();
				out.print("更新失敗");
			}
		}

		if ("delete_room".equals(action)) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("backend/rooms/roomInfo.jsp");
			try {
				String rm_no = req.getParameter("rm_no");
				String rm_type = req.getParameter("rm_type");
				RoomsService rmSvc = new RoomsService();
				rmSvc.delete(rm_no);
				RoomTypeService rmtypeSvc = new RoomTypeService();
				rmtypeSvc.updateRoomQty(rm_type, -1);
				req.setAttribute("msg", "房號" + rm_no + "已刪除");
				dispatcher.forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("msg", "刪除失敗");
				dispatcher.forward(req, res);
			}
		}

		if ("getall_by_status".equals(action)) {
			RequestDispatcher dispatcher = req.getRequestDispatcher(req.getContextPath() + "/roomsByStatus.jsp");
			try {
				List<RoomsVO> rooms = new ArrayList<>();
				String rm_status = req.getParameter("rm_status");
				RoomsService rmSvc = new RoomsService();
				rooms = rmSvc.getAllByStatus(rm_status);
				req.setAttribute("rooms", rooms);
				dispatcher.forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("error", "無符合條件之查詢結果");
				dispatcher.forward(req, res);
			}
		}

		if ("getall_by_rmtype".equals(action)) {
			RequestDispatcher dispatcher = req.getRequestDispatcher(req.getContextPath() + "/roomsByRmType.jsp");
			try {
				List<RoomsVO> rooms = new ArrayList<>();
				String rm_type = req.getParameter("rm_type");
				RoomsService rmSvc = new RoomsService();
				rooms = rmSvc.getAllByRmType(rm_type);
				req.setAttribute("rooms", rooms);
				dispatcher.forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("error", "無符合條件之查詢結果");
				dispatcher.forward(req, res);
			}
		}

		if ("getall".equals(action)) {
			RequestDispatcher dispatcher = req.getRequestDispatcher(req.getContextPath() + "/allRooms.jsp");
			try {
				List<RoomsVO> rooms = new ArrayList<>();
				RoomsService rmSvc = new RoomsService();
				rooms = rmSvc.getAll();
				req.setAttribute("rooms", rooms);
				dispatcher.forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("error", "無符合條件之查詢結果");
				dispatcher.forward(req, res);
			}
		}
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

}
