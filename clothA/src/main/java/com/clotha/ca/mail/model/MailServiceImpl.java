package com.clotha.ca.mail.model;

import java.util.List;

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
	
	
}
