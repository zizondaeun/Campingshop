package com.camcam.reply.mapper;

import java.util.List;

import com.camcam.common.SearchVO;
import com.camcam.reply.vo.ReplyVO;

public interface ReplyMapper {
	//댓글 목록
	List<ReplyVO> selectReplyList(int boardNo);

}
