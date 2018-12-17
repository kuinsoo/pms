package kr.or.ddit.websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;



@ServerEndpoint("/wsServer")
public class WsServer {
	
	static List<Session> sessions = new ArrayList<Session>();
	
	// 새로운 클라이언트의 요청이 들어왔을때
	@OnOpen
	public void onOpen(Session session){
		System.out.println("onOpen " + session.getId());
		sessions.add(session);
	}
	
	@OnMessage
	public void onMessage(String message, Session session) throws IOException{
		System.out.println("onMessage : " + message);
		for(Session s : sessions){
			s.getBasicRemote().sendText(message);			
		}
	}
	
	@OnClose
	public void onClose(Session session){
		for( Session s : sessions){
			if(session.getId().equals(s.getId())){
				sessions.remove(s);
			}
		}
	}
}
