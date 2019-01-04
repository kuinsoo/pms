package kr.or.ddit.card.mapper;

import kr.or.ddit.card.model.CardVo;

import java.util.List;

/**
 * kr.or.ddit.card.mapper
 * null.java
 * Desc : Card Mapper
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-19 / 오후 2:07
 * @Version :
 */
public interface CardMapper {

	List<CardVo> selectWorkCard(String pmember_project);

	List<CardVo> selectGroupCard(String groupNo);

	CardVo selectCard(String cardNo);

	int createCard();

	int updateCard(CardVo cardVo);

	int deleteCard(String work_id);

}
