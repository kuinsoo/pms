package kr.or.ddit.schedule.mapper;

import java.util.List;

import kr.or.ddit.schedule.model.ScheduleVo;

/**
 * kr.or.ddit.work.mapper
 * null.java
 * Desc : 일정 맵퍼
 *
 * @Author : jerry
 * @Date : 2018-12-03 16:13
 * @Version :
 */
public interface ScheduleMapper {
	
	/**
	* Method : myProjectList
	* 작성자 : jerry
	* 변경이력 :
	* @return
	* Method 설명 : 일정의 select 프로젝트명 list
	*/
	List<ScheduleVo> myProjectList(String sid);
	
}
