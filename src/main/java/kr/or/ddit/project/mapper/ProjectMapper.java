package kr.or.ddit.project.mapper;

import java.util.List;

import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.schedule.model.ScheduleVo;

/**
 * kr.or.ddit.project.mapper
 * null.java
 * Desc : 프로젝트 맵퍼
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 3:22
 * @Version :
 */
public interface ProjectMapper {

	List<ProjectVo> selectAllProject();

	List<ProjectVo> selectBookMarkProject(String bookmark);

	int createProject(ProjectVo projectVo);

	int deleteProject(String project_id);

	int updateProject(ProjectVo projectVo);
	
	/**
	* Method : projectAllSchedule
	* 작성자 : jerry
	* 변경이력 : 2018-11-29 19:03
	* @param sid
	* @return
	* Method 설명 : 프로젝트 전체 일정
	*/
	List<ProjectVo> projectAllSchedule(ScheduleVo scheduleVo);
	
	/**
	* Method : myProjectList
	* 작성자 : jerry
	* 변경이력 :
	* @param scheduleVo
	* @return
	* Method 설명 : 일정의 select 프로젝트명 list
	*/
	List<ScheduleVo> myProjectList(ScheduleVo scheduleVo);
	
}
