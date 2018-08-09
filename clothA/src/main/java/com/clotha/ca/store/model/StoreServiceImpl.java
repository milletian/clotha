package com.clotha.ca.store.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clotha.ca.employee.model.EmployeeVO;

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

	@Override
	public int insertStore(StoreVO storeVO) {
		int result = storeDao.insertStore(storeVO);
		int cnt = 0;
		if(result>0) {
			EmployeeVO vo = new EmployeeVO();
			vo.setEmpNo(storeVO.getEmpNo());
			vo.setStoreCode(storeVO.getStoreCode());
			cnt = storeDao.updateEmpStore(vo);
		}
		
		return cnt;
	}

	@Override
	public int updateStore(StoreVO storeVO) {
		return storeDao.updateStore(storeVO);
	}

	@Override
	public int storeDel(String storeCode) {
		return storeDao.storeDel(storeCode);
	}
	
	
}
