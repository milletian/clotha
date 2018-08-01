package com.clotha.ca.inout.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InoutServiceImple implements InoutService{

	@Autowired
	private InoutDAO inoutDao;
	
	@Override
	public List<Map<String, Object>> inoutSelectAll(InoutVO inoutVo) {
		return inoutDao.inoutSelectAll(inoutVo);
	}

	@Override
	public int insertInout(InoutVO inoutVO) {
		return inoutDao.insertInout(inoutVO);
	}

	@Override
	public int insertInoutDetail(InoutVO inoutVO) {
		return inoutDao.insertInoutDetail(inoutVO);
	}

}
