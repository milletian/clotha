package com.clotha.ca.notice.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOMybatis implements NoticeDAO {
	
	private String namespace="config.mybatis.mapper.oracle.notice.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int noticeInsert(NoticeVO noticeVo) {	//NoticeController
		return sqlSession.insert(namespace+"noticeInsert",noticeVo);
	}

	@Override
	public List<NoticeVO> selectNoticeAll(NoticeVO noticeVO) {	//NoticeController
		return sqlSession.selectList(namespace+"selectNoticeAll",noticeVO);
	}

	@Override
	public NoticeVO selectNotice(int noticeNo) {	//NoticeController
		return sqlSession.selectOne(namespace+"selectNotice",noticeNo);
	}

	@Override
	public int readUp(int noticeNo) {
		return sqlSession.update(namespace+"readUp",noticeNo);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return sqlSession.delete(namespace+"deleteNotice",noticeNo);
	}

	@Override
	public int noticeEdit(NoticeVO noticeVo) {
		return sqlSession.update(namespace+"noticeEdit",noticeVo);
	}
	
}
