package kr.or.ddit.post.mapper;

import java.util.List;

import kr.or.ddit.post.model.PostPageVo;
import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.util.model.PageVo;

/**
 * kr.or.ddit.post.mapper
 * null.java
 * Desc : QNA 질의 게시글 맵퍼
 *
 * @Author : 변찬우 
 * @Date : 2018-12-18 / 오후 11:00
 * @Version :
 */
public interface PostMapper {

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
	
	//글 목록(+페이징)
	List<PostVo> qnaPostList(PostPageVo postPageVo);
	
	//검색 결과 목록(+페이징)
	List<PostVo> qnaSerachList(PostPageVo postPageVo);
	
	//질문(만) 목록(+페이징)
	List<PostVo> qPostList(PostPageVo postPageVo);

	//지정 답글 
	PostVo aPost(String post_hierarchy);
	
	//비밀 질의만 목록 
	List<PostVo> secretQPost(String board_id);
	
	//비밀 답변만 목록 
	List<PostVo> secretAReply(String board_id);
	
	/**
	* Method : getPostPageList
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 게시글 페이지 리스트 조회
	*/
	List<PostVo> getPostPageList(PageVo pageVo);
	
	/**
	* Method : totalPostCnt
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 게시글 건수 조회
	*/
	int totalPostCnt();
	
	/**
	* Method : insertNotice
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 게시글 등록
	*/
	int insertNotice(PostVo postVo);
	
	/**
	* Method : updateNotice
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 게시글 수정
	*/
	int updateNotice(PostVo postVo);
	
	/**
	* Method : selectAdmin
	* 작성자 : iks
	* 변경이력 :
	* @param postVo
	* @return
	* Method 설명 : 게시글 상세조회
	*/
	PostVo selectAdmin(String post_id);
	
	/**
	* Method : deleteAdmin
	* 작성자 : iks
	* 변경이력 :
	* @param postVo
	* @return
	* Method 설명 : 게시글 삭제
	*/
	int deleteAdmin(String post_id);
	
	/**
	* Method : getPostPageListGuide
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 게시글 페이지 리스트 조회
	*/
	List<PostVo> getPostPageListGuide(PageVo pageVo);
	
	/**
	* Method : totalPostCntGuide
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 게시글 건수 조회
	*/
	int totalPostCntGuide();
	
	/**
	* Method : insertNoticeGuide
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 게시글 등록
	*/
	int insertNoticeGuide(PostVo postVo);
	
	/**
	* Method : updateNoticeGuide
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 게시글 수정
	*/
	int updateNoticeGuide(PostVo postVo);
	
	/**
	* Method : selectAdminGuide
	* 작성자 : iks
	* 변경이력 :
	* @param postVo
	* @return
	* Method 설명 : 게시글 상세조회
	*/
	PostVo selectAdminGuide(String post_id);
	
	/**
	* Method : deleteAdminGuide
	* 작성자 : iks
	* 변경이력 :
	* @param postVo
	* @return
	* Method 설명 : 게시글 삭제
	*/
	int deleteAdminGuide(String post_id);
}
