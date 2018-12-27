package kr.or.ddit.chatting.mapper;

import java.util.List;

import kr.or.ddit.meeting.model.MeetingVo;

/**
 * kr.or.ddit.chatting.mapper
 * null.java
 * Desc : 채팅 맵퍼
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:42
 * @Version :
 */
public interface ChattingMapper {
	//지난 채팅목록
	List<MeetingVo> chattingList(String meeting_title);
}
