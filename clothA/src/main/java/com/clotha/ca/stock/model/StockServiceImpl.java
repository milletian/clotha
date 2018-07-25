package com.clotha.ca.stock.model;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class StockServiceImpl implements StockService{
	@Autowired
	private StockDAO stockDAO;

	@Override
	public List<Map<String, Object>> stockList(StockVO stockVO) {
		return stockDAO.stockList(stockVO);
	}

	@Override
	@Transactional
	public int addStock(List<StockVO> list) {
		int result=0;
		for(StockVO vo : list) {
			if(vo.getPdCode()!=null&&!vo.getPdCode().isEmpty()) {				
				if(vo.getStockPk()!=0) {
					result+= stockDAO.updateStock(vo);
				}else {
					result+= stockDAO.insertStock(vo);
				}
			}
		}
		return result;
	}

	@Override
	public List<Map<String, Object>> stockSearchList(Map<String, String> map) {
		return stockDAO.stockSearchList(map);
	}

	@Override
	public List<StockVO> xlsExcelReader(MultipartHttpServletRequest req) {
		List<StockVO> list = new ArrayList<>();
		MultipartFile file = req.getFile("excel");
		HSSFWorkbook workbook = null;
		try {
			// HSSFWorkbook은 엑셀파일 전체 내용을 담고 있는 객체
			workbook = new HSSFWorkbook(file.getInputStream());

			// 탐색에 사용할 Sheet, Row, Cell 객체
			HSSFSheet curSheet;
			HSSFRow curRow;
			HSSFCell curCell;
			StockVO vo;

			// Sheet 탐색 for문
			for (int sheetIndex = 0; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++) {
				// 현재 sheet 반환
				curSheet = workbook.getSheetAt(sheetIndex);
				// row 탐색 for문
				for (int rowIndex = 0; rowIndex < curSheet.getPhysicalNumberOfRows(); rowIndex++) {
					// row 0은 헤더정보이기 때문에 무시
					if (rowIndex != 0) {
						curRow = curSheet.getRow(rowIndex);
						vo = new StockVO();
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
												value = curCell.getNumericCellValue() + "";
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
											case 0: // 아이디
												vo.setStaCode(value);
												break;
											case 1: // 이름
												vo.setPdCode(value);
												break;
											case 2: // 나이
												vo.setStockQty(Integer.parseInt(value));
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
		/*stockDAO.insertExcelTest(list);*/
		return list;
		}
	}

