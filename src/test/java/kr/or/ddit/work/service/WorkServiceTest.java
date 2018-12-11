package kr.or.ddit.work.service;

import kr.or.ddit.member.service.MemberServiceInf;
import kr.or.ddit.project.service.ProjectServiceInf;
import kr.or.ddit.work.model.WorkVo;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;

/**
 * kr.or.ddit.work.service
 * JUnit4 Test Class.java.java
 * Desc :
 *
 * @Author : "Mr.KKu"
 * @Date : 2018-12-11 / 오전 12:05
 * @Version :
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class WorkServiceTest {

	@Autowired
	private WorkServiceInf workService;

	@Autowired
	private ProjectServiceInf projectService;

	@Autowired
	private MemberServiceInf memberService;

	@Test
	public void workAllSchedule() {
		/*** Given ***/

		/*** When ***/

		/*** Then ***/
	}

	@Test
	public void selectWorks() {
		/*** Given ***/
		Map<String, String> workMap = new HashMap<>();
		workMap.put("member_mail","kkuinsoo@gmail.com");
		workMap.put("project_id","8");
		/*** When ***/
		List<WorkVo> workVos = workService.selectWorks(workMap);
		/*** Then ***/
		Assert.assertEquals(1,workVos.size());
	}

	@Test
	public void createWork() {
		/*** Given ***/
		WorkVo workVo = new WorkVo();
		workVo.setWork_id("2");
		workVo.setWork_project("8");
		workVo.setWork_title("kkutest");
		workVo.setWork_content("kkutest");
		workVo.setWork_type("1");
		workVo.setWork_importance("5");
		workVo.setWork_sdate(new Date());
		workVo.setWork_progress(30);
		workVo.setWork_approval("N");
		workVo.setWork_eedate(new Date());
		workVo.setWork_public("Y");
		/*** When ***/
		int resultCnt = workService.createWork(workVo);
		/*** Then ***/
		Assert.assertEquals(1,1);
	}

	@Test
	public void deleteWork() {
	}

	@Test
	public void updateWork() {
	}
}