package kr.or.ddit.todo.mapper;

import java.util.List;

import kr.or.ddit.todo.model.ToDoVo;

/**
 * kr.or.ddit.todo.mapper
 * null.java
 * Desc : 할일 맵퍼
 *
 * @Author : Mr.KKu, jerry
 * @Date : 2018-11-27 / 오후 3:30
 * @Version :
 */
public interface ToDoMapper {
	
	/**
	* Method : todoAllSchedule
	* 작성자 : jerry
	* 변경이력 : 2018-11-30 09:59
	* @return
	* Method 설명 : 할일 전체 일정
	*/
	List<ToDoVo> todoAllSchedule();
	
}
