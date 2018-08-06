package com.clotha.ca.transport.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TransportServiceImpl implements TransportService{

	@Autowired
	private TransportDAO transportDAO;

	@Override
	public List<Map<String, Object>> transportSearchtList(TransportVO transportVO) {
		return transportDAO.transportSearchtList(transportVO);
	}
}
