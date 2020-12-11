package com.bookingorder.model;

import java.sql.*;

public class BookingOrderVO {
	private String bk_no;
	private String mb_id;
	private Date bk_date;
	private Date dateIn;
	private Date dateOut;
	private Date checkIn;
	private Date checkOut;
	private String od_status;
	private Integer total_price;
	
	
	
	public BookingOrderVO() {};
	
	public BookingOrderVO(String bk_no, String mb_id, Date bk_date, Date dateIn, Date dateOut, String od_status, 
			Integer total_price) {
		super();
		this.bk_no = bk_no;
		this.mb_id = mb_id;
		this.bk_date = bk_date;
		this.dateIn = dateIn;
		this.dateOut = dateOut;
		this.od_status = od_status;
		this.total_price = total_price;
	}

	public String getBk_no() {
		return bk_no;
	}

	public void setBk_no(String bk_no) {
		this.bk_no = bk_no;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public Date getBk_date() {
		return bk_date;
	}

	public void setBk_date(Date bk_date) {
		this.bk_date = bk_date;
	}

	public Date getDateIn() {
		return dateIn;
	}

	public void setDateIn(Date dateIn) {
		this.dateIn = dateIn;
	}

	public Date getDateOut() {
		return dateOut;
	}

	public void setDateOut(Date dateOut) {
		this.dateOut = dateOut;
	}

	public Date getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}

	public Date getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(Date checkOut) {
		this.checkOut = checkOut;
	}
	
	public String getOd_status() {
		return od_status;
	}

	public void setOd_status(String od_status) {
		this.od_status = od_status;
	}

	public Integer getTotal_price() {
		return total_price;
	}

	public void setTotal_price(Integer total_price) {
		this.total_price = total_price;
	}
	
	
	
	
}
