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

	public List<AllSubInfo> getAllNotDidSubInfo() {
		// TODO Auto-generated method stub
		session=request.getSession();
		String user_id=(String)session.getAttribute("id");
		return stuDoSubDao.SearchAllNotDidSubInfo(user_id);
	}

	public boolean AddNewSub() {
		// TODO Auto-generated method stub
		session=request.getSession();
		String user_id=(String)session.getAttribute("id");
		boolean flag1=stuDoSubDao.AddNewSubInStuCooseSub(user_id);
		boolean flag2=stuDoSubDao.AddNewSubInStuWork(user_id);
		return (flag1&&flag2);
	}

	public boolean SubmitCode() {
		// TODO Auto-generated method stub
		return false;
	}

}
