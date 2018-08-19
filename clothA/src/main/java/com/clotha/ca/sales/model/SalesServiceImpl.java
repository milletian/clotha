package com.clotha.ca.sales.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SalesServiceImpl implements SalesService {
	@Autowired private SalesDAO salesDao;

	@Override
	public List<SalesVO> selectAll(SalesVO salesVo) {
		return salesDao.selectAll(salesVo);
	}
	
	
}
