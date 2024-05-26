package com.camcam.review.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.camcam.common.DataSource;
import com.camcam.common.SearchVO;
import com.camcam.review.mapper.ReviewMapper;
import com.camcam.review.service.ReviewService;
import com.camcam.review.vo.ReviewVO;

public class ReviewServiceImpl implements ReviewService{
	SqlSession session = DataSource.getInstance().openSession(true);
	ReviewMapper mapper = session.getMapper(ReviewMapper.class);
	
	@Override
	public boolean addReview(ReviewVO rvo) {
		return mapper.insertReview(rvo) == 1;
	}

	@Override
	public List<ReviewVO> reviewList(SearchVO search) {
		return mapper.selectReviewList(search);
	}

	@Override
	public int totalCount(int productNo) {
		return mapper.getTotalCnt(productNo);
	}

	@Override
	public void modRating() {
		mapper.updateRating();
	}
}
