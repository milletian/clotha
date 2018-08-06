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
	public List<MailVO> selectGetMail(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"selectGetMail",map);
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
	public List<MailVO> selectSender(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"selectSender",map);
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

	@Override
	public int getTotalRecord(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"getTotalRecord",map);
	}

	@Override
	public int sendTotalRecord(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"sendTotalRecord",map);
	}

	@Override
	public List<MailVO> searchName(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"searchName",map);
	}

	@Override
	public List<MailVO> saveGetL(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"saveGetL",map);
	}

	@Override
	public List<MailVO> saveSendL(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"saveSendL",map);
	}

	@Override
	public List<MailVO> searchName1(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"searchName1",map);
	}

	@Override
	public int sendTotalRecord1(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"sendTotalRecord1", map);
	}

	@Override
	public int getTotalRecord1(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"getTotalRecord1",map);
	}

	
	
	
	
}
