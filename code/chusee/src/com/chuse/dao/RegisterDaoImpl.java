package com.chuse.dao;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.chuse.entity.User;

@Repository
public class RegisterDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
		public void save(User User) throws Exception {
			Session session=this.sessionFactory.openSession();
			Transaction tx=session.beginTransaction();
			session.save(User);
			tx.commit();
		}
		public User findByid1(String email){
			User getemail=(User)this.sessionFactory.openSession().createQuery("from User where email="+email).uniqueResult();
			if(getemail==null){
				return getemail;
			}else{
				return null;
			}
		}
}