package kr.or.ddit.work.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.work.mapper.WorkMapper;
import kr.or.ddit.work.model.WorkVo;

/**
 * kr.or.ddit.work.service
 * null.java
 * Desc : 업무 서비스
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 3:33
 * @Version :
 */
@Service
@Transactional
public class WorkService implements WorkServiceInf{

	@Autowired
	private WorkMapper workMapper;
	
	/**
	* Method : workAllSchedule
	* 작성자 : jerry
	* 변경이력 :
	* @return
	* Method 설명 : 업무 전체 일정
	*/
	@Override
	public List<WorkVo> workAllSchedule() {
		return workMapper.workAllSchedule();
	}
	
}

