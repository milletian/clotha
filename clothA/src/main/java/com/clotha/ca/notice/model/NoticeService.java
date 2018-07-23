package com.clotha.ca.notice.model;

import java.util.List;

public interface NoticeService {
	public int noticeInsert(NoticeVO noticeVo);	//NoticeController
	public List<NoticeVO> selectNoticeAll(NoticeVO noticeVO);	//NoticeController
}
