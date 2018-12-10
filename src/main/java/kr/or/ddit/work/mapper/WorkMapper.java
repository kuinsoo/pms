package kr.or.ddit.work.mapper;

import java.util.List;
import java.util.Map;

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
	
	
	/**
	* Method : selectWorks
	* 작성자 : Mr.kku
	* 변경이력 :
	* @param mapWork
	* @return
	* Method 설명 : 업무 리스트를 이메일과 프로젝트 ID 로 검색한다.
	*/
	List<WorkVo> selectWorks(Map<String,String> mapWork);
	
	/**
	* Method : createWork
	* 작성자 : Mr.kku
	* 변경이력 :
	* @param workVo
	* @return
	* Method 설명 : 업무를 생성한다
	*/
	int createWork(WorkVo workVo);
	
	/**
	* Method : deleteWork
	* 작성자 : Mr.kku
	* 변경이력 :
	* @param work_id
	* @return
	* Method 설명 : 업무 삭제
	*/
	int deleteWork(String work_id);
	
	/**
	* Method : updateWork
	* 작성자 : Mr.kku
	* 변경이력 :
	* @param workVo
	* @return
	* Method 설명 : 업무 수정
	*/
	int updateWork(WorkVo workVo);
}
