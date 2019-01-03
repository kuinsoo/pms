package kr.or.ddit.todo.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.work.service.WorkServiceInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.issue.model.IssueVo;
import kr.or.ddit.issue.service.IssueServiceInf;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.message.service.MessageServiceInf;
import kr.or.ddit.post.service.PostServiceInf;
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
	
	@Autowired
	private IssueServiceInf issueService;

	@Autowired
	private PostServiceInf postService;
	
	@Autowired
	private WorkServiceInf workService;
	
	@Autowired
	private MessageServiceInf messageService;

	/**
	 * Method : ajaxInsertTodo
	 * 작성자 : jerry
	 * 변경이력 :
	 *
	 * @param request the request
	 * @param pageVo  the page vo
	 * @param todoVo  the todo vo
	 * @param model   the model
	 * @return Method  설명 : to-do list 등록(Ajax적용)
	 */
	@RequestMapping(value="/todoInsert", method= {RequestMethod.POST, RequestMethod.GET})
	public String ajaxInsertTodo(ToDoVo todoVo, HttpServletRequest request, PageVo pageVo, Model model, MemberVo memberVo) {
		WorkVo workVo = new WorkVo();
		workVo.setWork_project(request.getParameter("work_project"));
		workVo.setWork_id(request.getParameter("todo_work"));

		/* to-do insert */
		try {
			todoService.todoInsert(todoVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		pageVo.setPage(1);
		pageVo.setPageSize(5);
		
		Map<String, Object> todoMap = new HashMap<String, Object>();
		todoMap.put("workVo", workVo);
		todoMap.put("pageVo", pageVo);
		
		Map<String, Object> todoListMap = todoService.workToDoSelect(todoMap);
		
		model.addAttribute("todoListMap", todoListMap);
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		
		return "todo/todoInsertAjax";
	}

	/**
	 * Method : ajaxSelectTodo
	 * 작성자 : jerry
	 * 변경이력 :
	 *
	 * @param request the request
	 * @param pageVo  the page vo
	 * @param model   the model
	 * @return Method  설명 : to-do list 조회
	 */
	@RequestMapping(value="/todoSelect", method= {RequestMethod.POST, RequestMethod.GET})
	public String ajaxSelectTodo(HttpServletRequest request, PageVo pageVo, Model model, MemberVo memberVo) {
		String work_id = request.getParameter("work_id");
		
		WorkVo workVo = new WorkVo();
		workVo.setWork_project(request.getParameter("project_id"));
		workVo.setWork_id(work_id);
		
		//todoCnt param -> String todo_work
		
		Map<String, Object> todoMap = new HashMap<String, Object>();
		todoMap.put("workVo", workVo);
		todoMap.put("pageVo", pageVo);
		
		/* to-do select */
		Map<String, Object> todoListMap = todoService.workToDoSelect(todoMap);
		
		/* issue select list */
		List<IssueVo> issueMemberList = issueService.selGetProjectMember(work_id);
		
		model.addAttribute("todoListMap", todoListMap);
		model.addAttribute("issueMemberList", issueMemberList);
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		
		return "todo/todoInsertAjax";
	}

	/**
	 * Method : ajaxPaginationTodo
	 * 작성자 : jerry
	 * 변경이력 :
	 *
	 * @param project_id the project id
	 * @param work_id    the work id
	 * @param pageVo     the page vo
	 * @param model      the model
	 * @return Method  설명 : to-do list 페이징처리
	 */
	@RequestMapping(value="todoPagination", method= {RequestMethod.POST, RequestMethod.GET})
	public String ajaxPaginationTodo(@RequestParam("project_id")String project_id, @RequestParam("work_id")String work_id, PageVo pageVo, Model model, MemberVo memberVo) {
		int todoCnt = todoService.todoCnt(work_id);
		
		model.addAttribute("todoCnt", (int)Math.ceil((double)todoCnt / pageVo.getPageSize()));
		
		model.addAttribute("work_id", work_id);
		model.addAttribute("project_id", project_id);
		model.addAttribute("pageVo", pageVo);
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		
		return "todo/todoPaginationHtml";
	}

	/**
	 * Method : ajaxPopupMember
	 * 작성자 : jerry
	 * 변경이력 :
	 *
	 * @param model        the model
	 * @param project_id   the project id
	 * @param work_id      the work id
	 * @param searchOption the search option
	 * @param searchMember the search member
	 * @return Method  설명 : to-do insert시 popup창에 참여자 리스트 조회
	 */
	@RequestMapping(value="/popupMemberList", method= {RequestMethod.POST, RequestMethod.GET})
	public String ajaxPopupMember(Model model, @RequestParam("project_id")String project_id, @RequestParam("work_id")String work_id, 
									@RequestParam("searchOption")String searchOption, @RequestParam("searchMember")String searchMember, MemberVo memberVo) {
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("project_id", project_id);
		searchMap.put("searchOption", searchOption);
		searchMap.put("searchMember", searchMember);
		
		List<ToDoVo> popupMemberList = todoService.getProjectMember(searchMap);
		
		Map<String, Object> popupMap = new HashMap<String, Object>();
		popupMap.put("popupMemberList", popupMemberList);
		popupMap.put("popup_work_id", work_id);

		model.addAttribute("popupMap", popupMap);
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		
		return "todo/popupMemberList";
	}

	/**
	 * Method : todoCompletY
	 * 작성자 : jerry
	 * 변경이력 :
	 *
	 * @param todo_id the todo id
	 * @param chk     Method 설명 : to-do 완료여부 체크
	 */
	@RequestMapping(value="/todoCompletY", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public void todoCompletY(@RequestParam("todo_id")String todo_id, @RequestParam("chk")String chk) {
		ToDoVo todoVo = todoService.selectTodo(todo_id);
		WorkVo workVo = workService.selectWork(todoVo.getTodo_work());
		Map<String, Object> todoUpdateMap = new HashMap<String, Object>();
		todoUpdateMap.put("todo_id", todo_id);
		todoUpdateMap.put("chk", chk);
		try {
			/*todoService.todoCompletYN(todoUpdateMap);*/
			workService.updateWork(workVo, todoUpdateMap, todoVo.getTodo_work());
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	/**
	* Method : todoDelete
	* 작성자 : jerry
	* 변경이력 :
	* @param todo_id
	* @param project_id
	* @param work_id
	* @param pageVo
	* @param model
	* @return
	* Method 설명 : to-do 삭제
	*/
	@RequestMapping(value="/todoDelete", method= {RequestMethod.POST, RequestMethod.GET})
	public String todoDelete(@RequestParam("todo_id")String todo_id, @RequestParam("project_id")String project_id,
							@RequestParam("work_id")String work_id, PageVo pageVo, Model model, MemberVo memberVo) {
		WorkVo workVo = new WorkVo();
		workVo.setWork_project(project_id);
		workVo.setWork_id(work_id);

		/* to-do delete */
		try {
			todoService.todoDelete(todo_id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		pageVo.setPage(1);
		pageVo.setPageSize(5);
		
		Map<String, Object> todoMap = new HashMap<String, Object>();
		todoMap.put("workVo", workVo);
		todoMap.put("pageVo", pageVo);
		
		/* to-do select */
		Map<String, Object> todoListMap = todoService.workToDoSelect(todoMap);
		
		model.addAttribute("todoListMap", todoListMap);
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		
		return "todo/todoInsertAjax";
	}
	
	/**
	* Method : selectOptionProjectMember
	* 작성자 : jerry
	* 변경이력 :
	* @param project_id
	* @return
	* Method 설명 : to-do 수정시 담당자 select option 값 조회
	*/
	@RequestMapping(value="/optionMember", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public List<ToDoVo> selectOptionProjectMember(@RequestParam("project_id")String project_id){
		
		List<ToDoVo> optionMemberList = todoService.selectOptionProjectMember(project_id);
		
		return optionMemberList;
	}
	
	/**
	* Method : todoUpdate
	* 작성자 : jerry
	* 변경이력 :
	* @param todoVo
	* @return
	* Method 설명 : to-do 수정
	*/
	@RequestMapping(value="/todoUpdate", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public void todoUpdate(ToDoVo todoVo) {
		try {
			todoService.todoUpdate(todoVo);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
