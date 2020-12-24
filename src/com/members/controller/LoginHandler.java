package com.members.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.Base64.Decoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.members.model.MembersService;
import com.members.model.MembersVO;

import security.SecureUtils;

/**
 * Servlet implementation class LoginHandler
 */
@MultipartConfig
@WebServlet("/LoginHandler")
public class LoginHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action").trim();
		
		if ("member-login".equals(action)) {
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			SecureUtils security = new SecureUtils();
			HttpSession user_session = req.getSession();
			try {
				String mb_email = req.getParameter("mb_email").trim();
				String mb_pwd = req.getParameter("mb_pwd").trim();
				String pass = req.getParameter("pass");
				MembersService memberSvc = new MembersService();
				MembersVO member = memberSvc.getOneByMbEmail(mb_email);
				if (member == null) {
					res.setContentType("text; charset=utf8");
					out.print("email_not_found");
					return;
				}
				Decoder decoder = Base64.getDecoder();
				byte[] salt = decoder.decode(member.getMb_salt());
				if (!member.getMb_pwd().equals(security.getSecurePassword(mb_pwd, salt))) {
					res.setContentType("text; charset=utf8");
					out.print("pwd_incorrect");
					return;
				}
				if ("pass".equals(pass)) { // 如果通過就存使用者的SeesionID 和 電子郵件 在Cookie裏，用於自動判斷登入
					String sessionID = req.getSession().getId(); // 獲取使用者的sessionID
					Cookie user_session_cookie = new Cookie("diamond-session", sessionID);
					Cookie dmUser = new Cookie("dmUser", member.getMb_email());
					user_session_cookie.setMaxAge(24 * 60 * 60); // 設定cookie存活時間為1天
					res.addCookie(user_session_cookie); // 加入cookie到使用者瀏覽器
					res.addCookie(dmUser);
					Object location = user_session.getAttribute("location"); // 查看使用者是否有登入前的頁面
					if (location == null) {
						location = req.getParameter("location"); // 如果沒有的話，表示使用者是使用小人頭登入，找到來源網頁
					}
					req.getSession().setAttribute("member", member);
					res.sendRedirect((String) location);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if ("member-logout".equals(action)) {
			res.setCharacterEncoding("UTF-8");
			Cookie dmUser = new Cookie("dmUser", "");
			String location = req.getParameter("location");
			req.getSession().removeAttribute("member");
			dmUser.setMaxAge(0);
			res.addCookie(dmUser);
			res.sendRedirect(location);
		}
	}

}
