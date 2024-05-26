package com.camcam.review.service;

import java.util.List;

import com.camcam.common.SearchVO;
import com.camcam.review.vo.ReviewVO;

public interface ReviewService {
	List<ReviewVO> reviewList(SearchVO search);
	int totalCount(int productNo);
	
	boolean addReview(ReviewVO rvo); // 리뷰 등록
	
	void modRating(); // 평점수정
}
