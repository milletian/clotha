package com.clotha.ca.log.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LogServiceImpl implements LogService {
	
	@Autowired
	private LogDAO logDao;

	@Override
	public int loginInsert(LogVO logVo) {
		return logDao.loginInsert(logVo);
	}
	
}
