package kr.or.ddit.friendslist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.friendslist.mapper.FriendsListMapper;
import kr.or.ddit.friendslist.model.FriendListVo;

/**
 * kr.or.ddit.friendslist.service
 * null.java
 * Desc : 친구리스트 서비스
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:51
 * @Version :
 */
@Service
@Transactional
public class FriendsListService implements FriendsListServiceInf{
	
	@Autowired
	private FriendsListMapper friendMapper;

	@Override
	public List<FriendListVo> selectMyFriends(String friend_myemail) {
		return friendMapper.selectMyFriends(friend_myemail);
	}

}
