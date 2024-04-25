package com.first.biz.user.impl;

import java.util.List;

import com.first.biz.user.UserVO;

public interface UserService {

	public void insertUser(UserVO vo);
	
	public UserVO getUser(UserVO vo);
	
	public UserVO updateUser(UserVO vo);
	
	public void deleteUser(UserVO vo);
	
	public List<UserVO> getUserList(UserVO vo);

	public void updateUserBlock(UserVO vo);

	public void updateClearBlock(UserVO vo);
}
