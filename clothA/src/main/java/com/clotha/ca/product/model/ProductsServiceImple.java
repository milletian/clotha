package com.clotha.ca.product.model;

import java.util.List;
import java.util.Map;

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

	@Override
	public List<ProductsVO> selectProduct(ProductsVO productsVo) {
		return productDao.selectProduct(productsVo);
	}


	@Override
	public List<ProductsVO> selectAll() {
		return productDao.selectAll();
	}
	
	
}
