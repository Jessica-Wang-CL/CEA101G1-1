package com.roomrsv.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.roomrsv.model.*;
import com.roomtype.model.RoomTypeService;
import com.roomtype.model.RoomTypeVO;

@WebServlet("/booking/Available")
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
//		LocalDate now = Calendar.getInstance().getTime();
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
				LocalDate rsv_date = LocalDate.parse(rsv_str);
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
				LocalDate rsv_date = LocalDate.parse(rsv_str);
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
			try {
				int nights = Integer.parseInt(req.getParameter("night"));
				int adult = Integer.parseInt(req.getParameter("adult"));
				int currentMonth = Integer.parseInt(req.getParameter("currentMonth"));
				int currentYear = Integer.parseInt(req.getParameter("currentYear"));
				RoomRsvService rsvSvc = new RoomRsvService();
				List<RoomRsvVO> list = rsvSvc.getAll();
				req.setAttribute("rsvList", list);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if("roomCheck".equals(action)) {
			try {
				String date = req.getParameter("date");
				Integer stay = Integer.parseInt(req.getParameter("stay"));
				String rmType = req.getParameter("rmtype");
				LocalDate rsv_date = LocalDate.parse(date);
				RoomRsvService rsvSvc = new RoomRsvService();
				RoomTypeService rmtypeSvc = new RoomTypeService();
				StringBuilder jsonStr = new StringBuilder();
				if (rmType.equals("all")) {
					List<RoomTypeVO> rmtypeList = rmtypeSvc.getAll();
					JSONArray jsonArray = new JSONArray();
					for (RoomTypeVO rmtypevo : rmtypeList) {
						Map<String, String[]>  map = rsvSvc.roomCheck(rsv_date, stay, rmtypevo.getRm_type());
						JSONObject json = new JSONObject(map);
						jsonArray.put(json);
					}
					jsonStr.append(jsonArray.toString());
				} else {
					Map<String, String[]>  map = rsvSvc.roomCheck(rsv_date, stay, rmType);
					JSONObject json = new JSONObject(map);
					jsonStr.append(json.toString());
				}
				out = res.getWriter();
				out.print(jsonStr.toString());
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException(e.getMessage());
			}
		}
	}

}
