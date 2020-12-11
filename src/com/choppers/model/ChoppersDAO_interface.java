package com.choppers.model;

import java.util.List;

public interface ChoppersDAO_interface {
	public void insert(ChoppersVO chopvo);
	public void update(ChoppersVO chopvo);
	public void update_status(ChoppersVO chopvo);
	public List<ChoppersVO> getAll();
}
