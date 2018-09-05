package global.sesoc.www.dto;

public class T_Plist {
	private int plNum;//PK
	private int plaNum; //T_Plan의 Num
	private int groNum;
	private String userId;
	
	public T_Plist() {
		// TODO Auto-generated constructor stub
	}

	public int getPlNum() {
		return plNum;
	}

	public void setPlNum(int plNum) {
		this.plNum = plNum;
	}

	public int getPlaNum() {
		return plaNum;
	}

	public void setPlaNum(int plaNum) {
		this.plaNum = plaNum;
	}

<<<<<<< HEAD
=======
	public int getGroNum() {
		return groNum;
	}

	public void setGroNum(int groNum) {
		this.groNum = groNum;
	}

>>>>>>> feature
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "T_Plist [plNum=" + plNum + ", plaNum=" + plaNum + ", groNum=" + groNum + ", userId=" + userId + "]";
	}
	
}
