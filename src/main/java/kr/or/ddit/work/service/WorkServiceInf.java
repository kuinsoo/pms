package kr.or.ddit.work.service;

import java.util.List;
import java.util.Map;

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
	
	/**
	* Method : selectWorks
	* 작성자 : Mr.kku
	* 변경이력 :
	* @param work_project
	* @return
	* Method 설명 : 업무 리스트를 이메일과 프로젝트 ID 로 검색한다.
	*/
	List<WorkVo> selectWorks(String work_project);
	
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


	/**
	 * Method : updateWork
	 * 작성자 : Mr.kku
	 * 변경이력 :
	 * @param wmMap
	 * @return
	 * Method 설명 : 업무 등록시 함꼐 등록
	 */
	int insertWorkMember(Map<String, String> wmMap, WorkVo workVo);
	
}
