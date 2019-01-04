package kr.or.ddit.card.service;

import kr.or.ddit.Application;
import kr.or.ddit.attachment.model.AttachmentVo;
import kr.or.ddit.attachment.service.AttachmentServiceInf;
import kr.or.ddit.card.mapper.CardMapper;
import kr.or.ddit.card.model.CardVo;
import kr.or.ddit.commons.util.UUID;
import kr.or.ddit.commons.util.Utils;
import kr.or.ddit.work.model.WorkVo;
import kr.or.ddit.work.service.WorkServiceInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * kr.or.ddit.card.service
 * null.java
 * Desc :
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-16 / 오전 11:00
 * @Version :
 */
@Service
@Transactional
public class CardService implements CardServiceInf {

	@Autowired
	private CardMapper cardMapper;

	@Autowired
	private WorkServiceInf workService;

	@Autowired
	private AttachmentServiceInf attachmentService;

	@Override
	public List<CardVo> selectWorkCard(String pmember_project) {
		return cardMapper.selectWorkCard(pmember_project) ;
	}



	@Override
	public List<CardVo> selectGroupCard(String groupNo) {
		return cardMapper.selectGroupCard(groupNo);
	}

	@Override
	public CardVo selectCard(String cardNo) {
		return cardMapper.selectCard(cardNo);
	}

	@Override
	public int createCard(Map<String, String> wmMap , WorkVo workVo, MultipartFile[] files) {

		workService.insertWorkMember(wmMap , workVo);
		String fileName = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		AttachmentVo attVo = new AttachmentVo();

		if (files != null && files.length > 0) {
			for (int i = 0; i < files.length; i++) {
				try {
					if (true == files[i].isEmpty()) {
						continue;
					}
					fileName = files[i].getOriginalFilename();
					attVo.setAtt_name(files[i].getOriginalFilename());
					String path = Application.UPLOAD_DIR + "/" + UUID.UUID() + "_" + sdf.format(new Date()) + "_" + fileName;
					String extension = path.substring(path.lastIndexOf(".") + 1, path.length());
					attVo.setAtt_extension(extension);
					attVo.setAtt_path(path);
					attVo.setAtt_file(files[i].getBytes());
					attachmentService.insertAtt(attVo);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		return cardMapper.createCard();
	}

	@Override
	public int createCard(Map<String, String> wmMap, WorkVo workVo) {
		workService.insertWorkMember(wmMap , workVo);
		return cardMapper.createCard();
	}

	@Override
	public int updateCard(CardVo cardVo) {
		return cardMapper.updateCard(cardVo);
	}

	@Override
	public int deleteCard(String work_id) {
		return cardMapper.deleteCard(work_id);
	}
}
