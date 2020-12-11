package com.roomrsv.controller;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RoomRsvServlet")
public class RoomRsvServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RoomRsvServlet() {
        super();
    }
    
	public void init(ServletConfig config) throws ServletException {
		//每天早上刪除昨天的預約表格
	}

	public void destroy() {
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
	}

}
