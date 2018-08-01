package com.clotha.ca.warehouse.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.clotha.ca.store.model.StoreVO;

@Repository
public class WarehouseDAOMybatis implements WarehouseDAO{

private String namesapce="config.mybatis.mapper.oracle.warehouse.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<WarehouseVO> Searchwarehouse(WarehouseVO warehouseVO) {
		return sqlSession.selectList(namesapce+"SearchWarehouse", warehouseVO);
	}

	@Override
	public WarehouseVO SearchWarehouseByCode(String whCode) {
		return sqlSession.selectOne(namesapce+"SearchWarehouseByCode", whCode);
	}

	@Override
	public int insertWarehouse(WarehouseVO warehouseVO) {
		return sqlSession.insert(namesapce+"insertWarehouse", warehouseVO);
	}

	@Override
	public int updateWarehouse(WarehouseVO warehouseVO) {
		return sqlSession.update(namesapce+"updatewarehouse", warehouseVO);
	}

	@Override
	public int warehouseDel(String whCode) {
		return sqlSession.update(namesapce+"warehouseDel", whCode);
	}

	@Override
	public List<Map<String, Object>> selectWhStockQty(String pdCode) {
		return sqlSession.selectList(namesapce+"selectWhStockQty",pdCode);
	}
}
