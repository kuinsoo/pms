package kr.or.ddit.todo.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.todo.model.ToDoVo;
import kr.or.ddit.todo.service.ToDoServiceInf;
import kr.or.ddit.work.model.WorkVo;

/**
 * kr.or.ddit.todo.web
 * null.java
 * Desc : 할일 컨트롤러
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 3:31
 * @Version :
 */
@Controller
public class ToDoController {
	@Autowired
	private ToDoServiceInf todoService;
	
	/**
	* Method : ajaxInsertTodo
	* 작성자 : jerry
	* 변경이력 :
	* @param memberVo
	* @param project_id
	* @param todoVo
	* @param model
	* @return
	* Method 설명 : to-do list 등록(Ajax적용)
	*/
	@RequestMapping(value="/todoInsert", method= {RequestMethod.POST, RequestMethod.GET})
	public String ajaxInsertTodo(HttpServletRequest request, ToDoVo todoVo, Model model) {
		WorkVo workVo = new WorkVo();
		workVo.setWork_project(request.getParameter("project_id"));
		workVo.setWork_id(request.getParameter("work_id"));
		
		/* to-do insert */
		try {
			todoService.todoInsert(todoVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
//		model.addAttribute("todoList", todoService.workToDoSelect(workVo));
		
		return "/todoSelect";
	}
	
	/**
	* Method : ajaxSelectTodo
	* 작성자 : jerry
	* 변경이력 :
	* @param todo_work
	* @param model
	* @return
	* Method 설명 : to-do list 조회
	*/
	@RequestMapping(value="/todoSelect", method= {RequestMethod.POST, RequestMethod.GET})
	public String ajaxSelectTodo(HttpServletRequest request, Model model) {
		WorkVo workVo = new WorkVo();
		workVo.setWork_project(request.getParameter("project_id"));
		workVo.setWork_id(request.getParameter("work_id"));
		
		System.out.println("work_id : " + request.getParameter("work_id"));
		
		/* to-do select */
		List<ToDoVo> todoList = todoService.workToDoSelect(workVo);
		System.out.println("todoList.size() : " + todoList.size());
		
		model.addAttribute("todoList", todoList);
		
		return "todo/todoInsertAjax";
	}
	
}
