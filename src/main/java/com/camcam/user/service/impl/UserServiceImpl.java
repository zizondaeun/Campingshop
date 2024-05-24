package com.camcam.user.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.camcam.common.DataSource;
import com.camcam.user.mapper.UserMapper;
import com.camcam.user.service.UserService;
import com.camcam.user.vo.UserVO;

public class UserServiceImpl implements UserService{
	
	SqlSession session = DataSource.getInstance().openSession(true);
	UserMapper mapper = session.getMapper(UserMapper.class);
	
	@Override
	public boolean addUser(UserVO user) {
		// TODO Auto-generated method stub
		
		return mapper.insertUser(user) == 1;
	}

	@Override
	public boolean checkUserId(String userId) {
		// TODO Auto-generated method stub
		 return mapper.selectUserCountById(userId) > 0;
	}

	@Override
	public UserVO login(String id, String pw) {
		// TODO Auto-generated method stub
		return mapper.selectMember(id, pw);
	}

	@Override
	public UserVO checkMember(String id) {
		// TODO Auto-generated method stub
		return mapper.selectMember2(id);
	}
	
	
	@Override
	public List<UserVO> userList() {
		// TODO Auto-generated method stub
		return mapper.selectUserList();
	}
	
}
