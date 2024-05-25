package com.camcam.review.mapper;

import java.util.List;

import com.camcam.common.SearchVO;
import com.camcam.review.vo.ReviewVO;

public interface ReviewMapper {
	// 리뷰 리스트
	List<ReviewVO> selectReviewList(SearchVO search);
	// 리뷰 개수
	
	// 리뷰 작성
	int insertReview(ReviewVO rvo);
}
