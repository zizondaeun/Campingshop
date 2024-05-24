package com.camcam.user.service;

import com.camcam.user.vo.UserVO;

public interface UserService {
	boolean addUser(UserVO user);

	boolean checkUserId(String userId); 
	
	UserVO login(String id, String pw);
	UserVO checkMember(String id);
	
}
