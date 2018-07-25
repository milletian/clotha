package com.clotha.ca.notice.model;

import java.util.List;

public interface NoticeDAO {
	public int noticeInsert(NoticeVO noticeVo);	//NoticeController
	public List<NoticeVO> selectNoticeAll(NoticeVO noticeVO);	//NoticeController
	public NoticeVO selectNotice(int noticeNo);	//NoticeController
	public int readUp(int noticeNo);	//NoticeController
	public int deleteNotice(int noticeNo);	//NoticeController
	public int noticeEdit(NoticeVO noticeVo);	//NoticeController
}
