package kr.or.ddit.post.model;

import org.apache.ibatis.type.Alias;

/**
 * kr.or.ddit.board.model
 * null.java
 * Desc : 게시글 페이징 및 검색 처리 
 *
 * @Author : 변찬우 
 * @Date : 2018-12-17 / 오후 10:10
 * @Version :
 */
@Alias("postPageVo")
public class PostPageVo {

	private String board_id;
	
	private int pageNum;
	private int postCnt;
	
	private String searchText;
	
	public PostPageVo(){
	}

	public String getBoard_id() {
		return board_id;
	}

	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPostCnt() {
		return postCnt;
	}

	public void setPostCnt(int postCnt) {
		this.postCnt = postCnt;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	@Override
	public String toString() {
		return "PostPageVo [board_id=" + board_id + ", pageNum=" + pageNum + ", postCnt=" + postCnt + ", searchText="
				+ searchText + "]";
	}
	
}
