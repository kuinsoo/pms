package kr.or.ddit.issue.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.ddit.issue.model.IssueVo;
import kr.or.ddit.issue.service.IssueServiceInf;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.util.model.PageVo;

/**
 * kr.or.ddit.issue.web
 * null.java
 * Desc : 이슈 컨트롤러
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:54
 * @Version :
 */
@Controller
public class IssueController {
	Logger logger = LoggerFactory.getLogger(IssueController.class);
	
	@Autowired
	private IssueServiceInf issueService;
	
	/**
	* Method : issueHistory
	* 작성자 : jerry
	* 변경이력 :
	* @param memberVo
	* @param pageVo
	* @param model
	* @return
	* Method 설명 : 이슈히스토리 메뉴에 프로젝트 list 조회
	*/
	@RequestMapping(value="/issueHistory")
	public String issueHistory(@SessionAttribute("memberVo") MemberVo memberVo, PageVo pageVo, Model model) {
		
		pageVo.setMember_mail(memberVo.getMember_mail());
		pageVo.setPageSize(5);
		
		List<ProjectVo> history_myProjectList = issueService.issueHistoryPagination(pageVo);
		int projectCnt = issueService.projectCnt(pageVo);
		
		Map<String, Object> myProjectList = new HashMap<String, Object>();
		myProjectList.put("percentList", getPercentList(history_myProjectList));
		myProjectList.put("history_myProjectList", history_myProjectList);
		
		model.addAttribute("projectCnt", (int)Math.ceil((double)projectCnt / pageVo.getPageSize()));
		
		model.addAttribute("myProjectList", myProjectList);
		
		return "history/issueHistory";
	}
	
	/**
	* Method : issueHistoryAjax
	* 작성자 : jerry
	* 변경이력 :
	* @param memberVo
	* @param pageVo
	* @param model
	* @return
	* Method 설명 : 이슈히스토리 메뉴에 프로젝트 list 조회(Ajax 적용)
	*/
	@RequestMapping(value="/issueHistoryAjax", method= {RequestMethod.POST, RequestMethod.GET})
	public String issueHistoryAjax(@SessionAttribute("memberVo")MemberVo memberVo, PageVo pageVo, Model model) {
		List<ProjectVo> history_myProjectList = issueService.issueHistoryPagination(pageVo);
		int projectCnt = issueService.projectCnt(pageVo);
		List<IssueVo> pjtAllIssueHistory = issueService.pjtAllIssueHistory(memberVo.getMember_mail());
		
		Map<String, Object> myProjectList = new HashMap<String, Object>();
		myProjectList.put("percentList", getPercentList(history_myProjectList));
		myProjectList.put("issueSdateList", getIssueSdateList(pjtAllIssueHistory));
		myProjectList.put("history_myProjectList", history_myProjectList);
		myProjectList.put("pjtAllIssueHistory", pjtAllIssueHistory);
		
		model.addAttribute("projectCnt", (int)Math.ceil((double)projectCnt / pageVo.getPageSize()));
		model.addAttribute("myProjectList", myProjectList);
		
		return "history/issueHistoryAjax";
	}
	
	/**
	* Method : issueInsert
	* 작성자 : jerry
	* 변경이력 :
	* @param issueVo
	* @param model
	* @return
	* Method 설명 : 이슈 등록 / TODO_ISSUE 컬럼 값 추가 / 이슈 list 조회
	*/
	@RequestMapping(value="/issueInsert", method= {RequestMethod.POST, RequestMethod.GET})
	public String issueInsert(IssueVo issueVo, Model model) {
		try {
			int result = issueService.issueInsert(issueVo);
			if(result != 0) {
				issueService.todoIssueUpdate(issueVo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		List<IssueVo> issueList = issueService.issueSelectList(issueVo.getTodo_id());
		
		model.addAttribute("issueList", issueList);
		
		return "issue/issueSelectHtmlAjax";
	}
	
	/**
	* Method : issueSelectList
	* 작성자 : jerry
	* 변경이력 :
	* @param todo_id
	* @param model
	* @return
	* Method 설명 : 이슈 list 조회
	*/
	@RequestMapping(value="/issueSelectList", method= {RequestMethod.POST, RequestMethod.GET})
	public String issueSelectList(@RequestParam("todo_id")String todo_id, Model model) {
		List<IssueVo> issueList = issueService.issueSelectList(todo_id);
		
		model.addAttribute("issueList", issueList);
		
		return "issue/issueSelectHtmlAjax";
	}
	
	/**
	* Method : issueUpdate
	* 작성자 : jerry
	* 변경이력 :
	* @param issueVo
	* Method 설명 : 이슈 수정
	*/
	@RequestMapping(value="/issueUpdate", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public void issueUpdate(IssueVo issueVo) {
		try {
			issueService.issueUpdate(issueVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	* Method : helperUpdate
	* 작성자 : jerry
	* 변경이력 :
	* @param issueVo
	* Method 설명 : 이슈 도움 등록
	*/
	@RequestMapping(value="/helperUpdate", method= {RequestMethod.POST, RequestMethod.GET})
	public String helperUpdate(IssueVo issueVo, Model model) {
		
		List<IssueVo> helperList = new ArrayList<IssueVo>();
		try {
			int result = issueService.helperUpdate(issueVo);
			if(result != 0) {
				helperList = issueService.helperSelectList(issueVo.getTodo_id());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("helperList", helperList);
		
		return "issue/issueHelperHtmlAjax";
	}
	
	/**
	* Method : issueHelperList
	* 작성자 : jerry
	* 변경이력 :
	* @param todo_id
	* @param model
	* @return
	* Method 설명 : 이슈 도움 조회
	*/
	@RequestMapping(value="/issueHelperList", method= {RequestMethod.POST, RequestMethod.GET})
	public String issueHelperList(@RequestParam("todo_id")String todo_id, Model model) {
		List<IssueVo> helperList = issueService.helperSelectList(todo_id);
		
		model.addAttribute("helperList", helperList);
		
		return "issue/issueHelperHtmlAjax";
	}
	
	/**
	* Method : issueDelete
	* 작성자 : jerry
	* 변경이력 :
	* @param issue_id
	* Method 설명 : TODO-ISSUE 무결성 제약조건 해제 후 ISSUE 삭제
	*/
	@RequestMapping(value="/issueDelete", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public void issueDelete(@RequestParam("issue_id")String issue_id) {
		
		try {
			issueService.issueDeleteTodoIssue(issue_id);
			issueService.issueDelete(issue_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	* Method : getPercentList
	* 작성자 : jerry
	* 변경이력 :
	* @param history_myProjectList
	* @return
	* Method 설명 : 프로젝트의 지난 기간을 percent로 구하는 메서드
	*/
	List<Integer> getPercentList(List<ProjectVo> history_myProjectList){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date sdate = null;	//시작일 선언 및 초기화
		Date edate = null;	//종료일 선언 및 초기화
		Date current = new Date();	//현재날짜
		long pjtPeriod = -1;		//프로젝트 총기간 선언 및 초기화
		long currentPeriod = -1;	//지난 기간 선언 및 초기화
		List<Integer> percentList = new ArrayList<Integer>();	//지난 기간 퍼센트 리스트
		
		/* 예상종료일과 실종료일의 null 유무를 체크해서 원하는 패턴("yyyyMMdd")으로 값 변환 */
		for(ProjectVo pjtvo : history_myProjectList) {
			
			sdate = pjtvo.getProject_sdate();
			
			if(pjtvo.getProject_eedate() != null) {
				edate = pjtvo.getProject_eedate();
			} else if(pjtvo.getProject_edate() != null) {
				edate = pjtvo.getProject_edate();
			}
			
			/* 프로젝트 총 기간 : 종료일 - 시작일 */
			long totalDays = edate.getTime() - sdate.getTime();
			pjtPeriod = totalDays / (24 * 60 * 60 * 1000);

			/* 지난 기간 : 현재날짜 - 시작일 */
			long currentDays = current.getTime() - sdate.getTime();
			currentPeriod = currentDays / (24 * 60 * 60 * 1000);
			
			/* 지난 기간 퍼센트 : (지난 기간 * 100) / 총 기간 */
			percentList.add((int)((currentPeriod * 100) / pjtPeriod));

		}
		return percentList;
		
	}//getPercentList()
	
	/**
	* Method : getIssueSdateList
	* 작성자 : jerry
	* 변경이력 :
	* @param pjtAllIssueHistory
	* @return
	* Method 설명 : 프로젝트의 총 기간과 이슈 발생일자의 위치를 구하는 메서드
	*/
	List<Integer> getIssueSdateList(List<IssueVo> pjtAllIssueHistory){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date pjtSdate = null;		//프로젝트 시작일 선언 및 초기화
		Date pjtEdate = null;		//프로젝트 종료일 선언 및 초기화
		Date issueSdate = null;		//이슈발생일자
		long pjtPeriod = -1;		//프로젝트 총기간 선언 및 초기화
		long issuePeriod = -1;		//시작일-이슈발생일 선언 및 초기화
		List<Integer> issueSdateList = new ArrayList<Integer>();	//시작일-이슈발생일 리스트
		
		/* 예상종료일과 실종료일의 null 유무를 체크해서 원하는 패턴("yyyyMMdd")으로 값 변환 */
		for(IssueVo issueVo : pjtAllIssueHistory) {
			
			pjtSdate = issueVo.getProject_sdate();
			issueSdate = issueVo.getIssue_sdate();
			
			if(issueVo.getProject_eedate() != null) {
				pjtEdate = issueVo.getProject_eedate();
			} else if(issueVo.getProject_edate() != null) {
				pjtEdate = issueVo.getProject_edate();
			}
			
			/* 프로젝트 총 기간 : 종료일 - 시작일 */
			long totalDays = pjtEdate.getTime() - pjtSdate.getTime();
			pjtPeriod = totalDays / (24 * 60 * 60 * 1000);

			/* 지난 기간 : 이슈발생일 - 시작일 */
			long issueSDates = issueSdate.getTime() - pjtSdate.getTime();
			issuePeriod = issueSDates / (24 * 60 * 60 * 1000);
			
			/* 지난 기간 퍼센트 : (지난 기간 * 100) / 총 기간 */
			issueSdateList.add((int)((issuePeriod * 100) / pjtPeriod));

		}
		return issueSdateList;
		
	}//getIssueSdateList()
	
}
