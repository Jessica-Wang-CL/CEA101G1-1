package com.choppers.model;

import java.util.List;


public class ChoppersService {
	private ChoppersDAO_interface dao;

	public ChoppersService() {
		dao = new ChoppersDAO();
	}

	public ChoppersVO addChopper(String chop_no, byte[] chop_pic, String chop_name) {

		ChoppersVO chopvo = new ChoppersVO();

		chopvo.setChop_no(chop_no);
		chopvo.setChop_pic(chop_pic);
		chopvo.setChop_name(chop_name);
		dao.insert(chopvo);
		return chopvo;
	}

	public ChoppersVO updateChopper(String chop_no, byte[] chop_pic, String chop_name) {

		ChoppersVO chopvo = new ChoppersVO();

		chopvo.setChop_no(chop_no);
		chopvo.setChop_pic(chop_pic);
		chopvo.setChop_name(chop_name);
		dao.update(chopvo);
		return chopvo;
	}
	
	public ChoppersVO updateChopperStatus(String chop_no, String chop_status) {

		ChoppersVO chopvo = new ChoppersVO();

		chopvo.setChop_no(chop_no);
		chopvo.setChop_status(chop_status);
		dao.update_status(chopvo);
		return chopvo;
	}

	public List<ChoppersVO> getAll() {
		return dao.getAll();
	}
}
