package com.ssm.controller;

import java.io.Console;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.jms.Session;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ssm.pojo.AllSubInfo;
import com.ssm.pojo.StuInfo;
import com.ssm.pojo.SubInfo;
import com.ssm.pojo.SubRequire;
import com.ssm.pojo.TeaSub;
import com.ssm.service.StuDo;
import com.ssm.serviceimpl.StuDoImpl;

import netscape.javascript.JSObject;

@Controller
public class StuLinkSub {
	@Autowired 
	private StuDo stuDo;
	public StuLinkSub() {
		// TODO Auto-generated constructor stub
	}
	@RequestMapping("/problemIndex")
	public String getProblems(Model model){
		//返回题目页面，并且返回所有的题目相关信息
		System.out.println("收到problem请求");
		List<SubInfo> Subs=stuDo.getAllSubInfo();
		JSONArray array=(JSONArray) JSONArray.toJSON(Subs);
		String info=array.toString();
		model.addAttribute("info",info);
		System.out.println(info);
		return "problemindex";
	}
	@RequestMapping("/goToUserInfo")
	public String getPersonalInfo(Model model){
		System.out.println("收到userindex请求");
		List<AllSubInfo> allSubInfo=(List<AllSubInfo>) stuDo.getAllDidSubInfo();
		JSONArray array=(JSONArray) JSONArray.toJSON(allSubInfo);
		String info=array.toString();
		StuInfo stuInfo= stuDo.getStuInfo();
		JSON json=(JSON)JSON.toJSON(stuInfo);
		String info2=json.toString();
		model.addAttribute("info",info);
		model.addAttribute("stuInfo",info2);
		System.out.println(info);
		System.out.println(info2);
		return "stuInfo";
	}
	@RequestMapping("/problemdetail")
	public String getSubDetail(Model model){
		//返回题目页面，并且返回所有的题目相关信息
//		System.out.println("收到problem请求");
//		List<SubInfo> Subs=stuDo.getAllSubInfo();
//		JSONArray array=(JSONArray) JSONArray.toJSON(Subs);
//		String info=array.toString();
//		model.addAttribute("info",info);
//		System.out.println(info);
		return "problemdetail";
	}
	@RequestMapping("/inSubmit")
	public String insSubmit(String problem_id,Model model){
		//返回题目页面，并且返回所有的题目相关信息
//		System.out.println("收到problem请求");
//		List<SubInfo> Subs=stuDo.getAllSubInfo();
//		JSONArray array=(JSONArray) JSONArray.toJSON(Subs);
//		String info=array.toString();
//		model.addAttribute("info",info);
//		System.out.println(info);
		
		System.out.println("这是我的pid:"+problem_id);
		SubRequire subRequire=stuDo.getSubRequire(problem_id);
		//JSON json=(JSON)JSON.toJSON(subRequire);
		//String info=json.toString();
		model.addAttribute("sub", subRequire);
		System.out.println("sssss"+subRequire.getContent());
		return "submit";
	}
	
	@RequestMapping("/Submit")
	@ResponseBody
	public String submitCode(String compiler_id,String submit_code,String problem_id){
		//返回题目页面，并且返回所有的题目相关信息
        System.out.println("aaa");
        System.out.println(compiler_id);
        String language="C";
        if(compiler_id.equals("2")){
        	language="C++";
        }else if(compiler_id.equals("3")){
        	language="Java";
        }
        System.out.println(language);
        System.out.println("bbb");
        System.out.println(problem_id);
        System.out.println("ccc");
        System.out.println(submit_code);
        boolean flag=stuDo.SubmitCode(problem_id, language, submit_code);
        if(flag){
        	System.out.println("插入code成功");
        	return "Ok";
        }else{
        	System.out.println("插入code失败");
        	return "No";
        }
		
	}
	@RequestMapping("/SureChoose")
	@ResponseBody
	public String ChooseSub(String problem_id){
		//返回题目页面，并且返回所有的题目相关信息
        System.out.println("这是我的problem_id:");
        System.out.println(problem_id);
        boolean falg=stuDo.AddNewSub(problem_id);
        if(falg){
        	return "OK";
        }else {
        	return "No";
        }
		
	}
	
	
}
