package com.first.biz.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.first.biz.user.UserVO;

@Service("UserSevice")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;

	@Override
	public void insertUser(UserVO vo) {

		userDAO.insertUser(vo);

	}
	@Override
	public UserVO getUser(UserVO vo) {
		
		return userDAO.getUser(vo);
	}
	
	@Override
	public List<UserVO> getUserList(UserVO vo) {
		
		return userDAO.getUserList(vo);
	}
	
	@Override
	public UserVO updateUser(UserVO vo) {
		return userDAO.updateUser(vo);
		
	}
	
	@Override
	public void updateUserBlock(UserVO vo) {
		
		userDAO.updateUserBlock(vo);
	}
	@Override
	public void updateClearBlock(UserVO vo) {
		
		userDAO.updateClearBlock(vo);
		
	}
	
	@Override
	public void deleteUser(UserVO vo) {
		userDAO.deleteUser(vo);
		
	}
}
