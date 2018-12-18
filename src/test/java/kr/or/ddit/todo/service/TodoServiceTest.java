package kr.or.ddit.todo.service;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import kr.or.ddit.commons.ResetSQL;
import kr.or.ddit.todo.model.ToDoVo;
import kr.or.ddit.work.model.WorkVo;

public class TodoServiceTest extends ResetSQL{

	@Autowired
	private ToDoServiceInf todoService;
	
	@Test
	public void todoSelectTest() {
		/***Given***/
		WorkVo workVo = new WorkVo();
		workVo.setWork_id("22");
		workVo.setWork_project("8");
		
		/***When***/
		List<ToDoVo> todoList = todoService.workToDoSelect(workVo);
		
		/***Then***/
		Assert.assertEquals(4, todoList.size());
		
	}
	

}
