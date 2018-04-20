package com.ssm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.jms.Session;
import javax.json.JsonArray;
import javax.json.JsonObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ssm.pojo.AllSubInfo;
import com.ssm.pojo.StuInfo;
import com.ssm.pojo.SubInfo;
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
	@RequestMapping("problemIndex")
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
	@RequestMapping("goToUserInfo")
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
}
