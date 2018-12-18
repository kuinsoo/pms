package kr.or.ddit.todo.service;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import kr.or.ddit.commons.ResetSQL;
import kr.or.ddit.todo.model.ToDoVo;

public class TodoServiceTest extends ResetSQL{

	@Autowired
	private ToDoServiceInf todoService;
	
	@Test
	public void todoSelectTest() {
		/***Given***/
		String todo_work = "2";
		
		/***When***/
		List<ToDoVo> todoSelectList = todoService.workToDoSelect(todo_work);
		
		/***Then***/
		Assert.assertEquals(4, todoSelectList.size());
		
	}
	

}
