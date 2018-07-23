package com.clotha.ca.notice.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDAO noticeDao;

	@Override
	public int noticeInsert(NoticeVO noticeVo) {	//NoticeController
		return noticeDao.noticeInsert(noticeVo);
	}

	@Override
	public List<NoticeVO> selectNoticeAll(NoticeVO noticeVO) {
		return noticeDao.selectNoticeAll(noticeVO);
	} 
	
}
