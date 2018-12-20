package kr.or.ddit.post.service;

import java.util.List;

import kr.or.ddit.post.model.PostPageVo;
import kr.or.ddit.post.model.PostVo;

/**
 * kr.or.ddit.post.service
 * PostServiceInf.java
 * Desc : QNA 질의 게시글 인터페이스
 *
 * @Author : 변찬우 
 * @Date : 2018-12-18 / 오후 10:20
 * @Version :
 */
public interface PostServiceInf {
	
	//글 쓰기
	int insertQnaPost(PostVo postVo);
	
	//선택한 글 내용 출력
	PostVo selectQnaPost(String post_id);
	
	//글 내용 수정
	int updateQnaPost(PostVo postVo);
	
	//삭제
	int deleteQnaPost(String post_id);
	
	//전체 글 개수 
	int postListCnt(PostPageVo postPageVo);
	
	//글 목록
	List<PostVo> qnaPostList(PostPageVo postPageVo);
	
	//검색 결과 목록
	List<PostVo> qnaSerachList(PostPageVo postPageVo);
	
	//질문(만) 목록(+페이징)
	List<PostVo> qPostList(PostPageVo postPageVo);

	//지정 답글 
	PostVo aPost(String post_hierarchy);
	
	//비밀 질의만 목록 
	List<PostVo> secretQPost(String board_id);
	
	//비밀 답변만 목록 
	List<PostVo> secretAReply(String board_id);
	
}
