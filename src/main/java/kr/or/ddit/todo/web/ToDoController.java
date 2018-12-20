package kr.or.ddit.todo.web;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.todo.model.ToDoVo;
import kr.or.ddit.todo.service.ToDoServiceInf;
import kr.or.ddit.util.model.PageVo;
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
	public String ajaxInsertTodo(HttpServletRequest request, PageVo pageVo, ToDoVo todoVo, Model model) {

		/* to-do insert */
		try {
			todoService.todoInsert(todoVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		WorkVo workVo = new WorkVo();
		workVo.setWork_project(request.getParameter("work_project"));
		workVo.setWork_id(request.getParameter("todo_work"));
		
		pageVo.setPage(1);
		pageVo.setPageSize(5);
		
		System.out.println("1. workVo : " + workVo);
		System.out.println("2. pageVo : " + pageVo);
		
		Map<String, Object> todoMap = new HashMap<String, Object>();
		todoMap.put("workVo", workVo);
		todoMap.put("pageVo", pageVo);
		
		Map<String, Object> todoListMap = todoService.workToDoSelect(todoMap);
		
		Iterator<String> keys = todoListMap.keySet().iterator();
		while(keys.hasNext()) {
			String key = keys.next();
			System.out.println("key : " + key + " / value : " + todoListMap.get(key));
		}
		
		model.addAttribute("todoListMap", todoListMap);
		
		return "todo/todoInsertAjax";
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
	public String ajaxSelectTodo(HttpServletRequest request, PageVo pageVo, Model model) {
		WorkVo workVo = new WorkVo();
		workVo.setWork_project(request.getParameter("project_id"));
		workVo.setWork_id(request.getParameter("work_id"));
		
		//todoCnt param -> String todo_work
		
		Map<String, Object> todoMap = new HashMap<String, Object>();
		todoMap.put("workVo", workVo);
		todoMap.put("pageVo", pageVo);
		
		/* to-do select */
		Map<String, Object> todoListMap = todoService.workToDoSelect(todoMap);
		
		model.addAttribute("todoListMap", todoListMap);
		
		return "todo/todoInsertAjax";
	}
	
	/**
	* Method : ajaxPaginationTodo
	* 작성자 : jerry
	* 변경이력 :
	* @param project_id
	* @param work_id
	* @param pageVo
	* @param model
	* @return
	* Method 설명 : to-do list 페이징처리
	*/
	@RequestMapping(value="todoPagination", method= {RequestMethod.POST, RequestMethod.GET})
	public String ajaxPaginationTodo(@RequestParam("project_id")String project_id, @RequestParam("work_id")String work_id, PageVo pageVo, Model model) {
		int todoCnt = todoService.todoCnt(work_id);
		
		model.addAttribute("todoCnt", (int)Math.ceil((double)todoCnt / pageVo.getPageSize()));
		model.addAttribute("work_id", work_id);
		model.addAttribute("project_id", project_id);
		model.addAttribute("pageVo", pageVo);
		
		return "todo/todoPaginationHtml";
	}
}
