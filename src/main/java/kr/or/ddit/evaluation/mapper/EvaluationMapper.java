package kr.or.ddit.evaluation.mapper;

import kr.or.ddit.evaluation.model.EvaluationVo;

import java.util.List;
import java.util.Map;

/**
 * kr.or.ddit.evaluation.mapper
 * null.java
 * Desc : 회원 능력 평가 맵퍼
 *
 * @Author : Mr.KKu
 * @Date : 2018-12-20 / 오후 5:20
 * @Version :
 */
public interface EvaluationMapper {

	/**
	 * Evaluation view list.
	 * 작성자 : Mr.KKu
	 * 내용	: 능력 평가  출력
	 *
	 * @param evalMap the eval map
	 * @return the list
	 */
	List<EvaluationVo> evaluationView(Map<String, String> evalMap);

	/**
	 * Evaluation project list list.
	 * 작성자 : Mr.KKu
	 * 내용	: 능력 평가 프로젝트 리스트
	 *
	 * @param evalMap the eval map
	 * @return the list
	 */
	List<EvaluationVo> evaluationProjectList(Map<String, String> evalMap);



	/**
	 * Evaluation chart list.
	 * 작성자 : Mr.KKu
	 * 내용	: 프로젝트 차트 값
	 *
	 * @param evalMap the eval map
	 * @return the EvaluationVo
	 */
	EvaluationVo evaluationChart(Map<String, String > evalMap);
}
