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

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.MemberServiceInf;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.todo.model.ToDoVo;
import kr.or.ddit.util.model.PageVo;


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
		
		memberservice.selectUser(memberVo.getMember_mail());
		model.addAttribute("memberVo",memberVo);
		return "myPage/myPage";
	}
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	/**
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
	public Map<String, Object> myPageProjectAjax(Model model , PageVo pageVo , @SessionAttribute("memberVo") MemberVo memberVo ,
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
		
		// 검색 부분 
		if (pageVo.getSearchText() == null) {
			pageVo.setSearchText("");
		}
		
		List<ProjectVo> projectList = memberservice.myprojectselect(pageVo);
		Map<String, Object> projectMap = new HashMap<>();
		int pageCnt = memberservice.totalProjectCnt(memberVo.getMember_mail());
		
		projectMap.put("projectList", projectList);		
		projectMap.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		return projectMap;
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
	
		System.out.println("pageCnt : " + pageCnt);
		System.out.println("pageVo.getPageSize() : " + pageVo.getPageSize());	
		System.out.println("(int)Math.ceil((double)pageCnt/pageVo.getPageSize()) : " + (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
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
		int pageCnt = memberservice.selectProjectCnt(memberVo.getMember_mail());
		projectBookMap.put("projectBookList", projectBookList);
		
		projectBookMap.put("pageCnt",(int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
	
		return projectBookMap;
	}
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	// TodoList
	
	@ResponseBody
	@RequestMapping(value ="/myTodoProjectListAjax", method = RequestMethod.GET)
	public Map<String, Object> myTodoProjectListAjax (Model model , PageVo pageVo,
			@SessionAttribute("memberVo") MemberVo memberVo, HttpServletRequest request) {
		
		
		pageVo.setMember_mail(memberVo.getMember_mail());
		
		List<ToDoVo> projectTodoList = memberservice.myTodoselect(pageVo);
		
		Map<String , Object> projectTodoListMap = new HashMap<>();
		int pageCnt = memberservice.selectTodoCnt(memberVo.getMember_mail());
		
		projectTodoListMap.put("projectTodoList", projectTodoList);
		projectTodoListMap.put("pageCnt",(int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		return projectTodoListMap;
	}
	
	@ResponseBody
	@RequestMapping(value ="/searchTodoProjectAjax", method = RequestMethod.POST)
	public Map<String, Object> searchTodoProjectAjax (Model model , PageVo pageVo , @SessionAttribute("memberVo") MemberVo memberVo 
			, HttpServletRequest request){
		
		pageVo.setMember_mail(memberVo.getMember_mail());
		
		// 검색 부분 
		if (pageVo.getSearchTodoText() == null) {
			pageVo.setSearchTodoText("");
		}
		
		List<ToDoVo> projectTodoList = memberservice.myTodoselect(pageVo);
	
		Map<String , Object> projectTodoMap = new HashMap<>();
		int pageCnt = memberservice.selectTodoCnt(memberVo.getMember_mail());
	
		projectTodoMap.put("projectTodoList", projectTodoList);
		
		projectTodoMap.put("pageCnt",(int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
	
		return projectTodoMap;
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
		@RequestPart("member_profile")MultipartFile part, HttpServletRequest request) {
		
			String member_name = request.getParameter("member_name");
			String member_tel = request.getParameter("member_tel");
			String member_pass = request.getParameter("member_pass");
			
			memberVo.setMember_name(member_name);
			memberVo.setMember_tel(member_tel);
			memberVo.setMember_pass(member_pass);
			
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
			
			return "redirect:/myPage?member_mail=" + memberVo.getMember_mail();
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
		@RequestMapping(value="/userwithDrawal")
		public String userwithDrawal( @SessionAttribute("memberVo") MemberVo memberVo) {
			
			memberservice.updateUserwithDrawal(memberVo);
			
			return "redirect:/";				
			
		}
	}


























