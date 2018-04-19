package com.ssm.service;

import java.util.List;

import com.ssm.pojo.AllSubInfo;

public interface StuDo {
	public List<AllSubInfo> getAllDidSubInfo();
	public List<AllSubInfo> getAllNotDidSubInfo(String user_id);
}
