package kr.or.ddit.schedule.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.schedule.model.ScheduleVo;

/**
 * kr.or.ddit.schedule.service
 * null.java
 * Desc : 일정 서비스 인터페스
 *
 * @Author : jerry
 * @Date : 2018-11-29 19:37
 * @Version :
 */
public interface ScheduleServiceInf {

	/**
	* Method : scheduleList
	* 작성자 : jerry
	* 변경이력 :
	* @return
	* Method 설명 : 프로젝트, 업무, 회의, 이슈 등 전체 일정
	*/
	Map<String, Object> scheduleList(String sid);
	
	/**
	* Method : myProjectList
	* 작성자 : jerry
	* 변경이력 :
	* @return
	* Method 설명 : 일정의 select 프로젝트명 list
	*/
	List<ScheduleVo> myProjectList(String sid);
	
}

