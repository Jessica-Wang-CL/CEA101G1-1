package com.choppers.model;

public class ChoppersVO {
	private String chop_no;
	private byte[] chop_pic;
	private String chop_name;
	private String chop_status;
	
	public ChoppersVO() {};

	public ChoppersVO(String chop_no, byte[] chop_pic, String chop_name, String chop_status) {
		super();
		this.chop_no = chop_no;
		this.chop_pic = chop_pic;
		this.chop_name = chop_name;
		this.chop_status = chop_status;
	}

	public String getChop_no() {
		return chop_no;
	}

	public void setChop_no(String chop_no) {
		this.chop_no = chop_no;
	}

	public byte[] getChop_pic() {
		return chop_pic;
	}

	public void setChop_pic(byte[] chop_pic) {
		this.chop_pic = chop_pic;
	}

	public String getChop_name() {
		return chop_name;
	}

	public void setChop_name(String chop_name) {
		this.chop_name = chop_name;
	}

	/**
	 * @return the chop_status
	 */
	public String getChop_status() {
		return chop_status;
	}

	/**
	 * @param chop_status the chop_status to set
	 */
	public void setChop_status(String chop_status) {
		this.chop_status = chop_status;
	}
	
	
}
