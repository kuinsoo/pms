package kr.or.ddit.todo.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.todo.model.ToDoVo;
import kr.or.ddit.todo.service.ToDoServiceInf;

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
	@RequestMapping(value="/todoInsert", method=RequestMethod.POST)
	public String ajaxInsertTodo(@RequestParam("project_id")String project_id, ToDoVo todoVo, Model model) {
		
		try {
			todoService.todoInsert(todoVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "";
	}
	
}
