package com.clotha.ca.mail.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MailDAOMybatis implements MailDAO {
	private String namespace="config.mybatis.mapper.oracle.mail.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertMail(MailVO vo) {
		return sqlSession.insert(namespace+"insertMail",vo);
	}

	@Override
	public int insertGet(MailVO mailvo) {
		return sqlSession.insert(namespace+"insertGet",mailvo);
	}

	@Override
	public List<MailVO> selectGetMail(String empNo) {
		return sqlSession.selectList(namespace+"selectGetMail",empNo);
	}

	@Override
	public MailVO selectDetail(MailVO mailVo) {
		return sqlSession.selectOne(namespace+"selectDetail",mailVo);
	}

	@Override
	public int mailRead(MailVO vo) {
		return sqlSession.update(namespace+"mailRead",vo);
	}

	@Override
	public int deleteMail(MailVO vo) {
		return sqlSession.update(namespace+"deleteMail",vo);
	}

	@Override
	public List<MailVO> selectSender(String empNo) {
		return sqlSession.selectList(namespace+"selectSender",empNo);
	}

	@Override
	public MailVO sendMailDetail(int mailNo) {
		return sqlSession.selectOne(namespace+"sendMailDetail",mailNo);
	}

	@Override
	public List<MailVO> sendEmpNO(int mailNo) {
		return sqlSession.selectList(namespace+"sendEmpNO",mailNo);
	}

	@Override
	public int sendDelete(int mailNo) {
		return sqlSession.update(namespace+"sendDelete",mailNo);
	}
	
	
	
	
}
