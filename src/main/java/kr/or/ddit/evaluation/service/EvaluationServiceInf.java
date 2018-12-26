package kr.or.ddit.evaluation.service;

import kr.or.ddit.evaluation.model.EvaluationVo;

import java.util.List;
import java.util.Map;

/**
 * kr.or.ddit.evaluation.service
 * null.java
 * Desc :
 *
 * @Author : Mr.KKu
 * @Date : 2018-12-20 / 오후 5:20
 * @Version :
 */
public interface EvaluationServiceInf {

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
	 * Evaluation work cnt int.
	 * 작성자 : Mr.KKu
	 * 내용	: 업무 수
	 *
	 * @param evalMap the eval map
	 * @return the int
	 */
	int evaluationWorkCnt(Map<String, String> evalMap);

	/**
	 * Evaluation work cnt int.
	 * 작성자 : Mr.KKu
	 * 내용	: 이슈 처리수
	 *
	 * @param evalMap the eval map
	 * @return the int
	 */
	int evaluationIssueCnt(Map<String, String> evalMap);

	/**
	 * Evaluation work cnt int.
	 * 작성자 : Mr.KKu
	 * 내용	: 프로젝트 내에 이슈처리 건수
	 *
	 * @param evalMap the eval map
	 * @return the int
	 */
	List<EvaluationVo> evaluationProjectIssueCnt(Map<String, String> evalMap);

	/**
	 * Evaluation chart list.
	 * 작성자 : Mr.KKu
	 * 내용	: 프로젝트 차트 값
	 *
	 * @param evalMap the eval map
	 * @return the list
	 */
	List<EvaluationVo> evaluationChart(Map<String, String > evalMap);
}
