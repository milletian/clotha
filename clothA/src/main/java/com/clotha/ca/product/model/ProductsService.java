package com.clotha.ca.product.model;

import java.util.List;
import java.util.Map;

public interface ProductsService {

	public int insertProducts(ProductsVO productsVo);
	public List<ProductsVO> selectProduct(ProductsVO productsVo);
}
