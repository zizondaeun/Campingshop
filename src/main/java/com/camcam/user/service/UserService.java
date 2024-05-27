package com.camcam.user.service;

import java.util.List;

import com.camcam.user.vo.UserVO;

public interface UserService {
	boolean addUser(UserVO user); //회원가입

	boolean checkUserId(String userId); //아이디 중복체크
	
	UserVO login(String id, String pw); //로그인
	UserVO checkMember(String id); 
	
	UserVO loginFind(String name, String tel); //아이디 찾기
	UserVO pwFind(String id, String name, String tel);
	
	public List<UserVO> userList();
	
	boolean userModefy(UserVO userId);
	
	boolean modifyUser(String userId);
	
    UserVO getUserById(String userId);

	
}
