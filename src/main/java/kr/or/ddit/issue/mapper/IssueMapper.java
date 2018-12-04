package kr.or.ddit.issue.mapper;

import java.util.List;

import kr.or.ddit.issue.model.IssueVo;

/**
 * kr.or.ddit.issue.mapper
 * null.java
 * Desc : 이슈 맵퍼
 *
 * @Author : Mr.KKu, jerry
 * @Date : 2018-11-27 / 오후 2:53
 * @Version :
 */
public interface IssueMapper {

	/**
	* Method : issueAllSchedule
	* 작성자 : jerry
	* 변경이력 :
	* @return
	* Method 설명 : 이슈 전체 일정
	*/
	List<IssueVo> issueAllSchedule(String sid);
	
}
