package com.clotha.ca.store.model;

import java.util.List;

import com.clotha.ca.employee.model.EmployeeVO;

public interface StoreDAO {

	public List<StoreVO> SearchStore(StoreVO storeVO);
	public StoreVO SearchStoreByCode(String storeCode);
	public int insertStore(StoreVO storeVO);
	public int updateStore(StoreVO storeVO);
	public int storeDel(String storeCode);
	public int updateEmpStore(EmployeeVO employeeVo);
}
