package global.sesoc.www.dto;

public class T_Message {
	private int mesNum;
	private String mesContext;
	private String mesRegdate;
	private String userA;
	private String userB;
	
	public T_Message() {
		// TODO Auto-generated constructor stub
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

	@Override
	public String toString() {
		return "T_Message [mesNum=" + mesNum + ", mesContext=" + mesContext + ", mesRegdate=" + mesRegdate + ", userA="
				+ userA + ", userB=" + userB + "]";
	}
	
}
