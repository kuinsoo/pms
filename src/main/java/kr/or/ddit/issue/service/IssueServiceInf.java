package kr.or.ddit.issue.service;

import java.util.List;

import kr.or.ddit.issue.model.IssueVo;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.schedule.model.ScheduleVo;
import kr.or.ddit.util.model.PageVo;

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
	
	/**
	* Method : myProjectList
	* 작성자 : jerry
	* 변경이력 :
	* @param scheduleVo
	* @return
	* Method 설명 : 일정의 select 프로젝트명 list
	*/
	List<ProjectVo> myProjectList(ScheduleVo scheduleVo);
	
	/**
	* Method : issueHistoryPagination
	* 작성자 : jerry
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 이슈 히스토리 스크롤 페이징처리
	*/
	List<ProjectVo> issueHistoryPagination(PageVo pageVo);
	
	/**
	* Method : projectCnt
	* 작성자 : jerry
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 프로젝트 총 갯수
	*/
	int projectCnt(PageVo pageVo);
	
	/**
	* Method : issueInsert
	* 작성자 : jerry
	* 변경이력 :
	* @param issueVo
	* @return
	* Method 설명 : 이슈 등록
	*/
	int issueInsert(IssueVo issueVo);
	
	/**
	* Method : todoIssueUpdate
	* 작성자 : jerry
	* 변경이력 :
	* @param issueVo
	* @return
	* Method 설명 : issue 등록시 todo테이블의 todo_issue컬럼 추가(수정)
	*/
	int todoIssueUpdate(IssueVo issueVo);
	
	/**
	* Method : selGetProjectMember
	* 작성자 : jerry
	* 변경이력 :
	* @param work_id
	* @return
	* Method 설명 : issue 등록시 select-option에 프로젝트 참여자 리스트
	*/
	List<IssueVo> selGetProjectMember(String work_id);
	
}
