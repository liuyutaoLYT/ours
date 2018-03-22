package com.chuse.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chuse.entity.User;
import com.chuse.dao.*;
@Service
public class LoginServiceImpl {
	@Resource
	private LoginDaoImpl loginDaoImpl;
	@Transactional(readOnly=true)
	public User Login(String email,String password){
		User login=this.loginDaoImpl.findById(email);
		if(login!=null)
		{
			if(login.getPassword().equals(password)){
				return login;
			}else{
				return null;
			}
	}else{
		return null;
	}
}
}
