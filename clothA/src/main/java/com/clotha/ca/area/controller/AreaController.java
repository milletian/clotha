package com.clotha.ca.area.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.clotha.ca.area.model.AreaService;
import com.clotha.ca.area.model.AreaVO;

@Controller
@RequestMapping("/admin/area")
public class AreaController {
	@Autowired
	private AreaService areaService;
	
	
	@RequestMapping("/ajaxAreaList.do")
	@ResponseBody
	public List<AreaVO> ajaxAreaList() {
		return areaService.selectArea();
	}
}
