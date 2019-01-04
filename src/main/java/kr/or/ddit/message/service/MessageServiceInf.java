package kr.or.ddit.message.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.friendslist.model.FriendListVo;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.message.model.MessageVo;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.util.model.PageVo;

/**
 * kr.or.ddit.message.service
 * null.java
 * Desc : 쪽지 서비스 인터페이스
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 3:12
 * @Version :
 */
public interface MessageServiceInf {

	/**
	 * Method : updateSfriendN
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param friend_code
	 * @return
	 * Method 설명 : 친구 추가 버튼을 클릭했을때 임의로 넣어준 S --> N 으로 바꾸기 ..
	 */
	//int updateSfriendN(String friend_code);
	
	
	/**
	 * Method : totalFriendSizeCheckSearch
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param pageVo
	 * @return
	 * Method 설명 : 나의 친구 목록 검색 전체 
	 */
	int totalFriendsSearch(PageVo pageVo);
	
	
	/**
	 * Method : totalyouGiveFriendListSearch
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param pageVo
	 * @return
	 * Method 설명 : 내가 받은 친구요청 검색 전체 total값
	 */
	int totalyouGiveFriendListSearch(PageVo pageVo);
	

	/**
	 * Method : totalmySendFriendListSearch
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param pageVo
	 * @return
	 * Method 설명 : 내가 보낸 친구요청 검색 total값 
	 */
	int totalmySendFriendListSearch(PageVo pageVo);

	/**
	 * Method : totalmessageSizeCheck
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param msg_smember
	 * @return
	 * Method 설명 : Y 쪽지 개수 
	 */
	int totalmessageSizeCheck(String member_mail);
	
	/**
	 * Method : totalMemberSearch
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param searchTextFriendList
	 * @return
	 * Method 설명 : 전체 리스트 뽑아오고 (검색 부분  : 전체 값 )
	 */
	int totalMemberListSearch(PageVo pageVo);
	
	
	
	/**
	 * Method : totalFriendSizeCheck
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param member_mail
	 * @return
	 * Method 설명 : 내가 받은 친구 요청 개수 
	 */
	int totalFriendSizeCheck(String member_mail); 
	
	/**
	 * Method : totalMember
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param friend_myemail
	 * @return
	 * Method 설명 : 전체 사용자
	 */
	int totalMember(String member_mail); 
	
	/**
	 * Method : updateAcceptFriend
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param friendVo
	 * @return
	 * Method 설명 : 내가 받은요청에서 수락 버튼을 클릭했을때
	 */
	int updateAcceptFriend(String friend_code);
	
	
	/**
	 * Method : insertFriendN
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param friendVo
	 * @return
	 * Method 설명 : 전체 사용자중 친구요청을 보내는거 
	 */
	int insertFriendN(FriendListVo friendVo);
	
	
	/**
	 * Method : updateRefuseFriend
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param friendVo
	 * @return
	 * Method 설명 : 내가 받은요청에서 거절 버튼을 클릭했을때
	 */
	int updateRefuseFriend (String friend_code);
	
	
	/**
	 * Method : insertFriendY
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param friendVo
	 * @return
	 * Method 설명 : 내가 받은 친구요청에서 수락을 눌렀을때 경우 1.업데이트가 되고 2. 생성을 한다.
	 */
	int insertFriendY(FriendListVo friendVo);
	
	
	/**
	 * Method : myprojectselect
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param pageVo 
	 * @param pageVo
	 * @return
	 * Method 설명 : 
	 */
	List<MessageVo> messageReceived(PageVo pageVo);
	
	/**
	 * Method : totalmySendFriendList
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param member_mail
	 * @return
	 * Method 설명 : 내가 보낸 친구요청 개수
	 */
	int totalmySendFriendList(String member_mail);
	
	
	/**
	 * Method : deletemySendFriendList
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param friend_member
	 * @return
	 * Method 설명 : 내가 보낸 요청  : 요청 취소 --> 삭제 
	 */
	int deletemySendFriendList(String friend_code);
	
	/**
	 * Method : totalyouGiveFriendListt
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param member_mail
	 * @return
	 * Method 설명 : 받은 요청 개수 
	 */
	int totalyouGiveFriendList(String member_mail);
	/**
	 * Method : youGiveFriendList
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param pageVo
	 * @return
	 * Method 설명 : 내가 받은 친구 요청 
	 */
	List<FriendListVo> youGiveFriendList(PageVo pageVo);
	
	/**
	 * Method : mySendFriendList
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param pageVo
	 * @return
	 * Method 설명 :  친구 요청  :  내가 보낸 요청 페이징 처리 + 리스트 
	 */
	List<FriendListVo> mySendFriendList (PageVo pageVo);
	
	/**
	 * Method : totalMemberSearch
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param pageVo
	 * @return
     * Method 설명 : 전체 사용자 리스트 + 페이징 처리 
	 */
	List<MemberVo> totalMemberSearch(PageVo pageVo);
	
	/**
	 * Method : deleteMyfriend
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param friend_code
	 * @return
	 * Method 설명 : 친구목록중 친구 삭제하기 
	 */
	int deleteMyfriend(String friend_code);
	
	/**
	 * Method : MyFriendsList
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param friend_myemail
	 * @return
	 * Method 설명 : 페이징 처리 포함 
	 */
	List<FriendListVo> MyFriendsList(PageVo pageVo);


	
	/**
	 * Method : tatalFriends
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param friend_myemail
	 * @return
	 * Method 설명 : 친구목록 중 count(*)
	 */
	int totalFriends(String friend_myemail);
	
	/**
	 * Method : insertMessageSend
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param msgVo
	 * @return
	 * Method 설명 : 쪽지 보내기 
	 */
	int insertMessageSend(MessageVo msgVo);
	
	
	/**
	 * Method : messageSend
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param pageVo
	 * @return
	 * Method 설명 : 보낸 쪽지 리스트 
	 */
	List<MessageVo> messageSend(PageVo pageVo);

	/**
	 * Method : totalMsgReceived
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param member_mail
	 * @return
	 * Method 설명 : 받은 쪽지 갯수 
	 */
	int totalMsgReceived(String msg_rmember);

	/**
	 * Method : updateMessageReceived
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param msgVo
	 * @return
	 * Method 설명 : 읽음/ 안읽음 구분하기 
	 */
	int updateMessageReceived(MessageVo msgVo);
	
	
	/**
	 * Method : selectOneMessageReceived
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param msg_id
	 * @return
	 * Method 설명 : 클릭시 detail 팝업 
	 */
	MessageVo selectOneMessageReceived(String msg_id);
	
	
	/**
	 * Method : selectOneMessageSend
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param messageVo
	 * @return
	 * Method 설명 : 보낸 쪽지 클릭시 detail 팝업 
	 */
	MessageVo selectOneMessageSend(MessageVo msgVo);

	
	/**
	 * Method : totalMsgReceived
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param msg_smember
	 * @return
	 * Method 설명 : 보낸 쪽지 갯수 
	 */
	int totalMsgSend(String msg_smember);

	/**
	 * Method : deleteMsgReceived
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param msg_id
	 * @return
	 * Method 설명 : 받은 메시지 삭제부분
	 */
	int deleteMsgReceived(String msg_id);
	
	/**
	 * Method : memberListN
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param friendVo
	 * @return
	 * Method 설명 : 버튼 처리 Y - N
	 */
	List<FriendListVo> memberListN(FriendListVo friendVo);
	
	/**
	 * Method : selectMessageReceived
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param msg_id
	 * @return
	 * Method 설명 : Detail : 클릭했을때 팝업창에 뿌려주기 위함 
	 */
	MessageVo selectMessageReceived(String msg_id);
	
	/**
	 * Method : updateAccept
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param friendVo
	 * @return
	 * Method 설명 : 수락 시 update와 insert가 동시에 이루어지게 하기위함
	 */
	//Map<String, Object> updateAccept(FriendListVo friendVo);
}


