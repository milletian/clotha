package com.clotha.ca.product.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductsServiceImple implements ProductsService  {
	
	@Autowired
	private ProductsDAO productDao;

	@Override
	public int insertProducts(ProductsVO productsVo) {
		int cnt = productDao.insertProducts(productsVo);
		return cnt;
	}
	
	
}
