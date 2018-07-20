package com.clotha.ca.store.model;

import java.util.List;

public interface StoreDAO {

	public List<StoreVO> SearchStore(StoreVO storeVO);
	public StoreVO SearchStoreByCode(String storeCode);
	public int insertStore(StoreVO storeVO);
	public int updateStore(StoreVO storeVO);
	public int storeDel(String storeCode);
}
