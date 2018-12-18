package kr.or.ddit.message.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
}
