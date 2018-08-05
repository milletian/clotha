package com.clotha.ca.common;

import javax.servlet.http.HttpServletRequest;

public class Utility {
	public static final int BLOCK_SIZE = 10;
	public static final int RECORD_COUNT_PER_PAGE = 5; // 게시판 한 페이지에 보여줄 레코드 개수
	public static final int RECORD_COUNT_PER_PAGE10 = 10; // 게시판 한 페이지에 보여줄 레코드 개수
	public static final int RECORD_COUNT = 13; // 우편번호 한 페이지에 보여줄 레코드 개수
	public static final int NOTICE_RECORD = 6; // 공지사항
	
	public static String getFileInfo(String originalFileName, long fileSize, HttpServletRequest request) {
		String fileInfo = "";
		double fSize = Math.round((fileSize / 1000.0) * 100) / 100.0;

		if (originalFileName != null && !originalFileName.isEmpty()) {
			fileInfo = "<img src='" + request.getContextPath() + "/images/file.gif' alt = '파일 이미지' />";
			fileInfo += originalFileName + "(" + fSize + "KB)";
		}

		return fileInfo;
	}

}
