package com.camcam.user.service.impl;

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
	
}
