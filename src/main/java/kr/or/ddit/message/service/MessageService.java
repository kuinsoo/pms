package kr.or.ddit.message.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.friendslist.model.FriendListVo;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.message.mapper.MessageMapper;
import kr.or.ddit.message.model.MessageVo;
import kr.or.ddit.util.model.PageVo;

/**
 * kr.or.ddit.message.service
 * null.java
 * Desc : 쪽지 서비스
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 3:12
 * @Version :
 */
@Service
@Transactional
public class MessageService implements MessageServiceInf{

	
	@Autowired
	private MessageMapper messageMapper;
	
	@Override
	public List<MessageVo> messageReceived(PageVo pageVo) {
		return messageMapper.messageReceived(pageVo);
	}

	
	@Override
	public int totalMsgReceived(String msg_rmember) {
		return messageMapper.totalMsgReceived(msg_rmember);
	}


	@Override
	public MessageVo selectMessageReceived(String msg_id) {
		return messageMapper.selectMessageReceived(msg_id);
	}


	@Override
	public List<MessageVo> messageSend(PageVo pageVo) {
		return messageMapper.messageSend(pageVo);
	}


	@Override
	public int totalMsgSend(String msg_smember) {
		return messageMapper.totalMsgSend(msg_smember);
	}


	@Override
	public int updateMessageReceived(MessageVo msgVo) {
		return messageMapper.updateMessageReceived(msgVo);
	}


	@Override
	public MessageVo selectOneMessageReceived(String msg_id) {
		return messageMapper.selectOneMessageReceived(msg_id);
	}


	@Override
	public int deleteMsgReceived(String msg_id) {
		return messageMapper.deleteMsgReceived(msg_id);
	}


	@Override
	public int insertMessageSend(MessageVo msgVo) {
		return messageMapper.insertMessageSend(msgVo);
	}


	@Override
	public MessageVo selectOneMessageSend(MessageVo msgVo) {
		return messageMapper.selectOneMessageSend(msgVo);
	}


	@Override
	public int totalFriends(String friend_myemail) {
		return messageMapper.totalFriends(friend_myemail);
	}


	@Override
	public List<FriendListVo> MyFriendsList(PageVo pageVo) {
		return messageMapper.MyFriendsList(pageVo);
	}


	@Override
	public int deleteMyfriend(String friend_code) {
		return messageMapper.deleteMyfriend(friend_code);
	}


	@Override
	public List<MemberVo> totalMemberSearch(PageVo pageVo) {
		return messageMapper.totalMemberSearch(pageVo);
	}


	@Override
	public int totalMember(String member_mail) {
		return messageMapper.totalMember(member_mail);
	}

	

	@Override
	public int insertFriendN(FriendListVo friendVo) {
		return messageMapper.insertFriendN(friendVo);
	}


	@Override
	public List<FriendListVo> mySendFriendList(PageVo pageVo) {
		return messageMapper.mySendFriendList(pageVo);
	}


	@Override
	public int totalmySendFriendList(String member_mail) {
		return messageMapper.totalmySendFriendList(member_mail);
	}


	@Override
	public int deletemySendFriendList(String friend_code) {
		return messageMapper.deletemySendFriendList(friend_code);
	}


	@Override
	public List<FriendListVo> youGiveFriendList(PageVo pageVo) {
		return messageMapper.youGiveFriendList(pageVo);
	}


	@Override
	public int totalyouGiveFriendList(String member_mail) {
		return messageMapper.totalyouGiveFriendList(member_mail);
	}


	@Override
	public int updateRefuseFriend(String friend_code) {
		return messageMapper.updateRefuseFriend(friend_code);
	}
	
	// 친구 수락 부분 
	@Override
	public int updateAcceptFriend(String friend_code) {
		return messageMapper.updateAcceptFriend(friend_code);
	}
	
	@Override
	public int insertFriendY(FriendListVo friendVo) {
		return messageMapper.insertFriendY(friendVo);
	}


	@Override
	public List<FriendListVo> memberListN(FriendListVo friendVo) {
		return messageMapper.memberListN(friendVo);
	}


	@Override
	public int totalmessageSizeCheck(String member_mail) {
		return messageMapper.totalmessageSizeCheck(member_mail);
	}


	@Override
	public int totalFriendSizeCheck(String member_mail) {
		return messageMapper.totalFriendSizeCheck(member_mail);
	}
}










