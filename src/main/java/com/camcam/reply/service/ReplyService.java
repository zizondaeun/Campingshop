package com.camcam.reply.service;

import java.util.List;

import com.camcam.common.SearchVO;
import com.camcam.reply.vo.ReplyVO;

public interface ReplyService {
	//댓글 목록
	List<ReplyVO> replyList(int boardNo);

}
