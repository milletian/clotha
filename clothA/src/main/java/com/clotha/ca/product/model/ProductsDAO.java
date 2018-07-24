package com.clotha.ca.product.model;

import java.util.List;
import java.util.Map;

public interface ProductsDAO {

	public int insertProducts(ProductsVO productsVo);
	public List<Map<String, Object>> selectProduct(ProductsVO productsVo);
	public List<ProductsVO> selectAll();
	public ProductsVO selectByPdCode(String pdCode);
	public int updatePdDetail(ProductsVO productsVo); 
	public int deleteProducts(Map<String, String[]> map);
}
