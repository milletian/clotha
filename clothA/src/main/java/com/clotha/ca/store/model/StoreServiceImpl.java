package com.clotha.ca.store.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StoreServiceImpl implements StoreService{

	@Autowired
	private StoreDAO storeDao;

	@Override
	public List<StoreVO> SearchStore(StoreVO storeVO) {
		return storeDao.SearchStore(storeVO);
	}

	@Override
	public StoreVO SearchStoreByCode(String storeCode) {
		return storeDao.SearchStoreByCode(storeCode);
	}
	
	
}
