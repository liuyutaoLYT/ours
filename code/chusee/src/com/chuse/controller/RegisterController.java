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
public class RegisterController {
	private static final String RegisterServiceImpl = null;
	@Resource
	private RegisterServiceImpl RegisterServiceImol;
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String register (@RequestParam("username") String username,
			@RequestParam("psw") String password ,
			@RequestParam("email") String email, User User,@RequestParam("file") CommonsMultipartFile file)
					throws IOException {
		System.out.println("11111");
		long  startTime=System.currentTimeMillis();
		   System.out.println("fileName："+file.getOriginalFilename());
		   String path="E:/"+new Date().getTime()+file.getOriginalFilename();
	         
	        File newFile=new File(path);
	        file.transferTo(newFile);
	        long  endTime=System.currentTimeMillis();
			User.setPassword(password);
//			User.setEmail(email);
//
//			User.setName(username);
//			User.setPicture(path);
//            this.RegisterServiceImpl.registerUser(User);
			return "regist";
	
	}
	// 2 关于比较两次密码是否一致的代码
	@RequestMapping(value="/checkpassword", method=RequestMethod.POST)
	@ResponseBody
	public boolean checkpassword(@RequestParam("psw") String psw,@RequestParam("psw1") String psw1){
		if(psw.equals(psw1)){
			return  true;
				}else{
					return false;
				}
	}
	// 3关于检验邮箱是否正确的代码   
	@RequestMapping(value="/checkemail", method=RequestMethod.POST)
	@ResponseBody
	public String checkemail(@RequestParam("email") String  email){
		User comperemail=RegisterServiceImol.checkemail(email);
		 boolean flag = false;
		  try{
		    String check = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
		    Pattern regex = Pattern.compile(check);
		    Matcher matcher = regex.matcher(email);
		    flag = matcher.matches();
		  }catch(Exception e){
			    flag = false;
			   }
		  if(flag==false){
			  return "1";
		  }
		if( comperemail!=null){
			
			return "true";
		}else{
			return "false";
		}
	}
	
	
}
