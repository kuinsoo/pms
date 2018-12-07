package kr.or.ddit.project.service;

import kr.or.ddit.project.model.ProjectVo;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

/**
 * kr.or.ddit.project.service
 * JUnit4 Test Class.java.java
 * Desc : 프로젝트  테스트 코드
 *
 * @Author : Mr.KKu
 * @Date : 2018-12-06 / 오전 10:47
 * @Version :
 */
@SpringBootTest
@RunWith(SpringRunner.class)
public class ProjectServiceTest {

	@Autowired
	private ProjectServiceInf projectService;

	/**
	 * Sets up.
	 *
	 * @throws Exception the exception
	 */
	@Before
	public void setUp() throws Exception {
	}

	/**
	 * Select all project.
	 * 작성자: Mr.kku
	 */
	@Test
	public void selectAllProject() {
		/*** Given ***/

		/*** When ***/
		List<ProjectVo> projectList =  projectService.selectAllProject();
		/*** Then ***/
		Assert.assertEquals(21, projectList.size());
	}

	/**
	 * Select project list.
	 */
	@Test
	public void selectProjectList() {
		/*** Given ***/

		/*** When ***/

		/*** Then ***/
	}

	/**
	 * Select book mark project.
	 */
	@Test
	public void selectBookMarkProject() {
		/*** Given ***/

		/*** When ***/

		/*** Then ***/
	}

	/**
	 * Create project.
	 */
	@Test
	public void createProject() {
		/*** Given ***/

		/*** When ***/

		/*** Then ***/
	}

	/**
	 * Delete project.
	 */
	@Test
	public void deleteProject() {
		/*** Given ***/

		/*** When ***/

		/*** Then ***/
	}

	/**
	 * Update project.
	 */
	@Test
	public void updateProject() {
		/*** Given ***/

		/*** When ***/

		/*** Then ***/
	}

	/**
	 * Project all schedule.
	 */
	@Test
	public void projectAllSchedule() {
		/*** Given ***/

		/*** When ***/

		/*** Then ***/
	}
}