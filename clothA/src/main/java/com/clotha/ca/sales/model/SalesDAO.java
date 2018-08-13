package com.clotha.ca.sales.model;

import java.util.List;

public interface SalesDAO {
	public List<SalesVO> selectAll(SalesVO salesVo);
}
