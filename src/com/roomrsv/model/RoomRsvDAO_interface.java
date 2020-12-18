package com.roomrsv.model;

import java.sql.Date;
import java.util.List;

public interface RoomRsvDAO_interface {
	public void insert(Date rsvDate);
	public void update(Date rsvDate, String rmType ,Integer rmLeft);
	public void delete(Date rsvDate);
	public RoomRsvVO getOneByDateNRmType(Date rsvDate, String rm_ype);
	public List<RoomRsvVO> getOneDayByDate(Date rsvDate);
	public List<RoomRsvVO> getAll();
	public List<RoomRsvVO> getAllByRmType(String rmType);
}
