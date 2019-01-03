package kr.or.ddit.work.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.schedule.model.ScheduleVo;
import kr.or.ddit.todo.model.ToDoVo;
import kr.or.ddit.util.model.PageVo;
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
	int insertWorkMember(Map<String, String> wmMap);
	
	/**
	* Method : workMember
	* 작성자 : 임규승
	* 변경이력 :
	* @param member_mail
	* @return
	* Method 설명 : 해당 회원의 진행중인 프로젝트 명 검색
	*/
	List<WorkVo> workMember(String member_mail);

	/**
	 * Method : workChart
	 * 작성자 : Mr.kku
	 * 내용 : 업무 차트
	 * @param mtMap
	 * @return
	 */
	List<ToDoVo> workChart(Map<String, String> mtMap);

	/**
	 * Method : selectWorkChart
	 * 작성자 : Mr.kku
	 * 내용 : 개별 업무 차트
	 * @param mtMap
	 * @return
	 */
	List<ToDoVo> selectWorkChart(Map<String, String> mtMap);
	

	/**
	* Method : workAllSchedule
	* 작성자 : bhuanchanwoo
	* 변경이력 :
	* @param workVo
	* @return
	* Method 설명 : 프로젝트 & 해당 구성원에게 할당된 업무 리스트 출력
	*/
	List<WorkVo> myWorkList(WorkVo workVo);
}
