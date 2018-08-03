package com.clotha.ca.mail.model;

import java.util.List;
import java.util.Map;

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

	@Override
	public int sendMulti(Map<String, String[]> map) {
		return sqlSession.update(namespace+"sendMulti",map);
	}

	@Override
	public int getMulti(Map<String, Object> map) {
		return sqlSession.update(namespace+"getMulti",map);
	}

	@Override
	public List<MailVO> sendSave(String sender) {
		return sqlSession.selectList(namespace+"sendSave",sender);
	}

	@Override
	public List<MailVO> getSave(String empNo) {
		return sqlSession.selectList(namespace+"getSave",empNo);
	}

	@Override
	public int getSaveUp(Map<String, Object> map) {
		return sqlSession.update(namespace+"getSaveUp",map);
	}

	@Override
	public int sendSaveUp(Map<String, Object> map) {
		return sqlSession.update(namespace+"sendSaveUp",map);
		
	}
	
	
	
	
}
