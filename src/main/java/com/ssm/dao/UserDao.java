package com.ssm.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

public interface UserDao {
	//查找是否有这个账户，登陆的时候用的（根据sid和pawssword）
		public HashMap<String, String> SearchUser(@Param("id") String id,
				@Param("password") String password);
	//查找表中是否已经有了这个学生
		public String SearchIfExist(@Param("id") String id);
	//学生注册
		public Boolean AddStu(@Param("id") String id,
				@Param("name") String name,@Param("password")String pasword);
	//更改密码
		public Boolean ChangePassword(@Param("id") String id,@Param("name") String name,
				@Param("password") String password);
}
