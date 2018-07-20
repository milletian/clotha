package com.clotha.ca.log.model;

public interface LogDAO {
	public int loginInsert(LogVO logVo);	//StoreLoginController
	public int logoutUpdate(int logPk);	//logoutController

}
	