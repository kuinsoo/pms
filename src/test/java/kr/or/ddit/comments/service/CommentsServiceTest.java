package kr.or.ddit.comments.service;

import kr.or.ddit.comments.model.CommentsVo;
import kr.or.ddit.commons.ResetSQL;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.*;

/**
 * kr.or.ddit.comments.service
 * JUnit4 Test Class.java.java
 * Desc :
 *
 * @Author : "Mr.KKu"
 * @Date : 2018-12-13 / 오후 11:03
 * @Version :
 */
public class CommentsServiceTest extends ResetSQL {

	@Autowired
	private CommentsServiceInf commentsService;

	@Test
	public void cmtList() {
		/*** Given ***/
		String project_id = "8";
		/*** When ***/
		List<CommentsVo> commentsVos = commentsService.cmtList(project_id);
		/*** Then ***/
		Assert.assertEquals(6,commentsVos.size());
	}

	@Test
	public void insertCmt() {
		/*** Given ***/

		/*** When ***/

		/*** Then ***/
	}

	@Test
	public void updateCmt() {
		/*** Given ***/

		/*** When ***/

		/*** Then ***/
	}

	@Test
	public void deleteCmt() {
		/*** Given ***/

		/*** When ***/

		/*** Then ***/
	}
}