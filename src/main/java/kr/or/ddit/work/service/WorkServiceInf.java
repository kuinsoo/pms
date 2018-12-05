package kr.or.ddit.work.service;

import java.util.List;

import kr.or.ddit.schedule.model.ScheduleVo;
import kr.or.ddit.work.model.WorkVo;

/**
 * kr.or.ddit.work.service
 * null.java
 * Desc : 업무 서비스 인터페이스
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 3:33
 * @Version :
 */
public interface WorkServiceInf {
	
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
