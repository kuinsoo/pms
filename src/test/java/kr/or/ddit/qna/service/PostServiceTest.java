package kr.or.ddit.qna.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import kr.or.ddit.commons.ResetSQL;
import kr.or.ddit.post.model.PostPageVo;
import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.post.service.PostServiceInf;

public class PostServiceTest extends ResetSQL {

	private Logger logger = LoggerFactory.getLogger(PostServiceTest.class);
	
	@Autowired
	private PostServiceInf postService;
	
	@Test
	public void qnaPostListTest() {
		/***Given***/
		PostPageVo postPageVo = new PostPageVo();
		postPageVo.setBoard_id("kkuinsoo@gmail.com");
		postPageVo.setPageNum(1);
		postPageVo.setPostCnt(10);
		
		List<PostVo> postList = postService.qnaPostList(postPageVo);
		
		/***When***/
		int postListSize = postList.size();
		
		/***Then***/
		assertEquals(0, postListSize);
	}

}
