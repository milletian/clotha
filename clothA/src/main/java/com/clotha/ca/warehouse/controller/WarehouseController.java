package com.clotha.ca.warehouse.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.clotha.ca.common.FileUploadUtil;
import com.clotha.ca.stockarea.model.StockAreaService;
import com.clotha.ca.store.controller.StoreController;
import com.clotha.ca.store.model.StoreVO;
import com.clotha.ca.warehouse.model.WarehouseService;
import com.clotha.ca.warehouse.model.WarehouseVO;

@Controller
@RequestMapping("/admin/warehouse")
public class WarehouseController {
	private static final Logger logger = LoggerFactory.getLogger(WarehouseController.class);

	@Autowired
	private WarehouseService warehouseService;
	@Autowired
	private StockAreaService stockAreaService;
	@Autowired
	private FileUploadUtil fileupload;
	
	@RequestMapping(value="/warehouseWrite.do", method=RequestMethod.GET)
	public String warehouseWrite_get(@RequestParam(required=false) String whCode,Model model) {
		if(whCode!=null&&!whCode.isEmpty()) {
			WarehouseVO warehouseVO = warehouseService.SearchWarehouseByCode(whCode);
			model.addAttribute("warehouseVO",warehouseVO);
		}
		return "admin/warehouse/warehouseWrite";
	}
	
	@RequestMapping(value="/warehouseWrite.do", method=RequestMethod.POST)
	public void warehouseWrite_post(HttpServletRequest request,HttpServletResponse response) throws IOException {
		WarehouseVO warehouseVO = new WarehouseVO();
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;
		String oldfile = multi.getParameter("oldfile");
		String[] oldFileList = oldfile.split(",");
		String areaCode = multi.getParameter("areaCode");
		warehouseVO.setWhCode(multi.getParameter("whCode"));
		warehouseVO.setWhName(multi.getParameter("whName"));
		warehouseVO.setWhZipcode(multi.getParameter("whZipcode"));
		warehouseVO.setWhAddress(multi.getParameter("address")+"~"+multi.getParameter("addressDetail"));
		String result = "";
		String path = fileupload.getUploadPath(request,fileupload.PATH_FLAG_WAREHOUSEIMAGE); // 테스트용 경로
		result = fileupload.multifileup(multi,path); // 테스트용 업로드(미완성)
		warehouseVO.setWhImage(result); // 업로드 메서드 결과로 나온 이미지 파일들 이름 을 세팅
		if(oldfile!=null&&!oldfile.isEmpty()&&result!=null&&!result.isEmpty()) {
			for(String oldfilename : oldFileList) {				
				 File file = new File(path+"\\"+oldfilename);
			     if(file.exists() ){
			         if(file.delete()){
			             System.out.println("파일삭제 성공");
			         }else{
			             System.out.println("파일삭제 실패");
			         }
			     }else{
			         System.out.println("파일이 존재하지 않습니다.");
			     }
			}
		}
		if(warehouseVO.getWhCode()==null||warehouseVO.getWhCode().isEmpty()) {
			stockAreaService.insertStockArea(areaCode);
			warehouseService.insertWarehouse(warehouseVO);
		}else {
			warehouseService.updateWarehouse(warehouseVO);
		}

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>");
		out.println("alert('성공.');");
		out.print("self.close();");
		out.print("</script>");
		
		return;
	}
	
	@RequestMapping(value="/warehouseList.do", method=RequestMethod.GET)
	public void warehouseList() {
		
	}
	@RequestMapping(value="/warehouseSearch.do", method=RequestMethod.GET)
	public void warehouseSearch() {
		
	}
	
	@RequestMapping(value="/ajaxWarehouseList.do")
	@ResponseBody
	public List<WarehouseVO> ajaxWarehouseList(@ModelAttribute WarehouseVO warehouseVO) {
		logger.info("{}",warehouseVO);
		List<WarehouseVO> list = warehouseService.Searchwarehouse(warehouseVO);
		logger.info("{}",list.size());
		return list;
	}
	
	@RequestMapping(value="/ajaxWarehouseDel.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String ajaxWarehouseDel(@RequestParam String whCode) {
		logger.info("{}",whCode);
		int result = warehouseService.warehouseDel(whCode);
		if(result==0) {
			return "영업정지 처분 실패";
		}else {
			return "영업정지 처분 성공";			
		}
	}
	
}
