package kr.or.ddit.card.service;

import kr.or.ddit.card.mapper.CardMapper;
import kr.or.ddit.card.model.CardVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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
	public int createCard(CardVo cardVo) {
		return cardMapper.createCard(cardVo);
	}

	@Override
	public int updateCard(CardVo cardVo) {
		return cardMapper.updateCard(cardVo);
	}

	@Override
	public int deleteCard(int cardNo) {
		return cardMapper.deleteCard(cardNo);
	}
}
