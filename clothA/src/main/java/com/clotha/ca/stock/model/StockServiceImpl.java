package com.clotha.ca.stock.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
}
