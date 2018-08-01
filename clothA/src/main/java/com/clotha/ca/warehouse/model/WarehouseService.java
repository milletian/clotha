package com.clotha.ca.warehouse.model;

import java.util.List;
import java.util.Map;

public interface WarehouseService {
	public List<WarehouseVO> Searchwarehouse(WarehouseVO warehouseVO);
	public WarehouseVO SearchWarehouseByCode(String whCode);
	public int insertWarehouse(WarehouseVO warehouseVO);
	public int updateWarehouse(WarehouseVO warehouseVO);
	public int warehouseDel(String whCode);
	public List<Map<String, Object>> selectWhStockQty(String pdCode);
}
