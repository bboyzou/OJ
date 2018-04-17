package com.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Stu {

	public Stu() {
		// TODO Auto-generated constructor stub
	}
	@RequestMapping("problemIndex")
	public String getProblems(){
		System.out.println("收到problem请求");
		return "problemindex";
	}
	@RequestMapping("goToUserInfo")
	public String getPersonalInfo(){
		System.out.println("收到userindex请求");
		return "stuInfo";
	}
}
