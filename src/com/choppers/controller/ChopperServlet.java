package com.choppers.controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.choppers.model.*;

@MultipartConfig
@WebServlet("/ChopperServlet")
public class ChopperServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ChopperServlet() {
		super();
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text; charset=utf-8");
		PrintWriter out = res.getWriter();
		String action = req.getParameter("action").trim();
		BufferedInputStream bis = null;

		if ("insert_chopper".equals(action)) {
			String chop_no = req.getParameter("chop_no");
			if (chop_no.length() == 0 | chop_no.length() > 2) {
				out.print("編號超出規定長度");
				return;
			}
			Part part = req.getPart("chop_pic");
			bis = new BufferedInputStream(part.getInputStream());
			byte[] chop_pic = new byte[bis.available()];
			bis.read(chop_pic);
			String chop_name = req.getParameter("chop_name");
			ChoppersService chopSvc = new ChoppersService();
			chopSvc.addChopper(chop_no, chop_pic, chop_name);
		}

		if ("update_chopper".equals(action)) {
			String chop_no = req.getParameter("chop_no");
			Part part = req.getPart("chop_pic");
			bis = new BufferedInputStream(part.getInputStream());
			byte[] chop_pic = new byte[bis.available()];
			bis.read(chop_pic);
			String chop_name = req.getParameter("chop_name");
			ChoppersService chopSvc = new ChoppersService();
			chopSvc.updateChopper(chop_no, chop_pic, chop_name);
		}
		
		if ("update_chopper_status".equals(action)) {
			String chop_no = req.getParameter("chop_no");
			String chop_status = req.getParameter("chop_status");
			ChoppersService chopSvc = new ChoppersService();
			chopSvc.updateChopperStatus(chop_no, chop_status);
		}
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
}
