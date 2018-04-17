package com.ssm.service;

import java.util.HashMap;

public interface UserCount {
	//判断登陆，返回的东西有id和mark值
	public HashMap<String, String> ifLog(String id, String password);

	// 注册
	public boolean Regist(String id,String name,
			String password, String password2);
	//更改密码
	public boolean ChangePassword(String id,String name,
			String password,String password2);
}
