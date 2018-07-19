package com.clotha.ca.store.model;

import java.util.List;
public interface StoreService {

	
	public List<StoreVO> SearchStore(StoreVO storeVO);
	public StoreVO SearchStoreByCode(String storeCode);
}
