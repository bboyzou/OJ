package com.ssm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSONArray;
import com.ssm.pojo.SubInfo;
import com.ssm.service.TeaDo;
import com.ssm.service.UserCount;
import com.ssm.serviceimpl.UserCountImpl;
//登陆，注册，忘记密码分发
@Controller
public class User {
	@Autowired
	private UserCount userCount;
	@Autowired
	private TeaDo teaDo;
	public User() {
	}
	@RequestMapping(value="/log")
    public String Log(@RequestParam("id") String id,
    		@RequestParam("password") String password,Model model
    		) {
		System.out.println("收到登陆请求："+id);
		Map<String, String> map=new HashMap<String, String>();
		map=userCount.ifLog(id, password);
        String myid=map.get("id");
        String mark=map.get("mark");
        System.out.println(myid);
        if(myid!=null&&mark.equals("0")){
        	model.addAttribute("id", id);
        	return "index1";
        	//return "roleindex";
        }else if(myid!=null&&mark.equals("1")){
        	//teacher界面
        	List<SubInfo> subInfos=teaDo.getMySubInfo(myid);
        	JSONArray array=(JSONArray) JSONArray.toJSON(subInfos);
    		String info=array.toString();
    		model.addAttribute("info",info);
        	return "teacherindex";
		}else{
			return "fail";
		}
        
    }
	@RequestMapping(value="/regist")
    public String Regist(@RequestParam("id") String id,
    		@RequestParam("name") String name,
    		@RequestParam("password") String password,
    		@RequestParam("password2") String password2
    		) {
		System.out.println(id+" "+name+" "+password+" "+password2+" ");
        boolean flag=userCount.Regist(id, name,password, password2);
        if(flag) return "index2";
        else{
        	return "fail";
        }
    }
	@RequestMapping(value="/findPassword")
    public String ChangePassword(@RequestParam("id") String id,
    		@RequestParam("name") String name,
    		@RequestParam("password") String password,
    		@RequestParam("password2") String password2
    		) {
        boolean flag=userCount.ChangePassword(id, name, password,password2);
        if(flag) return "index2";
        else{
        	return "fail";
        }
    }
	@RequestMapping(value="/logOut")
    public String LogOut(Model model
    		) {
        model.addAttribute("id", null);
        System.out.println("收到退出登陆请求");
        return "index2";
    }
	
}
