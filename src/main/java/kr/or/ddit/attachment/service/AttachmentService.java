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

	@Override
	public int insertFile(AttachmentVo attVo) {
		return attachmentMapper.insertFile(attVo);
	}
}
