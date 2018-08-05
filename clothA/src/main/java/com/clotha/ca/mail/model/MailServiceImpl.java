package com.clotha.ca.mail.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService{
	
	@Autowired
	private MailDAO MailDao;

	@Override
	public int insertMail(MailVO vo) {
		int result = 0;
		int cnt = MailDao.insertMail(vo);
		if(cnt > 0) {
			if(vo.getEmpNo().length()>5) {
				MailVO vo2 = new MailVO();
				vo2.setMailNo(vo.getMailNo());
				String[] empNo = vo.getEmpNo().split(",");
				for(String emp : empNo) {
					vo2.setEmpNo(emp);
					cnt += MailDao.insertGet(vo2);
				}
			}
			result = cnt;
		}
		
		return result;
	}

	@Override
	public List<MailVO> selectGetMail(String empNo) {
		return MailDao.selectGetMail(empNo);
	}

	@Override
	public MailVO selectDetail(MailVO mailVo) {
		int cnt = MailDao.mailRead(mailVo);
		if(cnt>0) {
			System.out.println("읽기 성공");
		}else {
			System.out.println("읽기 실패");
		}
		
		return MailDao.selectDetail(mailVo);
	}

	@Override
	public int deleteMail(MailVO vo) {
		return MailDao.deleteMail(vo);
	}

	@Override
	public List<MailVO> selectSender(String empNo) {
		return MailDao.selectSender(empNo);
	}

	@Override
	public MailVO sendMailDetail(int mailNo) {
		return MailDao.sendMailDetail(mailNo);
	}

	@Override
	public List<MailVO> sendEmpNO(int mailNo) {
		return MailDao.sendEmpNO(mailNo);
	}

	@Override
	public int sendDelete(int mailNo) {
		return MailDao.sendDelete(mailNo);
	}

	@Override
	public int sendMulti(Map<String, String[]> map) {
		return MailDao.sendMulti(map);
	}

	@Override
	public int getMulti(Map<String, Object> map) {
		return MailDao.getMulti(map);
	}
	
	@Override
	public List<MailVO> sendSave(String sender) {
		return MailDao.sendSave(sender);
	}
 	@Override
	public List<MailVO> getSave(String empNo) {
		return MailDao.getSave(empNo);
	}
 	@Override
	public int getSaveUp(Map<String, Object> map) {
		return MailDao.getSaveUp(map);
	}
 	@Override
	public int sendSaveUp(Map<String, Object> map) {
		return MailDao.sendSaveUp(map);
	}
	
	
}
