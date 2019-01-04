package kr.or.ddit.card.service;

import kr.or.ddit.card.model.CardVo;
import kr.or.ddit.work.model.WorkVo;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

/**
 * kr.or.ddit.card.service
 * null.java
 * Desc :
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-16 / 오전 11:01
 * @Version :
 */
public interface CardServiceInf {

	List<CardVo> selectWorkCard(String pmember_project);

	List<CardVo> selectGroupCard(String groupNo);

	CardVo selectCard(String cardNo);

	int createCard(Map<String, String> wmMap , WorkVo workVo , MultipartFile[] files);

	int createCard(Map<String, String> wmMap , WorkVo workVo );

	int updateCard(CardVo cardVo);

	int deleteCard(String work_id);

}
