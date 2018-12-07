package kr.or.ddit.project.web;

import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.project.service.ProjectServiceInf;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;

import static org.mockito.ArgumentMatchers.any;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

/**
 * kr.or.ddit.project.web
 * JUnit4 Test Class.java.java
 * Desc :
 *
 * @Author : Mr.KKu
 * @Date : 2018-12-06 / 오전 11:10
 * @Version :
 */
@RunWith(SpringRunner.class)
//@WebMvcTest(ProjectController.class)
@SpringBootTest
//@AutoConfigureMockMvc()
public class ProjectControllerTest {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private MockMvc mvc;

	@MockBean
	private ProjectService projectService;

	@MockBean
	private MemberService memberService;

	@Test
	public void createProjectView() throws Exception {

		MvcResult mvcResult = this.mvc.perform(get("/createProject")).andReturn();
		Assert.assertEquals("project/createProject", mvcResult.getModelAndView().getViewName());
	}

	@Test
	public void createProject() {
	}

	@Test
	public void projectList() {
	}

	@Test
	public void projectBookmarkAjax() {
	}

	@Test
	public void subMain() {
	}
}