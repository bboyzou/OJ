package com.ssm.service;

import java.util.HashMap;
import java.util.List;

import com.ssm.pojo.AllSubInfo;
import com.ssm.pojo.StuInfo;
import com.ssm.pojo.SubInfo;
import com.ssm.pojo.SubRequire;
import com.ssm.pojo.TeaSub;

public interface StuDo {
	//展示学生的个人信息
	public StuInfo getStuInfo();
	//列举出这个学生选了的所有课程
	public List<AllSubInfo> getAllDidSubInfo();
	//列举出所有课程
	public List<SubInfo> getAllSubInfo();
	//学生选课
	public boolean AddNewSub(String problem_id);
	//学生提交代码
	public boolean SubmitCode(String problem_id,String language,String submit_code);
	public SubRequire getSubRequire(String problem_id);
}
