package kr.or.ddit.message.service;

import static org.junit.Assert.assertEquals;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import kr.or.ddit.commons.ResetSQL;
import kr.or.ddit.message.model.MessageVo;

/**
 * kr.or.ddit.member.web
 * JUnit4 Test Class.java.java
 * Desc :
 *
 * @Author : Mr.KKu
 * @Date : 2018-12-07 / 오후 3:59
 * @Version :
 */

public class MessageServiceTest  extends ResetSQL{
	private Logger logger = LoggerFactory.getLogger(MessageServiceTest.class);
	
	@Autowired 
	private MessageServiceInf messageservice;
	
	@Test
	public void selectOneMessageSendTest() {
		
	/***Given***/
	String msg_id = "40";
	
	/***When***/
	MessageVo messageVo = new MessageVo();
	messageVo.setMsg_id(msg_id);
	messageVo.setMsg_smember("kkuinsoo@gmail.com");
	
	
	
	MessageVo msgVo = messageservice.selectOneMessageSend(messageVo);
	
	
	/***Then***/
	assertEquals(msgVo.getMsg_rmember(), "sally1334@naver.com");

	
	}
}