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
}
