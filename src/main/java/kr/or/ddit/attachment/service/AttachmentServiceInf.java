package kr.or.ddit.attachment.service;

import kr.or.ddit.attachment.model.AttachmentVo;

/**
 * kr.or.ddit.attachment.service
 * null.java
 * Desc : 첨부파일 서비스 인터페이스
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:21
 * @Version :
 */
public interface AttachmentServiceInf {

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
}
