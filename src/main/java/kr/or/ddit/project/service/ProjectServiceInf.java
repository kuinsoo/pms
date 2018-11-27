package kr.or.ddit.project.service;

import kr.or.ddit.project.model.ProjectVo;

import java.util.List;

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

	List<ProjectVo> selectAllProject();

	List<ProjectVo> selectBookMarkProject(String bookmark);

	int createProject(ProjectVo projectVo);

	int deleteProject(String project_id);

	int updateProject(ProjectVo projectVo);
}
