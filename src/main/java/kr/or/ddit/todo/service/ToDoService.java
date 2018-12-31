package kr.or.ddit.todo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	/**
	* Method : todoInsert
	* 작성자 : jerr
	* 변경이력 :
	* @param todoVo
	* @return
	* Method 설명 : to-do 등록
	*/
	@Override
	public int todoInsert(ToDoVo todoVo) {
		return todoMapper.todoInsert(todoVo);
	}
	
	/**
	* Method : workToDoSelect
	* 작성자 : jerry
	* 변경이력 :
	* @param todo_work
	* @return
	* Method 설명 : 각 업무의 to-do list를 조회
	*/
	@Override
	public Map<String, Object> workToDoSelect(Map todoMap) {
		
		List<ToDoVo> getToDoList = todoMapper.workToDoSelect(todoMap);
		
		Map<String, Object> getToDoMap = new HashMap<String, Object>();
		getToDoMap.put("todoList", getToDoList);
		
		return getToDoMap;
	}

	/**
	* Method : todoCnt
	* 작성자 : jerry
	* 변경이력 :
	* @param todo_work
	* @return
	* Method 설명 : to-do list의 총 to-do 갯수
	*/
	@Override
	public int todoCnt(String work_id) {
		return todoMapper.todoCnt(work_id);
	}

	/**
	* Method : getProjectMember
	* 작성자 : jerry
	* 변경이력 :
	* @param project_id
	* @return
	* Method 설명 : 참여자의 이름과 메일 조회
	*/
	@Override
	public List<ToDoVo> getProjectMember(Map searchMap) {
		return todoMapper.getProjectMember(searchMap);
	}

	/**
	* Method : todoCompletYN
	* 작성자 : jerry
	* 변경이력 :
	* @param todoUpdateMap
	* @return
	* Method 설명 : to-do의 완료여부 변경
	*/
	@Override
	public int todoCompletYN(Map todoUpdateMap) {
		return todoMapper.todoCompletYN(todoUpdateMap);
	}

	/**
	* Method : todoDelete
	* 작성자 : jerry
	* 변경이력 :
	* @param todo_id
	* @return
	* Method 설명 : to-do를 삭제
	*/
	@Override
	public int todoDelete(String todo_id) {
		return todoMapper.todoDelete(todo_id);
	}

	/**
	* Method : selectOptionProjectMember
	* 작성자 : jerry
	* 변경이력 :
	* @param project_id
	* @return
	* Method 설명 : to-do 수정시 담당자 select option 값 조회
	*/
	@Override
	public List<ToDoVo> selectOptionProjectMember(String project_id) {
		return todoMapper.selectOptionProjectMember(project_id);
	}
	
}
