package kr.or.ddit.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.post.mapper.PostMapper;
import kr.or.ddit.post.model.PostPageVo;
import kr.or.ddit.post.model.PostVo;

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
	public PostVo aPostList(String post_hierarchy) {
		return postMapper.aPostList(post_hierarchy);
	}

	@Override
	public List<PostVo> secretQPost(String board_id) {
		return postMapper.secretQPost(board_id);
	}

	@Override
	public List<PostVo> secretAReply(String board_id) {
		return postMapper.secretAReply(board_id);
	}
}
