package com.clotha.ca.product.model;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.clotha.ca.stock.model.StockVO;

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
	
	@SuppressWarnings("deprecation")
	@Override
	public List<ProductsVO> xlsExcelReader(MultipartHttpServletRequest req) {
		List<ProductsVO> list = new ArrayList<>();
		MultipartFile file = req.getFile("excel");
		HSSFWorkbook workbook = null;
		try {
			// HSSFWorkbook은 엑셀파일 전체 내용을 담고 있는 객체
			workbook = new HSSFWorkbook(file.getInputStream());

			// 탐색에 사용할 Sheet, Row, Cell 객체
			HSSFSheet curSheet;
			HSSFRow curRow;
			HSSFCell curCell;
			ProductsVO vo;

			// Sheet 탐색 for문
			for (int sheetIndex = 0; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++) {
				// 현재 sheet 반환
				curSheet = workbook.getSheetAt(sheetIndex);
				// row 탐색 for문
				for (int rowIndex = 0; rowIndex < curSheet.getPhysicalNumberOfRows(); rowIndex++) {
					// row 0은 헤더정보이기 때문에 무시
					if (rowIndex != 0) {
						curRow = curSheet.getRow(rowIndex);
						vo = new ProductsVO();
						String value;
						// row의 첫번째 cell값이 비어있지 않는 경우만 cell탐색
						if (curRow.getCell(0) != null) {
							if (!"".equals(curRow.getCell(0).getStringCellValue())) {
								// cell 탐색 for문
								for (int cellIndex = 0; cellIndex < curRow.getPhysicalNumberOfCells(); cellIndex++) {
									curCell = curRow.getCell(cellIndex);
									if (true) {
										value = "";
										// cell 스타일이 다르더라도 String으로 반환 받음
										switch (curCell.getCellType()) {
											case HSSFCell.CELL_TYPE_FORMULA:
												value = curCell.getCellFormula();
												break;
											case HSSFCell.CELL_TYPE_NUMERIC:
												value = (int)curCell.getNumericCellValue() + "";
												break;
											case HSSFCell.CELL_TYPE_STRING:
												value = curCell.getStringCellValue() + "";
												break;
											case HSSFCell.CELL_TYPE_BLANK:
												value = curCell.getBooleanCellValue() + "";
												break;
											case HSSFCell.CELL_TYPE_ERROR:
												value = curCell.getErrorCellValue() + "";
												break;
											default:
												value = new String();
												break;
										} // end switch

										// 현재 colum index에 따라서 vo입력
										switch (cellIndex) {
										case 0: // 상품이름
											vo.setPdName(value);
											break;
										case 1: // 상품원가
											vo.setPdOriginalPrice(Integer.parseInt(value));
											break;
										case 2: // 상품 판매가
											vo.setPdSellPrice(Integer.parseInt(value));
											break;
										case 3: // 구매처 명
											vo.setAccCode(value);
											break;
										case 4: // 상세정보
											vo.setPdExplanation(value);
											break;
										case 5: // 주의사항
											vo.setPdWarning(value);
											break;
										case 6: // 컬러
											vo.setColorCode(value);
											break;
										case 7: // 시즌
											vo.setSeasonCode(value);
											break;
										case 8: // 사이즈
											vo.setSizeCode(value);
											break;
										case 9: // 성별
											vo.setGenderCode(value);
											break;
										case 10: // 스타일코드
											vo.setStyleCode(value);
											break;
											default:
												break;
										}
									} // end if
								} // end for
								// cell 탐색 이후 vo 추가
								list.add(vo);
							} // end
						} // end if
					}

				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		// 디비에 insert
		for(ProductsVO vo : list) {
			
			productDao.insertExcelProducts(vo);						
				
		}
		return list;
	}
	
	public List<ProductsVO> xlsxExcelReader(MultipartHttpServletRequest req) {
		List<ProductsVO> list = new ArrayList<>();
		MultipartFile file = req.getFile("excel");
		XSSFWorkbook workbook = null;
		try {
			// HSSFWorkbook은 엑셀파일 전체 내용을 담고 있는 객체
			workbook = new XSSFWorkbook(file.getInputStream());

			// 탐색에 사용할 Sheet, Row, Cell 객체
			XSSFSheet curSheet;
			XSSFRow curRow;
			XSSFCell curCell;
			ProductsVO vo;

			// Sheet 탐색 for문
			for (int sheetIndex = 0; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++) {
				// 현재 sheet 반환
				curSheet = workbook.getSheetAt(sheetIndex);
				// row 탐색 for문
				for (int rowIndex = 0; rowIndex < curSheet.getPhysicalNumberOfRows(); rowIndex++) {
					// row 0은 헤더정보이기 때문에 무시
					if (rowIndex != 0) {
						curRow = curSheet.getRow(rowIndex);
						vo = new ProductsVO();
						String value;
						// row의 첫번째 cell값이 비어있지 않는 경우만 cell탐색
						if (curRow.getCell(0) != null) {
							if (!"".equals(curRow.getCell(0).getStringCellValue())) {
								// cell 탐색 for문
								for (int cellIndex = 0; cellIndex < curRow.getPhysicalNumberOfCells(); cellIndex++) {
									curCell = curRow.getCell(cellIndex);
									if (true) {
										value = "";
										// cell 스타일이 다르더라도 String으로 반환 받음
										switch (curCell.getCellType()) {
											case HSSFCell.CELL_TYPE_FORMULA:
												value = curCell.getCellFormula();
												break;
											case HSSFCell.CELL_TYPE_NUMERIC:
												value = (int)curCell.getNumericCellValue() + "";
												break;
											case HSSFCell.CELL_TYPE_STRING:
												value = curCell.getStringCellValue() + "";
												break;
											case HSSFCell.CELL_TYPE_BLANK:
												value = curCell.getBooleanCellValue() + "";
												break;
											case HSSFCell.CELL_TYPE_ERROR:
												value = curCell.getErrorCellValue() + "";
												break;
											default:
												value = new String();
												break;
										} // end switch

										// 현재 colum index에 따라서 vo입력
										switch (cellIndex) {
											case 0: // 상품이름
												vo.setPdName(value);
												break;
											case 1: // 상품원가
												vo.setPdOriginalPrice(Integer.parseInt(value));
												break;
											case 2: // 상품 판매가
												vo.setPdSellPrice(Integer.parseInt(value));
												break;
											case 3: // 구매처 명
												vo.setAccCode(value);
												break;
											case 4: // 상세정보
												vo.setPdExplanation(value);
												break;
											case 5: // 주의사항
												vo.setPdWarning(value);
												break;
											case 6: // 컬러
												vo.setColorCode(value);
												break;
											case 7: // 시즌
												vo.setSeasonCode(value);
												break;
											case 8: // 사이즈
												vo.setSizeCode(value);
												break;
											case 9: // 성별
												vo.setGenderCode(value);
												break;
											case 10: // 스타일코드
												vo.setStyleCode(value);
												break;
											default:
												break;
										}
									} // end if
								} // end for
								// cell 탐색 이후 vo 추가
								list.add(vo);
							} // end
						} // end if
					}

				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		// 디비에 insert
		for(ProductsVO vo : list) {
			System.out.println(vo);
			productDao.insertExcelProducts(vo);	
		}
		return list;
	}

	
}
