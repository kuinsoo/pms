package kr.or.ddit.evaluation.service;

import kr.or.ddit.evaluation.mapper.EvaluationMapper;
import kr.or.ddit.evaluation.model.EvaluationVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
@Service
@Transactional
public class EvaluationService  implements EvaluationServiceInf {

	@Autowired
	private EvaluationMapper evaluationMapper;

	/**
	 * Evaluation view list.
	 * 작성자 : Mr.KKu
	 * 내용	: 능력 평가  출력
	 *
	 * @param evalMap the eval map
	 * @return the list
	 */
	@Override
	public List<EvaluationVo> evaluationView(Map<String, String> evalMap) {
		return evaluationMapper.evaluationView(evalMap);
	}




	/**
	 * Evaluation project list list.
	 * 작성자 : Mr.KKu
	 * 내용	: 능력 평가 프로젝트 리스트
	 *
	 * @param evalMap the eval map
	 * @return the list
	 */
	@Override
	public List<EvaluationVo> evaluationProjectList(Map<String, String> evalMap) {
		return evaluationMapper.evaluationProjectList(evalMap);
	}


	/**
	 * Evaluation chart list.
	 * 작성자 : Mr.KKu
	 * 내용	: 프로젝트 차트 값
	 *
	 * @param evalMap the eval map
	 * @return the EvaluationVo
	 */
	@Override
	public EvaluationVo evaluationChart(Map<String, String> evalMap) {
		return evaluationMapper.evaluationChart(evalMap);
	}
}
