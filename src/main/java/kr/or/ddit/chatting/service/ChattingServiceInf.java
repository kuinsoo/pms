package kr.or.ddit.chatting.service;

import java.util.List;

import kr.or.ddit.chatting.model.ChattingVo;

/**
 * kr.or.ddit.chatting.service
 * null.java
 * Desc :채팅서비스 인터페이스
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:43
 * @Version :
 */
public interface ChattingServiceInf {
	//지난 채팅목록
	List<ChattingVo> chattingList(String meeting_id);
}
