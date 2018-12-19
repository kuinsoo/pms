package kr.or.ddit.project.service;

import java.util.List;

import kr.or.ddit.member.model.PMemberListVo;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.schedule.model.ScheduleVo;

/**
 * kr.or.ddit.project.service
 * null.java
 * Desc : 프로젝트 서비스 인터페이스
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 3:23
 * @Version :
 */
public interface ProjectServiceInf {

	/**
	 * Select all project list.
	 *
	 * @return the list
	 */
	List<ProjectVo> selectAllProject();

	/**
	 * Select project list list.
	 *
	 * @param project_id the project id
	 * @return the list
	 */
	ProjectVo selectProject(String project_id);


	/**
	 * Create project int.
	 *
	 * @param projectVo the project vo
	 * @return the int
	 */
	int createProject(ProjectVo projectVo);

	/**
	 * Delete project int.
	 *
	 * @param project_id the project id
	 * @return the int
	 */
	int deleteProject(String project_id);

	/**
	 * Update project int.
	 *
	 * @param projectVo the project vo
	 * @return the int
	 */
	int updateProject(ProjectVo projectVo);

	/**
	 * Method : projectAllSchedule
	 * 작성자 : jerry
	 * 변경이력 : 2018-11-29 19:04
	 *
	 * @param scheduleVo the schedule vo
	 * @return Method 설명 : 프로젝트 전체 일정
	 */
	List<ProjectVo> projectAllSchedule(ScheduleVo scheduleVo);


	/*----------------------------------  정리 ----------------------------- */
	/**
	 * Book mark projects list.
	 * 작성자 : Mr.KKu
	 * 설명 : 즐겨찾기된 프로젝트 목록
	 * @param member_mail the member mail
	 * @return the list
	 */
	List<PMemberListVo> bookMarkProjects(String member_mail);
}
