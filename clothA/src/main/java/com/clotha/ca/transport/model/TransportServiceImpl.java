package com.clotha.ca.transport.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clotha.ca.stock.model.StockDAO;
import com.clotha.ca.stock.model.StockVO;

@Service
public class TransportServiceImpl implements TransportService{

	@Autowired
	private TransportDAO transportDAO;
	@Autowired
	private StockDAO stockDAO;

	@Override
	public List<Map<String, Object>> transportSearchtList(TransportVO transportVO) {
		return transportDAO.transportSearchtList(transportVO);
	}

	@Override
	@Transactional
	public int insertTP(TransportVO transportVO, TransportDetailVO transportDetailVO) {
		int result = transportDAO.insertTP(transportVO);
		result = transportDAO.insertTPDetail(transportDetailVO);
		return result;
	}

	@Override
	public int deleteTP(String tpCode) {
		int result = transportDAO.deleteTPDetail(tpCode);
		result = transportDAO.deleteTP(tpCode);
		return result;
	}

	@Override
	public Map<String, Object> transportSearchOne(String tpCode) {
		return transportDAO.transportSearchOne(tpCode);
	}

	@Override
	public int agreeTP(Map<String, Object> map) {
		String areaStart = (String) map.get("START_STA");
		String areaEnd = (String) map.get("END_STA");
		String pdCode = (String) map.get("PD_CODE");
		String Qty = String.valueOf(map.get("QUANTITY"));
		
		StockVO start = new StockVO();
		StockVO end = new StockVO();
		start.setPdCode(pdCode);
		start.setStaCode(areaStart);
		start.setStockQty(-Integer.parseInt(Qty));
		end.setPdCode(pdCode);
		end.setStaCode(areaEnd);
		end.setStockQty(Integer.parseInt(Qty));
		int result =  transportDAO.agreeTP((String) map.get("TP_CODE"));
		result = stockDAO.updateStockQty(start);
		if(stockDAO.selectBystaCodeandpdCode(end)!=0) {
			result = stockDAO.updateStockQty(end);			
		}else {
			result = stockDAO.insertStock(end);
		}
		
		return result;
	}
}
