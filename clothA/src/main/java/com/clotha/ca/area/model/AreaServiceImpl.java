package com.clotha.ca.area.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AreaServiceImpl implements AreaService{
	@Autowired
	private AreaDAO areaDAO;

	@Override
	public List<AreaVO> selectArea() {
		return areaDAO.selectArea();
	}
}
