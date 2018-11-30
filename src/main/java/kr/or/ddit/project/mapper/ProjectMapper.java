package kr.or.ddit.project.mapper;

import kr.or.ddit.project.model.ProjectVo;

import java.util.List;

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
	* @return
	* Method 설명 : 프로젝트 전체 일정
	*/
	List<ProjectVo> projectAllSchedule();
	
}
