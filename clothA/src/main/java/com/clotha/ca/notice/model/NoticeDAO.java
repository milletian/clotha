package com.clotha.ca.notice.model;

import java.util.List;

import com.clotha.ca.common.SearchVO;

public interface NoticeDAO {
	public int noticeInsert(NoticeVO noticeVo);	//NoticeController
	public List<NoticeVO> selectNoticeAll(SearchVO searchVo);	//NoticeController
	public NoticeVO selectNotice(int noticeNo);	//NoticeController
	public int readUp(int noticeNo);	//NoticeController
	public int deleteNotice(int noticeNo);	//NoticeController
	public int noticeEdit(NoticeVO noticeVo);	//NoticeController
	public int selectCount(SearchVO searchVo);	//noticeController
}
