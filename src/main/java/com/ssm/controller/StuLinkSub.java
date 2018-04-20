package com.ssm.controller;

import java.util.List;

import javax.jms.Session;
import javax.json.JsonArray;
import javax.json.JsonObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSONArray;
import com.ssm.pojo.AllSubInfo;
import com.ssm.service.StuDo;

import netscape.javascript.JSObject;

@Controller
public class StuLinkSub {
	@Autowired 
	private StuDo stuDo;
	public StuLinkSub() {
		// TODO Auto-generated constructor stub
	}
	@RequestMapping("problemIndex")
	public String getProblems(){
		System.out.println("收到problem请求");
		return "problemindex";
	}
	@RequestMapping("goToUserInfo")
	public String getPersonalInfo(Model model){
		System.out.println("收到userindex请求");
		List<AllSubInfo> allSubInfo=(List<AllSubInfo>) stuDo.getAllDidSubInfo();
		JSONArray array=(JSONArray) JSONArray.toJSON(allSubInfo);
		String info=array.toString();
		model.addAttribute("info",info);
		System.out.println(info);
		System.out.println();
		return "stuInfo";
	}
}
