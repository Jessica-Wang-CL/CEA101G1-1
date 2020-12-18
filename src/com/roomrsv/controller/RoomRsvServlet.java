package com.roomrsv.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.roomrsv.model.*;

@WebServlet("/RoomRsvServlet")
public class RoomRsvServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TimerTask rsvCleaner;
	private Timer schedule;  
    public RoomRsvServlet() {
        super();
    }
    
	public void init(ServletConfig config) throws ServletException { //移除過期的預定表
//		rsvCleaner = new TimerTask() {
//    		@Override
//			public void run() {
//				System.out.println(count++);
//			}
//		};
//		
//		schedule = new Timer();
//		Date now = Calendar.getInstance().getTime();
//		now.set(year, month, date);
//		schedule.scheduleAtFixedRate(rsvCleaner, now, 24*60*60*1000);
	}

	public void destroy() {
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text; charset=utf-8");
		PrintWriter out = null;
		String action = req.getParameter("action").trim();

		if ("insert_n_update_rsv".equals(action)) {  //如果房客預定房型的日期沒有資料，則進入此判斷式
			try {
				String rsv_str = req.getParameter("rsv_date").trim();
				DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
				Date rsv_date = new Date(df.parse(rsv_str).getTime());
				RoomRsvService rsvSvc = new RoomRsvService();
				rsvSvc.insertRsvDate(rsv_date); //新增該天的客房預訂表
				
				String rm_type = req.getParameter("rm_type"); //取得該房客訂購的房型
				RoomRsvVO rsvvo = rsvSvc.getOneByDateNRmType(rsv_date, rm_type); //取得該天的訂房剩餘資訊
				Integer bk_qty = Integer.valueOf(req.getParameter("bk_qty")); //取得房客訂購房型的數量
				Integer rmLeft = rsvvo.getRm_left() - bk_qty; //剩餘數量 - 訂購數量
				rsvSvc.updateRmLeft(rsv_date, rm_type, rmLeft); //更新該天的房型數量
				return;
			} catch (Exception e) {
				e.printStackTrace(System.err);
			}
		}

		if ("update_rsv".equals(action)) {
			try {
				String rsv_str = req.getParameter("rsv_date").trim();
				DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
				Date rsv_date = new Date(df.parse(rsv_str).getTime());
				String rm_type = req.getParameter("rm_type"); //取得該房客訂購的房型
				RoomRsvService rsvSvc = new RoomRsvService();
				RoomRsvVO rsvvo = rsvSvc.getOneByDateNRmType(rsv_date, rm_type); //取得該天的訂房剩餘資訊
				Integer bk_qty = Integer.valueOf(req.getParameter("bk_qty")); //取得房客訂購房型的數量
				Integer rmLeft = rsvvo.getRm_left() - bk_qty; //剩餘數量 - 訂購數量
				rsvSvc.updateRmLeft(rsv_date, rm_type, rmLeft); //更新該天的房型數量
				return;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if ("getall_rsv".equals(action)) {
			RequestDispatcher dispatcher = null;
			try {
				RoomRsvService rsvSvc = new RoomRsvService();
				List<RoomRsvVO> list = rsvSvc.getAll();
				req.setAttribute("rsvList", list);
				dispatcher = req.getRequestDispatcher("/");
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("msg", "移除資料失敗");
				dispatcher.forward(req, res);
			}
		}
	}

}
