package com.roomrsv.model;

import java.sql.Date;
import java.util.List;

public class RoomRsvService {
	private RoomRsvDAO_interface dao;
	
	public RoomRsvService() {
		dao = new RoomRsvDAO();
	}
	
	public void insertRsvDate(Date rsvDate) {
		dao.insert(rsvDate);
	}
	
	public RoomRsvVO updateRmLeft(Date rsvDate, String rmType, Integer rmLeft) {
		RoomRsvVO rsvo = new RoomRsvVO();
		rsvo.setRsv_date(rsvDate);
		rsvo.setRm_type(rmType);
		rsvo.setRm_left(rmLeft);
		return rsvo;
	}
	
	public void deleteRsvDate(Date rsvDate) {
		dao.delete(rsvDate);
	}
	
	public RoomRsvVO getOneByDateNRmType(Date rsvDate, String rm_type) {
		return dao.getOneByDateNRmType(rsvDate, rm_type);
	}
	
	public List<RoomRsvVO> getOneByDate(Date rsvDate) {
		return dao.getOneDayByDate(rsvDate);
	}
	
	public List<RoomRsvVO> getAll() {
		return dao.getAll();
	}
	
	public List<RoomRsvVO> getAllByRmType(String rmType) {
		return dao.getAllByRmType(rmType);
	}
}
