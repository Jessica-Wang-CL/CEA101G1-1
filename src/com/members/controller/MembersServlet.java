package com.members.controller;

import java.io.*;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.*;
import com.members.model.MembersService;
import com.members.model.MembersVO;
import com.payment.model.PaymentService;

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
		String action = req.getParameter("action").trim();
		RequestDispatcher dispatcher = null;
		InputStream is = null;

		if ("insert_member".equals(action)) {
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text; charset=utf-8");
			PrintWriter out = res.getWriter();
			try {
				String mb_name = req.getParameter("mb_lname").trim() + req.getParameter("mb_fname").trim();
				String mb_acc = req.getParameter("mb_acc").trim();
				String mb_pwd = req.getParameter("mb_pwd").trim();
				String mb_bd_str = req.getParameter("mb_bd").trim();
				DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
				Date mb_bd = new Date(df.parse(mb_bd_str).getTime());
				is = req.getPart("mb_pic").getInputStream();
				byte[] mb_pic = new byte[is.available()];
				is.read(mb_pic);
				String mb_phone = req.getParameter("mb_phone").trim();
				String mb_email = req.getParameter("mb_email").trim();

				String mb_city = req.getParameter("mb_city").trim();
				String mb_town = req.getParameter("mb_town").trim();
				String mb_address = req.getParameter("mb_address").trim();
				// payment vo
				MembersService memberSvc = new MembersService();
				memberSvc.addNewMem(mb_name, mb_acc, mb_pwd, mb_bd, mb_pic, mb_phone, mb_email, mb_city, mb_town,
						mb_address);

				MembersVO membervo = memberSvc.getOneByMbAcc(mb_acc);
				String mb_id = membervo.getMb_id();
				String card_name = req.getParameter("credit-card-name");
				String card_no = req.getParameter("cardnumber");
				String[] expire = req.getParameter("expirationdate").trim().split("/");
				String exp_mon = expire[0];
				String exp_year = expire[1];
				String csc = req.getParameter("csc");
				PaymentService paySvc = new PaymentService();
				paySvc.insertCrdt(mb_id, card_no, card_name, exp_mon, exp_year, csc);
				out.print("success");
			} catch (Exception e) {
				e.printStackTrace();
				out.print("fail");
			} finally {
				if (is != null) {
					is.close();
				}
				if (out != null) {
					out.close();
				}
			}
		}

		if ("update_member".equals(action)) {
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text; charset=utf-8");
			dispatcher = req.getRequestDispatcher("/backend/members/memberInfo.jsp");
			try {
				String mb_name = req.getParameter("update-mbname").trim();
				String mb_bd_str = req.getParameter("update-mbbd").trim();
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				Date mb_bd = new Date(df.parse(mb_bd_str).getTime());
				String mb_phone = req.getParameter("update-mbphone").trim();
				String mb_email = req.getParameter("update-mbemail").trim();
				String mb_city = req.getParameter("update-mbcity").trim();
				String mb_town = req.getParameter("update-mbtown").trim();
				String mb_address = req.getParameter("update-mbaddress").trim();
				String mb_id = req.getParameter("update-mbid").trim();
				System.out.println(mb_id);
				Part part = req.getPart("update-mbpic");
				MembersService memberSvc = new MembersService();
				if (part.getContentType() != null && part.getContentType().indexOf("image") >= 0) {
					is = req.getPart("update-mbpic").getInputStream();
					byte[] mb_pic = new byte[is.available()];
					is.read(mb_pic);
					memberSvc.updateMemPic(mb_id, mb_pic);
				}
				memberSvc.updateMem(mb_name, mb_bd, mb_phone, mb_email, mb_city, mb_town, mb_address, mb_id);
				req.setAttribute("msg", "更新成功");
				dispatcher.forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("msg", "更新失敗");
				dispatcher.forward(req, res);
			}
		}

		if ("update_password".equals(action)) {
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text; charset=utf-8");
			try {
				String mb_pwd = req.getParameter("mb_pwd").trim();
				String mb_id = req.getParameter("mb_id").trim();
				MembersService memberSvc = new MembersService();
				memberSvc.updatePwd(mb_pwd, mb_id);
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("msg", "更新失敗");
				dispatcher.forward(req, res);
			}
		}

		if ("update_status".equals(action)) {
			try {
				String mb_id = req.getParameter("mb_id").trim();
				String mb_status = req.getParameter("mb_status").trim();
				MembersService memberSvc = new MembersService();
				memberSvc.updateStatus(mb_id, mb_status);
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("msg", "更新失敗");
				dispatcher.forward(req, res);
			}
		}

		if ("update_picture".equals(action)) {
			try {
				String mb_id = req.getParameter("mb_id").trim();
				is = req.getPart("mb_pic").getInputStream();
				byte[] mb_pic = new byte[is.available()];
				is.read(mb_pic);
				MembersService memberSvc = new MembersService();
				memberSvc.updateMemPic(mb_id, mb_pic);
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("msg", "更新失敗");
				dispatcher.forward(req, res);
			}
		}

		if ("update_point".equals(action)) {
			try {
				String mb_id = req.getParameter("mb_id").trim();
				Integer mb_point = new Integer(req.getParameter("mb_point"));
				MembersService memberSvc = new MembersService();
				memberSvc.updateMemPoint(mb_id, mb_point);
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("msg", "更新失敗");
				dispatcher.forward(req, res);
			}
		}

		if ("email_confirm".equals(action)) {
			PrintWriter out = res.getWriter();
			try {
				String email = req.getParameter("email").trim();
				MembersService memberSvc = new MembersService();
				List<MembersVO> members = memberSvc.getAll();
				for (MembersVO member : members) {
					if (email.equals(member.getMb_email())) {
						res.setContentType("text; charset=utf-8");
						out.print("used");
						return;
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("msg", "更新失敗");
				dispatcher.forward(req, res);
			}
		}

		if ("member-login".equals(action)) {
			try {

			} catch (Exception e) {

			}
		}

		if ("getone_bymbacc".equals(action)) {
			dispatcher = req.getRequestDispatcher(req.getContextPath() + "/.jsp");
			try {
				MembersVO membervo = new MembersVO();
				String rm_acc = req.getParameter("mb_acc");
				MembersService memberSvc = new MembersService();
				membervo = memberSvc.getOneByMbAcc("mb_acc");
				req.setAttribute("member", membervo);
				dispatcher.forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("error", "無符合條件之查詢結果");
				dispatcher.forward(req, res);
			}
		}

		if ("getone_bymbid".equals(action)) {
			dispatcher = req.getRequestDispatcher(req.getContextPath() + "/.jsp");
			try {
				MembersVO membervo = new MembersVO();
				String rm_id = req.getParameter("mb_id");
				MembersService memberSvc = new MembersService();
				membervo = memberSvc.getOneByMbId("mb_id");
				req.setAttribute("member", membervo);
				dispatcher.forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("error", "無符合條件之查詢結果");
				dispatcher.forward(req, res);
			}
		}

		if ("getone_mbpic".equals(action)) {
			res.setContentType("img/jpg");
			String mb_id = req.getParameter("mb_id").trim();
			System.out.println(mb_id);
			MembersService memberSvc = new MembersService();
			byte[] mbpic = memberSvc.getOneByMbId(mb_id).getMb_pic();
			System.out.println(mbpic == null);
			if (mbpic != null) {
				res.getOutputStream().write(mbpic);
			} else {
				is = req.getServletContext().getResourceAsStream("/images/nodata/nodata.png");
				byte[] pic = new byte[is.available()];
				is.read(pic);
				res.getOutputStream().write(pic);
			}
			return;
		}
		if ("getall".equals(action)) {
			dispatcher = req.getRequestDispatcher(req.getContextPath() + "/.jsp");
			List<MembersVO> members = new ArrayList<>();
			try {
				MembersService memberSvc = new MembersService();
				members = memberSvc.getAll();
				req.setAttribute("member", members);
				dispatcher.forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("error", "無符合條件之查詢結果");
				dispatcher.forward(req, res);
			}
		}

		if ("getall_bystatus".equals(action)) {
			dispatcher = req.getRequestDispatcher(req.getContextPath() + "/.jsp");
			List<MembersVO> members = new ArrayList<>();
			try {
				String mb_status = req.getParameter("mb_status");
				MembersService memberSvc = new MembersService();
				members = memberSvc.getAllByStatus(mb_status);
				req.setAttribute("member", members);
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
