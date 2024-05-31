package com.camcam.likes.mapper;

import com.camcam.product.vo.ProductVO;

public interface LikesMapper {
	// 좋아요 여부 체크
	int getUserLikeCnt(ProductVO pvo);
	// 좋아요 추가
	int insertLike(ProductVO pvo);
	// 좋아요 삭제
	int deleteLike(ProductVO pvo);
}
