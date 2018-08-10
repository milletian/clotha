package com.clotha.ca.notice.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clotha.ca.common.SearchVO;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDAO noticeDao;
	
	private static Logger logger = LoggerFactory.getLogger(NoticeServiceImpl.class);

	@Override
	public int noticeInsert(NoticeVO noticeVo) {	//NoticeController
		return noticeDao.noticeInsert(noticeVo);
	}

	@Override
	public List<NoticeVO> selectNoticeAll(SearchVO searchVo) {	//NoticeController
		return noticeDao.selectNoticeAll(searchVo);
	}

	@Override
	public NoticeVO selectNotice(int noticeNo) {	//NoticeController
		int cnt = noticeDao.readUp(noticeNo);
		if(cnt==1) {
			logger.info("readcount up 실행결과 ={}",cnt);
		}
		return noticeDao.selectNotice(noticeNo);
	}

	@Override
	public int deleteNotice(int noticeNo) {	//NoticeController
		return noticeDao.deleteNotice(noticeNo);
	}

	@Override
	public int noticeEdit(NoticeVO noticeVo) {	//NoticeController
		return noticeDao.noticeEdit(noticeVo);
	}

	@Override
	public int selectCount(SearchVO searchVo) {
		return noticeDao.selectCount(searchVo);
	} 
	
}
