package com.ssm.service;

import java.util.List;

import com.ssm.pojo.StuLinkSubInfo;
import com.ssm.pojo.SubInfo;
import com.ssm.pojo.SubRequire;
import com.ssm.pojo.TestData;

public interface TeaDo {
	// 列举出这个老师布置了的所有题目
	public List<SubInfo> getMySubInfo(String tid);

	// 列举出选了这个题目的所有学生的答题信息
	public List<StuLinkSubInfo> getSubmitInfo(String problem_id);

	// 列出这个学生这个题目的代码
	public String getStuCode(String problem_id, String user_id);

	// 增加一个题目
	public boolean AddNewSub(String tid, String problem_name, String content, String time_lim, String memory_lim);

	// 老师删除题目
	public boolean DeleSub(String problem_id);

	//用于修改题目信息的时候，先返回这个题目的一些具体信息
	public SubRequire getMySubRequire(String problem_id);
	
	//返回这个题目的测试数据信息
	public List<TestData> getTestDataInfo(String problem_id);
	
	
	
	
	
}
