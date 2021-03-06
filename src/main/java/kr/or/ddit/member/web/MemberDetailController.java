package kr.or.ddit.member.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.attachment.model.AttachmentVo;
import kr.or.ddit.attachment.service.AttachmentServiceInf;
import kr.or.ddit.card.service.CardServiceInf;
import kr.or.ddit.comments.service.CommentsServiceInf;
import kr.or.ddit.commons.util.KISA_SHA256;
import kr.or.ddit.issue.service.IssueServiceInf;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.model.PMemberVo;
import kr.or.ddit.member.service.MemberServiceInf;
import kr.or.ddit.message.service.MessageServiceInf;
import kr.or.ddit.post.service.PostServiceInf;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.todo.model.ToDoVo;
import kr.or.ddit.util.model.PageVo;
import kr.or.ddit.work.service.WorkServiceInf;


/**
 * MemberDetailController.java : 마이페이지 
 *
 * @author 나진실
 * @version 1.0
 * @see
 */
@Controller
public class MemberDetailController {
	Logger logger = LoggerFactory.getLogger(MemberDetailController.class);

	@Autowired
	private MemberServiceInf memberservice;

	@Autowired
	private WorkServiceInf workService;

	@Autowired
	private CommentsServiceInf commentsService;

	@Autowired
	private CardServiceInf cardService;
	
	@Autowired
	private AttachmentServiceInf attachmentService;
	
	@Autowired
	private PostServiceInf postService;
	
	@Autowired
	private MessageServiceInf messageService;
	
	@Autowired
	private IssueServiceInf issueService;
	
	

	/**
	 * Method : myPage
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param model
	 * @param memberVo
	 * @return
	 * Method 설명 : 마이페이지 화면으로 이동 
	 */
	@RequestMapping(value="/myPage",method = RequestMethod.GET)
	public String myPage(Model model, @SessionAttribute("memberVo") MemberVo memberVo) {
		
		String member_mail = memberVo.getMember_mail();

		memberservice.selectUser(memberVo.getMember_mail());		
		model.addAttribute("memberVo",memberVo);
	    List<ProjectVo> selectProjectMember =  memberservice.selectProjectMember(memberVo.getMember_mail());
	    model.addAttribute("selectProjectMember",selectProjectMember);

	    System.out.println(memberVo.getMember_pass());
	
		// 참여중인 프로젝트 갯수
		int totalProjectCnt = memberservice.totalProjectCnt(member_mail);

		// 참여했던 프로젝트 갯수
		int totalEndProjectCnt = memberservice.totalEndProjectCnt(member_mail);

		// 즐겨찾기한 프로젝트 갯수
		int selectProjectCnt = memberservice.selectProjectCnt(member_mail);

		// 나의 일감 갯수
		int selectTodoCnt = memberservice.selectTodoCnt(member_mail);
	

		model.addAttribute("totalProjectCnt",totalProjectCnt);
		model.addAttribute("totalEndProjectCnt",totalEndProjectCnt);
		model.addAttribute("selectProjectCnt",selectProjectCnt);
		model.addAttribute("selectTodoCnt",selectTodoCnt);
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		model.addAttribute("issueMemberTotalCnt", issueService.issueMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalyouGiveFriendList", messageService.totalyouGiveFriendList(memberVo.getMember_mail()));


		return "myPage/myPage";
	}
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	/*  
	 * Method : myPageProjectAjax
	 * 작성자 : pc07 
	 * 변경이력 :
	 * @param model
	 * @param pageVo
	 * @param memberVo
	 * @param projectVo
	 * @return
	 * Method 설명 : 마이페이지 참여중인 프로젝트 Ajax처리 
	 */

	@ResponseBody
	@RequestMapping(value= "/myPageProjectAjax", method= RequestMethod.GET)
	public Map<String, Object> myPageProjectAjax(Model model , PageVo pageVo , @SessionAttribute("memberVo") MemberVo memberVo,
							ProjectVo projectVo, HttpServletRequest request) {
		
		pageVo.setMember_mail(memberVo.getMember_mail());
	
		List<ProjectVo> projectList = memberservice.myprojectselect(pageVo);
		Map<String, Object> projectMap = new HashMap<>();
		int pageCnt = memberservice.totalProjectCnt(memberVo.getMember_mail());
		
		projectMap.put("projectList", projectList);		
		projectMap.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		return projectMap;
		
	}
	

	
	/**
	 * Method : searchProjectAjax
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param model
	 * @param pageVo
	 * @param memberVo
	 * @param projectVo
	 * @param request
	 * @return
	 * Method 설명 : 마이페이지 참여중인 프로젝트 검색 Ajax처리 
	 */
	@ResponseBody
	@RequestMapping(value= "/searchProjectAjax", method= RequestMethod.POST)
	public Map<String, Object> searchProjectAjax(Model model , PageVo pageVo , @SessionAttribute("memberVo") MemberVo memberVo ,
							ProjectVo projectVo, HttpServletRequest request) {
		
		pageVo.setMember_mail(memberVo.getMember_mail());
		projectVo.setPmember_member(memberVo.getMember_mail());
		
		// 검색 부분 
		if (pageVo.getSearchText() == null) {
			pageVo.setSearchText("");
		}
		
		List<ProjectVo> projectList = memberservice.myprojectselect(pageVo);
		Map<String, Object> projectMap = new HashMap<>();
		int pageCnt = memberservice.totalProjectCntSearch(pageVo);
		
		projectMap.put("projectList", projectList);		
		projectMap.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		return projectMap;
	}
	//**********************************************************************************************************************


	// 참여했던 프로젝트
	@ResponseBody
	@RequestMapping(value= "/myPageEndProjectAjax", method= RequestMethod.GET)
	public Map<String, Object> myPageEndProjectAjax(Model model , PageVo pageVo , @SessionAttribute("memberVo") MemberVo memberVo ,
							ProjectVo projectVo, HttpServletRequest request) {

		pageVo.setMember_mail(memberVo.getMember_mail());

		List<ProjectVo> projectEndList = memberservice.myprojectEndselect(pageVo);

		Map<String, Object> projectMap = new HashMap<>();
		int pageCnt = memberservice.totalEndProjectCnt(memberVo.getMember_mail());

		projectMap.put("projectEndList", projectEndList);
		projectMap.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));

		return projectMap;

	}

	@ResponseBody
	@RequestMapping(value= "/searchEndProjectAjax", method= RequestMethod.POST)
	public Map<String, Object> searchEndProjectAjax(Model model , PageVo pageVo , @SessionAttribute("memberVo") MemberVo memberVo ,
							ProjectVo projectVo, HttpServletRequest request) {

		pageVo.setMember_mail(memberVo.getMember_mail());

		// 검색 부분
		if (pageVo.getSearchEndText() == null) {
			pageVo.setSearchEndText("");
		}

		List<ProjectVo> projectEndList = memberservice.myprojectEndselect(pageVo);
		Map<String, Object> projectMap = new HashMap<>();

		int pageCnt = memberservice.totalEndProjectCntSearch(pageVo);

		projectMap.put("projectEndList", projectEndList);
		projectMap.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));

		return projectMap;
	}

	//===================================================================================================================
	// 참여중인 프로젝트 부분 클릭했을시   
	@RequestMapping(value="/projectClickDetail", method = RequestMethod.GET)
	public String projectClickDetail (Model model ,PMemberVo pmemberVo ,  ProjectVo projectVo, @SessionAttribute("memberVo") MemberVo memberVo ,
			@RequestParam("project_title") String project_title ,@RequestParam("project_id") String project_id , HttpServletRequest request) {
		
		model.addAttribute("project_title" , project_title);
		

		/* 프로젝트에 포함된 멤버 정보 */
		model.addAttribute("projectMemberList", memberservice.projectMemberList(project_id));

		/* 업무 출력 */
		model.addAttribute("workList",workService.selectWorks(project_id));

		/* 업무에 달린 댓글 출력 */
		model.addAttribute("cmtList", commentsService.cmtList(project_id));

		/* 업무 카드 출력 */
		model.addAttribute("wcList", cardService.selectWorkCard(project_id));
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		model.addAttribute("issueMemberTotalCnt", issueService.issueMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalyouGiveFriendList", messageService.totalyouGiveFriendList(memberVo.getMember_mail()));
		
		return "/main/subMain";
	}
	


	// 즐겨찾기한 프로젝트 부분 클릭했을시
	@RequestMapping(value="/projectBookClickDetail", method = RequestMethod.GET)
	public String projectBookClickDetail(Model model ,PMemberVo pmemberVo ,  ProjectVo projectVo, @SessionAttribute("memberVo") MemberVo memberVo ,
			@RequestParam("project_title") String project_title ,@RequestParam("project_id") String project_id , HttpServletRequest request) {
		
		model.addAttribute("project_title" , project_title);
		
		
		/* 프로젝트에 포함된 멤버 정보 */
		model.addAttribute("projectMemberList", memberservice.projectMemberList(project_id));

		/* 업무 출력 */
		model.addAttribute("workList",workService.selectWorks(project_id));

		/* 업무에 달린 댓글 출력 */
		model.addAttribute("cmtList", commentsService.cmtList(project_id));

		/* 업무 카드 출력 */
		model.addAttribute("wcList", cardService.selectWorkCard(project_id));
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		model.addAttribute("issueMemberTotalCnt", issueService.issueMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalyouGiveFriendList", messageService.totalyouGiveFriendList(memberVo.getMember_mail()));
		
		return "/main/subMain";
	}
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	/**
	 * Method : mybookMarkProjectList
	 * 작성자 : 나진실 
	 * 변경이력 :
	 * @return
	 * Method 설명 : 마이페이지 - 즐겨찾기한 프로젝트 리스트 Ajax
	 */
	@ResponseBody
	@RequestMapping(value = "/mybookMarkProjectList", method = RequestMethod.GET)
	public Map<String, Object> mybookMarkProjectList (Model model , PageVo pageVo, @SessionAttribute("memberVo") MemberVo memberVo, 
						ProjectVo projectVo, HttpServletRequest request) {
		
		pageVo.setMember_mail(memberVo.getMember_mail());
		List<ProjectVo> projectBookList = memberservice.mybookmarkselect(pageVo);
		
		Map<String , Object> projectBookMap = new HashMap<>();
		int pageCnt = memberservice.selectProjectCnt(memberVo.getMember_mail());
		
		projectBookMap.put("projectBookList", projectBookList);
		projectBookMap.put("pageCnt",(int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
	
		return projectBookMap;
	}
	
	
	/**
	 * Method : searchBookProjectAjax
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param model
	 * @param pageVo
	 * @param memberVo
	 * @param projectVo
	 * @param request
	 * @return
	 * Method 설명 :  마이페이지 - 즐겨찾기한 프로젝트 검색 부분 Ajax
	 */
	
	@ResponseBody
	@RequestMapping(value ="/searchBookProjectAjax" , method=  RequestMethod.POST)
	public Map<String, Object> searchBookProjectAjax (Model model , PageVo pageVo , @SessionAttribute("memberVo") MemberVo memberVo ,
			ProjectVo projectVo, HttpServletRequest request){
		
		pageVo.setMember_mail(memberVo.getMember_mail());
		
		// 검색 부분 
		if (pageVo.getSearchBookText() == null) {
			pageVo.setSearchBookText("");
		}
		
		List<ProjectVo> projectBookList = memberservice.mybookmarkselect(pageVo);
	
		Map<String , Object> projectBookMap = new HashMap<>();
		int pageCnt = memberservice.selectProjectCntSearch(pageVo);
		projectBookMap.put("projectBookList", projectBookList);
		
		projectBookMap.put("pageCnt",(int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
	
		return projectBookMap;
	}
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	// TodoList
	
	@ResponseBody
	@RequestMapping(value ="/myTodoProjectListAjax", method = RequestMethod.GET)
	public Map<String, Object> myTodoProjectListAjax (Model model , PageVo pageVo, ToDoVo todoVo, ProjectVo projectVo,
			@SessionAttribute("memberVo") MemberVo memberVo, HttpServletRequest request) {
		
		todoVo.setProject_id(projectVo.getProject_id());
		pageVo.setMember_mail(memberVo.getMember_mail());
		todoVo.setProject_title(projectVo.getProject_title());
		
		List<ToDoVo> projectTodoList = memberservice.myTodoselect(pageVo);
		
		Map<String , Object> projectTodoListMap = new HashMap<>();
		int pageCnt = memberservice.selectTodoCnt(memberVo.getMember_mail());
		
		projectTodoListMap.put("projectTodoList", projectTodoList);
		projectTodoListMap.put("pageCnt",(int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		return projectTodoListMap;
	}
	
	@ResponseBody
	@RequestMapping(value ="/searchTodoProjectAjax", method = RequestMethod.POST)
	public Map<String, Object> searchTodoProjectAjax (Model model , PageVo pageVo, ToDoVo todoVo, ProjectVo projectVo,
			@SessionAttribute("memberVo") MemberVo memberVo, HttpServletRequest request){
		
		todoVo.setProject_id(projectVo.getProject_id());
		pageVo.setMember_mail(memberVo.getMember_mail());
		todoVo.setProject_title(projectVo.getProject_title());
		
		// 검색 부분 
		if (pageVo.getSearchTodoText() == null) {
			pageVo.setSearchTodoText("");
		}
		
		List<ToDoVo> projectTodoList = memberservice.myTodoselect(pageVo);
	
		Map<String , Object> projectTodoMap = new HashMap<>();
		int pageCnt = memberservice.selectTodoCntSearch(pageVo);
	
		projectTodoMap.put("projectTodoList", projectTodoList);
		
		projectTodoMap.put("pageCnt",(int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
	
		return projectTodoMap;
	}
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	// TodoList
	
	@ResponseBody
	@RequestMapping(value ="/myProjectFileListAjax", method = RequestMethod.GET)
	public Map<String, Object> myProjectFileListAjax (Model model , PageVo pageVo,
			@SessionAttribute("memberVo") MemberVo memberVo, HttpServletRequest request) {
		
		pageVo.setMember_mail(memberVo.getMember_mail());
		List<AttachmentVo> myFileList = memberservice.myFileList(pageVo);
		
		Map<String , Object> myFileListMap = new HashMap<>();
		int pageCnt = memberservice.myFileListCnt(memberVo.getMember_mail());
		myFileListMap.put("myFileList", myFileList);
		myFileListMap.put("pageCnt",(int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		return myFileListMap;
	}
	
	@ResponseBody
	@RequestMapping(value ="/searchFileListAjax", method = RequestMethod.POST)
	public Map<String, Object> searchFileListAjax (Model model , PageVo pageVo , @SessionAttribute("memberVo") MemberVo memberVo 
			, HttpServletRequest request){
		pageVo.setMember_mail(memberVo.getMember_mail());
		// 검색 부분 
		if (pageVo.getSearchFileList() == null) {
			pageVo.setSearchFileList("");
		}
		List<AttachmentVo> myFileList = memberservice.myFileList(pageVo);
		
		Map<String , Object> myFileListMap = new HashMap<>();
		int pageCnt = memberservice.totalmyFileListCntSearch(pageVo);
		
		myFileListMap.put("myFileList", myFileList);
		myFileListMap.put("pageCnt",(int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		return myFileListMap;
	}
	
	/*@ResponseBody
	@RequestMapping(value ="/selectProjectFileListAjax", method = RequestMethod.POST)
	public Map<String, Object> selectProjectFileListAjax (Model model , PageVo pageVo , @SessionAttribute("memberVo") MemberVo memberVo ,
			HttpServletRequest request){
		
		String project_id = request.getParameter("project_id");
		pageVo.setMember_mail(memberVo.getMember_mail());
		
		if(project_id == null) {
			List<AttachmentVo> myFileList = memberservice.myFileList(pageVo);
		}else {
			pageVo.setProject_id(project_id);
			List<AttachmentVo> myFileListProjectId = memberservice.myFileListProjectId(pageVo);
		}
		Map<String , Object> myFileListMap = new HashMap<>();
		int pageCnt = memberservice.myFileListCnt(memberVo.getMember_mail());
		
		myFileListMap.put("myFileList", memberservice.myFileList(pageVo));
		myFileListMap.put("myFileListProjectId",  memberservice.myFileListProjectId(pageVo));
		myFileListMap.put("pageCnt",(int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		return myFileListMap;
	}*/
	
	@RequestMapping(value ="/selectProjectFileAttachIdDownload", method = RequestMethod.GET)
	public String selectProjectFileAttachNameAjax (Model model, @RequestParam("att_id")String att_id, @SessionAttribute("memberVo") MemberVo memberVo){
			
			AttachmentVo attVo = attachmentService.selectAtt(att_id);
			attVo.setAtt_path("a");
			model.addAttribute("attVo", attVo);
			
			/* 알림기능 - IKS */
			model.addAttribute("pageCnt", postService.totalPostCnt());
			model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
			model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
			model.addAttribute("issueMemberTotalCnt", issueService.issueMemberTotalCnt(memberVo.getMember_mail()));
			model.addAttribute("totalyouGiveFriendList", messageService.totalyouGiveFriendList(memberVo.getMember_mail()));
			
			return "attachment/download";
		}
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	/**
	 * Method : memberDetailUpdate
	 * 작성자 : 나진실
	 * 변경이력 :
	 * @param model
	 * @param memberVo
	 * @param part
	 * @param request
	 * @return
	 * Method 설명 : 마이페이지 수정부분
	 */
	@RequestMapping(value="/myPageUpdate", method=RequestMethod.POST)
	public String memberDetailUpdate(Model model, @SessionAttribute("memberVo") MemberVo memberVo,
		 HttpServletRequest request) {
		
			String member_name = request.getParameter("member_name");
			String member_tel = request.getParameter("member_tel");
			String member_pass = request.getParameter("member_pass");
			
			System.out.println("memberPass" + member_pass);
			
			memberVo.setMember_name(member_name);
			memberVo.setMember_tel(member_tel);
			
				
//			// 암호화로 비교한다. 입력된값이랑 
//			if(memberVo.getMember_pass().equals(KISA_SHA256.encrypt(member_pass))) {
//				model.addAttribute("memberVo",memberVo);
//			}
			
			//String passwardPass = request.getParameter("passwardPass");
			//System.out.println("passwardPass" + passwardPass);
			
			if(member_pass != "") {
				String kisa = KISA_SHA256.encrypt(member_pass).toLowerCase();
				memberVo.setMember_pass(kisa);
				model.addAttribute("kisa",kisa);
			}
				
			int updateUser = memberservice.updateUser(memberVo);
			model.addAttribute("memberVo",memberVo);
			
			/* 알림기능 - IKS */
			model.addAttribute("pageCnt", postService.totalPostCnt());
			model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
			model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
			model.addAttribute("issueMemberTotalCnt", issueService.issueMemberTotalCnt(memberVo.getMember_mail()));
			model.addAttribute("totalyouGiveFriendList", messageService.totalyouGiveFriendList(memberVo.getMember_mail()));
			
			return "redirect:/myPage?member_mail=" + memberVo.getMember_mail();
		}
	
	@RequestMapping(value="/myPageUpdateFile", method=RequestMethod.POST)
	public String myPageUpdateFile(Model model, @SessionAttribute("memberVo") MemberVo memberVo,
			@RequestPart("member_profile")MultipartFile part, HttpServletRequest request) {
		
	/*	String member_name = request.getParameter("member_name");
		String member_tel = request.getParameter("member_tel");
		String member_pass = request.getParameter("member_pass");
		
		memberVo.setMember_name(member_name);
		memberVo.setMember_tel(member_tel);
		
//			// 암호화로 비교한다. 입력된값이랑 
//			if(memberVo.getMember_pass().equals(KISA_SHA256.encrypt(member_pass))) {
//				model.addAttribute("memberVo",memberVo);
//			}
		
		String kisa = KISA_SHA256.encrypt(member_pass).toLowerCase();
		memberVo.setMember_pass(kisa);*/
		
		
		try {
			if(part.getSize()>0) {
				String path = request.getServletContext().getRealPath("/images");
				String fileName = part.getOriginalFilename();
				part.transferTo(new File(path + File.separator + fileName));
				
				// profile
				memberVo.setMember_profile("/images/"+fileName);
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		int updateUser = memberservice.updateUser(memberVo);
		model.addAttribute("memberVo",memberVo);
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		model.addAttribute("issueMemberTotalCnt", issueService.issueMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalyouGiveFriendList", messageService.totalyouGiveFriendList(memberVo.getMember_mail()));
		
		return "redirect:/myPage?member_mail=" + memberVo.getMember_mail();
	}
	
	
	
		@ResponseBody
		@RequestMapping(value="/myPageSHA256Ajax", method=RequestMethod.GET)
		public Map<String , String> myPageSHA256Ajax(HttpServletRequest request,Model model) {
			
			String pass1 = request.getParameter("pass1").toLowerCase();
			
			String kisa256 = KISA_SHA256.encrypt(pass1);
			
			Map<String, String> passMap = new HashMap<>();
			passMap.put("kisa256", kisa256);
			
			System.out.println("현재 비밀번호 " +  kisa256);
			
			return passMap;
		}
		
		@ResponseBody
		@RequestMapping(value="/myPageMemberENDSHA256Ajax", method=RequestMethod.GET)
		public Map<String , String> myPageMemberENDSHA256Ajax(HttpServletRequest request,Model model) {
			
			String passwordEnd = request.getParameter("passwordEnd").toLowerCase();
			
			String kisa256 = KISA_SHA256.encrypt(passwordEnd);
			
			Map<String, String> passMap = new HashMap<>();
			passMap.put("kisa256", kisa256);
			
			return passMap;
		}
		
		/**
		 * Method : myPageAjax
		 * 작성자 : 나진실
		 * 변경이력 :
		 * @param request
		 * @param model
		 * @return
		 * Method 설명 : myPage 휴대폰 인증 부분
		 */
		@ResponseBody
		@RequestMapping(value="/myPageAjax", method=RequestMethod.GET)
		public String myPageAjax(HttpServletRequest request, Model model) {
			
			// 핸드폰 번호 입력란 
			String member_tel = request.getParameter("member_tel");
		
			String api_key = "NCSJQVBNAKBRXLTC";
			String api_secret ="ZNJ2OS1W0F1A4N9FPRUKO8YXWT1RBXKR";
			Coolsms coolsms = new Coolsms(api_key, api_secret);
		
			HashMap<String, String> set = new HashMap<String, String>();
			set.put("to", member_tel); // 수신
			set.put("from", "01099011334"); // 발신
			
			// random 로직 
			String number ="0123456789";	
			
			// 인증번호 담아주는 변수 
			String certificationNumber = "";
			for(int i = 0; i < 4; i++) {
				certificationNumber += number.charAt((int) Math.floor(Math.random()* number.length()));
			}
			set.put("text", "CURRENT 인증번호는  [ " + certificationNumber + " ]  입니다. ");
			set.put("type", "sms"); // 문자타입
			
			//JSONObject result = coolsms.send(set);// 보내기&전송결과받기
			coolsms.send(set);
			
			return certificationNumber;
		}
		
		
		/**
		 * Method : userwithDrawal
		 * 작성자 : pc07
		 * 변경이력 :
		 * @return
		 * Method 설명 : 마이페이지 회원 탈퇴시 비밀번호 확인 부분
		 */
		@RequestMapping(value="/userwithDrawal", method=RequestMethod.GET)
		public String userwithDrawal( @SessionAttribute("memberVo") MemberVo memberVo, HttpServletRequest request) {
			memberservice.updateUserwithDrawal(memberVo);
			return "redirect:/";
		}
	}
