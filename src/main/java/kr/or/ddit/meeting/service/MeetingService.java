package kr.or.ddit.meeting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.meeting.mapper.MeetingMapper;
import kr.or.ddit.meeting.model.MeetingVo;

/**
 * kr.or.ddit.meeting.service
 * null.java
 * Desc : 회의 서비스
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:58
 * @Version :
 */
@Service
@Transactional
public class MeetingService implements MeetingServiceInf{

	@Autowired
	private MeetingMapper meetingMapper;

	@Override
	public List<MeetingVo> meetingList(String project_id) {
		return meetingMapper.meetingList(project_id);
	}

}
