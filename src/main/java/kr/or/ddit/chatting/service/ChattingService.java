package kr.or.ddit.chatting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.chatting.mapper.ChattingMapper;
import kr.or.ddit.meeting.model.MeetingVo;

/**
 * kr.or.ddit.chatting.service
 * null.java
 * Desc : 채팅 서비스
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:42
 * @Version :
 */
@Service
@Transactional
public class ChattingService implements ChattingServiceInf{

	@Autowired
	private ChattingMapper chattingMapper;
	
	@Override
	public List<MeetingVo> chattingList(String meeting_title) {
		return chattingMapper.chattingList(meeting_title);
	}
	
}
