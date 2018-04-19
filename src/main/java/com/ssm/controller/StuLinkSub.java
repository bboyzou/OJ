package com.ssm.controller;

import java.util.List;

import javax.jms.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssm.pojo.AllSubInfo;
import com.ssm.service.StuDo;

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
		model.addAttribute(allSubInfo);
		System.out.println(allSubInfo);
		System.out.println();
		return "stuInfo";
	}
}
