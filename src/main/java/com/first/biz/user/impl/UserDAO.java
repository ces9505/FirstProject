package com.first.biz.user.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.first.biz.user.UserVO;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public void insertUser(UserVO vo) {
		System.out.println("MYbatis insertuser 처리");
		mybatis.insert("UserDAO.insertUser", vo);
	}
	public UserVO getUser(UserVO vo) {
		System.out.println("MYbatis getUser처리");
		return mybatis.selectOne("UserDAO.getUser", vo);
		
	}
	public List<UserVO> getUserList(UserVO vo){
		System.out.println("MYbatis getUserList처리");
		return mybatis.selectList("UserDAO.getUserList",vo);
		
	}
	public UserVO updateUser(UserVO vo) {
		
		System.out.println("MYbatis updateUser 처리");
		System.out.println(vo.getUserid());
		mybatis.update("UserDAO.updateUser", vo);
		return mybatis.selectOne("UserDAO.getUser", vo);
		
	}
	
	public void updateUserBlock(UserVO vo) {
		String newRemark = "<"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())+">" + vo.getRemarks();
		vo.setRemarks(newRemark);
		System.out.println(vo.getUserid());
		System.out.println(vo.getRemarks());
		System.out.println(vo.getBlockdate());
		mybatis.update("UserDAO.updateUserBlock",vo);
		
	}
	
	public void deleteUser(UserVO vo) {
		System.out.println("MYbatis deleteUser 처리");
		mybatis.delete("UserDAO.deleteUser",vo);
	}
	public void updateClearBlock(UserVO vo) {
		System.out.println("MYbatis blockClear 처리");
		mybatis.update("UserDAO.userClearBlock",vo);
	}
	
}
