package com.ssm.service;

import java.util.List;

import com.ssm.pojo.AllSubInfo;

public interface StuDo {
	//列举出这个学生选了的所有课程
	public List<AllSubInfo> getAllDidSubInfo();
	//列举出这个学生没有选的所有课程
	public List<AllSubInfo> getAllNotDidSubInfo();
	//学生选课
	public boolean AddNewSub();
	//学生提交代码
	public boolean SubmitCode();
}
