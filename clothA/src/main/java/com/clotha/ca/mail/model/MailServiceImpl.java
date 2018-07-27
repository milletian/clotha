package com.clotha.ca.mail.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService{
	
	@Autowired
	private MailDAO MailDao;

	@Override
	public int insertMail(MailVO vo) {
		return MailDao.insertMail(vo);
	}
	
	
}
