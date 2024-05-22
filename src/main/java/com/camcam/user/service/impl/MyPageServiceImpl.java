package com.camcam.user.service.impl;

import org.apache.ibatis.session.SqlSession;

import com.camcam.common.DataSource;
import com.camcam.user.mapper.MyPageMapper;
import com.camcam.user.service.MyPageService;
import com.camcam.user.vo.UserVO;

public class MyPageServiceImpl implements MyPageService {
	SqlSession session = DataSource.getInstance().openSession(true); 
	MyPageMapper mapper = session.getMapper(MyPageMapper.class);
	
	@Override
	public UserVO getMypage(String id) {
		return mapper.selectMypage(id);
	}

}
