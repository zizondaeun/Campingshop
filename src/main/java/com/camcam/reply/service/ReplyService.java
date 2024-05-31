package com.camcam.reply.service;

import java.util.List;

import com.camcam.reply.vo.ReplyVO;

public interface ReplyService {
	//댓글 목록
	List<ReplyVO> replyList(int boardNo);
	//댓글 등록
	boolean addReply(ReplyVO rvo);
	//댓글 삭제
	boolean removeReply(int replyNo);
	//
	int getReplyCnt(int boardNo);
	boolean modReply(ReplyVO rvo);

}
