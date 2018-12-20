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
	
	/**
	* Method : insertQnaPostTest
	* 작성자 : bhuanchanwoo
	* 변경이력 :
	* Method 설명 : 새 질의 글 추가 (질문)
	*/
	@Test
	public void insertQnaPostTest1() {
		/***Given***/
		String board_id="board4";
		String post_hierarchy="";
		String post_writer="skwlstlf1227@gmail.com";
		String post_title="크리스마스는 언제인가요?";
		String post_content="2018 크리스마스는 무슨 요일인가요?";
		String post_public="y";
		String post_pass="";
		
		PostVo postVo = new PostVo();

		/***When***/
		postVo.setBoard_id(board_id);
		postVo.setPost_hierarchy(post_hierarchy);
		postVo.setPost_writer(post_writer);
		postVo.setPost_pass(post_pass);
		postVo.setPost_title(post_title);
		postVo.setPost_content(post_content);
		postVo.setPost_public(post_public);
		
		int insert = postService.insertQnaPost(postVo);
		
		/***Then***/
		assertEquals(1, insert);
	}
	
	
	/**
	* Method : insertQnaPostTest
	* 작성자 : bhuanchanwoo
	* 변경이력 :
	* Method 설명 : 새 질의 글 추가 (답변)
	*/
	@Test
	public void insertQnaPostTest2() {
		/***Given***/
		String board_id="board4";
		String post_hierarchy="QApost5";
		String post_writer="admin@admin.com";
		String post_title="아..설날이요~ ?";
		String post_content="달력을 보시거나 구글을 검색하세요?";
		String post_public="y";
		String post_pass="";
		
		PostVo postVo = new PostVo();

		/***When***/
		postVo.setBoard_id(board_id);
		postVo.setPost_hierarchy(post_hierarchy);
		postVo.setPost_writer(post_writer);
		postVo.setPost_pass(post_pass);
		postVo.setPost_title(post_title);
		postVo.setPost_content(post_content);
		postVo.setPost_public(post_public);
		
		int insert = postService.insertQnaPost(postVo);
		
		/***Then***/
		assertEquals(1, insert);
	}
	
	
	/**
	* Method : selectQnaPost
	* 작성자 : bhuanchanwoo
	* 변경이력 :
	* Method 설명 : 선택한 글 출력
	*/
	@Test
	public void selectQnaPost() {
		/***Given***/
		String post_id="QApost2";
		
		/***When***/
		PostVo postVo =postService.selectQnaPost(post_id);
		
		String ori_post_id = postVo.getPost_id();
		
		logger.debug("글 id : ", ori_post_id);
		logger.debug("글 내용 : ", postVo.getPost_content());
		
		/***Then***/
		assertEquals(post_id, ori_post_id);
	}
	
	/**
	* Method : updateQnaPost
	* 작성자 : bhuanchanwoo
	* 변경이력 :
	* Method 설명 : 선택한 글 내용 수정
	*/
	@Test
	public void updateQnaPost() {
		/***Given***/
		String post_id="QApost3";
		
		String post_title="아..크리스마스 말인가요?";
		String post_content="달력을 보시거나 구글을 검색하세요?";
		String post_public="n";
		String post_pass="1234";

		PostVo postVo =postService.selectQnaPost(post_id);
		
		/***When***/
		postVo.setPost_title(post_title);
		postVo.setPost_content(post_content);
		postVo.setPost_public(post_public);
		postVo.setPost_pass(post_pass);
		
		int updateCnt = postService.updateQnaPost(postVo);
		String resultValue = postVo.getPost_public();
		
		/***Then***/
		assertEquals(1, updateCnt);
		assertEquals("n", resultValue);
	}
	
	
	/**
	* Method : deleteQnaPost
	* 작성자 : bhuanchanwoo
	* 변경이력 :
	* Method 설명 : 선택한 글 내용 삭제 
	*/
	@Test
	public void deleteQnaPost() {
		/***Given***/
		String post_id="QApost2";	//1,3번은 답글이 있어 삭제 불가 
		
		/***When***/
		int delPost = postService.deleteQnaPost(post_id);
		
		/***Then***/
		assertEquals(1, delPost);
	}
	
	
	/**
	* Method : postListCntTest
	* 작성자 : bhuanchanwoo
	* 변경이력 :
	* Method 설명 : Q&A 게시글 수 출력 
	*/
	@Test
	public void postListCntTest() {
		/***Given***/
		String board_id="board4";
		
		PostPageVo postPageVo = new PostPageVo();
		postPageVo.setBoard_id(board_id);
		
		/***When***/
		int postListCnt = postService.postListCnt(postPageVo);
		
		/***Then***/
		assertEquals(5, postListCnt);
	}
	
	
	/**
	* Method : qnaPostList
	* 작성자 : bhuanchanwoo
	* 변경이력 :
	* Method 설명 : 질의응답 글 목록(+페이징) 출력	   //->? 리스트 개수와  postCnt 비교 
	*/
	@Test
	public void qnaPostListTest() {
		/***Given***/
		String board_id="board4";
		int pageNum=1;
		int postCnt =10 ;
		
		PostPageVo postPageVo = new PostPageVo();
		postPageVo.setBoard_id(board_id);
		postPageVo.setPageNum(pageNum);
		postPageVo.setPostCnt(postCnt);
		
		/***When***/
		List<PostVo> pageList = postService.qnaPostList(postPageVo);
		int pageListSize = pageList.size();
	
		/***Then***/
		assertEquals(postCnt, pageListSize);
	}
	
	
	/**
	* Method : qnaSerachList
	* 작성자 : bhuanchanwoo
	* 변경이력 :
	* Method 설명 : 검색 결과(+페이징) 출력
	*/
	@Test
	public void qnaSerachListTest() {
		/***Given***/
		String board_id="board4";
		int pageNum=1;
		int postCnt =10 ;
		String searchText="회식";

		PostPageVo postPageVo = new PostPageVo();
		postPageVo.setBoard_id(board_id);
		postPageVo.setPageNum(pageNum);
		postPageVo.setPostCnt(postCnt);
		postPageVo.setSearchText(searchText);
		
		/***When***/
		List<PostVo> searchList = postService.qnaSerachList(postPageVo);
		int serchResult = searchList.size();
		
		/***Then***/
		assertEquals(4, serchResult);
		//issue : out of process memory when trying to allocate 152 bytes
	}
	
	
	/**
	* Method : qPostListTest
	* 작성자 : bhuanchanwoo
	* 변경이력 :
	* Method 설명 : 질문 목록만 출력
	*/
	@Test
	public void qPostListTest() {
		/***Given***/
		String board_id="board4";
		int pageNum=1;
		int postCnt =10 ;

		PostPageVo postPageVo = new PostPageVo();
		postPageVo.setBoard_id(board_id);
		postPageVo.setPageNum(pageNum);
		postPageVo.setPostCnt(postCnt);
		
		/***When***/
		List<PostVo> qList = postService.qPostList(postPageVo);
		int listResult = qList.size();
		
		/***Then***/
		assertEquals(7, listResult);
	}
	
	
	/**
	* Method : aPostTest
	* 작성자 : bhuanchanwoo
	* 변경이력 :
	* Method 설명 : 지정 글의 답글 출력	//->? 해당 프로퍼티 벨류를 맞출력
	*/
	@Test
	public void aPostTest() {
		/***Given***/
		String post_id="QApost1";

		/***When***/
		PostVo postVo = postService.aPost(post_id);
		
		/***Then***/
		assertEquals("QApost1", postVo.getPost_hierarchy());
	}
	
	
	/**
	* Method : secretQPost
	* 작성자 : bhuanchanwoo
	* 변경이력 :
	* Method 설명 : 비밀 질의 글만 출력
	*/
	@Test
	public void secretQPost() {
		/***Given***/
		String board_id="board4";
		
		/***When***/
		List<PostVo> secretQList = postService.secretQPost(board_id);
		int secretQcnt = secretQList.size();
		
		/***Then***/
		assertEquals(3, secretQcnt);
	}
	
	
	/**
	* Method : secretAReply
	* 작성자 : bhuanchanwoo
	* 변경이력 :
	* Method 설명 : 비밀 답변 글만 출력
	*/
	@Test
	public void secretAReply() {
		/***Given***/
		String board_id="board4";
		
		/***When***/
		List<PostVo> secretAList = postService.secretAReply(board_id);
		int secretAcnt = secretAList.size();
		
		/***Then***/
		assertEquals(3, secretAcnt);
	}
	
}
