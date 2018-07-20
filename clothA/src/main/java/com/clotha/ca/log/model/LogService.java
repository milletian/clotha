package com.clotha.ca.log.model;

public interface LogService {
	public int loginInsert(LogVO logVo);	//StoreLoginController
	public int logoutUpdate(int logPk);	//logoutController

}
