package com.camcam.likes.service.impl;

import org.apache.ibatis.session.SqlSession;

import com.camcam.common.DataSource;
import com.camcam.likes.mapper.LikesMapper;
import com.camcam.likes.service.LikesService;
import com.camcam.product.vo.ProductVO;

public class LikeServiceImpl implements LikesService{
	SqlSession session = DataSource.getInstance().openSession(true);
	LikesMapper mapper = session.getMapper(LikesMapper.class);
	
	@Override
	public int getUserLikeCnt(ProductVO pvo) {
		return mapper.getUserLikeCnt(pvo);
	}
	
	
	
}
