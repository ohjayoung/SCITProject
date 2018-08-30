package global.sesoc.www.dto;

public class T_Plist {
	private int plNum;//PK
	private int plaNum; //T_Plan의 Num
	private String userId;
	
	public T_Plist() {
		// TODO Auto-generated constructor stub
	}
	
	public T_Plist(int plNum, int plaNum, String userId) {
		this.plNum = plNum;
		this.plaNum = plaNum;
		this.userId = userId;
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
	
>>>>>>> 0e0d5fd26e6761a6bc6c7dfda6c1bc3f8d911c57
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "T_Plist [plNum=" + plNum + ", plaNum=" + plaNum + ", userId=" + userId + "]";
	}

}
