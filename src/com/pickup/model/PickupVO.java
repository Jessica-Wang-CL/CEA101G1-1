package com.pickup.model;

import java.sql.Date;

public class PickupVO {
	private String pkup_no;
	private String chop_no;
	private String bk_no;
	private Date pkup_time;
	private Date arrive_datetime;
	private String pkup_status;
	
	public PickupVO() {};
	
	public PickupVO(String pkup_no, String chop_no, String bk_no, Date arrive_datetime, String pkup_status) {
		super();
		this.pkup_no = pkup_no;
		this.chop_no = chop_no;
		this.bk_no = bk_no;
		this.arrive_datetime = arrive_datetime;
		this.pkup_status = pkup_status;
	}
	
	public PickupVO(Date pkup_time) {
		this.pkup_time = pkup_time;
	};

	public String getPkup_no() {
		return pkup_no;
	}

	public void setPkup_no(String pkup_no) {
		this.pkup_no = pkup_no;
	}

	public String getChop_no() {
		return chop_no;
	}

	public void setChop_no(String chop_no) {
		this.chop_no = chop_no;
	}

	public String getBk_no() {
		return bk_no;
	}

	public void setBk_no(String bk_no) {
		this.bk_no = bk_no;
	}

	public Date getPkup_time() {
		return pkup_time;
	}

	public void setPkup_time(Date pkup_time) {
		this.pkup_time = pkup_time;
	}

	public Date getArrive_datetime() {
		return arrive_datetime;
	}

	public void setArrive_datetime(Date arrive_datetime) {
		this.arrive_datetime = arrive_datetime;
	}

	public String getPkup_status() {
		return pkup_status;
	}

	public void setPkup_status(String pkup_status) {
		this.pkup_status = pkup_status;
	}
}
