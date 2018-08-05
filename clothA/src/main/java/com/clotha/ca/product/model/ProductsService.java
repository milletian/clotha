package com.clotha.ca.product.model;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ProductsService {

	public int insertProducts(ProductsVO productsVo);
	public List<Map<String, Object>> selectProduct(ProductsVO productsVo);
	public List<ProductsVO> selectAll();
	public ProductsVO selectByPdCode(String pdCode);
	public int updatePdDetail(ProductsVO productsVo);
	public int deleteProducts(Map<String, String[]> map);
	public List<ProductsVO> xlsExcelReader(MultipartHttpServletRequest req);
	public List<ProductsVO> xlsxExcelReader(MultipartHttpServletRequest req);
} 
