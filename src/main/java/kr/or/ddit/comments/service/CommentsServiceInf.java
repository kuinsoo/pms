package kr.or.ddit.comments.service;

import kr.or.ddit.comments.model.CommentsVo;

import java.util.List;

/**
 * kr.or.ddit.comments.service
 * null.java
 * Desc : 댓글 서비스 인터페이스
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:45
 * @Version :
 */
public interface CommentsServiceInf {
	/**
	 * Cmt list list.
	 * 작성자 : Mr.KKu
	 * 내용 : 댓글 조회
	 * @param project_id the cmt work
	 * @return the list
	 */
	List<CommentsVo> cmtList(String project_id);

	/**
	 * Insert cmt int.
	 * 작성자 : Mr.KKu
	 * 내용 : 댓글 생성
	 *
	 * @param cmtVo the cmt vo
	 * @return the int
	 */
	int insertCmt(CommentsVo cmtVo);

	/**
	 * Update cmt int.
	 * 작성자 : Mr.KKu
	 * 내용 : 댓글 수정
	 *
	 * @param cmtVo the cmt vo
	 * @return the int
	 */
	int updateCmt(CommentsVo cmtVo);

	/**
	 * Delete cmt int.
	 * 작성자 : Mr.KKu
	 * 내용 : 댓글 삭제
	 *
	 * @param cmt_id the cmt id
	 * @return the int
	 */
	int deleteCmt(String cmt_id);



}
