package kr.or.ddit.work.service;

import kr.or.ddit.attachment.service.AttachmentServiceInf;
import kr.or.ddit.card.service.CardServiceInf;
import kr.or.ddit.comments.service.CommentsServiceInf;
import kr.or.ddit.schedule.model.ScheduleVo;
import kr.or.ddit.todo.model.ToDoVo;
import kr.or.ddit.todo.service.ToDoServiceInf;
import kr.or.ddit.util.model.PageVo;
import kr.or.ddit.work.mapper.WorkMapper;
import kr.or.ddit.work.model.WorkVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

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

	@Autowired
	private ToDoServiceInf todoService;

	@Autowired
	private CardServiceInf cardService;

	@Autowired
	private AttachmentServiceInf attachmentService;

	@Autowired
    private CommentsServiceInf commentsService;


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
        attachmentService.deleteAtt(work_id);
        commentsService.deleteWorkCmt(work_id);
        cardService.deleteCard(work_id);
        workMapper.deleteWorkMember(work_id);
		return workMapper.deleteWork(work_id);
	}


	@Override
	public int deleteWorkMember(String work_id) {
		return workMapper.deleteWorkMember(work_id);
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

	@Override
	public int updateWork(WorkVo workVo, Map<String, Object> todoMap, String work_id) {
		todoService.todoCompletYN(todoMap);

		List<ToDoVo> todoList = (List<ToDoVo>) todoService.selectCntTodoList(work_id);
		int todoListCnt = todoList.size();
		List<ToDoVo> todoListCpt = (List<ToDoVo>) todoService.selectCntTodoComplete(work_id);
		int todoListCCnt = todoListCpt.size();
		int totalP = 100/todoListCnt;
		int currentP = todoListCCnt * totalP;
		workVo.setWork_progress(currentP);
		return workMapper.updateWork(workVo);
	}


	/**
	 * Method : updateWork
	 * 작성자 : Mr.kku
	 * 변경이력 :
	 * @param wmMap
	 * @return
	 * Method 설명 : 업무 등록시 함꼐 등록
	 */
	@Override
	public int insertWorkMember(Map<String, String> wmMap ,WorkVo workVo) {
		workMapper.createWork(workVo);
		return workMapper.insertWorkMember(wmMap);
	}

	/**
	* Method : workMember
	* 작성자 : 임규승
	* 변경이력 :
	* @param member_mail
	* @return
	* Method 설명 : 해당 회원의 진행중인 프로젝트 명 검색
	*/
	@Override
	public List<WorkVo> workMember(String member_mail) {
		return workMapper.workMember(member_mail);
	}

	/**
	 * Method : workChart
	 * 작성자 : Mr.kku
	 * 내용 : 업무 차트
	 * @param mtMap
	 * @return
	 */
	@Override
	public List<ToDoVo> workChart(Map<String, String> mtMap) {
		return workMapper.workChart(mtMap);
	}

	/**
	 * Method : selectWorkChart
	 * 작성자 : Mr.kku
	 * 내용 : 개별 업무 차트
	 * @param mtMap
	 * @return
	 */
	@Override
	public List<ToDoVo> selectWorkChart(Map<String, String> mtMap) {
		return selectWorkChart(mtMap);
	}

	/**
	 * Method : workMemberTotalCnt
	 * 작성자 : iks
	 * 내용 : 자신이 등록한 업무 총 갯수
	 * @param
	 * @return
	 */
	@Override
	public int workMemberTotalCnt(String member_mail) {
		return workMapper.workMemberTotalCnt(member_mail);
	}

	/**
	 * Method : getWorkPageList
	 * 작성자 : iks
	 * 변경이력 :
	 * @param pageVo
	 * @return
	 * Method 설명 : 알림을 위한 업무 페이지 리스트 조회
	 */
	@Override
	public List<WorkVo> getWorkPageList(PageVo pageVo) {
		return workMapper.getWorkPageList(pageVo);
	}


	@Override
	public WorkVo selectWork(String work_id) {
		return workMapper.selectWork(work_id);
	}

	@Override
	public WorkVo selectWorkMap(Map<String, String> workMap) {
		return workMapper.selectWorkMap(workMap);
	}

	@Override
	public List<WorkVo> myWorkList(WorkVo workVo) {
		return workMapper.myWorkList(workVo);
	}


	/**
	 * Method : getWorkPageList
	 * 작성자 : Mr.KKu
	 * 변경이력 :
	 * @param project_id
	 * @return
	 * Method 설명 : subMain  메인 차트를 위한 카운트
	 */
	@Override
	public WorkVo workMainChart(String project_id) {
		return workMapper.workMainChart(project_id);
	}

	/**
	 * Select project work list.
	 * Method : 프로젝트 내 업무들
	 * 작성자 : Mr.KKu
	 *
	 * @param project_id the project id
	 * @return the list
	 */
	@Override
	public List<WorkVo> selectProjectWork(String project_id) {
		return workMapper.selectProjectWork(project_id);
	}
}