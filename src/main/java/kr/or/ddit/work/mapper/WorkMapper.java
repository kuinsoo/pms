package kr.or.ddit.work.mapper;

import java.util.List;

import kr.or.ddit.schedule.model.ScheduleVo;
import kr.or.ddit.work.model.WorkVo;

/**
 * kr.or.ddit.work.mapper
 * null.java
 * Desc : 업무 맵퍼
 *
 * @Author : Mr.KKu, jerry
 * @Date : 2018-11-27 / 오후 3:32
 * @Version :
 */
public interface WorkMapper {
	
	/**
	* Method : workAllSchedule
	* 작성자 : jerry
	* 변경이력 :
	* @param scheduleVo
	* @return
	* Method 설명 : 업무 전체 일정
	*/
	List<WorkVo> workAllSchedule(ScheduleVo scheduleVo);
	
}
