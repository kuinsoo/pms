package kr.or.ddit.friendslist.mapper;

import java.util.List;

import kr.or.ddit.friendslist.model.FriendListVo;

/**
 * kr.or.ddit.friendlist.mapper
 * null.java
 * Desc : 친구 리스트 맵퍼
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:46
 * @Version :
 */

public interface FriendsListMapper {

	/**
	 * Method : selectMyFriends
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param friendVo
	 * @return
	 * Method 설명 : 친구를 뽑아오는 
	 */
	
	List<FriendListVo> selectMyFriends(String friend_myemail);
}
