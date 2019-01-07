package kr.or.ddit.issue.service;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.issue.mapper.IssueMapper;
import kr.or.ddit.issue.model.IssueVo;
import kr.or.ddit.project.mapper.ProjectMapper;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.schedule.model.ScheduleVo;
import kr.or.ddit.util.model.PageVo;

/**
 * kr.or.ddit.issue.service
 * null.java
 * Desc : 이슈 서비스
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:54
 * @Version :
 */
@Service
@Transactional
public class IssueService implements IssueServiceInf{
	Logger logger = LoggerFactory.getLogger(IssueService.class);
	
	@Autowired
	private IssueMapper issueMapper;
	@Autowired
	private ProjectMapper projectMapper;
	
	/**
	* Method : issueAllSchedule
	* 작성자 : jerry
	* 변경이력 :
	* @param scheduleVo
	* @return
	* Method 설명 : 이슈 전체 일정
	*/
	@Override
	public List<IssueVo> issueAllSchedule(ScheduleVo scheduleVo) {
		return issueMapper.issueAllSchedule(scheduleVo);
	}

	/**
	* Method : myProjectList
	* 작성자 : jerry
	* 변경이력 :
	* @param scheduleVo
	* @return
	* Method 설명 : 각 project별 issue history를 위해 project명 조회
	*/
	@Override
	public List<ProjectVo> myProjectList(ScheduleVo scheduleVo) {
		return projectMapper.projectAllSchedule(scheduleVo);
	}

	/**
	* Method : issueHistoryPagination
	* 작성자 : jerry
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 이슈 히스토리 스크롤 페이징처리
	*/
	@Override
	public List<ProjectVo> issueHistoryPagination(PageVo pageVo) {
		return issueMapper.issueHistoryPagination(pageVo);
	}

	/**
	* Method : projectCnt
	* 작성자 : jerry
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 프로젝트 총 갯수
	*/
	@Override
	public int projectCnt(PageVo pageVo) {
		return issueMapper.projectCnt(pageVo);
	}

	/**
	* Method : issueInsert
	* 작성자 : jerry
	* 변경이력 :
	* @param issueVo
	* @return
	* Method 설명 : 이슈 등록
	*/
	@Override
	public int issueInsert(IssueVo issueVo) {
		long chk = dateCompare(issueVo);
		
		if (chk >= 0) {
			return issueMapper.issueInsert(issueVo);
		} else {
			return -400;
		}
	}

	/**
	* Method : selGetProjectMember
	* 작성자 : jerry
	* 변경이력 :
	* @param work_id
	* @return
	* Method 설명 : issue 등록시 select-option에 프로젝트 참여자 리스트
	*/
	@Override
	public List<IssueVo> selGetProjectMember(String work_id) {
		return issueMapper.selGetProjectMember(work_id);
	}

	/**
	* Method : todoIssueUpdate
	* 작성자 : jerry
	* 변경이력 :
	* @param issueVo
	* @return
	* Method 설명 : issue 등록시 todo테이블의 todo_issue컬럼 추가(수정)
	*/
	@Override
	public int todoIssueUpdate(IssueVo issueVo) {
		return issueMapper.todoIssueUpdate(issueVo);
	}

	/**
	* Method : issueSelectList
	* 작성자 : jerry
	* 변경이력 :
	* @param todo_id
	* @return
	* Method 설명 : 이슈 리스트 조회
	*/
	@Override
	public List<IssueVo> issueSelectList(String todo_id) {
		return issueMapper.issueSelectList(todo_id);
	}

	/**
	* Method : issueUpdate
	* 작성자 : jerry
	* 변경이력 :
	* @param issueVo
	* @return
	* Method 설명 : 이슈 수정
	*/
	@Override
	public int issueUpdate(IssueVo issueVo) {
		long chk = dateCompare(issueVo);
		
		if(chk >= 0) {
			return issueMapper.issueUpdate(issueVo);
		} else {
			return -400;
		}
	}

	/**
	* Method : helperUpdate
	* 작성자 : jerry
	* 변경이력 :
	* @param issueVo
	* @return
	* Method 설명 : 도움 등록
	*/
	@Override
	public int helperUpdate(IssueVo issueVo) {
		return issueMapper.helperUpdate(issueVo);
	}

	/**
	* Method : helperSelectList
	* 작성자 : jerry
	* 변경이력 :
	* @param todo_id
	* @return
	* Method 설명 : 도움 리스트 조회
	*/
	@Override
	public List<IssueVo> helperSelectList(String todo_id) {
		return issueMapper.helperSelectList(todo_id);
	}

	/**
	* Method : issueDeleteTodoIssue
	* 작성자 : jerry
	* 변경이력 :
	* @param issue_id
	* @return
	* Method 설명 : 이슈 삭제시 무결성 제약조건 해제를 위해 todo_issue컬럼 값을 Null로 수정(UPDATE) 
	*/
	@Override
	public int issueDeleteTodoIssue(String issue_id) {
		return issueMapper.issueDeleteTodoIssue(issue_id);
	}

	/**
	* Method : issueDelete
	* 작성자 : jerry
	* 변경이력 :
	* @param issue_id
	* @return
	* Method 설명 : (무결성 제약조건 이후) 이슈 삭제
	*/
	@Override
	public int issueDelete(String issue_id) {
		return issueMapper.issueDelete(issue_id);
	}

	/**
	* Method : pjtAllIssueHistory
	* 작성자 : jerry
	* 변경이력 :
	* @param sid
	* @return
	* Method 설명 : 프로젝트별 이슈 조회
	*/
	@Override
	public List<IssueVo> pjtAllIssueHistory(String sid) {
		return issueMapper.pjtAllIssueHistory(sid);
	}

	/**
	* Method : getProjectEndDate
	* 작성자 : jerry
	* 변경이력 :
	* @param issueVo
	* @return
	* Method 설명 : 이슈 등록시 해당 프로젝트의 종료기간을 조회
	*/
	@Override
	public IssueVo getProjectEndDate(IssueVo issueVo) {
		return issueMapper.getProjectEndDate(issueVo);
	}
	
	/**
	 * Method : getIssuePageList
	 * 작성자 : iks
	 * 변경이력 :
	 * @param map
	 * @return
	 * Method 설명 : 알림을 위한 이슈 페이지 리스트 조회
	 */
	@Override
	public List<IssueVo> getIssuePageList(PageVo pageVo) {
		return issueMapper.getIssuePageList(pageVo);
	}

	/**
	 * Method : issueMemberTotalCnt
	 * 작성자 : iks
	 * 변경이력 :
	 * @param map
	 * @return
	 * Method 설명 : 본인이 등록한 업무에 대한 이슈 총 갯수
	 */
	@Override
	public int issueMemberTotalCnt(String member_mail) {
		return issueMapper.issueMemberTotalCnt(member_mail);
	}

	/**
	* Method : dateCompare
	* 작성자 : jerry
	* 변경이력 :
	* @param issueVo
	* @return
	* Method 설명 : 이슈 발생일이 프로젝트 종료일보다 후일이면 등록되지 않는다.
	*/
	public long dateCompare(IssueVo issueVo) {
		IssueVo projectDateValue = getProjectEndDate(issueVo);
		Date project_edate = null;
		
		/**
		 * issueVo에 담겨있는 issue_work 값으로 해당 프로젝트의 종료일(혹은 예상종료일)을
		 * 조회한 후 각각의 알맞은 변수명에 초기화해준다.
		 */
		if (projectDateValue.getProject_edate() != null) {
			project_edate = projectDateValue.getProject_edate();
		} else {
			project_edate =projectDateValue.getProject_eedate();
		}
		
		long chk = project_edate.getTime() - issueVo.getIssue_sdate().getTime();
		
		return chk;
	}
	
}
