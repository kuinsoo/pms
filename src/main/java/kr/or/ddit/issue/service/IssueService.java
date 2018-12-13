package kr.or.ddit.issue.service;

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
	
}
