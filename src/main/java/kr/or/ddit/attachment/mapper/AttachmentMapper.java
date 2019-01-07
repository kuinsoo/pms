package kr.or.ddit.attachment.mapper;

import kr.or.ddit.attachment.model.AttachmentVo;

import java.util.List;

/**
 * kr.or.ddit.attachment.mapper
 * null.java
 * Desc : 첨부파일 맵퍼
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:22
 * @Version :
 */
public interface AttachmentMapper {

	/**
	 * Insert att int.
	 * 작성자 : Mr.KKu
	 * 내용 : 첨부파일 추가
	 *
	 * @param attVo the att vo
	 * @return the int
	 */
	int insertAtt(AttachmentVo attVo);

	/**
	 * Select att attachment vo.
	 * 작성자 : Mr.KKu
	 * 내용 : 첨부파일 찾기
	 *
	 * @param att_id the att id
	 * @return the attachment vo
	 */
	AttachmentVo selectAtt(String att_id);


	/**
	 * Select att attachment vo.
	 * 작성자 : Mr.KKu
	 * 내용 : 첨부파일 삭제
	 *
	 * @param work_id the att id
	 * @return the attachment vo
	 */
	int deleteAtt (String work_id);

	/**
	 * Select project att list.
	 * 작성자 : Mr.KKu
	 * 내용 : 프로젝트 내 첨부파일 검색
	 *
	 * @param project_id the project id
	 * @return the list
	 */
	List<AttachmentVo> selectProjectAtt(String project_id);
}
