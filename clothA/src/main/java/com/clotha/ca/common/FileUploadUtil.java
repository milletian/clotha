package com.clotha.ca.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class FileUploadUtil {
	public static final int PATH_FLAG_PDS = 1;
	public static final int PATH_FLAG_IMAGE = 2;
	
	private static final Logger logger = LoggerFactory.getLogger(FileUploadUtil.class);

	@Resource(name = "fileUploadProperties")
	private Properties fileUploadProps;

	
	
	public String getUploadPath(HttpServletRequest request,int isimg) {
		// 업로드 폴더 구하는 메서드
		String upPath = "";
		String type = fileUploadProps.getProperty("file.upload.type");
		if (type.equals("test")) {
			// 테스트 경로
			if(isimg==PATH_FLAG_IMAGE) {
				upPath = fileUploadProps.getProperty("imageFile.upload.path.test");
			}else if(isimg==PATH_FLAG_PDS) {
				upPath = fileUploadProps.getProperty("file.upload.path.test");
			}
		} else {
			// 실제 물리적인 경로 구하기
			if(isimg==PATH_FLAG_IMAGE) {
				upPath = fileUploadProps.getProperty("imageFile.upload.path");
				upPath = request.getSession().getServletContext().getRealPath(upPath);
			}else if(isimg==PATH_FLAG_PDS) {
				upPath = fileUploadProps.getProperty("file.upload.path");
				upPath = request.getSession().getServletContext().getRealPath(upPath);
				
			}
		}
		logger.info("업로드 경로 : {}", upPath);

		return upPath;
	}

	public String getCurrentTime() {
		// 현재 시간을 밀리초까지 표현
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String today = sdf.format(d);
		logger.info("현재 시간(밀리초)-{}", today);

		return today;
	}

	public String getUniqueFileName(String originalFileName) {
		// original파일이름을 unique한 파일 이름으로 변경하는 메서드
		// abc.txt => abc20180615112150123.txt
		int idx = originalFileName.lastIndexOf(".");
		String fName = originalFileName.substring(0, idx); // abc
		String ext = originalFileName.substring(idx); // .txt
		String fileName = fName + getCurrentTime() + ext;
		logger.info("변경된 파일 이름: {}", fileName);

		return fileName;
	}

	public List<Map<String, Object>> fileUpload(HttpServletRequest request,int isimg) throws IllegalStateException, IOException {
		// 파일 업로드 처리하는 메서드
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
		// 업로드에 쓰이는 MultipartHttpServletRequest 객체에 매개변수로 받은 request의 정보를 넣음
		Map<String, MultipartFile> fileMap = multiRequest.getFileMap();
		// 업로드된 파일을 구해서 map의 형태로 반환하는 메서드이용(여러개 가능)
		// 키 : 업로드된 파일 객체(값)
		// Map<String, MultipartFile> getFileMap()

		// 파일 정보를 저장할 컬렉션
		List<Map<String, Object>> list = new ArrayList<>();

		Iterator<String> iter = fileMap.keySet().iterator();
		while (iter.hasNext()) {
			String key = iter.next();
			MultipartFile tempFile = fileMap.get(key);
			// 업로드된 파일이 있으면
			if (!tempFile.isEmpty()) {
				// 업로드된 파일 정보 구하기
				String originalFileName = tempFile.getOriginalFilename();
				long fileSize = tempFile.getSize();
				String fileName = getUniqueFileName(originalFileName);
				
				// 업로드 처리하기
				File file = new File(getUploadPath(request,isimg), fileName);
				tempFile.transferTo(file);

				// 파일 정보를 map에 저장
				Map<String, Object> map = new HashMap<>();
				map.put("originalFileName", originalFileName);
				map.put("fileSize", fileSize);
				map.put("fileName", fileName);

				// map을 list에 저장
				list.add(map);
			}
		} // while

		return list;
	}

}
