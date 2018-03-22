package com.chuse.service;

import javax.annotation.Resource;





import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chuse.entity.User;
import com.chuse.dao.*;
@Service
@Transactional(readOnly=true)
public class RegisterServiceImpl {

	@Resource
	private RegisterDaoImpl registerDaoImpl;
	
	public void registerUser(User User){
		try{
			this.registerDaoImpl.save(User);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public User checkemail(String email){
		User email1=this.registerDaoImpl.findByid1(email);
		if(email1==null){
			return email1;	
		}else{
			return null;
		}
	
	}

}
