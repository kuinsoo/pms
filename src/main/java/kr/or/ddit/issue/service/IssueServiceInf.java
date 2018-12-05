package kr.or.ddit.issue.service;

import java.util.List;

import kr.or.ddit.issue.model.IssueVo;
import kr.or.ddit.schedule.model.ScheduleVo;

/**
 * kr.or.ddit.issue.service
 * null.java
 * Desc : 이슈서비스 인터페이스
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:54
 * @Version :
 */
public interface IssueServiceInf {
	
	/**
	* Method : issueAllSchedule
	* 작성자 : jerry
	* 변경이력 :
	* @param scheduleVo
	* @return
	* Method 설명 : 이슈 전체 일정
	*/
	List<IssueVo> issueAllSchedule(ScheduleVo scheduleVo);
	
}
