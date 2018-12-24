package kr.or.ddit.comments.mapper;

import kr.or.ddit.comments.model.CommentsVo;

import java.util.List;
import java.util.Map;

/**
 * kr.or.ddit.comments.mapper
 * null.java
 * Desc : 댓글 맵퍼
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:44
 * @Version :
 */
public interface CommentsMapper {
	/**
	 * Cmt list list.
	 * 작성자 : Mr.KKu
	 * 내용 : 댓글 조회
	 *
	 * @param project_id the project id
	 * @return the list
	 */
	List<CommentsVo> cmtList(String project_id);


	/**
	 * Ajax cmt list list.
	 * 작성자 : Mr.KKu
	 * 내용 : 댓글 조회
	 *
	 * @param mapCmtList the map cmt list
	 * @return the list
	 */
	List<CommentsVo> ajaxCmtList(Map<String, String> mapCmtList);
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
