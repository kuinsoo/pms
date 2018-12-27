package kr.or.ddit.meeting.service;

import java.util.List;

import kr.or.ddit.meeting.model.MeetingVo;

/**
 * kr.or.ddit.meeting.service
 * null.java
 * Desc : 회의 서비스 인터페이스
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:59
 * @Version :
 */
public interface MeetingServiceInf {
	//지난 회의목록
	List<MeetingVo> meetingList(String project_id);
}
