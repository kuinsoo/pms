package kr.or.ddit.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.post.mapper.PostMapper;
import kr.or.ddit.post.model.PostPageVo;
import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.util.model.PageVo;

/**
 * kr.or.ddit.post.service
 * PostService.java
 * Desc : QNA 질의 게시글 서비스
 *
 * @Author : 변찬우 
 * @Date : 2018-12-18 / 오후 10:50
 * @Version :
 */
@Service
@Transactional
public class PostService implements PostServiceInf {
	
	@Autowired
	private PostMapper postMapper;

	@Override
	public int insertQnaPost(PostVo postVo) {
		return postMapper.insertQnaPost(postVo);
	}

	@Override
	public PostVo selectQnaPost(String post_id) {
		return postMapper.selectQnaPost(post_id);
	}

	@Override
	public int updateQnaPost(PostVo postVo) {
		return postMapper.updateQnaPost(postVo);
	}

	@Override
	public int deleteQnaPost(String post_id) {
		return postMapper.deleteQnaPost(post_id);
	}

	@Override
	public int postListCnt(PostPageVo postPageVo) {
		return postMapper.postListCnt(postPageVo);
	}
	
	@Override
	public List<PostVo> qnaPostList(PostPageVo postPageVo) {
		return postMapper.qnaPostList(postPageVo);
	}

	@Override
	public List<PostVo> qnaSerachList(PostPageVo postPageVo) {
		return postMapper.qnaSerachList(postPageVo);
	}

	@Override
	public List<PostVo> qPostList(PostPageVo postPageVo) {
		return postMapper.qPostList(postPageVo);
	}

	@Override
	public PostVo aPost(String post_hierarchy) {
		return postMapper.aPost(post_hierarchy);
	}

	@Override
	public List<PostVo> secretQPost(String board_id) {
		return postMapper.secretQPost(board_id);
	}

	@Override
	public List<PostVo> secretAReply(String board_id) {
		return postMapper.secretAReply(board_id);
	}
	
	/**
	* Method : getPostPageList
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 게시글 페이지 리스트 조회
	*/
	@Override
	public List<PostVo> getPostPageList(PageVo pageVo) {
		return postMapper.getPostPageList(pageVo);
	}
	
	/**
	* Method : totalPostCnt
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 게시글 건수 조회
	*/
	@Override
	public int totalPostCnt() {
		return postMapper.totalPostCnt();
	}

	/**
	* Method : insertNotice
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 게시글 등록
	*/
	@Override
	public int insertNotice(PostVo postVo) {
		return postMapper.insertNotice(postVo);
	}

	/**
	* Method : updateNotice
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 게시글 수정
	*/
	@Override
	public int updateNotice(PostVo postVo) {
		return postMapper.updateNotice(postVo);
	}

	/**
	* Method : selectAdmin
	* 작성자 : iks
	* 변경이력 :
	* @param postVo
	* @return
	* Method 설명 : 게시글 상세조회
	*/
	@Override
	public PostVo selectAdmin(String post_id) {
		return postMapper.selectAdmin(post_id);
	}

	/**
	* Method : deleteAdmin
	* 작성자 : iks
	* 변경이력 :
	* @param postVo
	* @return
	* Method 설명 : 게시글 삭제
	*/
	@Override
	public int deleteAdmin(String post_id) {
		return postMapper.deleteAdmin(post_id);
	}
	
	/**
	* Method : getPostPageListGuide
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 게시글 페이지 리스트 조회
	*/
	@Override
	public List<PostVo> getPostPageListGuide(PageVo pageVo) {
		return postMapper.getPostPageListGuide(pageVo);
	}
	
	/**
	* Method : totalPostCntGuide
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 게시글 건수 조회
	*/
	@Override
	public int totalPostCntGuide() {
		return postMapper.totalPostCntGuide();
	}

	/**
	* Method : insertNoticeGuide
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 게시글 등록
	*/
	@Override
	public int insertNoticeGuide(PostVo postVo) {
		return postMapper.insertNoticeGuide(postVo);
	}

	/**
	* Method : updateNoticeGuide
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 게시글 수정
	*/
	@Override
	public int updateNoticeGuide(PostVo postVo) {
		return postMapper.updateNoticeGuide(postVo);
	}

	/**
	* Method : selectAdminGuide
	* 작성자 : iks
	* 변경이력 :
	* @param postVo
	* @return
	* Method 설명 : 게시글 상세조회
	*/
	@Override
	public PostVo selectAdminGuide(String post_id) {
		return postMapper.selectAdminGuide(post_id);
	}

	/**
	* Method : deleteAdminGuide
	* 작성자 : iks
	* 변경이력 :
	* @param postVo
	* @return
	* Method 설명 : 게시글 삭제
	*/
	@Override
	public int deleteAdminGuide(String post_id) {
		return postMapper.deleteAdminGuide(post_id);
	}
}