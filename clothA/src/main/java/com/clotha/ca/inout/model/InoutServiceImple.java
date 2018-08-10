package com.clotha.ca.inout.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clotha.ca.stock.model.StockDAO;
import com.clotha.ca.stock.model.StockVO;

@Service
public class InoutServiceImple implements InoutService{

	@Autowired
	private InoutDAO inoutDao;
	@Autowired
	private StockDAO stockDAO;
	
	@Override
	public List<Map<String, Object>> inoutSelectAll(InoutVO inoutVo) {
		return inoutDao.inoutSelectAll(inoutVo);
	}

	@Override
	public int insertInout(InoutVO inoutVO) {
		return inoutDao.insertInout(inoutVO);
	}

	@Override
	public int insertInoutDetail(InoutVO inoutVO) {
		return inoutDao.insertInoutDetail(inoutVO);
	}

	@Override
	public int agreeInOut(Map<String, Object> map) {
		String inoutCode = (String) map.get("INOUT_CODE");
		String areaStart = (String) map.get("AREA_START");
		String areaEnd = (String) map.get("AREA_END");
		String pdCode = (String) map.get("PD_CODE");
		String inoutDetailQty = String.valueOf(map.get("INOUT_DETAIL_QTY"));
		
		StockVO start = new StockVO();
		StockVO end = new StockVO();
		start.setPdCode(pdCode);
		start.setStaCode(areaStart);
		start.setStockQty(-Integer.parseInt(inoutDetailQty));
		end.setPdCode(pdCode);
		end.setStaCode(areaEnd);
		end.setStockQty(Integer.parseInt(inoutDetailQty));
		int result =  inoutDao.agreeInOut(inoutCode);
		result = stockDAO.updateStockQty(start);
		if(stockDAO.selectBystaCodeandpdCode(end)!=0) {
			result = stockDAO.updateStockQty(end);			
		}else {
			result = stockDAO.insertStock(end);
		}
		
		return result;
	}

}
