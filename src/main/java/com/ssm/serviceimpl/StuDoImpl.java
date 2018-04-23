package com.ssm.serviceimpl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.StuDoSubDao;
import com.ssm.pojo.AllSubInfo;
import com.ssm.pojo.StuInfo;
import com.ssm.pojo.SubInfo;
import com.ssm.pojo.SubRequire;
import com.ssm.pojo.TeaSub;
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
		session = request.getSession();
		String user_id = (String) session.getAttribute("id");
		return stuDoSubDao.SearchAllDidSubInfo(user_id);
	}

	public List<SubInfo> getAllSubInfo() {
		// TODO Auto-generated method stub
		return stuDoSubDao.SearchAllSubInfo();
	}

	public boolean AddNewSub(String problem_id) {
		// TODO Auto-generated method stub
		session = request.getSession();
		String user_id = (String) session.getAttribute("id");
		boolean flag1 = stuDoSubDao.AddNewSubInStuCooseSub(user_id, problem_id);
		boolean flag2 = stuDoSubDao.AddNewSubInStuWork(user_id, problem_id);
		return (flag1 && flag2);
	}

	public StuInfo getStuInfo() {
		// TODO Auto-generated method stub
		session = request.getSession();
		String user_id = (String) session.getAttribute("id");
		return stuDoSubDao.getStuInfo(user_id);
	}

	public SubRequire getSubRequire(String problem_id) {
		// TODO Auto-generated method stub
		return stuDoSubDao.getSubRequire(problem_id);
	}

	public boolean SubmitCode(String problem_id, String language, String submit_code) {
		// TODO Auto-generated method stub
		session = request.getSession();
		String user_id = (String) session.getAttribute("id");
		Date dt = new Date();
		SimpleDateFormat matter1 = new SimpleDateFormat("yyyy-MM-dd");
		String submit_date=matter1.format(dt);
		return stuDoSubDao.SubmitCode(user_id, problem_id, language, submit_code, submit_date);
	}

}
