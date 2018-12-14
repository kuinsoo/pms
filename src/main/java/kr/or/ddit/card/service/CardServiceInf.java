package kr.or.ddit.card.service;

import kr.or.ddit.card.model.CardVo;

import java.util.List;

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

	List<CardVo> selectAllCard();

	List<CardVo> selectGroupCard(String groupNo);

	CardVo selectCard(int cardNo);

	int createCard(CardVo cardVo);

	int updateCard(CardVo cardVo);

	int deleteCard(int cardNo);

}
