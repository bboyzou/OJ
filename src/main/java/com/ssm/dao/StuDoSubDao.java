package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssm.pojo.AllSubInfo;

public interface StuDoSubDao {
	//查找这个学生选了的所有的课程
	public List<AllSubInfo> SearchAllDidSubInfo
	(@Param("user_id") String user_id);
	
	//查找这个学生没有用选的所有课程
	public List<AllSubInfo> SearchAllNotDidSubInfo
	(@Param("user_id") String user_id);
	
	//学生选择一门课程，选了一门课程需要更新两个表，更新stu_choose_sub和stu_work
	public boolean AddNewSubInStuCooseSub
	(@Param("user_id") String user_id);
	public boolean AddNewSubInStuWork(@Param("user_id") String user_id);
	
	
}
