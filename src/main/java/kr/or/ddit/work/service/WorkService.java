package kr.or.ddit.work.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.schedule.model.ScheduleVo;
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
	* @param scheduleVo
	* @return
	* Method 설명 : 업무 전체 일정
	*/
	@Override
	public List<WorkVo> workAllSchedule(ScheduleVo scheduleVo) {
		return workMapper.workAllSchedule(scheduleVo);
	}

	/**
	* Method : selectWorks
	* 작성자 : Mr.kku
	* 변경이력 :
	* @param work_project
	* @return
	* Method 설명 : 업무 리스트를 이메일과 프로젝트 ID 로 검색한다.
	*/
	@Override
	public List<WorkVo> selectWorks(String work_project ) {
		return workMapper.selectWorks(work_project);
	}
	
	/**
	* Method : createWork
	* 작성자 : Mr.kku
	* 변경이력 :
	* @param workVo
	* @return
	* Method 설명 : 업무를 생성한다
	*/
	@Override
	public int createWork(WorkVo workVo) {
		return workMapper.createWork(workVo);
	}

	/**
	* Method : deleteWork
	* 작성자 : Mr.kku
	* 변경이력 :
	* @param work_id
	* @return
	* Method 설명 : 업무 삭제
	*/
	@Override
	public int deleteWork(String work_id) {
		return workMapper.deleteWork(work_id);
	}

	/**
	* Method : updateWork
	* 작성자 : Mr.kku
	* 변경이력 :
	* @param workVo
	* @return
	* Method 설명 : 업무 수정
	*/
	@Override
	public int updateWork(WorkVo workVo) {
		return workMapper.updateWork(workVo);
	}
	
	
	
}

