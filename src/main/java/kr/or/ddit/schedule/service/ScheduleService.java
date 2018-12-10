package kr.or.ddit.schedule.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.issue.mapper.IssueMapper;
import kr.or.ddit.project.mapper.ProjectMapper;
import kr.or.ddit.schedule.model.ScheduleVo;
import kr.or.ddit.todo.mapper.ToDoMapper;
import kr.or.ddit.work.mapper.WorkMapper;

@Service
@Transactional
public class ScheduleService implements ScheduleServiceInf{

	@Autowired
	private WorkMapper workMapper;
	@Autowired
	private ProjectMapper projectMapper;
	@Autowired
	private ToDoMapper todoMapper;
	@Autowired
	private IssueMapper issueMapper;
	
	/**
	* Method : scheduleList
	* 작성자 : jerry
	* 변경이력 :
	* @return
	* Method 설명 : 프로젝트, 업무, 회의, 이슈 등 전체 일정
	*/
	@Override
	public Map<String, Object> scheduleList(ScheduleVo scheduleVo) {
		Map<String, Object> allScheduleList = new HashMap<String, Object>();
		
		allScheduleList.put("projectScheduleList", projectMapper.projectAllSchedule(scheduleVo));
		allScheduleList.put("workScheduleList", workMapper.workAllSchedule(scheduleVo));
		allScheduleList.put("todoScheduleList", todoMapper.todoAllSchedule(scheduleVo));
		allScheduleList.put("issueScheduleList", issueMapper.issueAllSchedule(scheduleVo));
		
		return allScheduleList;
	}

}
