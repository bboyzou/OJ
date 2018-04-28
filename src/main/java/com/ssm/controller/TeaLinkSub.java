package com.ssm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.ssm.pojo.AllSubInfo;
import com.ssm.pojo.StuLinkSubInfo;
import com.ssm.pojo.SubInfo;
import com.ssm.pojo.SubRequire;
import com.ssm.pojo.TestData;
import com.ssm.service.TeaDo;

@Controller
public class TeaLinkSub {
	@Autowired
	TeaDo teaDo;
	@Autowired
	private HttpSession session;
	@Autowired
	private HttpServletRequest request;
	public TeaLinkSub() {
		// TODO Auto-generated constructor stub
	}
	@RequestMapping("/inTeaAdd")
	public String TeaForget(){
		System.out.println("收到了进入增加题目页面的请求");
		return "teacheradd";
	}
	
	
	
	@RequestMapping("/teaReLog")
	public String TeaReLog(String id,Model model){
		System.out.println("进来了重定向");
		List<SubInfo> subInfos=teaDo.getMySubInfo(id);
    	JSONArray array=(JSONArray) JSONArray.toJSON(subInfos);
		String info=array.toString();
		model.addAttribute("info",info);
    	return "teacherindex";
	}
	
	
	
	
	@RequestMapping("/teaSearch")
	public String TeaSearch(String problem_id,Model model){
		System.out.println("收到了搜寻学生成绩的请求");
		System.out.println(problem_id);
		List<StuLinkSubInfo> stuLinkSubs=teaDo.getSubmitInfo(problem_id);
		JSONArray array=(JSONArray) JSONArray.toJSON(stuLinkSubs);
		String info=array.toString();
		System.out.println(info);
		model.addAttribute("info", info);
		return "teachersearch";
	}
	@RequestMapping("/lookCode")
	@ResponseBody
	public String LookCode(String problem_id,String user_id){
		System.out.println("收到了查看详细代码的请求");
		System.out.println(problem_id);
		System.out.println(user_id);
		String code=teaDo.getStuCode(problem_id, user_id);
		return code;
	}
	@RequestMapping("/teaChangeSub")
	public String ChangeSub(String problem_id,Model model){
		System.out.println("收到了修改题目的请求");
		SubRequire subRequire=teaDo.getMySubRequire(problem_id);
		model.addAttribute("subInfo", subRequire);
		List<TestData> testDatas=teaDo.getTestDataInfo(problem_id);
		JSONArray array=(JSONArray) JSONArray.toJSON(testDatas);
		String info=array.toString();
		model.addAttribute("testdata", info);
		return "teachangesub";
	}
	
	@RequestMapping("/TeaDeleSub")
	@ResponseBody
	public String DeleSub(String problem_id){
		System.out.println("收到了删除题目的请求");
		System.out.println(problem_id);
		try{
			teaDo.DeleSub(problem_id);
			return "1";
		}catch(Exception exception){
			return "0";
		}
	}
	@RequestMapping("/teaAddSub")
	public ModelAndView TeaAddSub(@Param("problem_name")String problem_name,
			@Param("content")String content,
			@Param("time_lim") String time_lim,
			@Param("memory_lim") String memory_lim){
		System.out.println("收到了增加题目的请求");
		System.out.println(problem_name);
		System.out.println(content);
		System.out.println(time_lim);
		System.out.println(memory_lim);
		session=request.getSession();
		String tid=(String) session.getAttribute("id");
		System.out.println(tid);
		boolean flag=teaDo.AddNewSub(tid,problem_name, content, time_lim, memory_lim);
		return new ModelAndView("redirect:/teaReLog?id="+tid);
		
		//		if(flag){
//			List<SubInfo> subInfos=teaDo.getMySubInfo(tid);
//        	JSONArray array=(JSONArray) JSONArray.toJSON(subInfos);
//    		String info=array.toString();
//    		model.addAttribute("info",info);
//        	return "teacherindex";
//		}
//		else{
//			return "fail";
//		}
	}
	
}
