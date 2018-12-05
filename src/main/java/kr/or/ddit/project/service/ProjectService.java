package kr.or.ddit.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.project.mapper.ProjectMapper;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.schedule.model.ScheduleVo;

/**
 * kr.or.ddit.project.service
 * null.java
 * Desc : 프로젝트 서비스
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 3:23
 * @Version :
 */
@Service
@Transactional
public class ProjectService implements ProjectServiceInf {

	@Autowired
	private ProjectMapper projectMapper;

	@Override
	public List<ProjectVo> selectAllProject() {
		return projectMapper.selectAllProject();
	}

	@Override
	public List<ProjectVo> selectBookMarkProject(String bookmark) {
		return projectMapper.selectBookMarkProject(bookmark);
	}

	@Override
	public int createProject(ProjectVo projectVo) {
		return projectMapper.createProject(projectVo);
	}

	@Override
	public int deleteProject(String project_id) {
		return projectMapper.deleteProject(project_id);
	}

	@Override
	public int updateProject(ProjectVo projectVo) {
		return projectMapper.updateProject(projectVo);
	}

	/**
	* Method : projectAllSchedule
	* 작성자 : jerry
	* 변경이력 : 2018-11-29 19:04
	* @param scheduleVo
	* @return
	* Method 설명 : 프로젝트 전체 일정
	*/
	@Override
	public List<ProjectVo> projectAllSchedule(ScheduleVo scheduleVo) {
		return projectMapper.projectAllSchedule(scheduleVo);
	}

}

