package kr.or.ddit.todo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.schedule.model.ScheduleVo;
import kr.or.ddit.todo.mapper.ToDoMapper;
import kr.or.ddit.todo.model.ToDoVo;

/**
 * kr.or.ddit.todo.service
 * null.java
 * Desc : 할일 서비스
 *
 * @Author : Mr.KKu, jerry
 * @Date : 2018-11-27 / 오후 3:30
 * @Version :
 */
@Service
@Transactional
public class ToDoService implements ToDoServiceInf{

	@Autowired
	private ToDoMapper todoMapper;
	
	/**
	* Method : todoAllSchedule
	* 작성자 : jerry
	* 변경이력 : 2018-11-30 10:01
	* @param scheduleVo
	* @return
	* Method 설명 : 할일 전체 일정
	*/
	@Override
	public List<ToDoVo> todoAllSchedule(ScheduleVo scheduleVo) {
		return todoMapper.todoAllSchedule(scheduleVo);
	}
	
}
