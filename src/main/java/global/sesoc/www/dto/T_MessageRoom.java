package global.sesoc.www.dto;

import org.springframework.web.socket.WebSocketSession;

public class T_MessageRoom {
	private WebSocketSession session;
	private String id;
	private String userid;
	
	public T_MessageRoom() {
		// TODO Auto-generated constructor stub
	}

	public T_MessageRoom(String userid, String id, WebSocketSession session) {
		super();
		this.session = session;
		this.id = id;
		this.userid = userid;
	}

	public WebSocketSession getSession() {
		return session;
	}

	public void setSession(WebSocketSession session) {
		this.session = session;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "MessageRoom [session=" + session + ", id=" + id + ", userid=" + userid + "]";
	}
	
}
