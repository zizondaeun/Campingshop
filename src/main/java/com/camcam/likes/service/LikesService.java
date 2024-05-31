package com.camcam.likes.service;

import com.camcam.product.vo.ProductVO;

public interface LikesService {
	public int getUserLikeCnt(ProductVO pvo);
	
	// 좋아요 추가
	boolean addLike(ProductVO pvo);
	// 좋아요 삭제
	boolean removeLike(ProductVO pvo);
}
