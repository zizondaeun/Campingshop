package com.camcam.reply.mapper;

import java.util.List;

import com.camcam.common.SearchVO;
import com.camcam.reply.vo.ReplyVO;

public interface ReplyMapper {
	//댓글 목록
	List<ReplyVO> replyList(SearchVO search);
	//
	List<ReplyVO> replyListPaging(SearchVO search);
	//댓글 등록
	int insertReply(ReplyVO rvo);
	//댓글 삭제
	int deleteReply(int replyNo);
	//
	int selectCount(int replyNo);
	int updateReply(ReplyVO rvo);


}
