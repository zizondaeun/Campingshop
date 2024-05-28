package com.camcam.board.mapper;

import java.util.List;

import com.camcam.board.vo.QnAVO;

public interface BoardMapper {
	//게시글 목록
	List<QnAVO> selectBoard();

}
