package kr.or.ddit.meeting.mapper;

import java.util.List;

import kr.or.ddit.meeting.model.MeetingVo;

/**
 * kr.or.ddit.meeting.mapper
 * null.java
 * Desc : 회의 맵퍼
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:57
 * @Version :
 */
public interface MeetingMapper {
	
	//지난 회의목록
	List<MeetingVo> meetingList(String project_id);
}
