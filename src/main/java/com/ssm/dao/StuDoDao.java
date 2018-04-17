package com.ssm.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

public interface StuDoDao {
	//列举出学个学生做过的所有题目相关信息
	HashMap<String, Object> SearchAllDidSubInfo(@Param("id") String id);
}
