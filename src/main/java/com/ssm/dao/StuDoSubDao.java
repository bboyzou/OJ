package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssm.pojo.AllSubInfo;

public interface StuDoSubDao {
	public List<AllSubInfo> SearchAllDidSubInfo(@Param("user_id") String user_id);
	public List<AllSubInfo> SearchAllNotDidSubInfo(@Param("user_id") String user_id);
}
