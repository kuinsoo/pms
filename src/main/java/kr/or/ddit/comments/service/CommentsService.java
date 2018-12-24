package kr.or.ddit.comments.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.comments.mapper.CommentsMapper;
import kr.or.ddit.comments.model.CommentsVo;

/**
 * kr.or.ddit.comments.service
 * null.java
 * Desc : 댓글 서비스
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:45
 * @Version :
 */
@Service
@Transactional
public class CommentsService implements CommentsServiceInf {

	@Autowired
	private CommentsMapper commentsMapper;

	/**
	 * Cmt list list.
	 * 작성자 : Mr.KKu
	 * 내용 : 댓글 조회
	 * @param project_id the cmt work
	 * @return the list
	 */
	@Override
	public List<CommentsVo> cmtList(String project_id) {
		return commentsMapper.cmtList(project_id) ;
	}

	/**
	 * Ajax cmt list list.
	 * 작성자 : Mr.KKu
	 * 내용 : 댓글 조회
	 *
	 * @param mapCmtList the map cmt list
	 * @return the list
	 */
	@Override
	public List<CommentsVo> ajaxCmtList(Map<String, String> mapCmtList) {
		return commentsMapper.ajaxCmtList(mapCmtList);
	}

	/**
	 * Insert cmt int.
	 * 작성자 : Mr.KKu
	 * 내용 : 댓글 생성
	 *
	 * @param cmtVo the cmt vo
	 * @return the int
	 */
	@Override
	public int insertCmt(CommentsVo cmtVo) {
		return commentsMapper.insertCmt(cmtVo);
	}

	/**
	 * Update cmt int.
	 * 작성자 : Mr.KKu
	 * 내용 : 댓글 수정
	 *
	 * @param cmtVo the cmt vo
	 * @return the int
	 */
	@Override
	public int updateCmt(CommentsVo cmtVo) {
		return commentsMapper.updateCmt(cmtVo);
	}

	/**
	 * Delete cmt int.
	 * 작성자 : Mr.KKu
	 * 내용 : 댓글 삭제
	 *
	 * @param cmt_id the cmt id
	 * @return the int
	 */
	@Override
	public int deleteCmt(String cmt_id) {
		return commentsMapper.deleteCmt(cmt_id);
	}
}
