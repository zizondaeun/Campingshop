package com.camcam.review.mapper;

import java.util.List;

import com.camcam.common.SearchVO;
import com.camcam.review.vo.ReviewVO;

public interface ReviewMapper {
	// 리뷰 리스트
	List<ReviewVO> selectReviewList(SearchVO search);
	// 리뷰 개수
	ReviewVO getTotalCnt(int productNo);
	// 리뷰 작성
	int insertReview(ReviewVO rvo);
//	// 해당 유저의 해당 제품의 리뷰 여부 판단
//	int getReviewCnt(ReviewVO rvo);
	// 리뷰 작성시 product의 rating 업데이트
	void updateRating();
	
	int getUserReviewCnt(ReviewVO rvo);
}
