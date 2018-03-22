package com.chuse.controller;
import java.io.File;



import java.io.IOException;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.chuse.entity.User;
import com.chuse.service.*;
@Controller
@RequestMapping("/Usercontroller")
public class LoginController {
	@Resource
	private LoginServiceImpl  loginServiceImpl;
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(@RequestParam("name") String name ,
			@RequestParam("password") String password, Model model,HttpSession session){
		User u=loginServiceImpl.Login(name,password);
			if(u!=null){
				model.addAttribute(u);
				session.setAttribute("u", u);
				return "index";
			}else{
				model.addAttribute("error","账号密码错误");
				return "error";
			}	
		
	}
}
