package com.ssm.serviceimpl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.TeaDoSubDao;
import com.ssm.pojo.StuLinkSubInfo;
import com.ssm.pojo.SubInfo;
import com.ssm.pojo.SubRequire;
import com.ssm.pojo.TestData;
import com.ssm.service.TeaDo;
@Service
public class TeaDoImpl implements TeaDo {
	@Autowired
	TeaDoSubDao teaDoSubDao;
	@Autowired
	private HttpSession session;
	@Autowired
	private HttpServletRequest request;
	public TeaDoImpl() {
		// TODO Auto-generated constructor stub
	}

	public List<SubInfo> getMySubInfo(String tid) {
		// TODO Auto-generated method stub
		session = request.getSession();
		session.setAttribute("id", tid);
		return teaDoSubDao.getTeaSubInfo(tid);
	}

	public List<StuLinkSubInfo> getSubmitInfo(String problem_id) {
		// TODO Auto-generated method stub
		return teaDoSubDao.getStuLinkSubInfo(problem_id);
	}

	public String getStuCode(String problem_id, String user_id) {
		// TODO Auto-generated method stub
		return teaDoSubDao.getCode(problem_id, user_id);
	}

	public boolean AddNewSub(String tid,String problem_name, String content, String time_lim, String memory_lim) {
		int problem_id=teaDoSubDao.getNextProId()+1;
		return teaDoSubDao.addNewSub(tid, problem_id, problem_name, content, time_lim, memory_lim);
	}

	public boolean DeleSub(String problem_id) {
		boolean flag1=teaDoSubDao.deleSubFromStuChooseSub(problem_id);
		boolean flag2=teaDoSubDao.deleSubFromStuWork(problem_id);
		boolean flag3=teaDoSubDao.deleSubFromTeaSub(problem_id);
		
		return (flag1&&flag2&&flag3);
	}

	public SubRequire getMySubRequire(String problem_id) {
		// TODO Auto-generated method stub
		return teaDoSubDao.getMySubRequire(problem_id);
	}

	public List<TestData> getTestDataInfo(String problem_id) {
		// TODO Auto-generated method stub
		return teaDoSubDao.getTestDataInfo(problem_id);
	}

}
