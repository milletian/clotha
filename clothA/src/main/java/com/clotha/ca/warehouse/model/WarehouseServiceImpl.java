package com.clotha.ca.warehouse.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WarehouseServiceImpl implements WarehouseService{
	@Autowired
	private WarehouseDAO warehouseDAO;
	
	@Override
	public List<WarehouseVO> Searchwarehouse(WarehouseVO warehouseVO) {
		return warehouseDAO.Searchwarehouse(warehouseVO);
	}

	@Override
	public WarehouseVO SearchWarehouseByCode(String whCode) {
		return warehouseDAO.SearchWarehouseByCode(whCode);
	}

	@Override
	public int insertWarehouse(WarehouseVO warehouseVO) {
		return warehouseDAO.insertWarehouse(warehouseVO);
	}

	@Override
	public int updateWarehouse(WarehouseVO warehouseVO) {
		return warehouseDAO.updateWarehouse(warehouseVO);
	}

	@Override
	public int warehouseDel(String whCode) {
		return warehouseDAO.warehouseDel(whCode);
	}

	@Override
	public List<Map<String, Object>> selectWhStockQty(String pdCode) {
		return warehouseDAO.selectWhStockQty(pdCode);
	}
}
