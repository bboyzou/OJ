package com.ssm.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.pojo.StuLinkSubInfo;
import com.ssm.pojo.SubInfo;

public interface TeaDoSubDao {
	//列举出这个老师布置了的所有课程
	public List<SubInfo> getTeaSubInfo(@Param("tid") String tid);
	//列举出选了这个题目的所有学生的答题信息
	public List<StuLinkSubInfo> getStuLinkSubInfo(
			@Param("problem_id") String problem_id);
	//查看这个学生的这个题目的代码
	public String getCode(@Param("problem_id") String problem_id,
			@Param("user_id") String user_id);
	//找到下个应该给的题号
	public int getNextProId();
	//增加一个课程
	public boolean addNewSub(@Param("tid") String tid,
			@Param("problem_id") int problem_id,
			@Param("problem_name") String problem_name,
			@Param("content") String content,
			@Param("time_lim") String time_lim,
			@Param("memory_lim") String memory_lim);
	//老师删除一个课程，需要删除3个表的数据
	public boolean deleSubFromTeaSub(
			@Param("problem_id") String problem_id);
	public boolean deleSubFromStuChooseSub(
			@Param("problem_id") String problem_id);
	public boolean deleSubFromStuWork(
			@Param("problem_id") String problem_id);
	
	
	
	
	
	
	


}
