package com.clotha.ca.product.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductsDAOMyBatis implements ProductsDAO {
	
	private String namesapce="config.mybatis.mapper.oracle.products.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertProducts(ProductsVO productsVo) {
		
		int cnt = sqlSession.insert(namesapce+"insertProducts",productsVo);
		return cnt;
	}

	@Override
	public List<ProductsVO> selectProduct(ProductsVO productsVo) {
		return sqlSession.selectList(namesapce+"selectProduct", productsVo);
	}

}
