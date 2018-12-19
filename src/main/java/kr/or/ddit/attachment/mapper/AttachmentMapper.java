package kr.or.ddit.attachment.mapper;

import kr.or.ddit.attachment.model.AttachmentVo;

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
	 * Insert file int.
	 * 작성자 : Mr.KKu
	 * 설명  : 첨부파일 추가
	 *
	 * @param attVo the att vo
	 * @return the int
	 */
	int insertFile(AttachmentVo attVo);
}
