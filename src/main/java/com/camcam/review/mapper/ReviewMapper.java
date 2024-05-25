package com.camcam.review.mapper;

import com.camcam.review.vo.ReviewVO;

public interface ReviewMapper {
	// 리뷰 작성
	int insertReview(ReviewVO rvo);
}
