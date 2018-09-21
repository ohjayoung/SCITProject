package global.sesoc.www.dto;

import org.springframework.web.socket.WebSocketSession;

public class T_Message {
	private int mesNum;
	private String mesContext;
	private String mesRegdate;
	private String userA;		//보내는 사람 아이디
	private String userB;		//받는사람 아이디
	private int accessed;
	private WebSocketSession session;

	public T_Message() {
		// TODO Auto-generated constructor stub
	}
	public T_Message(String mesContext, String userA, String userB, int accessed) {
		super();
		this.mesContext = mesContext;
		this.userA = userA;
		this.userB = userB;
		this.accessed = accessed;
	}
	public int getMesNum() {
		return mesNum;
	}
	public void setMesNum(int mesNum) {
		this.mesNum = mesNum;
	}
	public String getMesContext() {
		return mesContext;
	}
	public void setMesContext(String mesContext) {
		this.mesContext = mesContext;
	}
	public String getMesRegdate() {
		return mesRegdate;
	}
	public void setMesRegdate(String mesRegdate) {
		this.mesRegdate = mesRegdate;
	}
	public String getUserA() {
		return userA;
	}
	public void setUserA(String userA) {
		this.userA = userA;
	}
	public String getUserB() {
		return userB;
	}
	public void setUserB(String userB) {
		this.userB = userB;
	}
	public int getAccessed() {
		return accessed;
	}
	public void setAccessed(int accessed) {
		this.accessed = accessed;
	}
	public WebSocketSession getSession() {
		return session;
	}
	public void setSession(WebSocketSession session) {
		this.session = session;
	}
	@Override
	public String toString() {
		return "T_Message [mesNum=" + mesNum + ", mesContext=" + mesContext + ", mesRegdate=" + mesRegdate + ", userA="
				+ userA + ", userB=" + userB + ", accessed=" + accessed + "]";
	}
	
}
