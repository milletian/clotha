package com.clotha.ca.product.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public List<Map<String, Object>> selectProduct(ProductsVO productsVo) {
		return productDao.selectProduct(productsVo);
	}


	@Override
	public List<ProductsVO> selectAll() {
		return productDao.selectAll();
	}

	@Override
	public ProductsVO selectByPdCode(String pdCode) {
		return productDao.selectByPdCode(pdCode);
	}

	@Override
	public int updatePdDetail(ProductsVO productsVo) {
		return productDao.updatePdDetail(productsVo);
	}
	
	@Transactional
	@Override
	public int deleteProducts(Map<String, String[]> map) {
		return productDao.deleteProducts(map);
	}
	
	
}
