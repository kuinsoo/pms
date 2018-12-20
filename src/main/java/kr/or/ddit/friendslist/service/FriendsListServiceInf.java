package kr.or.ddit.friendslist.service;

import java.util.List;

import kr.or.ddit.friendslist.model.FriendListVo;

/**
 * kr.or.ddit.friendslist.service
 * null.java
 * Desc : 친구리스트 서비스 인터페이스
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:51
 * @Version :
 */
public interface FriendsListServiceInf {
	
	
	/**
	 * Method : selectMyFriends
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param friend_myemail
	 * @return
	 * Method 설명 : 친구를 뽑아오는 
	 */
	
	List<FriendListVo> selectMyFriends(String friend_myemail);


}