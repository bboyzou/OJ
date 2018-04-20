package com.ssm.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssm.pojo.AllSubInfo;
import com.ssm.pojo.StuInfo;
import com.ssm.pojo.SubInfo;
import com.ssm.pojo.TeaSub;

public interface StuDoSubDao {
	//展示学生的信息
	public StuInfo getStuInfo(@Param("user_id") String user_id);
	//查找这个学生选了的所有的课程
	public List<AllSubInfo> SearchAllDidSubInfo
	(@Param("user_id") String user_id);
	
	//查找所有课程信息
	public List<SubInfo> SearchAllSubInfo();
	
	//学生选择一门课程，选了一门课程需要更新两个表，更新stu_choose_sub和stu_work
	public boolean AddNewSubInStuCooseSub
	(@Param("user_id") String user_id);
	public boolean AddNewSubInStuWork(@Param("user_id") String user_id);
	
	
}
