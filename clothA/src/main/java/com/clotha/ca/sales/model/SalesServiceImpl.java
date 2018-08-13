package com.clotha.ca.sales.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SalesServiceImpl implements SalesService {
	@Autowired private SalesDAO salesDao;
	
	
}
