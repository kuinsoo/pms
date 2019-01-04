package kr.or.ddit.attachment.service;

import kr.or.ddit.attachment.mapper.AttachmentMapper;
import kr.or.ddit.attachment.model.AttachmentVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * kr.or.ddit.attachment.service
 * null.java
 * Desc : 첨부파일 서비스
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:20
 * @Version :
 */
@Service
@Transactional
public class AttachmentService implements AttachmentServiceInf {

	@Autowired
	private AttachmentMapper attachmentMapper;

	/**
	 * Insert att int.
	 * 작성자 : Mr.KKu
	 * 내용 : 첨부파일 추가
	 *
	 * @param attVo the att vo
	 * @return the int
	 */
	@Override
	public int insertAtt(AttachmentVo attVo) {
		return attachmentMapper.insertAtt(attVo);
	}

	/**
	 * Select att attachment vo.
	 * 작성자 : Mr.KKu
	 * 내용 : 첨부파일 찾기
	 *
	 * @param att_id the att id
	 * @return the attachment vo
	 */
	@Override
	public AttachmentVo selectAtt(String att_id) {
		return attachmentMapper.selectAtt(att_id);
	}



	/**
	 * Select att attachment vo.
	 * 작성자 : Mr.KKu
	 * 내용 : 첨부파일 삭제
	 *
	 * @param work_id the att id
	 * @return the attachment vo
	 */
	@Override
	public int deleteAtt(String work_id) {
		return attachmentMapper.deleteAtt(work_id);
	}
}
