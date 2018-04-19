package com.ssm.serviceimpl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.StuDoSubDao;
import com.ssm.pojo.AllSubInfo;
import com.ssm.service.StuDo;
@Service
public class StuDoImpl implements StuDo {
	@Autowired
	private StuDoSubDao stuDoSubDao;
	@Autowired  
	private HttpSession session;  

	@Autowired  
	private HttpServletRequest request; 
	public StuDoImpl() {
		// TODO Auto-generated constructor stub
	}

	public List<AllSubInfo> getAllDidSubInfo() {
		// TODO Auto-generated method stub
		session=request.getSession();
		String user_id=(String)session.getAttribute("id");
		return stuDoSubDao.SearchAllDidSubInfo(user_id);
	}

	public List<AllSubInfo> getAllNotDidSubInfo(String user_id) {
		// TODO Auto-generated method stub
		return stuDoSubDao.SearchAllDidSubInfo(user_id);
	}

}
