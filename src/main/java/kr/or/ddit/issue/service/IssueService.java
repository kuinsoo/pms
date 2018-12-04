package kr.or.ddit.issue.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.issue.mapper.IssueMapper;
import kr.or.ddit.issue.model.IssueVo;

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
	
	@Autowired
	private IssueMapper issueMapper;

	/**
	* Method : issueAllSchedule
	* 작성자 : jerry
	* 변경이력 :
	* @return
	* Method 설명 : 이슈 전체 일정
	*/
	@Override
	public List<IssueVo> issueAllSchedule(String sid) {
		return issueMapper.issueAllSchedule(sid);
	}
	
}
